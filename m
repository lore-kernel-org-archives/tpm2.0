Content-Type: multipart/mixed; boundary="===============8969947407244394308=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 014ea5: password_util: rename to
 tpm2_password_util
Date: Thu, 17 Aug 2017 09:04:08 -0700
Message-ID: <5995be7875f7b_cc13f86cebf7c341075b@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8969947407244394308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/test-password-utils
  Home:   https://github.com/01org/tpm2-tools
  Commit: 014ea5081894af2e5da89e69725cf7bb5e546426
      https://github.com/01org/tpm2-tools/commit/014ea5081894af2e5da89e6972=
5cf7bb5e546426
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M Makefile.am
    R lib/password_util.c
    R lib/password_util.h
    A lib/tpm2_password_util.c
    A lib/tpm2_password_util.h
    M tools/tpm2_activatecredential.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_dictionarylockout.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_getrandom.c
    M tools/tpm2_hmac.c
    M tools/tpm2_load.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvreadlock.c
    M tools/tpm2_nvrelease.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_quote.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_sign.c
    M tools/tpm2_takeownership.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  password_util: rename to tpm2_password_util

Rename password_util and routines to be compliant with
coding standard.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 69eef0c5d67eff95a4208b557ebfe77bf126d3cd
      https://github.com/01org/tpm2-tools/commit/69eef0c5d67eff95a4208b557e=
bfe77bf126d3cd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M Makefile.am
    M lib/tpm2_password_util.c
    M lib/tpm2_password_util.h
    A test/unit/test_tpm2_password_util.c

  Log Message:
  -----------
  tpm2_password_util: add from optarg handler

Add a routine for replacing the remaining tpm2_password_util
routines. The new routine will be used to handle optarg
directly, and avoid the need of the -X argument.

Also add tests.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f7eeebc79f2e816a406573ce270c0488225dda65
      https://github.com/01org/tpm2-tools/commit/f7eeebc79f2e816a406573ce27=
0c0488225dda65
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M Makefile.am
    A man/password-fmt-common.troff
    M man/tpm2_create.8.in
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Update the manpage to include new string password formating
options.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ddc9df9e12e54e0417dd2543c1699d3470d8876b
      https://github.com/01org/tpm2-tools/commit/ddc9df9e12e54e0417dd2543c1=
699d3470d8876b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_createprimary.8.in
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5dce817851f19343af2e053e76e735df43e3eca1
      https://github.com/01org/tpm2-tools/commit/5dce817851f19343af2e053e76=
e735df43e3eca1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_load.8.in
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 483ad45f427ce2352c264c77a8ccaeb6606e9135
      https://github.com/01org/tpm2-tools/commit/483ad45f427ce2352c264c77a8=
ccaeb6606e9135
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_quote.8.in
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 98445681ea6d3360c5dcb27ee823ce271fba50ee
      https://github.com/01org/tpm2-tools/commit/98445681ea6d3360c5dcb27ee8=
23ce271fba50ee
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_takeownership.8.in
    M tools/tpm2_takeownership.c

  Log Message:
  -----------
  tpm2_takeownership: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9c0671031b3f8fa35e6b1bbf5fddf7425826ad72
      https://github.com/01org/tpm2-tools/commit/9c0671031b3f8fa35e6b1bbf5f=
ddf7425826ad72
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_getpubek.8.in
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c73ccdacb0fb0598cadca3043644bdba720acd40
      https://github.com/01org/tpm2-tools/commit/c73ccdacb0fb0598cadca30436=
44bdba720acd40
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_getpubak.8.in
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7befa28f73c6e05c4506607e29f8e1932298d7be
      https://github.com/01org/tpm2-tools/commit/7befa28f73c6e05c4506607e29=
f8e1932298d7be
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_activatecredential.8.in
    M tools/tpm2_activatecredential.c

  Log Message:
  -----------
  tpm2_activatecredential: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b0c2d11048b6c804ff79480c4dfc2865c01705f8
      https://github.com/01org/tpm2-tools/commit/b0c2d11048b6c804ff79480c4d=
fc2865c01705f8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_nvread.8.in
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: aea6bc5049379f6a5852307abd4b821d71ffc2b5
      https://github.com/01org/tpm2-tools/commit/aea6bc5049379f6a5852307abd=
