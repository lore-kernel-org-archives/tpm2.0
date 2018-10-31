Content-Type: multipart/mixed; boundary="===============1934729258339664711=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: [tpm2] what the different between 0x1d5 and 0x3d5
Date: Wed, 31 Oct 2018 17:15:02 +0800
Message-ID: <CA+tBKVhSh75EO1jwhgVXjPffCEitQ5PX6HCWYrU6feYosPeCdg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1934729258339664711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[root(a)localhost tpm2-init]# tpm2_rc_decode  0x1d5
tpm:parameter(1):structure is the wrong size
[root(a)localhost tpm2-init]# tpm2_rc_decode  0x3d5
tpm:parameter(3):structure is the wrong size

I'm so confusing where my code is wrong.

--===============1934729258339664711==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5bcm9vdEBsb2NhbGhvc3QgdHBtMi1p
bml0XSMgdHBtMl9yY19kZWNvZGXCoCAweDFkNTwvZGl2PjxkaXY+dHBtOnBhcmFtZXRlcigxKTpz
dHJ1Y3R1cmUgaXMgdGhlIHdyb25nIHNpemU8L2Rpdj48ZGl2Pltyb290QGxvY2FsaG9zdCB0cG0y
LWluaXRdIyB0cG0yX3JjX2RlY29kZcKgIDB4M2Q1PC9kaXY+PGRpdj50cG06cGFyYW1ldGVyKDMp
OnN0cnVjdHVyZSBpcyB0aGUgd3Jvbmcgc2l6ZTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSYj
Mzk7bSBzbyBjb25mdXNpbmcgd2hlcmUgbXkgY29kZSBpcyB3cm9uZy48L2Rpdj48L2Rpdj48L2Rp
dj4K

--===============1934729258339664711==--

