Content-Type: multipart/mixed; boundary="===============2318476744340720719=="
MIME-Version: 1.0
From: =?utf-8?q?Iratxe_Gonz=C3=A1lez_Garrido_=3Ciratxe=2Eggarrido_at_gmail=2Eco?=
 =?utf-8?q?m=3E?=
Subject: [tpm2] [tpm2-tools] tools error while compiling
Date: Mon, 26 Aug 2019 19:38:41 +0200
Message-ID: <CAPSVqM1c2k5tgCQvK+vTU=QNk-uhT934FEMsADJ-3Mk=6yURgg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2318476744340720719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello:

I am trying to update my tpm2-tools to version 4 but I get this error
message:

pi(a)iotacar:~/tpm2-tools $ make -j5
  CC       lib/lib_libcommon_a-files.o
  CC       lib/lib_libcommon_a-log.o
  CC       lib/lib_libcommon_a-object.o
  CC       lib/lib_libcommon_a-pcr.o
  CC       lib/lib_libcommon_a-tpm2.o
  CC       lib/lib_libcommon_a-tpm2_alg_util.o
  CC       lib/lib_libcommon_a-tpm2_attr_util.o
lib/tpm2_alg_util.c: In function =E2=80=98tpm2_alg_util_for_each_alg=E2=80=
=99:
lib/tpm2_alg_util.c:66:33: error: =E2=80=98TPM2_ALG_CMAC=E2=80=99 undeclare=
d (first use in
this function)
         { .name =3D "cmac", .id =3D TPM2_ALG_CMAC, .flags =3D
tpm2_alg_util_flags_sig },
                                 ^~~~~~~~~~~~~
lib/tpm2_alg_util.c:66:33: note: each undeclared identifier is reported
only once for each function it appears in
Makefile:2618: recipe for target 'lib/lib_libcommon_a-tpm2_alg_util.o'
failed
make: *** [lib/lib_libcommon_a-tpm2_alg_util.o] Error 1
make: *** Waiting for unfinished jobs....

I've tried uninstalling and reinstalling everything but I get the same
error. I installed it yesterday in another raspberry pi from scratch and it
works without problems, therefore I think I have some legacy files from the
previous installation, but I don't know what to delete. I have not
encountered any problems while installing tpms2-tss, tom2-abrmd or the TPM
simulator, just with tpm2-tools
Can anyone help me?

Thanks in advance

--===============2318476744340720719==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZWxsbzo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgYW0g
dHJ5aW5nIHRvIHVwZGF0ZSBteSB0cG0yLXRvb2xzIHRvIHZlcnNpb24gNCBidXQgSSBnZXQgdGhp
cyBlcnJvciBtZXNzYWdlOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZv
bnQtZmFtaWx5Om1vbm9zcGFjZSI+cGlAaW90YWNhcjp+L3RwbTItdG9vbHMgJCBtYWtlIC1qNTxi
cj7CoCBDQyDCoCDCoCDCoCBsaWIvbGliX2xpYmNvbW1vbl9hLWZpbGVzLm88YnI+wqAgQ0MgwqAg
wqAgwqAgbGliL2xpYl9saWJjb21tb25fYS1sb2cubzxicj7CoCBDQyDCoCDCoCDCoCBsaWIvbGli
X2xpYmNvbW1vbl9hLW9iamVjdC5vPGJyPsKgIENDIMKgIMKgIMKgIGxpYi9saWJfbGliY29tbW9u
X2EtcGNyLm88YnI+wqAgQ0MgwqAgwqAgwqAgbGliL2xpYl9saWJjb21tb25fYS10cG0yLm88YnI+
wqAgQ0MgwqAgwqAgwqAgbGliL2xpYl9saWJjb21tb25fYS10cG0yX2FsZ191dGlsLm88YnI+wqAg
Q0MgwqAgwqAgwqAgbGliL2xpYl9saWJjb21tb25fYS10cG0yX2F0dHJfdXRpbC5vPGJyPmxpYi90
cG0yX2FsZ191dGlsLmM6IEluIGZ1bmN0aW9uIOKAmHRwbTJfYWxnX3V0aWxfZm9yX2VhY2hfYWxn
4oCZOjxicj5saWIvdHBtMl9hbGdfdXRpbC5jOjY2OjMzOiBlcnJvcjog4oCYVFBNMl9BTEdfQ01B
Q+KAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik8YnI+wqAgwqAgwqAg
wqAgwqB7IC5uYW1lID0gJnF1b3Q7Y21hYyZxdW90OywgLmlkID0gVFBNMl9BTEdfQ01BQywgLmZs
YWdzID0gdHBtMl9hbGdfdXRpbF9mbGFnc19zaWcgfSw8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBefn5+fn5+fn5+fn5+PGJyPmxpYi90cG0yX2Fs
Z191dGlsLmM6NjY6MzM6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9y
dGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluPGJyPk1ha2VmaWxl
OjI2MTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICYjMzk7bGliL2xpYl9saWJjb21tb25fYS10cG0yX2Fs
Z191dGlsLm8mIzM5OyBmYWlsZWQ8YnI+bWFrZTogKioqIFtsaWIvbGliX2xpYmNvbW1vbl9hLXRw
bTJfYWxnX3V0aWwub10gRXJyb3IgMTxicj5tYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hl
ZCBqb2JzLi4uLjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTptb25v
c3BhY2UiPjxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6bW9u
b3NwYWNlIj48L3NwYW4+SSYjMzk7dmUgdHJpZWQgdW5pbnN0YWxsaW5nIGFuZCByZWluc3RhbGxp
bmcgZXZlcnl0aGluZyBidXQgSSBnZXQgdGhlIHNhbWUgZXJyb3IuIEkgaW5zdGFsbGVkIGl0IHll
c3RlcmRheSBpbiBhbm90aGVyIHJhc3BiZXJyeSBwaSBmcm9tIHNjcmF0Y2ggYW5kIGl0IHdvcmtz
IHdpdGhvdXQgcHJvYmxlbXMsIHRoZXJlZm9yZSBJIHRoaW5rIEkgaGF2ZSBzb21lIGxlZ2FjeSBm
aWxlcyBmcm9tIHRoZSBwcmV2aW91cyBpbnN0YWxsYXRpb24sIGJ1dCBJIGRvbiYjMzk7dCBrbm93
IHdoYXQgdG8gZGVsZXRlLiBJIGhhdmUgbm90IGVuY291bnRlcmVkIGFueSBwcm9ibGVtcyB3aGls
ZSBpbnN0YWxsaW5nIHRwbXMyLXRzcywgdG9tMi1hYnJtZCBvciB0aGUgVFBNIHNpbXVsYXRvciwg
anVzdCB3aXRoIHRwbTItdG9vbHM8YnI+PC9kaXY+PGRpdj5DYW4gYW55b25lIGhlbHAgbWU/PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgaW4gYWR2YW5jZTwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjwvZGl2Pgo=

--===============2318476744340720719==--

