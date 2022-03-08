Content-Type: multipart/mixed; boundary="===============4909856631035531358=="
MIME-Version: 1.0
From: Markus Willhelm Schmid <willhelm.schmid at gmail.com>
Subject: [tpm2] How do I use Microsoft's sim (TSS.MSR) with lib tss2-esys
Date: Tue, 08 Mar 2022 15:52:50 -0800
Message-ID: <CAMs2GAoW4oQK=w4AsJsThEwX-Myis8y+xnV2rYfrTEQiQAPMUw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4909856631035531358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have compiled the libraries using the included Visual Studio solution and
copied the following C example:
https://tpm2-software.github.io/tpm2-tss/getting-started/2019/02/05/Getting=
-Started.html

When I run the code, I get the following error when
function Esys_Initialize is called:
WARNING:tcti:tcti-tbs.c:292:Tss2_Tcti_Tbs_Init() Failed to create context
with TBS error: 0x8028400f
ERROR:tcti:tctildr-nodl.c:152:tctildr_get_default() No standard TCTI could
be loaded
ERROR:tcti:tctildr.c:428:Tss2_TctiLdr_Initialize_Ex() Failed to instantiate
TCTI
ERROR:esys:esys_context.c:69:Esys_Initialize() Initialize default tcti.
ErrorCode (0x000a000a)

I also tried to run the code using the Linux subsystem and I configured it
as follows:
./configure --enable-tcti-mssim
BTW, could not find any documentation on above, but it seemed to work?

When run without the simulator, I get a list of errors including:
WARNING:tcti:src/util/io.c:251:socket_connect() Failed to connect to host
127.0.0.1, port 2321: errno 111: Connection refused

I do not get the above socket error when the simulator is running, but it
still does not work:
ERROR:tcti:src/tss2-tcti/tcti-device.c:439:Tss2_Tcti_Device_Init() Failed
to open device file /dev/tpmrm0: No such file or directory
WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for
function 0x7f9b65ec1fb0 failed with a000a
WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not
initialize TCTI named: tcti-device
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not
initialize TCTI file: libtss2-tcti-device.so.0
ERROR:tcti:src/tss2-tcti/tcti-device.c:439:Tss2_Tcti_Device_Init() Failed
to open device file /dev/tpm0: No such file or directory
WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for
function 0x7f9b65ec1fb0 failed with a000a
WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not
initialize TCTI named: tcti-device
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not
initialize TCTI file: libtss2-tcti-device.so.0
WARNING:esys:src/tss2-esys/api/Esys_GetRandom.c:277:Esys_GetRandom_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_GetRandom.c:95:Esys_GetRandom() Esys
Finish ErrorCode (0x00000100)

