Content-Type: multipart/mixed; boundary="===============9011791493573121379=="
MIME-Version: 1.0
From: henry.gadacz at stud.h-da.de
Subject: [tpm2] Re: tpm2-pytss connect to dockerized swtpm
Date: Wed, 27 Jul 2022 14:39:16 +0200
Message-ID: <00b501d8a1b5$e93d70a0$bbb851e0$@stud.h-da.de>
In-Reply-To: 7493c7a8b32f01bef6b601bd51e5285cd10855e5.camel@cnackers.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9011791493573121379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Erik,

Thank you very much! The suggestion about the swtpm IP address was correct!

Best regards,
Henry

-----Urspr=C3=BCngliche Nachricht-----
Von: Erik <who+01tpm(a)cnackers.org> =

Gesendet: Mittwoch, 27. Juli 2022 14:16
An: henry.gadacz(a)stud.h-da.de; tpm2(a)lists.01.org
Betreff: [tpm2] Re: tpm2-pytss connect to dockerized swtpm

HI,

swtpm only listens on 127.0.0.1 by default, so unless you have changed that=
 it wont be accessible by any other address.
docker compose seems to use the same network namespace for each container s=
o localhost should work, but it might be as simple as that the python scrip=
t runs before swtpm is ready.
The unit tests for tpm2-pytss tries to connect to swtpm a couple of times w=
ith a small sleep in between each try to get around that, so try adding for=
 example time.sleep(5) before calling ESAPI(...) to see if that helps.

/Erik

On Wed, 2022-07-27 at 10:29 +0200, henry.gadacz(a)stud.h-da.de <mailto:henr=
y.gadacz(a)stud.h-da.de>  wrote:

	Hello everyone,
	 =

	I am trying to accomplish the following, but did not succeed and I hope so=
meone can help me.
	I want to have a docker compose with two containers. In the first containe=
r I want to run the swtpm (https://github.com/stefanberger/swtpm) and in th=
e other a python script that uses tpm2-pytss to connect to the swtpm in the=
 first container. =

	 =

	When I run swtpm and the python script in the same container it works.
	In order to run them in separate containers I just duplicated the Dockerfi=
le (I know this has some overhead, but to make sure don=E2=80=99t miss any =
dependencies), changed the docker CMD command to either run the python scri=
pt or the swtpm and renamed them to Dockerfile_app_test and Dockerfile_tpm_=
test.
	 =

	My docker compose file is looking like this:
	version: '3.7'
	services:

	  app:
	    container_name: app
	    build:
	      context: .
	      dockerfile: Dockerfile_app_test
	    restart: unless-stopped

	  tpm:
	    container_name: tpm
	    build:
	      context: .
	      dockerfile: Dockerfile_tpm_test
	    ports:
	      - "2321:2321"
	      - "2322:2322"
	    restart: unless-stopped
	 =

	 =

	My python script is:
	from tpm2_pytss import *
	if __name__ =3D=3D '__main__':
	    print("TPM test application")
	    tpm =3D ESAPI(tcti=3D"swtpm:host=3Dtpm,port=3D2321")
	    tpm.startup(TPM2_SU.CLEAR)
	    =

	    r =3D tpm.get_random(8)
	    print("type is ", type(r))
	    print("r    is ", str(r))
	    print("as int  ", int(str(r), 16))

	 =

	When I run it in one Dockerfile I used =

	tpm =3D ESAPI(tcti=3D"swtpm:host=3Dlocalhost,port=3D2321")

	so I thought changing the host name to the docker container name should do=
 it but I always get the following errors:
	app  | WARNING:tcti:src/util/io.c:262:socket_connect() Failed to connect t=
o host 172.21.0.2, port 2321: errno 111: Connection refused =

	app  | ERROR:tcti:src/tss2-tcti/tcti-swtpm.c:614:Tss2_Tcti_Swtpm_Init() Ca=
nnot connect to swtpm TPM socket =

	app  | ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() Could no=
t initialize TCTI file: swtpm =

	app  | ERROR:tcti:src/tss2-tcti/tctildr.c:428:Tss2_TctiLdr_Initialize_Ex()=
 Failed to instantiate TCTI =

	app  | Traceback (most recent call last):
	app  |   File "/app/main.py", line 70, in <module>
	app  |     tpm =3D ESAPI(tcti=3D"swtpm:host=3Dtpm,port=3D2321")
	app  |   File "/usr/local/lib/python3.10/dist-packages/tpm2_pytss/ESAPI.py=
", line 123, in __init__
	app  |     tcti =3D TCTILdr.parse(tcti)
	app  |   File "/usr/local/lib/python3.10/dist-packages/tpm2_pytss/TCTILdr.=
py", line 54, in parse
	app  |     return cls(name, conf)
	app  |   File "/usr/local/lib/python3.10/dist-packages/tpm2_pytss/TCTILdr.=
py", line 29, in __init__
	app  |     _chkrc(lib.Tss2_TctiLdr_Initialize_Ex(name, conf, self._ctx_pp))
	app  |   File "/usr/local/lib/python3.10/dist-packages/tpm2_pytss/internal=
/utils.py", line 32, in _chkr
	app  |     raise TSS2_Exception(rc)
	app  | tpm2_pytss.TSS2_Exception.TSS2_Exception: tcti:IO failure
	app exited with code 1

	 =

	 =

	I know it=E2=80=99s not a plain tpm2-tss question, but does anyone has exp=
erience with that and can help me? =

	 =

	Kind regards, =

	Henry
	 =

	_______________________________________________
	tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> =

	To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:tpm2-lea=
ve(a)lists.01.org> =

	%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s



--===============9011791493573121379==--

