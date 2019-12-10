Content-Type: multipart/mixed; boundary="===============8251592472982284899=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Tue, 10 Dec 2019 23:40:47 +0100
Message-ID: <CAJ8N_u9cc-Jigg6YtM8KM0SbuzO3kC-SzhGDs8Ro3aFV4V5fDA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8251592472982284899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

openssl can not verify plain signature (256 bytes) from tpm2_certify due to
bad padding.

*This should work (verification of signature from tpm2_certifycreation
works fine):*

openssl dgst -verify ../AIKOpaque.der -keyform der -sha1 -signature
Signature KeyAttest.bin
Verification Failure

*....examine:*

openssl rsautl -verify -inkey ../AIKOpaque.der -in Signature -pubin
-keyform der -pkcs > decrypted.bin
RSA operation error
140654247387584:error:0407008A:rsa
routines:R*SA_padding_check_PKCS1_type_1:invalid
padding:../crypto/rsa/rsa_pk1.c:67:*
140654247387584:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding
check failed:../crypto/rsa/rsa_ossl.c:582:


*..Same operation on a plain signature from tpm2_certifycreation works:*

openssl rsautl -verify -inkey ../AIKOpaque.der -in
../IdBinding.EXTRACTED_TPMT_SIGNATURE -pubin -keyform der  > decrypted.bin

dumpasn1 decrypted.bin
  0  33: SEQUENCE {
  2   9:   SEQUENCE {
  4   5:     OBJECT IDENTIFIER sha1 (1 3 14 3 2 26)
 11   0:     NULL
       :     }
 13  20:   OCTET STRING 2D A1 D1 30 3A D2 FD 68 A1 5A 2F 9B 8B C1 1E DB 36
A7 7C D4
       :   }

So. It looks like a bug in tpm2_certify.
tool=3D"tpm2_certify" version=3D"4.1" tctis=3D"libtss2-tctildr"
tcti-default=3Dtcti-device
tpm2-tss 2.3.2-rc0

Regards,
Niklas

--===============8251592472982284899==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5vcGVuc3NsIGNhbiBub3QgdmVyaWZ5IHBsYWluIHNpZ25hdHVy
ZSAoMjU2IGJ5dGVzKSBmcm9tIHRwbTJfY2VydGlmeSBkdWUgdG8gYmFkIHBhZGRpbmcuPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj48aT5UaGlzIHNob3VsZCB3b3JrICh2ZXJpZmljYXRpb24gb2Yg
c2lnbmF0dXJlIGZyb20gdHBtMl9jZXJ0aWZ5Y3JlYXRpb24gd29ya3MgZmluZSk6PC9pPjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+b3BlbnNzbCBkZ3N0IC12ZXJpZnkgLi4vQUlLT3BhcXVlLmRl
ciAta2V5Zm9ybSBkZXIgLXNoYTEgLXNpZ25hdHVyZSBTaWduYXR1cmUgS2V5QXR0ZXN0LmJpbiA8
YnI+VmVyaWZpY2F0aW9uIEZhaWx1cmU8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxpPi4uLi5l
eGFtaW5lOjwvaT48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pm9wZW5zc2wgcnNhdXRsIC12ZXJp
ZnkgLWlua2V5IC4uL0FJS09wYXF1ZS5kZXIgLWluIFNpZ25hdHVyZSAtcHViaW4gLWtleWZvcm0g
ZGVyIC1wa2NzICZndDsgZGVjcnlwdGVkLmJpbjxicj5SU0Egb3BlcmF0aW9uIGVycm9yPGJyPjE0
MDY1NDI0NzM4NzU4NDplcnJvcjowNDA3MDA4QTpyc2Egcm91dGluZXM6UjxiPlNBX3BhZGRpbmdf
Y2hlY2tfUEtDUzFfdHlwZV8xOmludmFsaWQgcGFkZGluZzouLi9jcnlwdG8vcnNhL3JzYV9wazEu
Yzo2Nzo8L2I+PGJyPjE0MDY1NDI0NzM4NzU4NDplcnJvcjowNDA2NzA3Mjpyc2Egcm91dGluZXM6
cnNhX29zc2xfcHVibGljX2RlY3J5cHQ6cGFkZGluZyBjaGVjayBmYWlsZWQ6Li4vY3J5cHRvL3Jz
YS9yc2Ffb3NzbC5jOjU4Mjo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxpPi4uU2FtZSBvcGVy
YXRpb24gb24gYSBwbGFpbiBzaWduYXR1cmUgZnJvbSB0cG0yX2NlcnRpZnljcmVhdGlvbiB3b3Jr
czo8YnI+PC9pPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+b3BlbnNzbCByc2F1dGwgLXZlcmlm
eSAtaW5rZXkgLi4vQUlLT3BhcXVlLmRlciAtaW4gLi4vSWRCaW5kaW5nLkVYVFJBQ1RFRF9UUE1U
X1NJR05BVFVSRSAtcHViaW4gLWtleWZvcm0gZGVyIMKgJmd0OyBkZWNyeXB0ZWQuYmluPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5kdW1wYXNuMSBkZWNyeXB0ZWQuYmluIDxicj7CoCAwIMKgMzM6
IFNFUVVFTkNFIHs8YnI+wqAgMiDCoCA5OiDCoCBTRVFVRU5DRSB7PGJyPsKgIDQgwqAgNTogwqAg
wqAgT0JKRUNUIElERU5USUZJRVIgc2hhMSAoMSAzIDE0IDMgMiAyNik8YnI+wqAxMSDCoCAwOiDC
oCDCoCBOVUxMPGJyPsKgIMKgIMKgIMKgOiDCoCDCoCB9PGJyPsKgMTMgwqAyMDogwqAgT0NURVQg
U1RSSU5HIDJEIEExIEQxIDMwIDNBIEQyIEZEIDY4IEExIDVBIDJGIDlCIDhCIEMxIDFFIERCIDM2
IEE3IDdDIEQ0PGJyPsKgIMKgIMKgIMKgOiDCoCB9PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+U28uIEl0IGxvb2tzIGxpa2UgYSBidWcgaW4gdHBtMl9jZXJ0aWZ5LiA8YnI+PC9kaXY+PGRp
dj50b29sPSZxdW90O3RwbTJfY2VydGlmeSZxdW90OyB2ZXJzaW9uPSZxdW90OzQuMSZxdW90OyB0
Y3Rpcz0mcXVvdDtsaWJ0c3MyLXRjdGlsZHImcXVvdDsgdGN0aS1kZWZhdWx0PXRjdGktZGV2aWNl
PC9kaXY+PGRpdj50cG0yLXRzcyAyLjMuMi1yYzA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJl
Z2FyZHMsPC9kaXY+PGRpdj5OaWtsYXM8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+Cg==

--===============8251592472982284899==--

