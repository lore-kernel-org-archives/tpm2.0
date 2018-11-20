Content-Type: multipart/mixed; boundary="===============5567164170937674163=="
MIME-Version: 1.0
From: Sourajit Mukhopadhyay <smukho16 at gmail.com>
Subject: [tpm2] Esys_Create Error
Date: Tue, 20 Nov 2018 14:56:13 +0100
Message-ID: <CANva-dxYnW=AnHTv=g8McCLM0r6SXZ9r-575353=uAi6zdp_bQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5567164170937674163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear team,

I am working on a test code to check the unseal functionality for
educational purposes. I am following the test module for ESAPI unseal, and
the test code is working on one system perfectly with the IBM simulator,
but failing on another system running the same version of the simulator
with:

WARNING:esys:src/tss2-esys/api/Esys_Create.c:421:Esys_Create_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_Create.c:164:Esys_Create() Esys Finish
ErrorCode (0x00000921)
Esys_Create fail

I am unable to detect the cause of this error, since the same code is
running perfectly fine on a different system with same version of the
simulator. Any advice on the cause of this issue would be highly
appreciated.

Regards,
Sourajit Mukhopadhyay

--===============5567164170937674163==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+RGVhciB0ZWFtLDxkaXY+PGJyPjwvZGl2Pjxk
aXY+SSBhbSB3b3JraW5nIG9uIGEgdGVzdCBjb2RlIHRvIGNoZWNrIHRoZSB1bnNlYWwgZnVuY3Rp
b25hbGl0eSBmb3IgZWR1Y2F0aW9uYWwgcHVycG9zZXMuIEkgYW0gZm9sbG93aW5nIHRoZSB0ZXN0
IG1vZHVsZSBmb3IgRVNBUEkgdW5zZWFsLCBhbmQgdGhlIHRlc3QgY29kZSBpcyB3b3JraW5nIG9u
IG9uZSBzeXN0ZW0gcGVyZmVjdGx5IHdpdGggdGhlIElCTSBzaW11bGF0b3IsIGJ1dCBmYWlsaW5n
IG9uIGFub3RoZXIgc3lzdGVtIHJ1bm5pbmcgdGhlIHNhbWUgdmVyc2lvbiBvZiB0aGUgc2ltdWxh
dG9yIHdpdGg6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PldBUk5JTkc6ZXN5czpzcmMv
dHNzMi1lc3lzL2FwaS9Fc3lzX0NyZWF0ZS5jOjQyMTpFc3lzX0NyZWF0ZV9GaW5pc2goKSBSZWNl
aXZlZCBUUE0gRXJyb3I8L2Rpdj48ZGl2PkVSUk9SOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5
c19DcmVhdGUuYzoxNjQ6RXN5c19DcmVhdGUoKSBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4MDAw
MDA5MjEpPC9kaXY+PGRpdj5Fc3lzX0NyZWF0ZSBmYWlsPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5JIGFtIHVuYWJsZSB0byBkZXRlY3QgdGhlIGNhdXNlIG9mIHRoaXPCoGVycm9yLCBz
aW5jZSB0aGUgc2FtZSBjb2RlIGlzIHJ1bm5pbmcgcGVyZmVjdGx5IGZpbmUgb24gYSBkaWZmZXJl
bnQgc3lzdGVtIHdpdGggc2FtZSB2ZXJzaW9uIG9mIHRoZSBzaW11bGF0b3IuIEFueSBhZHZpY2Ug
b24gdGhlIGNhdXNlIG9mIHRoaXMgaXNzdWUgd291bGTCoGJlIGhpZ2hseSBhcHByZWNpYXRlZC48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+UmVnYXJkcyw8L2Rpdj48ZGl2PlNvdXJhaml0
IE11a2hvcGFkaHlheTwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============5567164170937674163==--

