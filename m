Content-Type: multipart/mixed; boundary="===============0074134931055467691=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Re: Generate keypair using OpenSSL, then load into TPM2
Date: Tue, 10 Dec 2019 08:16:23 +0000
Message-ID: <CALtZhhMA1EnSpFX11L7i++L05DddbaOnbCPXh=NUFmhe4e-qrw@mail.gmail.com>
In-Reply-To: CAOCvsS=1Y-F4dBSHN4+Q=GxzHoC=0OCVSSPhZGEBg3-qgQyTVQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0074134931055467691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/9/19, Steven Clark <davolfman(a)gmail.com> wrote:

> Have you tried loading the keypair with permissions that let you sign and
> try to sign a digest with it?  Maybe you've just zero'd out a copy of the
> public key and a self signature or something?  Even a DER of an openSSL
> private key is much larger than it needs to be.
>
> Here's a rough layout of a 2048RSA private key I'm looking at with -text.
> Modulus ~256 bytes
> public exponent <=3D4 bytes
> Private exponent ~256 bytes
> Prime 1 ~128 bytes
> Prime 2 ~128 bytes
> Exponent 1 ~128 bytes
> Exponent 2 ~128 bytes
> Coefficient ~128 bytes
> If that helps you might be able to guess which parts of the key you're
> zeroing.

Here's the before and after of a private key I zero'ed out. The
uppercase letter 'A' corresponds to six bits all set to zero.

Before:

-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCujoM27e3vbybfgGBRXpB9N6HBG1/VNlg2COJbjysYHcG6elBe
bNldx7NscmwZFqY6hb577a0OWjpWXXJqfEpAropDKke3bqP/jFQGkMoiGfBs0P+p
e5oOvTMD7mgtQ7PXbZIdx30VMH9oZEveP8Fe1N3ES4RK1VxX/URpt3pOnwIDAQAB
AoGAAUdJ7r0PYRGPV1O5YN8wb7pYlPF+YjFjtAGcps8FoceWA6ehrw9dCDLOPZ0Y
7ZYc4ZDZNE8pVVGT284TaHRAlvWV1Qm0m/bP4oirymlnwY43m2ai70TLjw8q+xli
0OhxfVmKAy2c/winwpZKxK0w2kMMGJTrX1/lqMdNwf7QrwECQQDh64jWzLwz1dsk
dxJxq3KBJYl98+qycjkOAcBEhpU3vljLYsCIdO6ScADLGUBAGXz+TDjIg1VV2/rb
cM4AcDrzAkEAxcxDGyKfzhX1LQX54jr5NgoGZQAP/x0+5ZIwRJfWTvJnr1M/lEWs
IvhXkhMq0gpOsQtXxSlV4zd4WhLqV75wpQJAKjRJDO+UXQ6fcLF51ZhUvMGZbNkr
SAjEldRH6cVGjPJXPi+Fjjhh9SNNUqO1+AOK8SqmFPdL8s00kNgC89wDdwJACD1M
BlNY6NLNVcTL9fqS6wdb4NUx1WS4fAOs8w6IJN3AJ/OF0H1egE5sB2+49urrAEEC
tPnV1BM5djcXf/Q06QJBAMGkX/PF7jf4xgNKTH0Ps28oxAPA0nBt1/NGXZonsgPs
3Lk67iZYvjwj9H9nXnelFqwqRxJLS2r1AmYkxMv/0ns=3D
-----END RSA PRIVATE KEY-----

After:

-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCujoM27e3vbybfgGBRXpB9N6HBG1/VNlg2COJbjysYHcG6elBe
bNldx7NscmwZFqY6hb577a0OWjpWXXJqfEpAropDKke3bqP/jFQGkMoiGfBs0P+p
e5oOvTMD7mgtQ7PXbZIdx30VMH9oZEveP8Fe1N3ES4RK1VxX/URpt3pOnwIDAQAB
AoGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACQQDh64jWzLwz1dsk
dxJxq3KBJYl98+qycjkOAcBEhpU3vljLYsCIdO6ScADLGUBAGXz+TDjIg1VV2/rb
cM4AcDrzAkEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAJBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=3D
-----END RSA PRIVATE KEY-----


If I feed this zero'ed out key into OpenSSL, I can get back the public
key intact. Also I can import this private key into the TPM2 chip and
use it to verify a signature.
--===============0074134931055467691==--

