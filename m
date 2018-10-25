Content-Type: multipart/mixed; boundary="===============6466153398830318438=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: [tpm2] How do I input password via tmp2_import
Date: Thu, 25 Oct 2018 17:02:14 +0800
Message-ID: <CA+tBKVjCFwbHvimhGSX_Dh+O7cESQnw-P9mu_fKByPU8MNaeMA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6466153398830318438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

How do I input password via tpm2_import?

[root(a)bogon Test]# tpm2_import -C 0x81020009 -G rsa -k priv.pem -u pub.key
-r priv.key
Enter PEM pass phrase:
ERROR: Tss2_Sys_Import(0x98E) - tpm:session(1):the authorization HMAC check
failed and DA counter incremented
ERROR: Unable to run tpm2_import

--===============6466153398830318438==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5Ib3cgZG8g
SSBpbnB1dCBwYXNzd29yZCB2aWEgdHBtMl9pbXBvcnQ/wqA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PjxkaXY+W3Jvb3RAYm9nb24gVGVzdF0jIHRwbTJfaW1wb3J0IC1DIDB4ODEwMjAwMDkgLUcg
cnNhIC1rIHByaXYucGVtIC11IHB1Yi5rZXkgLXIgcHJpdi5rZXnCoDwvZGl2PjxkaXY+RW50ZXIg
UEVNIHBhc3MgcGhyYXNlOjwvZGl2PjxkaXY+RVJST1I6IFRzczJfU3lzX0ltcG9ydCgweDk4RSkg
LSB0cG06c2Vzc2lvbigxKTp0aGUgYXV0aG9yaXphdGlvbiBITUFDIGNoZWNrIGZhaWxlZCBhbmQg
REEgY291bnRlciBpbmNyZW1lbnRlZDwvZGl2PjxkaXY+RVJST1I6IFVuYWJsZSB0byBydW4gdHBt
Ml9pbXBvcnQ8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============6466153398830318438==--

