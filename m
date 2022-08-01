Content-Type: multipart/mixed; boundary="===============2253446376125688817=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2-pytss connect to dockerized swtpm
Date: Mon, 01 Aug 2022 15:37:22 +0000
Message-ID: <SN6PR11MB343777B0AD0F89F5B19021C9B89A9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 00b501d8a1b5$e93d70a0$bbb851e0$@stud.h-da.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2253446376125688817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oh nevermind I see you expose the ports in the dockerfile and Erik figured =
it out.
________________________________
From: henry.gadacz(a)stud.h-da.de <henry.gadacz(a)stud.h-da.de>
Sent: Wednesday, July 27, 2022 7:39 AM
To: 'Erik' <who+01tpm(a)cnackers.org>; tpm2(a)lists.01.org <tpm2(a)lists.01=
.org>
Subject: [tpm2] Re: tpm2-pytss connect to dockerized swtpm

Hi Erik,

Thank you very much! The suggestion about the swtpm IP address was correct!

Best regards,
Henry

-----Urspr=C3=BCngliche Nachricht-----
Von: Erik <who+01tpm(a)cnackers.org>
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

        I am trying to accomplish the following, but did not succeed and I =
hope someone can help me.
        I want to have a docker compose with two containers. In the first c=
ontainer I want to run the swtpm (https://github.com/stefanberger/swtpm) an=
d in the other a python script that uses tpm2-pytss to connect to the swtpm=
 in the first container.

        When I run swtpm and the python script in the same container it wor=
ks.
        In order to run them in separate containers I just duplicated the D=
ockerfile (I know this has some overhead, but to make sure don=E2=80=99t mi=
ss any dependencies), changed the docker CMD command to either run the pyth=
on script or the swtpm and renamed them to Dockerfile_app_test and Dockerfi=
le_tpm_test.

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


        My python script is:
        from tpm2_pytss import *
        if __name__ =3D=3D '__main__':
            print("TPM test application")
            tpm =3D ESAPI(tcti=3D"swtpm:host=3Dtpm,port=3D2321")
            tpm.startup(TPM2_SU.CLEAR)

            r =3D tpm.get_random(8)
            print("type is ", type(r))
            print("r    is ", str(r))
            print("as int  ", int(str(r), 16))


        When I run it in one Dockerfile I used
        tpm =3D ESAPI(tcti=3D"swtpm:host=3Dlocalhost,port=3D2321")

        so I thought changing the host name to the docker container name sh=
ould do it but I always get the following errors:
        app  | WARNING:tcti:src/util/io.c:262:socket_connect() Failed to co=
nnect to host 172.21.0.2, port 2321: errno 111: Connection refused
        app  | ERROR:tcti:src/tss2-tcti/tcti-swtpm.c:614:Tss2_Tcti_Swtpm_In=
it() Cannot connect to swtpm TPM socket
        app  | ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() C=
ould not initialize TCTI file: swtpm
        app  | ERROR:tcti:src/tss2-tcti/tctildr.c:428:Tss2_TctiLdr_Initiali=
ze_Ex() Failed to instantiate TCTI
        app  | Traceback (most recent call last):
        app  |   File "/app/main.py", line 70, in <module>
        app  |     tpm =3D ESAPI(tcti=3D"swtpm:host=3Dtpm,port=3D2321")
        app  |   File "/usr/local/lib/python3.10/dist-packages/tpm2_pytss/E=
SAPI.py", line 123, in __init__
        app  |     tcti =3D TCTILdr.parse(tcti)
        app  |   File "/usr/local/lib/python3.10/dist-packages/tpm2_pytss/T=
CTILdr.py", line 54, in parse
        app  |     return cls(name, conf)
        app  |   File "/usr/local/lib/python3.10/dist-packages/tpm2_pytss/T=
CTILdr.py", line 29, in __init__
        app  |     _chkrc(lib.Tss2_TctiLdr_Initialize_Ex(name, conf, self._=
ctx_pp))
        app  |   File "/usr/local/lib/python3.10/dist-packages/tpm2_pytss/i=
nternal/utils.py", line 32, in _chkr
        app  |     raise TSS2_Exception(rc)
        app  | tpm2_pytss.TSS2_Exception.TSS2_Exception: tcti:IO failure
        app exited with code 1



        I know it=E2=80=99s not a plain tpm2-tss question, but does anyone =
has experience with that and can help me?

        Kind regards,
        Henry

        _______________________________________________
        tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.or=
g>
        To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:t=
pm2-leave(a)lists.01.org>
        %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2253446376125688817==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1XaW5kb3dzLTEyNTIiPgo8c3R5bGUgdHlwZT0idGV4dC9jc3MiIHN0
eWxlPSJkaXNwbGF5Om5vbmU7Ij4gUCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9IDwv
c3R5bGU+CjwvaGVhZD4KPGJvZHkgZGlyPSJsdHIiPgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
Q2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBj
b2xvcjogcmdiKDAsIDAsIDApOyIgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj4KT2ggbmV2ZXJtaW5k
IEkgc2VlIHlvdSBleHBvc2UgdGhlIHBvcnRzIGluIHRoZSBkb2NrZXJmaWxlIGFuZCBFcmlrIGZp
Z3VyZWQgaXQgb3V0LjwvZGl2Pgo8ZGl2IGlkPSJhcHBlbmRvbnNlbmQiPjwvZGl2Pgo8aHIgc3R5
bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4KPGRpdiBp
ZD0iZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGlicmksIHNhbnMtc2Vy
aWYiIHN0eWxlPSJmb250LXNpemU6MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBo
ZW5yeS5nYWRhY3pAc3R1ZC5oLWRhLmRlICZsdDtoZW5yeS5nYWRhY3pAc3R1ZC5oLWRhLmRlJmd0
Ozxicj4KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwgSnVseSAyNywgMjAyMiA3OjM5IEFNPGJyPgo8
Yj5Ubzo8L2I+ICdFcmlrJyAmbHQ7d2hvKzAxdHBtQGNuYWNrZXJzLm9yZyZndDs7IHRwbTJAbGlz
dHMuMDEub3JnICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8YnI+CjxiPlN1YmplY3Q6PC9iPiBb
dHBtMl0gUmU6IHRwbTItcHl0c3MgY29ubmVjdCB0byBkb2NrZXJpemVkIHN3dHBtPC9mb250Pgo8
ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdiBjbGFzcz0iQm9keUZyYWdtZW50Ij48Zm9udCBz
aXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4KPGRpdiBjbGFzcz0iUGxhaW5U
ZXh0Ij5IaSBFcmlrLDxicj4KPGJyPgpUaGFuayB5b3UgdmVyeSBtdWNoISBUaGUgc3VnZ2VzdGlv
biBhYm91dCB0aGUgc3d0cG0gSVAgYWRkcmVzcyB3YXMgY29ycmVjdCE8YnI+Cjxicj4KQmVzdCBy
ZWdhcmRzLDxicj4KSGVucnk8YnI+Cjxicj4KLS0tLS1VcnNwcvxuZ2xpY2hlIE5hY2hyaWNodC0t
LS0tPGJyPgpWb246IEVyaWsgJmx0O3dobyswMXRwbUBjbmFja2Vycy5vcmcmZ3Q7IDxicj4KR2Vz
ZW5kZXQ6IE1pdHR3b2NoLCAyNy4gSnVsaSAyMDIyIDE0OjE2PGJyPgpBbjogaGVucnkuZ2FkYWN6
QHN0dWQuaC1kYS5kZTsgdHBtMkBsaXN0cy4wMS5vcmc8YnI+CkJldHJlZmY6IFt0cG0yXSBSZTog
dHBtMi1weXRzcyBjb25uZWN0IHRvIGRvY2tlcml6ZWQgc3d0cG08YnI+Cjxicj4KSEksPGJyPgo8
YnI+CnN3dHBtIG9ubHkgbGlzdGVucyBvbiAxMjcuMC4wLjEgYnkgZGVmYXVsdCwgc28gdW5sZXNz
IHlvdSBoYXZlIGNoYW5nZWQgdGhhdCBpdCB3b250IGJlIGFjY2Vzc2libGUgYnkgYW55IG90aGVy
IGFkZHJlc3MuPGJyPgpkb2NrZXIgY29tcG9zZSBzZWVtcyB0byB1c2UgdGhlIHNhbWUgbmV0d29y
ayBuYW1lc3BhY2UgZm9yIGVhY2ggY29udGFpbmVyIHNvIGxvY2FsaG9zdCBzaG91bGQgd29yaywg
YnV0IGl0IG1pZ2h0IGJlIGFzIHNpbXBsZSBhcyB0aGF0IHRoZSBweXRob24gc2NyaXB0IHJ1bnMg
YmVmb3JlIHN3dHBtIGlzIHJlYWR5Ljxicj4KVGhlIHVuaXQgdGVzdHMgZm9yIHRwbTItcHl0c3Mg
dHJpZXMgdG8gY29ubmVjdCB0byBzd3RwbSBhIGNvdXBsZSBvZiB0aW1lcyB3aXRoIGEgc21hbGwg
c2xlZXAgaW4gYmV0d2VlbiBlYWNoIHRyeSB0byBnZXQgYXJvdW5kIHRoYXQsIHNvIHRyeSBhZGRp
bmcgZm9yIGV4YW1wbGUgdGltZS5zbGVlcCg1KSBiZWZvcmUgY2FsbGluZyBFU0FQSSguLi4pIHRv
IHNlZSBpZiB0aGF0IGhlbHBzLjxicj4KPGJyPgovRXJpazxicj4KPGJyPgpPbiBXZWQsIDIwMjIt
MDctMjcgYXQgMTA6MjkgKzAyMDAsIGhlbnJ5LmdhZGFjekBzdHVkLmgtZGEuZGUgJmx0OzxhIGhy
ZWY9Im1haWx0bzpoZW5yeS5nYWRhY3pAc3R1ZC5oLWRhLmRlIj5tYWlsdG86aGVucnkuZ2FkYWN6
QHN0dWQuaC1kYS5kZTwvYT4mZ3Q7Jm5ic3A7IHdyb3RlOjxicj4KPGJyPgombmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgSGVsbG8gZXZlcnlvbmUsPGJyPgombmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGJyPgombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgSSBhbSB0cnlpbmcgdG8gYWNjb21wbGlz
aCB0aGUgZm9sbG93aW5nLCBidXQgZGlkIG5vdCBzdWNjZWVkIGFuZCBJIGhvcGUgc29tZW9uZSBj
YW4gaGVscCBtZS48YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBJIHdhbnQgdG8gaGF2ZSBhIGRvY2tlciBjb21wb3NlIHdpdGggdHdvIGNvbnRhaW5lcnMuIElu
IHRoZSBmaXJzdCBjb250YWluZXIgSSB3YW50IHRvIHJ1biB0aGUgc3d0cG0gKDxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS9zdGVmYW5iZXJnZXIvc3d0cG0iPmh0dHBzOi8vZ2l0aHViLmNvbS9z
dGVmYW5iZXJnZXIvc3d0cG08L2E+KSBhbmQgaW4gdGhlIG90aGVyIGEgcHl0aG9uIHNjcmlwdCB0
aGF0IHVzZXMgdHBtMi1weXRzcyB0bwogY29ubmVjdCB0byB0aGUgc3d0cG0gaW4gdGhlIGZpcnN0
IGNvbnRhaW5lci4gPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
V2hlbiBJIHJ1biBzd3RwbSBhbmQgdGhlIHB5dGhvbiBzY3JpcHQgaW4gdGhlIHNhbWUgY29udGFp
bmVyIGl0IHdvcmtzLjxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IEluIG9yZGVyIHRvIHJ1biB0aGVtIGluIHNlcGFyYXRlIGNvbnRhaW5lcnMgSSBqdXN0IGR1
cGxpY2F0ZWQgdGhlIERvY2tlcmZpbGUgKEkga25vdyB0aGlzIGhhcyBzb21lIG92ZXJoZWFkLCBi
dXQgdG8gbWFrZSBzdXJlIGRvbpJ0IG1pc3MgYW55IGRlcGVuZGVuY2llcyksIGNoYW5nZWQgdGhl
IGRvY2tlciBDTUQgY29tbWFuZCB0byBlaXRoZXIgcnVuIHRoZSBweXRob24gc2NyaXB0IG9yIHRo
ZSBzd3RwbSBhbmQgcmVuYW1lZCB0aGVtCiB0byBEb2NrZXJmaWxlX2FwcF90ZXN0IGFuZCBEb2Nr
ZXJmaWxlX3RwbV90ZXN0Ljxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IDxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IE15IGRvY2tlciBjb21wb3NlIGZpbGUgaXMgbG9va2luZyBsaWtlIHRoaXM6PGJyPgombmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdmVyc2lvbjogJzMuNyc8YnI+
CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBzZXJ2aWNlczo8YnI+
Cjxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IGFwcDo8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBjb250YWluZXJfbmFtZTogYXBwPGJyPgombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
YnVpbGQ6PGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgY29udGV4dDogLjxicj4KJm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IGRvY2tlcmZpbGU6IERvY2tlcmZpbGVfYXBwX3Rlc3Q8YnI+CiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyByZXN0YXJ0OiB1bmxlc3Mtc3RvcHBlZDxicj4KPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdHBtOjxicj4KJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvbnRh
aW5lcl9uYW1lOiB0cG08YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBidWlsZDo8YnI+CiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBjb250ZXh0OiAuPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgZG9ja2VyZmlsZTogRG9j
a2VyZmlsZV90cG1fdGVzdDxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHBvcnRzOjxicj4KJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IC0gJnF1b3Q7MjMyMToyMzIxJnF1b3Q7PGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
LSAmcXVvdDsyMzIyOjIzMjImcXVvdDs8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXN0YXJ0OiB1bmxlc3Mtc3Rv
cHBlZDxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IDxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxi
cj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IE15IHB5dGhvbiBz
Y3JpcHQgaXM6PGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
ZnJvbSB0cG0yX3B5dHNzIGltcG9ydCAqPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgaWYgX19uYW1lX18gPT0gJ19fbWFpbl9fJzo8YnI+CiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBw
cmludCgmcXVvdDtUUE0gdGVzdCBhcHBsaWNhdGlvbiZxdW90Oyk8YnI+CiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB0cG0g
PSBFU0FQSSh0Y3RpPSZxdW90O3N3dHBtOmhvc3Q9dHBtLHBvcnQ9MjMyMSZxdW90Oyk8YnI+CiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyB0cG0uc3RhcnR1cChUUE0yX1NVLkNMRUFSKTxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxicj4KJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHIgPSB0cG0uZ2V0X3JhbmRvbSg4KTxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHByaW50KCZxdW90O3R5
cGUgaXMgJnF1b3Q7LCB0eXBlKHIpKTxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHByaW50KCZxdW90O3ImbmJzcDsm
bmJzcDsmbmJzcDsgaXMgJnF1b3Q7LCBzdHIocikpPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcHJpbnQoJnF1b3Q7
YXMgaW50Jm5ic3A7ICZxdW90OywgaW50KHN0cihyKSwgMTYpKTxicj4KPGJyPgombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGJyPgombmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgV2hlbiBJIHJ1biBpdCBpbiBvbmUgRG9ja2Vy
ZmlsZSBJIHVzZWQgPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgdHBtID0gRVNBUEkodGN0aT0mcXVvdDtzd3RwbTpob3N0PWxvY2FsaG9zdCxwb3J0PTIzMjEm
cXVvdDspPGJyPgo8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBzbyBJIHRob3VnaHQgY2hhbmdpbmcgdGhlIGhvc3QgbmFtZSB0byB0aGUgZG9ja2VyIGNvbnRh
aW5lciBuYW1lIHNob3VsZCBkbyBpdCBidXQgSSBhbHdheXMgZ2V0IHRoZSBmb2xsb3dpbmcgZXJy
b3JzOjxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFwcCZu
YnNwOyB8IFdBUk5JTkc6dGN0aTpzcmMvdXRpbC9pby5jOjI2Mjpzb2NrZXRfY29ubmVjdCgpIEZh
aWxlZCB0byBjb25uZWN0IHRvIGhvc3QgMTcyLjIxLjAuMiwgcG9ydCAyMzIxOiBlcnJubyAxMTE6
IENvbm5lY3Rpb24gcmVmdXNlZAo8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBhcHAmbmJzcDsgfCBFUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aS1zd3Rw
bS5jOjYxNDpUc3MyX1RjdGlfU3d0cG1fSW5pdCgpIENhbm5vdCBjb25uZWN0IHRvIHN3dHBtIFRQ
TSBzb2NrZXQKPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
YXBwJm5ic3A7IHwgRVJST1I6dGN0aTpzcmMvdHNzMi10Y3RpL3RjdGlsZHItZGwuYzoxNzA6dGN0
aV9mcm9tX2ZpbGUoKSBDb3VsZCBub3QgaW5pdGlhbGl6ZSBUQ1RJIGZpbGU6IHN3dHBtCjxicj4K
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFwcCZuYnNwOyB8IEVS
Uk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLmM6NDI4OlRzczJfVGN0aUxkcl9Jbml0aWFs
aXplX0V4KCkgRmFpbGVkIHRvIGluc3RhbnRpYXRlIFRDVEkKPGJyPgombmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgYXBwJm5ic3A7IHwgVHJhY2ViYWNrIChtb3N0IHJl
Y2VudCBjYWxsIGxhc3QpOjxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IGFwcCZuYnNwOyB8Jm5ic3A7Jm5ic3A7IEZpbGUgJnF1b3Q7L2FwcC9tYWluLnB5JnF1
b3Q7LCBsaW5lIDcwLCBpbiAmbHQ7bW9kdWxlJmd0Ozxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFwcCZuYnNwOyB8Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IHRwbSA9IEVTQVBJKHRjdGk9JnF1b3Q7c3d0cG06aG9zdD10cG0scG9ydD0yMzIxJnF1b3Q7KTxi
cj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFwcCZuYnNwOyB8
Jm5ic3A7Jm5ic3A7IEZpbGUgJnF1b3Q7L3Vzci9sb2NhbC9saWIvcHl0aG9uMy4xMC9kaXN0LXBh
Y2thZ2VzL3RwbTJfcHl0c3MvRVNBUEkucHkmcXVvdDssIGxpbmUgMTIzLCBpbiBfX2luaXRfXzxi
cj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFwcCZuYnNwOyB8
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRjdGkgPSBUQ1RJTGRyLnBhcnNlKHRjdGkpPGJyPgom
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgYXBwJm5ic3A7IHwmbmJz
cDsmbmJzcDsgRmlsZSAmcXVvdDsvdXNyL2xvY2FsL2xpYi9weXRob24zLjEwL2Rpc3QtcGFja2Fn
ZXMvdHBtMl9weXRzcy9UQ1RJTGRyLnB5JnF1b3Q7LCBsaW5lIDU0LCBpbiBwYXJzZTxicj4KJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFwcCZuYnNwOyB8Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiBjbHMobmFtZSwgY29uZik8YnI+CiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBhcHAmbmJzcDsgfCZuYnNwOyZuYnNwOyBG
aWxlICZxdW90Oy91c3IvbG9jYWwvbGliL3B5dGhvbjMuMTAvZGlzdC1wYWNrYWdlcy90cG0yX3B5
dHNzL1RDVElMZHIucHkmcXVvdDssIGxpbmUgMjksIGluIF9faW5pdF9fPGJyPgombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgYXBwJm5ic3A7IHwmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgX2Noa3JjKGxpYi5Uc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZV9FeChuYW1lLCBj
b25mLCBzZWxmLl9jdHhfcHApKTxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IGFwcCZuYnNwOyB8Jm5ic3A7Jm5ic3A7IEZpbGUgJnF1b3Q7L3Vzci9sb2NhbC9s
aWIvcHl0aG9uMy4xMC9kaXN0LXBhY2thZ2VzL3RwbTJfcHl0c3MvaW50ZXJuYWwvdXRpbHMucHkm
cXVvdDssIGxpbmUgMzIsIGluIF9jaGtyPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgYXBwJm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmFpc2Ug
VFNTMl9FeGNlcHRpb24ocmMpPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgYXBwJm5ic3A7IHwgdHBtMl9weXRzcy5UU1MyX0V4Y2VwdGlvbi5UU1MyX0V4Y2Vw
dGlvbjogdGN0aTpJTyBmYWlsdXJlPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgYXBwIGV4aXRlZCB3aXRoIGNvZGUgMTxicj4KPGJyPgombmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGJyPgombmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGJyPgombmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgSSBrbm93IGl0knMgbm90IGEgcGxhaW4gdHBtMi10c3Mg
cXVlc3Rpb24sIGJ1dCBkb2VzIGFueW9uZSBoYXMgZXhwZXJpZW5jZSB3aXRoIHRoYXQgYW5kIGNh
biBoZWxwIG1lPwo8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyA8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBL
aW5kIHJlZ2FyZHMsIDxicj4KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IEhlbnJ5PGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgPGJyPgombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB0cG0yIG1haWxpbmcgbGlzdCAtLSB0
cG0yQGxpc3RzLjAxLm9yZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIj5t
YWlsdG86dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Owo8YnI+CiZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRw
bTItbGVhdmVAbGlzdHMuMDEub3JnICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0
cy4wMS5vcmciPm1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7Cjxicj4KJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICUod2ViX3BhZ2VfdXJsKXNs
aXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJyPgo8YnI+Cjxicj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGlu
ZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEub3JnPGJyPgolKHdlYl9wYWdlX3VybClzbGlzdGlu
Zm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczwvZGl2Pgo8L3NwYW4+PC9mb250PjwvZGl2
Pgo8L2JvZHk+CjwvaHRtbD4K

--===============2253446376125688817==--

