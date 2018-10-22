Content-Type: multipart/mixed; boundary="===============6651898422274502440=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: [tpm2] How do I import a PEM format privateKey into TPM2 ?
Date: Mon, 22 Oct 2018 14:25:59 +0800
Message-ID: <CA+tBKViXgSTQASd03OPDcCH1LFPM2tjOJcVgtwvj00Xa3Zyi0w@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6651898422274502440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I generated a PEM format keypair using openssl:
# openssl genrsa -out priv.key
# openssl rsa -in priv.key  -out pub.key -pubout

and then I used tpm2-tools to import:
# tpm2_createprimary -H o -g sha256 -G ecc -C context.out
ObjectAttribute: 0x00030072
CreatePrimary Succeed ! Handle: 0x800000ff

# tpm2_load -H 0x80000ff -c context.out -r priv.key
ERROR: File "priv.key" size is larger than buffer, got 1766 expected less
than 1552
an error appeared.

My purpose is to encrypt by public key and decrypt by tpm2.0
Encrypt:
# openssl rsautl -encrypt -inkey pub.key  -pubin -in data.in -out data.enc

Decrypt:
what should I do?

--===============6651898422274502440==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGkgZXZlcnlvbmUsPC9kaXY+PGRpdiBk
aXI9Imx0ciI+PGJyPjwvZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+SSBnZW5lcmF0ZWQgYSBQRU0g
Zm9ybWF0IGtleXBhaXIgdXNpbmcgb3BlbnNzbDo8L2Rpdj48ZGl2PiMgb3BlbnNzbCBnZW5yc2Eg
LW91dCBwcml2LmtleTxicj48L2Rpdj48ZGl2PiMgb3BlbnNzbCByc2EgLWluIHByaXYua2V5wqAg
LW91dCBwdWIua2V5IC1wdWJvdXQ8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5hbmQgdGhl
biBJIHVzZWQgdHBtMi10b29scyB0byBpbXBvcnQ6PC9kaXY+PGRpdj48ZGl2PiMgdHBtMl9jcmVh
dGVwcmltYXJ5IC1IIG8gLWcgc2hhMjU2IC1HIGVjYyAtQyBjb250ZXh0Lm91dMKgPC9kaXY+PGRp
dj5PYmplY3RBdHRyaWJ1dGU6IDB4MDAwMzAwNzI8L2Rpdj48ZGl2PkNyZWF0ZVByaW1hcnkgU3Vj
Y2VlZCAhIEhhbmRsZTogMHg4MDAwMDBmZjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
PGRpdj4jIHRwbTJfbG9hZCAtSCAweDgwMDAwZmYgLWMgY29udGV4dC5vdXQgLXIgcHJpdi5rZXnC
oDwvZGl2PjxkaXY+RVJST1I6IEZpbGUgJnF1b3Q7cHJpdi5rZXkmcXVvdDsgc2l6ZSBpcyBsYXJn
ZXIgdGhhbiBidWZmZXIsIGdvdCAxNzY2IGV4cGVjdGVkIGxlc3MgdGhhbiAxNTUyPC9kaXY+PC9k
aXY+PGRpdj5hbiBlcnJvciBhcHBlYXJlZC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk15IHB1
cnBvc2UgaXMgdG8gZW5jcnlwdCBieSBwdWJsaWMga2V5IGFuZCBkZWNyeXB0IGJ5IHRwbTIuMDwv
ZGl2PjxkaXY+RW5jcnlwdDo8L2Rpdj48ZGl2PjxkaXY+IyBvcGVuc3NsIHJzYXV0bCAtZW5jcnlw
dCAtaW5rZXkgcHViLmtlecKgIC1wdWJpbiAtaW4gPGEgaHJlZj0iaHR0cDovL2RhdGEuaW4iPmRh
dGEuaW48L2E+IC1vdXQgZGF0YS5lbmM8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkRl
Y3J5cHQ6wqA8L2Rpdj48ZGl2PndoYXQgc2hvdWxkIEkgZG8/PC9kaXY+PC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============6651898422274502440==--

