Content-Type: multipart/mixed; boundary="===============4861431519694939950=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] rsaencrypt/create file size limits
Date: Mon, 11 Dec 2017 15:53:53 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FE69E35@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAAxBZJta5rXsfLnDTLvzEpYZiXaaNjrvGyzThH_KmWn5DAimdQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4861431519694939950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

They are limited to the key size and padding scheme of the RSA key.

If you need to encrypt larger pieces of data, the tpm isn=E2=80=99t the bes=
t way to do that because
It=E2=80=99s usually very slow, especially if it=E2=80=99s discrete hanging=
 off the LPC bus.

What you could do is rsa encrypt a:
1. symmetric key
2. A seed to a key derivation function

And then use some crypto routines from there that don=E2=80=99t involve the=
 tpm. This could also make use of
hardware acceleration such as AES-NI so you can encrypt/decrypt large thing=
s without it taking a fortnight.

Bill

From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ian Oliver
Sent: Friday, December 8, 2017 12:10 AM
To: tpm2(a)lists.01.org
Subject: [tpm2] rsaencrypt/create file size limits

Hi,
could you confirm that tpm2_rsaencrypt, create etc have a limit of 256 byte=
s as the input file size as that this is the expected behaviour?
t.
Ian


-- =

Dr. Ian Oliver
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:=C2=A0 via Amazon
Twitter: @i_j_oliver

--===============4861431519694939950==--

