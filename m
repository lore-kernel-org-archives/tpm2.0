Content-Type: multipart/mixed; boundary="===============6915253691550916000=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 2e00e9: tpm2_import: fix
 encrypt_seed_with_tpm2_rsa_public...
Date: Tue, 17 Oct 2017 09:56:15 -0700
Message-ID: <59e6362fd638c_7bef3f8fedd3dc38102374@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6915253691550916000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 2e00e90064ee48656943d9e6fb7ce760649d8b8d
      https://github.com/01org/tpm2-tools/commit/2e00e90064ee48656943d9e6fb=
7ce760649d8b8d
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-17 (Tue, 17 Oct 2017)

  Changed paths:
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: fix encrypt_seed_with_tpm2_rsa_public_key() return values

The function returns a bool value where true means success and false means
an error, but some error paths are incorrectly returning a 1 as an error.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 987c63f0755c027c767ffe708bbe1791a3e81938
      https://github.com/01org/tpm2-tools/commit/987c63f0755c027c767ffe708b=
be1791a3e81938
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-17 (Tue, 17 Oct 2017)

  Changed paths:
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: check if modulus conversion failed before trying to use it

There's no point to call the ssl_RSA_set0_key() to set the modulus for a
RSA object if BN_bin2bn() already failed and returned NULL.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 0efc073c33fb8e7929d4a6976895309cb11398b1
      https://github.com/01org/tpm2-tools/commit/0efc073c33fb8e7929d4a69768=
95309cb11398b1
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-17 (Tue, 17 Oct 2017)

  Changed paths:
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: check if BIGNUM and RSA allocations failed

The BN_new() and RSA_new() allocations function can fail and return NULL
in that case, check the return value for both functions.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: abb622f79faf0ca95d6ffb2efef23b59b7b41081
      https://github.com/01org/tpm2-tools/commit/abb622f79faf0ca95d6ffb2efe=
f23b59b7b41081
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-17 (Tue, 17 Oct 2017)

  Changed paths:
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: free exponent BIGNUM after RSA_generate_key_ex() call

The RSA_generate_key_ex() creates a duplicate of the exponent component
passed as an argument, so it can be freed just after the function call.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 6220f535d8aeb08ff785090251b58ba91c48059e
      https://github.com/01org/tpm2-tools/commit/6220f535d8aeb08ff785090251=
b58ba91c48059e
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-17 (Tue, 17 Oct 2017)

  Changed paths:
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: properly cleanup resources on error paths

The resources allocated in the encrypt_seed_with_tpm2_rsa_public_key()
functions weren't properly cleaned up on the error paths, fix them.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 03c54466ee113d49866643d2b45a2422614c2660
      https://github.com/01org/tpm2-tools/commit/03c54466ee113d49866643d2b4=
5a2422614c2660
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-17 (Tue, 17 Oct 2017)

  Changed paths:
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: fix build error with OpenSSL 1.1.x

Since OpenSSL version 1.1.0, the RSA structure (struct rsa_st) is opaque
to programs (https://wiki.openssl.org/index.php/OpenSSL_1.1.0_Changes).

So the structure members can't be accessed directly and instead helpers
functions should be used.

Because the API changes, building tpm2-tools with OpenSSL 1.1.x leads to
the following compile error:

tools/tpm2_import.c:99:11: error: dereferencing pointer to incomplete type =
=E2=80=98RSA {aka struct rsa_st}=E2=80=99
     if ((r->n =3D=3D NULL && n =3D=3D NULL) || (r->e =3D=3D NULL && e =3D=
=3D NULL)) {
     ^~

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/490b31387612...03c5446=
6ee11

--===============6915253691550916000==--

