Content-Type: multipart/mixed; boundary="===============2043982552147096798=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] fa9fe7: conversion: fix build error with
 OpenSSL 1.1.x
Date: Wed, 18 Oct 2017 09:14:55 -0700
Message-ID: <59e77dffbfe1d_1a363fab5a307c2c877c7@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2043982552147096798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: fa9fe7a749521600e990f88e95e4c79e16b7bf48
      https://github.com/01org/tpm2-tools/commit/fa9fe7a749521600e990f88e95=
e4c79e16b7bf48
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-18 (Wed, 18 Oct 2017)

  Changed paths:
    M lib/conversion.c

  Log Message:
  -----------
  conversion: fix build error with OpenSSL 1.1.x

Since OpenSSL version 1.1.0, the RSA structure (struct rsa_st) is opaque
to programs (https://wiki.openssl.org/index.php/OpenSSL_1.1.0_Changes).

So the structure members can't be accessed directly and instead helpers
functions should be used.

Because the API changes, building tpm2-tools with OpenSSL 1.1.x leads to
the following compile error:

lib/conversion.c: In function =E2=80=98tpm2_convert_pubkey_ssl=E2=80=99:
lib/conversion.c:126:16: error: dereferencing pointer to incomplete type =
=E2=80=98RSA {aka struct rsa_st}=E2=80=99
     ssl_rsa_key->e =3D BN_bin2bn((void*)&exponent, sizeof(exponent), NULL);
          ^~
make: *** [Makefile:1842: lib/conversion.o] Error 1

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============2043982552147096798==--

