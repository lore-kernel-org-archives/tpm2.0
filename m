Content-Type: multipart/mixed; boundary="===============7924428233062922614=="
MIME-Version: 1.0
From: Erik <who+01tpm at cnackers.org>
Subject: [tpm2] Re: tpm2-pytss connect to dockerized swtpm
Date: Wed, 27 Jul 2022 14:16:04 +0200
Message-ID: <7493c7a8b32f01bef6b601bd51e5285cd10855e5.camel@cnackers.org>
In-Reply-To: 007f01d8a192$f6229bb0$e267d310$@stud.h-da.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7924428233062922614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

HI,

swtpm only listens on 127.0.0.1 by default, so unless you have changed that=
 it wont be accessible by any other address.
docker compose seems to use the same network namespace for each container s=
o localhost should work, but it might be as
simple as that the python script runs before swtpm is ready.
The unit tests for tpm2-pytss tries to connect to swtpm a couple of times w=
ith a small sleep in between each try to get
around that, so try adding for example time.sleep(5) before calling ESAPI(.=
..) to see if that helps.

/Erik

On Wed, 2022-07-27 at 10:29 +0200, henry.gadacz(a)stud.h-da.de wrote:
> Hello everyone,
> =C2=A0
> I am trying to accomplish the following, but did not succeed and I hope s=
omeone can help me.
> I want to have a docker compose with two containers. In the first contain=
er I want to run the swtpm
> (https://github.com/stefanberger/swtpm) and in the other a python script =
that uses tpm2-pytss to connect to the swtpm
> in the first container. =

> =C2=A0
> When I run swtpm and the python script in the same container it works.
> In order to run them in separate containers I just duplicated the Dockerf=
ile (I know this has some overhead, but to
> make sure don=E2=80=99t miss any dependencies), changed the docker CMD co=
mmand to either run the python script or the swtpm
> and renamed them to Dockerfile_app_test and Dockerfile_tpm_test.
> =C2=A0
> My docker compose file is looking like this:
> version: '3.7'
> services:
> =

> =C2=A0 app:
> =C2=A0=C2=A0=C2=A0 container_name: app
> =C2=A0=C2=A0=C2=A0 build:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context: .
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dockerfile: Dockerfile_app_test
> =C2=A0=C2=A0=C2=A0 restart: unless-stopped
> =

> =C2=A0 tpm:
> =C2=A0=C2=A0=C2=A0 container_name: tpm
> =C2=A0=C2=A0=C2=A0 build:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context: .
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dockerfile: Dockerfile_tpm_test
> =C2=A0=C2=A0=C2=A0 ports:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "2321:2321"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - "2322:2322"
> =C2=A0=C2=A0=C2=A0 restart: unless-stopped
> =C2=A0
> =C2=A0
> My python script is:
> from tpm2_pytss import *
> if __name__ =3D=3D '__main__':
> =C2=A0=C2=A0=C2=A0 print("TPM test application")
> =C2=A0=C2=A0=C2=A0 tpm =3D ESAPI(tcti=3D"swtpm:host=3Dtpm,port=3D2321")
> =C2=A0=C2=A0=C2=A0 tpm.startup(TPM2_SU.CLEAR)
> =C2=A0=C2=A0=C2=A0 =

> =C2=A0=C2=A0=C2=A0=C2=A0r =3D tpm.get_random(8)
> =C2=A0=C2=A0=C2=A0 print("type is ", type(r))
> =C2=A0=C2=A0=C2=A0 print("r=C2=A0=C2=A0=C2=A0 is ", str(r))
> =C2=A0=C2=A0=C2=A0 print("as int=C2=A0 ", int(str(r), 16))
> =

> =C2=A0
> When I run it in one Dockerfile I used =

> tpm =3D ESAPI(tcti=3D"swtpm:host=3Dlocalhost,port=3D2321")
> =

> so I thought changing the host name to the docker container name should d=
o it but I always get the following errors:
> app=C2=A0 | WARNING:tcti:src/util/io.c:262:socket_connect() Failed to con=
nect to host 172.21.0.2, port 2321: errno 111:
> Connection refused =

> app=C2=A0 | ERROR:tcti:src/tss2-tcti/tcti-swtpm.c:614:Tss2_Tcti_Swtpm_Ini=
t() Cannot connect to swtpm TPM socket =

> app=C2=A0 | ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() Co=
uld not initialize TCTI file: swtpm =

> app=C2=A0 | ERROR:tcti:src/tss2-tcti/tctildr.c:428:Tss2_TctiLdr_Initializ=
e_Ex() Failed to instantiate TCTI =

> app=C2=A0 | Traceback (most recent call last):
> app=C2=A0 |=C2=A0=C2=A0 File "/app/main.py", line 70, in <module>
> app=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 tpm =3D ESAPI(tcti=3D"swtpm:host=3Dtp=
m,port=3D2321")
> app=C2=A0 |=C2=A0=C2=A0 File "/usr/local/lib/python3.10/dist-packages/tpm=
2_pytss/ESAPI.py", line 123, in __init__
> app=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 tcti =3D TCTILdr.parse(tcti)
> app=C2=A0 |=C2=A0=C2=A0 File "/usr/local/lib/python3.10/dist-packages/tpm=
2_pytss/TCTILdr.py", line 54, in parse
> app=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 return cls(name, conf)
> app=C2=A0 |=C2=A0=C2=A0 File "/usr/local/lib/python3.10/dist-packages/tpm=
2_pytss/TCTILdr.py", line 29, in __init__
> app=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 _chkrc(lib.Tss2_TctiLdr_Initialize_Ex=
(name, conf, self._ctx_pp))
> app=C2=A0 |=C2=A0=C2=A0 File "/usr/local/lib/python3.10/dist-packages/tpm=
2_pytss/internal/utils.py", line 32, in _chkr
> app=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 raise TSS2_Exception(rc)
> app=C2=A0 | tpm2_pytss.TSS2_Exception.TSS2_Exception: tcti:IO failure
> app exited with code 1
> =

> =C2=A0
> =C2=A0
> I know it=E2=80=99s not a plain tpm2-tss question, but does anyone has ex=
perience with that and can help me? =

> =C2=A0
> Kind regards, =

> Henry
> =C2=A0
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============7924428233062922614==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+Cgo8L2hlYWQ+PGJvZHk+PGRpdj5ISSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PnN3dHBtIG9ubHkgbGlzdGVucyBvbiAxMjcuMC4wLjEgYnkgZGVmYXVsdCwgc28gdW5sZXNz
IHlvdSBoYXZlIGNoYW5nZWQgdGhhdCBpdCB3b250IGJlIGFjY2Vzc2libGUgYnkgYW55IG90aGVy
IGFkZHJlc3MuPC9kaXY+PGRpdj5kb2NrZXIgY29tcG9zZSBzZWVtcyB0byB1c2UgdGhlIHNhbWUg
bmV0d29yayBuYW1lc3BhY2UgZm9yIGVhY2ggY29udGFpbmVyIHNvIGxvY2FsaG9zdCBzaG91bGQg
d29yaywgYnV0IGl0IG1pZ2h0IGJlIGFzIHNpbXBsZSBhcyB0aGF0IHRoZSBweXRob24gc2NyaXB0
IHJ1bnMgYmVmb3JlIHN3dHBtIGlzIHJlYWR5LjwvZGl2PjxkaXY+VGhlIHVuaXQgdGVzdHMgZm9y
IHRwbTItcHl0c3MgdHJpZXMgdG8gY29ubmVjdCB0byBzd3RwbSBhIGNvdXBsZSBvZiB0aW1lcyB3
aXRoIGEgc21hbGwgc2xlZXAgaW4gYmV0d2VlbiBlYWNoIHRyeSB0byBnZXQgYXJvdW5kIHRoYXQs
IHNvIHRyeSBhZGRpbmcgZm9yIGV4YW1wbGUgdGltZS5zbGVlcCg1KSBiZWZvcmUgY2FsbGluZyBF
U0FQSSguLi4pIHRvIHNlZSBpZiB0aGF0IGhlbHBzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
L0VyaWs8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk9uIFdlZCwgMjAyMi0wNy0yNyBhdCAxMDoy
OSArMDIwMCwgPGEgaHJlZj0ibWFpbHRvOmhlbnJ5LmdhZGFjekBzdHVkLmgtZGEuZGUiPmhlbnJ5
LmdhZGFjekBzdHVkLmgtZGEuZGU8L2E+IHdyb3RlOjwvZGl2PjxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29s
aWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdj5IZWxsbyBldmVyeW9uZSw8L2Rpdj48ZGl2PiZuYnNw
OzwvZGl2PjxkaXY+SSBhbSB0cnlpbmcgdG8gYWNjb21wbGlzaCB0aGUgZm9sbG93aW5nLCBidXQg
ZGlkIG5vdCBzdWNjZWVkIGFuZCBJIGhvcGUgc29tZW9uZSBjYW4gaGVscCBtZS48L2Rpdj48ZGl2
Pkkgd2FudCB0byBoYXZlIGEgZG9ja2VyIGNvbXBvc2Ugd2l0aCB0d28gY29udGFpbmVycy4gSW4g
dGhlIGZpcnN0IGNvbnRhaW5lciBJIHdhbnQgdG8gcnVuIHRoZSBzd3RwbSAoPGEgaHJlZj0iaHR0
cHM6Ly9naXRodWIuY29tL3N0ZWZhbmJlcmdlci9zd3RwbSI+aHR0cHM6Ly9naXRodWIuY29tL3N0
ZWZhbmJlcmdlci9zd3RwbTwvYT4pIGFuZCBpbiB0aGUgb3RoZXIgYSBweXRob24gc2NyaXB0IHRo
YXQgdXNlcyB0cG0yLXB5dHNzIHRvIGNvbm5lY3QgdG8gdGhlIHN3dHBtIGluIHRoZSBmaXJzdCBj
b250YWluZXIuIDwvZGl2PjxkaXY+Jm5ic3A7PC9kaXY+PGRpdj5XaGVuIEkgcnVuIHN3dHBtIGFu
ZCB0aGUgcHl0aG9uIHNjcmlwdCBpbiB0aGUgc2FtZSBjb250YWluZXIgaXQgd29ya3MuPC9kaXY+
PGRpdj5JbiBvcmRlciB0byBydW4gdGhlbSBpbiBzZXBhcmF0ZSBjb250YWluZXJzIEkganVzdCBk
dXBsaWNhdGVkIHRoZSBEb2NrZXJmaWxlIChJIGtub3cgdGhpcyBoYXMgc29tZSBvdmVyaGVhZCwg
YnV0IHRvIG1ha2Ugc3VyZSBkb27igJl0IG1pc3MgYW55IGRlcGVuZGVuY2llcyksIGNoYW5nZWQg
dGhlIGRvY2tlciBDTUQgY29tbWFuZCB0byBlaXRoZXIgcnVuIHRoZSBweXRob24gc2NyaXB0IG9y
IHRoZSBzd3RwbSBhbmQgcmVuYW1lZCB0aGVtIHRvIERvY2tlcmZpbGVfYXBwX3Rlc3QgYW5kIERv
Y2tlcmZpbGVfdHBtX3Rlc3QuPC9kaXY+PGRpdj4mbmJzcDs8L2Rpdj48ZGl2Pk15IGRvY2tlciBj
b21wb3NlIGZpbGUgaXMgbG9va2luZyBsaWtlIHRoaXM6PC9kaXY+PGRpdj52ZXJzaW9uOiAnMy43
JzwvZGl2PjxkaXY+c2VydmljZXM6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4mbmJzcDsgYXBw
OjwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvbnRhaW5lcl9uYW1lOiBhcHA8L2Rpdj48
ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyBidWlsZDo8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyBjb250ZXh0OiAuPC9kaXY+PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgZG9ja2VyZmlsZTogRG9ja2VyZmlsZV9hcHBfdGVzdDwvZGl2PjxkaXY+Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHJlc3RhcnQ6IHVubGVzcy1zdG9wcGVkPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj4mbmJzcDsgdHBtOjwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IGNvbnRhaW5lcl9u
YW1lOiB0cG08L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyBidWlsZDo8L2Rpdj48ZGl2PiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBjb250ZXh0OiAuPC9kaXY+PGRpdj4mbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgZG9ja2VyZmlsZTogRG9ja2VyZmlsZV90cG1fdGVzdDwv
ZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IHBvcnRzOjwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IC0gIjIzMjE6MjMyMSI8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyAtICIyMzIyOjIzMjIiPC9kaXY+PGRpdj4mbmJzcDsmbmJzcDsmbmJz
cDsgcmVzdGFydDogdW5sZXNzLXN0b3BwZWQ8L2Rpdj48ZGl2PiZuYnNwOzwvZGl2PjxkaXY+Jm5i
c3A7PC9kaXY+PGRpdj5NeSBweXRob24gc2NyaXB0IGlzOjwvZGl2PjxkaXY+ZnJvbSB0cG0yX3B5
dHNzIGltcG9ydCAqPC9kaXY+PGRpdj5pZiBfX25hbWVfXyA9PSAnX19tYWluX18nOjwvZGl2Pjxk
aXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IHByaW50KCJUUE0gdGVzdCBhcHBsaWNhdGlvbiIpPC9kaXY+
PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgdHBtID0gRVNBUEkodGN0aT0ic3d0cG06aG9zdD10cG0s
cG9ydD0yMzIxIik8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyB0cG0uc3RhcnR1cChUUE0y
X1NVLkNMRUFSKTwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IDwvZGl2PjxkaXY+Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7ciA9IHRwbS5nZXRfcmFuZG9tKDgpPC9kaXY+PGRpdj4mbmJzcDsm
bmJzcDsmbmJzcDsgcHJpbnQoInR5cGUgaXMgIiwgdHlwZShyKSk8L2Rpdj48ZGl2PiZuYnNwOyZu
YnNwOyZuYnNwOyBwcmludCgiciZuYnNwOyZuYnNwOyZuYnNwOyBpcyAiLCBzdHIocikpPC9kaXY+
PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgcHJpbnQoImFzIGludCZuYnNwOyAiLCBpbnQoc3RyKHIp
LCAxNikpPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4mbmJzcDs8L2Rpdj48ZGl2PldoZW4gSSBy
dW4gaXQgaW4gb25lIERvY2tlcmZpbGUgSSB1c2VkIDwvZGl2PjxkaXY+dHBtID0gRVNBUEkodGN0
aT0ic3d0cG06aG9zdD1sb2NhbGhvc3QscG9ydD0yMzIxIik8L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PnNvIEkgdGhvdWdodCBjaGFuZ2luZyB0aGUgaG9zdCBuYW1lIHRvIHRoZSBkb2NrZXIgY29u
dGFpbmVyIG5hbWUgc2hvdWxkIGRvIGl0IGJ1dCBJIGFsd2F5cyBnZXQgdGhlIGZvbGxvd2luZyBl
cnJvcnM6PC9kaXY+PGRpdj5hcHAmbmJzcDsgfCBXQVJOSU5HOnRjdGk6c3JjL3V0aWwvaW8uYzoy
NjI6c29ja2V0X2Nvbm5lY3QoKSBGYWlsZWQgdG8gY29ubmVjdCB0byBob3N0IDE3Mi4yMS4wLjIs
IHBvcnQgMjMyMTogZXJybm8gMTExOiBDb25uZWN0aW9uIHJlZnVzZWQgPC9kaXY+PGRpdj5hcHAm
bmJzcDsgfCBFUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aS1zd3RwbS5jOjYxNDpUc3MyX1Rj
dGlfU3d0cG1fSW5pdCgpIENhbm5vdCBjb25uZWN0IHRvIHN3dHBtIFRQTSBzb2NrZXQgPC9kaXY+
PGRpdj5hcHAmbmJzcDsgfCBFUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aWxkci1kbC5jOjE3
MDp0Y3RpX2Zyb21fZmlsZSgpIENvdWxkIG5vdCBpbml0aWFsaXplIFRDVEkgZmlsZTogc3d0cG0g
PC9kaXY+PGRpdj5hcHAmbmJzcDsgfCBFUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aWxkci5j
OjQyODpUc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZV9FeCgpIEZhaWxlZCB0byBpbnN0YW50aWF0ZSBU
Q1RJIDwvZGl2PjxkaXY+YXBwJm5ic3A7IHwgVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxh
c3QpOjwvZGl2PjxkaXY+YXBwJm5ic3A7IHwmbmJzcDsmbmJzcDsgRmlsZSAiL2FwcC9tYWluLnB5
IiwgbGluZSA3MCwgaW4gJmx0O21vZHVsZSZndDs8L2Rpdj48ZGl2PmFwcCZuYnNwOyB8Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IHRwbSA9IEVTQVBJKHRjdGk9InN3dHBtOmhvc3Q9dHBtLHBvcnQ9
MjMyMSIpPC9kaXY+PGRpdj5hcHAmbmJzcDsgfCZuYnNwOyZuYnNwOyBGaWxlICIvdXNyL2xvY2Fs
L2xpYi9weXRob24zLjEwL2Rpc3QtcGFja2FnZXMvdHBtMl9weXRzcy9FU0FQSS5weSIsIGxpbmUg
MTIzLCBpbiBfX2luaXRfXzwvZGl2PjxkaXY+YXBwJm5ic3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgdGN0aSA9IFRDVElMZHIucGFyc2UodGN0aSk8L2Rpdj48ZGl2PmFwcCZuYnNwOyB8Jm5i
c3A7Jm5ic3A7IEZpbGUgIi91c3IvbG9jYWwvbGliL3B5dGhvbjMuMTAvZGlzdC1wYWNrYWdlcy90
cG0yX3B5dHNzL1RDVElMZHIucHkiLCBsaW5lIDU0LCBpbiBwYXJzZTwvZGl2PjxkaXY+YXBwJm5i
c3A7IHwmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIGNscyhuYW1lLCBjb25mKTwvZGl2
PjxkaXY+YXBwJm5ic3A7IHwmbmJzcDsmbmJzcDsgRmlsZSAiL3Vzci9sb2NhbC9saWIvcHl0aG9u
My4xMC9kaXN0LXBhY2thZ2VzL3RwbTJfcHl0c3MvVENUSUxkci5weSIsIGxpbmUgMjksIGluIF9f
aW5pdF9fPC9kaXY+PGRpdj5hcHAmbmJzcDsgfCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBfY2hr
cmMobGliLlRzczJfVGN0aUxkcl9Jbml0aWFsaXplX0V4KG5hbWUsIGNvbmYsIHNlbGYuX2N0eF9w
cCkpPC9kaXY+PGRpdj5hcHAmbmJzcDsgfCZuYnNwOyZuYnNwOyBGaWxlICIvdXNyL2xvY2FsL2xp
Yi9weXRob24zLjEwL2Rpc3QtcGFja2FnZXMvdHBtMl9weXRzcy9pbnRlcm5hbC91dGlscy5weSIs
IGxpbmUgMzIsIGluIF9jaGtyPC9kaXY+PGRpdj5hcHAmbmJzcDsgfCZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyByYWlzZSBUU1MyX0V4Y2VwdGlvbihyYyk8L2Rpdj48ZGl2PmFwcCZuYnNwOyB8IHRw
bTJfcHl0c3MuVFNTMl9FeGNlcHRpb24uVFNTMl9FeGNlcHRpb246IHRjdGk6SU8gZmFpbHVyZTwv
ZGl2PjxkaXY+YXBwIGV4aXRlZCB3aXRoIGNvZGUgMTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
Jm5ic3A7PC9kaXY+PGRpdj4mbmJzcDs8L2Rpdj48ZGl2Pkkga25vdyBpdOKAmXMgbm90IGEgcGxh
aW4gdHBtMi10c3MgcXVlc3Rpb24sIGJ1dCBkb2VzIGFueW9uZSBoYXMgZXhwZXJpZW5jZSB3aXRo
IHRoYXQgYW5kIGNhbiBoZWxwIG1lPyA8L2Rpdj48ZGl2PiZuYnNwOzwvZGl2PjxkaXY+S2luZCBy
ZWdhcmRzLCA8L2Rpdj48ZGl2PkhlbnJ5PC9kaXY+PGRpdj4mbmJzcDs8L2Rpdj48ZGl2Pl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPC9kaXY+PGRpdj50cG0y
IG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciPnRwbTJA
bGlzdHMuMDEub3JnPC9hPjwvZGl2PjxkaXY+VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0
byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciPnRwbTItbGVhdmVAbGlz
dHMuMDEub3JnPC9hPjwvZGl2PjxkaXY+JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQp
cy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRp
dj48c3Bhbj48L3NwYW4+PC9kaXY+PC9ib2R5PjwvaHRtbD4K

--===============7924428233062922614==--

