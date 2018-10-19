Content-Type: multipart/mixed; boundary="===============8820804342358345115=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: [tpm2] There is no '-I' option for tpm2_rsaencrypt which I found it
 in the doc.
Date: Fri, 19 Oct 2018 16:36:57 +0800
Message-ID: <CA+tBKViQvj4SfavhkL6z=GQnkWkcB7SNEgNzWSQFsZcvkLgUeQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8820804342358345115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[root(a)localhost Test]# tpm2_rsaencrypt -I data.in -c obj.ctx  -o
data.encrypted
tpm2_rsaencrypt: invalid option -- 'I'
[root(a)localhost Test]#

--===============8820804342358345115==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5bcm9vdEBsb2NhbGhvc3QgVGVzdF0j
IHRwbTJfcnNhZW5jcnlwdCAtSSA8YSBocmVmPSJodHRwOi8vZGF0YS5pbiI+ZGF0YS5pbjwvYT4g
LWMgb2JqLmN0eMKgIC1vIGRhdGEuZW5jcnlwdGVkwqA8L2Rpdj48ZGl2PnRwbTJfcnNhZW5jcnlw
dDogaW52YWxpZCBvcHRpb24gLS0gJiMzOTtJJiMzOTs8L2Rpdj48ZGl2Pltyb290QGxvY2FsaG9z
dCBUZXN0XSM8L2Rpdj48L2Rpdj48L2Rpdj4K

--===============8820804342358345115==--

