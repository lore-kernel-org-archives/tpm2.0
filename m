Content-Type: multipart/mixed; boundary="===============1595056204368801818=="
MIME-Version: 1.0
From: Rajkumar K Sivasamy <rajkumar.k.sivasamy at gmail.com>
Subject: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 32 Bit
 Platform
Date: Thu, 02 Dec 2021 11:10:11 +0530
Message-ID: <CADu5Hqz2o0jMMT+q81x=njOygRNqVvb72sFud1cbRXkjgFEwAQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1595056204368801818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Team

I am trying to use tpm2_import on a Big Endian 32 Bit platform and running
into following error:

---------------------------------------------------------------------------=
-----------------------------------------------------

*Command: *

   1.

   openssl genrsa -out private.pem 2048
   2. tpm2_import -C 0x81000001 -G rsa -i private.pem -u key.pub -r key.priv


*Error:*
ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish
ErrorCode (0x000003df)
ERROR: Esys_HMAC(0x3DF) - tpm:parameter(3):integrity check failed
ERROR: Unable to run tpm2_import
---------------------------------------------------------------------------=
-----------------------------------------------------


Need pointers to debug this issue.
Have any of you come across this error with tpm2_import on Big Endian 32
Bit Platform? Do we have a fix Or can you provide inputs on the source
where I can look at for further debugging?

Thanks
Raj

--===============1595056204368801818==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZWxsbyBUZWFtPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5J
IGFtIHRyeWluZyB0byB1c2UgdHBtMl9pbXBvcnQgb24gYSBCaWcgRW5kaWFuIDMyIEJpdCBwbGF0
Zm9ybSBhbmQgcnVubmluZyBpbnRvIGZvbGxvd2luZyBlcnJvcjo8L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2Pi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPjwvZGl2PjxkaXY+PGI+PGJyPjwvYj48L2Rpdj48ZGl2
PjxiPkNvbW1hbmQ6IDwvYj48YnI+PC9kaXY+PGRpdj48b2w+PGxpPgoKCgoKCgoKCgoKPHAgc3R5
bGU9Im1hcmdpbjowaW47Zm9udC1mYW1pbHk6Q2FsaWJyaTtmb250LXNpemU6MTFwdCI+b3BlbnNz
bApnZW5yc2EgLW91dCBwcml2YXRlLnBlbSAyMDQ4PC9wPgoKCgoKPC9saT48bGk+dHBtMl9pbXBv
cnQgLUMgMHg4MTAwMDAwMSAtRyByc2EgLWkgcHJpdmF0ZS5wZW0gLXUga2V5LnB1YiAtciBrZXku
cHJpdjwvbGk+PC9vbD48L2Rpdj48ZGl2PjxiPjxicj48L2I+PC9kaXY+PGRpdj48Yj5FcnJvcjo8
L2I+PGJyPjwvZGl2PjxkaXY+PC9kaXY+PGRpdj5FUlJPUjplc3lzOnNyYy90c3MyLWVzeXMvYXBp
L0VzeXNfSW1wb3J0LmM6MTEwOkVzeXNfSW1wb3J0KCkgRXN5cyBGaW5pc2ggRXJyb3JDb2RlICgw
eDAwMDAwM2RmKTxicj5FUlJPUjogRXN5c19ITUFDKDB4M0RGKSAtIHRwbTpwYXJhbWV0ZXIoMyk6
aW50ZWdyaXR5IGNoZWNrIGZhaWxlZDxicj5FUlJPUjogVW5hYmxlIHRvIHJ1biB0cG0yX2ltcG9y
dDxicj48L2Rpdj48ZGl2PgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSA8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5OZWVkIHBvaW50ZXJzIHRvIGRlYnVnIHRoaXMgaXNzdWUuPC9kaXY+PGRpdj5IYXZlIGFu
eSBvZiB5b3UgY29tZSBhY3Jvc3MgdGhpcyBlcnJvciB3aXRoIHRwbTJfaW1wb3J0IG9uIEJpZyBF
bmRpYW4gMzIgQml0IFBsYXRmb3JtPyBEbyB3ZSBoYXZlIGEgZml4IE9yIGNhbiB5b3UgcHJvdmlk
ZSBpbnB1dHMgb24gdGhlIHNvdXJjZSB3aGVyZSBJIGNhbiBsb29rIGF0IGZvciBmdXJ0aGVyIGRl
YnVnZ2luZz88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3M8L2Rpdj48ZGl2PlJh
ajxicj48L2Rpdj48L2Rpdj4K

--===============1595056204368801818==--