--===============4909856631035531358==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SSBoYXZlIGNvbXBpbGVkIHRoZSBsaWJyYXJpZXMgdXNpbmcgdGhlIGlu
Y2x1ZGVkIFZpc3VhbCBTdHVkaW8gc29sdXRpb24gYW5kIGNvcGllZCB0aGUgZm9sbG93aW5nIEMg
ZXhhbXBsZTrCoDxhIGhyZWY9Imh0dHBzOi8vdHBtMi1zb2Z0d2FyZS5naXRodWIuaW8vdHBtMi10
c3MvZ2V0dGluZy1zdGFydGVkLzIwMTkvMDIvMDUvR2V0dGluZy1TdGFydGVkLmh0bWwiPmh0dHBz
Oi8vdHBtMi1zb2Z0d2FyZS5naXRodWIuaW8vdHBtMi10c3MvZ2V0dGluZy1zdGFydGVkLzIwMTkv
MDIvMDUvR2V0dGluZy1TdGFydGVkLmh0bWw8L2E+PGRpdj48YnI+PC9kaXY+PGRpdj5XaGVuIEkg
cnVuIHRoZSBjb2RlLCBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9yIHdoZW4gZnVuY3Rpb27CoEVz
eXNfSW5pdGlhbGl6ZSBpcyBjYWxsZWQ6PC9kaXY+PGRpdj5XQVJOSU5HOnRjdGk6dGN0aS10YnMu
YzoyOTI6VHNzMl9UY3RpX1Ric19Jbml0KCkgRmFpbGVkIHRvIGNyZWF0ZSBjb250ZXh0IHdpdGgg
VEJTIGVycm9yOiAweDgwMjg0MDBmPGJyPkVSUk9SOnRjdGk6dGN0aWxkci1ub2RsLmM6MTUyOnRj
dGlsZHJfZ2V0X2RlZmF1bHQoKSBObyBzdGFuZGFyZCBUQ1RJIGNvdWxkIGJlIGxvYWRlZDxicj5F
UlJPUjp0Y3RpOnRjdGlsZHIuYzo0Mjg6VHNzMl9UY3RpTGRyX0luaXRpYWxpemVfRXgoKSBGYWls
ZWQgdG8gaW5zdGFudGlhdGUgVENUSTxicj5FUlJPUjplc3lzOmVzeXNfY29udGV4dC5jOjY5OkVz
eXNfSW5pdGlhbGl6ZSgpIEluaXRpYWxpemUgZGVmYXVsdCB0Y3RpLiBFcnJvckNvZGUgKDB4MDAw
YTAwMGEpPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBhbHNvIHRyaWVkIHRvIHJ1biB0
aGUgY29kZSB1c2luZyB0aGUgTGludXggc3Vic3lzdGVtwqBhbmQgSSBjb25maWd1cmVkIGl0IGFz
IGZvbGxvd3M6PGJyPi4vY29uZmlndXJlIC0tZW5hYmxlLXRjdGktbXNzaW08YnI+QlRXLCBjb3Vs
ZCBub3QgZmluZCBhbnkgZG9jdW1lbnRhdGlvbiBvbiBhYm92ZSwgYnV0IGl0IHNlZW1lZCB0byB3
b3JrPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+V2hlbiBydW4gd2l0aG91dCB0aGUgc2ltdWxh
dG9yLCBJIGdldCBhIGxpc3Qgb2YgZXJyb3JzIGluY2x1ZGluZzo8YnI+V0FSTklORzp0Y3RpOnNy
Yy91dGlsL2lvLmM6MjUxOnNvY2tldF9jb25uZWN0KCkgRmFpbGVkIHRvIGNvbm5lY3QgdG8gaG9z
dCAxMjcuMC4wLjEsIHBvcnQgMjMyMTogZXJybm8gMTExOiBDb25uZWN0aW9uIHJlZnVzZWQ8YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGRvIG5vdCBnZXQgdGhlIGFib3ZlIHNvY2tldCBl
cnJvciB3aGVuIHRoZSBzaW11bGF0b3IgaXMgcnVubmluZywgYnV0IGl0IHN0aWxsIGRvZXMgbm90
IHdvcms6PGJyPkVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpLWRldmljZS5jOjQzOTpUc3My
X1RjdGlfRGV2aWNlX0luaXQoKSBGYWlsZWQgdG8gb3BlbiBkZXZpY2UgZmlsZSAvZGV2L3RwbXJt
MDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTxicj5XQVJOSU5HOnRjdGk6c3JjL3RzczItdGN0
aS90Y3RpbGRyLmM6NjI6dGN0aV9mcm9tX2luaXQoKSBUQ1RJIGluaXQgZm9yIGZ1bmN0aW9uIDB4
N2Y5YjY1ZWMxZmIwIGZhaWxlZCB3aXRoIGEwMDBhPGJyPldBUk5JTkc6dGN0aTpzcmMvdHNzMi10
Y3RpL3RjdGlsZHIuYzo5Mjp0Y3RpX2Zyb21faW5mbygpIENvdWxkIG5vdCBpbml0aWFsaXplIFRD
VEkgbmFtZWQ6IHRjdGktZGV2aWNlPGJyPkVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRy
LWRsLmM6MTUwOnRjdGlfZnJvbV9maWxlKCkgQ291bGQgbm90IGluaXRpYWxpemUgVENUSSBmaWxl
OiBsaWJ0c3MyLXRjdGktZGV2aWNlLnNvLjA8YnI+RVJST1I6dGN0aTpzcmMvdHNzMi10Y3RpL3Rj
dGktZGV2aWNlLmM6NDM5OlRzczJfVGN0aV9EZXZpY2VfSW5pdCgpIEZhaWxlZCB0byBvcGVuIGRl
dmljZSBmaWxlIC9kZXYvdHBtMDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTxicj5XQVJOSU5H
OnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLmM6NjI6dGN0aV9mcm9tX2luaXQoKSBUQ1RJIGlu
aXQgZm9yIGZ1bmN0aW9uIDB4N2Y5YjY1ZWMxZmIwIGZhaWxlZCB3aXRoIGEwMDBhPGJyPldBUk5J
Tkc6dGN0aTpzcmMvdHNzMi10Y3RpL3RjdGlsZHIuYzo5Mjp0Y3RpX2Zyb21faW5mbygpIENvdWxk
IG5vdCBpbml0aWFsaXplIFRDVEkgbmFtZWQ6IHRjdGktZGV2aWNlPGJyPkVSUk9SOnRjdGk6c3Jj
L3RzczItdGN0aS90Y3RpbGRyLWRsLmM6MTUwOnRjdGlfZnJvbV9maWxlKCkgQ291bGQgbm90IGlu
aXRpYWxpemUgVENUSSBmaWxlOiBsaWJ0c3MyLXRjdGktZGV2aWNlLnNvLjA8YnI+V0FSTklORzpl
c3lzOnNyYy90c3MyLWVzeXMvYXBpL0VzeXNfR2V0UmFuZG9tLmM6Mjc3OkVzeXNfR2V0UmFuZG9t
X0ZpbmlzaCgpIFJlY2VpdmVkIFRQTSBFcnJvcjxicj5FUlJPUjplc3lzOnNyYy90c3MyLWVzeXMv
YXBpL0VzeXNfR2V0UmFuZG9tLmM6OTU6RXN5c19HZXRSYW5kb20oKSBFc3lzIEZpbmlzaCBFcnJv
ckNvZGUgKDB4MDAwMDAxMDApPGJyPjwvZGl2PjwvZGl2Pgo=

--===============4909856631035531358==--

