Content-Type: multipart/mixed; boundary="===============1320250239080960573=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c15d5f: password_util: rename to
 tpm2_password_util
Date: Thu, 17 Aug 2017 09:01:47 -0700
Message-ID: <5995bdeb54a50_8e23fd89de95c2c1423b0@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1320250239080960573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/test-password-utils
  Home:   https://github.com/01org/tpm2-tools
  Commit: c15d5f6a81c5132048bb8a89201dff972c5ec688
      https://github.com/01org/tpm2-tools/commit/c15d5f6a81c5132048bb8a8920=
1dff972c5ec688
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-16 (Wed, 16 Aug 2017)

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


  Commit: a6e3a5e6d1d70a1e1aff19b8a92a2679447a8c41
      https://github.com/01org/tpm2-tools/commit/a6e3a5e6d1d70a1e1aff19b8a9=
2a2679447a8c41
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-16 (Wed, 16 Aug 2017)

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


  Commit: 8ec1eb8853600e6c4b84e368f2c7069385e44638
      https://github.com/01org/tpm2-tools/commit/8ec1eb8853600e6c4b84e368f2=
c7069385e44638
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


  Commit: 1fbf8eff548869713a63605c921634ac15ad4079
      https://github.com/01org/tpm2-tools/commit/1fbf8eff548869713a63605c92=
1634ac15ad4079
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


  Commit: a478ca8e4b0f5fa3a8cfd06f23dfbe46b40a52f7
      https://github.com/01org/tpm2-tools/commit/a478ca8e4b0f5fa3a8cfd06f23=
dfbe46b40a52f7
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


  Commit: 4d9d7bc9471b3c278952755b8ae419287397eadc
      https://github.com/01org/tpm2-tools/commit/4d9d7bc9471b3c278952755b8a=
e419287397eadc
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


  Commit: e6c05e41cbd3ffd376ea880601b5e9cd83793e72
      https://github.com/01org/tpm2-tools/commit/e6c05e41cbd3ffd376ea880601=
b5e9cd83793e72
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


  Commit: 59ddd0e1e193712bce50942e26e6d838e90435af
      https://github.com/01org/tpm2-tools/commit/59ddd0e1e193712bce50942e26=
e6d838e90435af
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


  Commit: 2faea8616294d613e63aa0230cee69ae82702604
      https://github.com/01org/tpm2-tools/commit/2faea8616294d613e63aa0230c=
ee69ae82702604
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


  Commit: ab395f13563d76349d25a3acfe99f2b59a31af7f
      https://github.com/01org/tpm2-tools/commit/ab395f13563d76349d25a3acfe=
99f2b59a31af7f
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


  Commit: b2e1d6c3ea48bbe3719fe7fba23d5e438e0568b4
      https://github.com/01org/tpm2-tools/commit/b2e1d6c3ea48bbe3719fe7fba2=
3d5e438e0568b4
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


  Commit: 9f487518035a66342ea9eb65030c4ddd5d29c013
      https://github.com/01org/tpm2-tools/commit/9f487518035a66342ea9eb6503=
0c4ddd5d29c013
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


  Commit: 4072abec53393cc220ac98f55796c24459064b22
      https://github.com/01org/tpm2-tools/commit/4072abec53393cc220ac98f557=
96c24459064b22
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


  Commit: 568677e8e0d8bbc1946e482bb59cfe62f724bdce
      https://github.com/01org/tpm2-tools/commit/568677e8e0d8bbc1946e482bb5=
9cfe62f724bdce
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


  Commit: 80617be1488a405e348be02454be911fa717ea2f
      https://github.com/01org/tpm2-tools/commit/80617be1488a405e348be02454=
be911fa717ea2f
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


  Commit: 5441af44ec0432b07c69900e4f54ab9b75063889
      https://github.com/01org/tpm2-tools/commit/5441af44ec0432b07c69900e4f=
54ab9b75063889
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


  Commit: df26ab914d4ce21790cf4b11bde4b2dc68274d02
      https://github.com/01org/tpm2-tools/commit/df26ab914d4ce21790cf4b11bd=
e4b2dc68274d02
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


  Commit: 77aebb863d7441ecdbd449d1483eb5f53dd4c7d6
      https://github.com/01org/tpm2-tools/commit/77aebb863d7441ecdbd449d148=
3eb5f53dd4c7d6
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


  Commit: 56b88d3adaa06186878c70a658b2e12b5fd048a4
      https://github.com/01org/tpm2-tools/commit/56b88d3adaa06186878c70a658=
b2e12b5fd048a4
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


  Commit: d52cf4f95ddb5b150f4a1fa0f5ab9714e9d5616a
      https://github.com/01org/tpm2-tools/commit/d52cf4f95ddb5b150f4a1fa0f5=
ab9714e9d5616a
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


  Commit: 4885bb412829485d66d88f3c26a44a9dc69a3411
      https://github.com/01org/tpm2-tools/commit/4885bb412829485d66d88f3c26=
a44a9dc69a3411
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


  Commit: 92adc0a4d80c9c556ad5774e3a87ef47dc09130d
      https://github.com/01org/tpm2-tools/commit/92adc0a4d80c9c556ad5774e3a=
87ef47dc09130d
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


  Commit: 1cf2ef534978d2c6fc7e046db6e38dda960104af
      https://github.com/01org/tpm2-tools/commit/1cf2ef534978d2c6fc7e046db6=
e38dda960104af
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


  Commit: 0cd7043992b91cf5df1fd013b1ac4bbd1194552e
      https://github.com/01org/tpm2-tools/commit/0cd7043992b91cf5df1fd013b1=
ac4bbd1194552e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M lib/tpm2_password_util.c
    M lib/tpm2_password_util.h

  Log Message:
  -----------
  tpm2_password_util: drop unused routines

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c927b7dc22e86e751a801da59546b3806911328e
      https://github.com/01org/tpm2-tools/commit/c927b7dc22e86e751a801da595=
46b3806911328e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M tools/tpm2_readpublic.c

  Log Message:
  -----------
  tpm2_readpublic.c: drop unused include

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c70ec342ecbe1507e29a625726bb0393bad00821
      https://github.com/01org/tpm2-tools/commit/c70ec342ecbe1507e29a625726=
bb0393bad00821
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-17 (Thu, 17 Aug 2017)

  Changed paths:
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  tpm2_getrandom.c: drop unused include


Compare: https://github.com/01org/tpm2-tools/compare/c15d5f6a81c5^...c70ec3=
42ecbe

--===============1320250239080960573==--