4b821d71ffc2b5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_nvreadlock.8.in
    M tools/tpm2_nvreadlock.c

  Log Message:
  -----------
  tpm2_nvreadlock: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8ddfaf6a2ee0a8e64d77314cf69dddb55ee0f71e
      https://github.com/01org/tpm2-tools/commit/8ddfaf6a2ee0a8e64d77314cf6=
9dddb55ee0f71e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_nvwrite.8.in
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: acac8c2e110d2ea2821e20ed67559c7089e2a48f
      https://github.com/01org/tpm2-tools/commit/acac8c2e110d2ea2821e20ed67=
559c7089e2a48f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_nvdefine.8.in
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 07c9c3578e10d0ac83902e895eac8d1fac6d0f9e
      https://github.com/01org/tpm2-tools/commit/07c9c3578e10d0ac83902e895e=
ac8d1fac6d0f9e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_nvrelease.8.in
    M tools/tpm2_nvrelease.c

  Log Message:
  -----------
  tpm2_nvrelease: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f57f8f052417d6729df6c4ba208d8725a45e8653
      https://github.com/01org/tpm2-tools/commit/f57f8f052417d6729df6c4ba20=
8d8725a45e8653
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_hmac.8.in
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: bd76419f0e8d0a3b453083a384c6065e401673ff
      https://github.com/01org/tpm2-tools/commit/bd76419f0e8d0a3b453083a384=
c6065e401673ff
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_certify.8.in
    M tools/tpm2_certify.c

  Log Message:
  -----------
  tpm2_certify: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6cbf804e5c7d57ca0b1dacb37c5dfe266cf98f34
      https://github.com/01org/tpm2-tools/commit/6cbf804e5c7d57ca0b1dacb37c=
5dfe266cf98f34
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_encryptdecrypt.8.in
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5efb4b584de905cfc878aba9ab72919e4d3fcb22
      https://github.com/01org/tpm2-tools/commit/5efb4b584de905cfc878aba9ab=
72919e4d3fcb22
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_evictcontrol.8.in
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1a7303d5d2312f7ab7ec92469dd9d7c21bf40f3a
      https://github.com/01org/tpm2-tools/commit/1a7303d5d2312f7ab7ec92469d=
d9d7c21bf40f3a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_rsadecrypt.8.in
    M tools/tpm2_rsadecrypt.c

  Log Message:
  -----------
  tpm2_rsadecrypt: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 72566cf75f0c0529de6906606659f0cbf30523b3
      https://github.com/01org/tpm2-tools/commit/72566cf75f0c0529de69066066=
59f0cbf30523b3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_sign.8.in
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b9f7d3240547a9f944c0324cfbc259335077bf49
      https://github.com/01org/tpm2-tools/commit/b9f7d3240547a9f944c0324cfb=
c259335077bf49
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_unseal.8.in
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c952d7bdf283841cce5eb4a7a9b8e37ce1c563cd
      https://github.com/01org/tpm2-tools/commit/c952d7bdf283841cce5eb4a7a9=
b8e37ce1c563cd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M man/tpm2_dictionarylockout.8.in
    M tools/tpm2_dictionarylockout.c

  Log Message:
  -----------
  tpm2_dictionarylockout: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c4e0f359c84b4e13f90b06415eb9e8dddebc6e36
      https://github.com/01org/tpm2-tools/commit/c4e0f359c84b4e13f90b06415e=
b9e8dddebc6e36
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M lib/tpm2_password_util.c
    M lib/tpm2_password_util.h

  Log Message:
  -----------
  tpm2_password_util: drop unused routines

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0f6a6de8c5e71f173d25b46377c9fba1a8eb7233
      https://github.com/01org/tpm2-tools/commit/0f6a6de8c5e71f173d25b46377=
c9fba1a8eb7233
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M tools/tpm2_readpublic.c

  Log Message:
  -----------
  tpm2_readpublic.c: drop unused include

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 818824f602ac0045423954784ea31b131230aea3
      https://github.com/01org/tpm2-tools/commit/818824f602ac0045423954784e=
a31b131230aea3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  tpm2_getrandom.c: drop unused include


Compare: https://github.com/01org/tpm2-tools/compare/c70ec342ecbe...818824f=
602ac

--===============8969947407244394308==--

