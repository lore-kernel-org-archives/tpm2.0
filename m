Content-Type: multipart/mixed; boundary="===============1292952878118752539=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] abrmd crash
Date: Wed, 12 May 2021 15:40:47 -0400
Message-ID: <OF5D487F7C.8847A990-ON002586D3.006C07B8-852586D3.006C1AC5@notes.na.collabserv.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1292952878118752539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


New install, Fedora 34.
TPM2TOOLS_TCTI=3Dtabrmd:bus_name=3Dcom.intel.tss2.Tabrmd


tpm2-abrmd --tcti=3Dmssim
connects to the SW TPM.
When I try
tpm2_getrandom --hex 8
abrmd exits, with no error message.


The result of tpm2_getrandom is


** (process:3031): WARNING **: 15:33:25.743: Failed to create connection
with service: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Remote peer
disconnected
WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init for
function 0x7f0122633210 failed with a0008
WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could not
initialize TCTI named: tcti-abrmd
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not
initialize TCTI file: tabrmd
ERROR:tcti:src/tss2-tcti/tctildr.c:416:Tss2_TctiLdr_Initialize_Ex() Failed
to instantiate TCTI
ERROR: Could not load tcti, got: "tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"


--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)

--===============1292952878118752539==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+TmV3IGluc3RhbGwsIEZlZG9yYSAzNC48YnI+VFBNMlRPT0xTX1RDVEk9
dGFicm1kOmJ1c19uYW1lPWNvbS5pbnRlbC50c3MyLlRhYnJtZAo8cD50cG0yLWFicm1kIC0tdGN0
aT1tc3NpbTxicj5jb25uZWN0cyB0byB0aGUgU1cgVFBNLjxicj5XaGVuIEkgdHJ5PGJyPnRwbTJf
Z2V0cmFuZG9tIC0taGV4IDg8YnI+YWJybWQgZXhpdHMsIHdpdGggbm8gZXJyb3IgbWVzc2FnZS4K
PHA+VGhlIHJlc3VsdCBvZiB0cG0yX2dldHJhbmRvbSBpcwo8cD4qKiAocHJvY2VzczozMDMxKTog
V0FSTklORyAqKjogMTU6MzM6MjUuNzQzOiBGYWlsZWQgdG8gY3JlYXRlIGNvbm5lY3Rpb24gd2l0
aCBzZXJ2aWNlOiBHREJ1cy5FcnJvcjpvcmcuZnJlZWRlc2t0b3AuREJ1cy5FcnJvci5Ob1JlcGx5
OiBSZW1vdGUgcGVlciBkaXNjb25uZWN0ZWQ8YnI+V0FSTklORzp0Y3RpOnNyYy90c3MyLXRjdGkv
dGN0aWxkci5jOjc5OnRjdGlfZnJvbV9pbml0KCkgVENUSSBpbml0IGZvciBmdW5jdGlvbiAweDdm
MDEyMjYzMzIxMCBmYWlsZWQgd2l0aCBhMDAwODxicj5XQVJOSU5HOnRjdGk6c3JjL3RzczItdGN0
aS90Y3RpbGRyLmM6MTA5OnRjdGlfZnJvbV9pbmZvKCkgQ291bGQgbm90IGluaXRpYWxpemUgVENU
SSBuYW1lZDogdGN0aS1hYnJtZDxicj5FUlJPUjp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aWxkci1k
bC5jOjE1NDp0Y3RpX2Zyb21fZmlsZSgpIENvdWxkIG5vdCBpbml0aWFsaXplIFRDVEkgZmlsZTog
dGFicm1kPGJyPkVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLmM6NDE2OlRzczJfVGN0
aUxkcl9Jbml0aWFsaXplX0V4KCkgRmFpbGVkIHRvIGluc3RhbnRpYXRlIFRDVEk8YnI+RVJST1I6
IENvdWxkIG5vdCBsb2FkIHRjdGksIGdvdDogJnF1b3Q7dGFicm1kOmJ1c19uYW1lPWNvbS5pbnRl
bC50c3MyLlRhYnJtZCZxdW90Ozxicj48Zm9udCBzaXplPSIyIj48YnI+PGJyPi0tPGJyPktlbiBH
b2xkbWFuICAga2dvbGRtYW5AdXMuaWJtLmNvbSAgIDxicj45MTQtOTQ1LTI0MTUgKDg2Mi0yNDE1
KTxicj48L2ZvbnQ+PEJSPgo8L2JvZHk+PC9odG1sPgo=

--===============1292952878118752539==--

