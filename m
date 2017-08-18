Content-Type: multipart/mixed; boundary="===============4605209110037984662=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 2aeb3e: password_util: rename to
 tpm2_password_util
Date: Fri, 18 Aug 2017 02:46:32 -0700
Message-ID: <5996b778101e9_178d3f8bef74bc3c128041@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4605209110037984662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 2aeb3ed3724f774c4b2c45f726136d0dcb25e2ba
      https://github.com/01org/tpm2-tools/commit/2aeb3ed3724f774c4b2c45f726=
136d0dcb25e2ba
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

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


  Commit: 5646feda0cb7125852d3768c98f119fd12390dcd
      https://github.com/01org/tpm2-tools/commit/5646feda0cb7125852d3768c98=
f119fd12390dcd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

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


  Commit: 9dd2102e993c2d51d3d6477318a1ad310977e6c0
      https://github.com/01org/tpm2-tools/commit/9dd2102e993c2d51d3d6477318=
a1ad310977e6c0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

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


  Commit: e5973aeed2e746c1aece4a654a68b5968df31d76
      https://github.com/01org/tpm2-tools/commit/e5973aeed2e746c1aece4a654a=
68b5968df31d76
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_createprimary.8.in
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 20ee018e5be1e42f157a9f3138de740b52afe7d5
      https://github.com/01org/tpm2-tools/commit/20ee018e5be1e42f157a9f3138=
de740b52afe7d5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_load.8.in
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cebaf0299e2e4d11ed4313bf64f3bb5eee9d2c64
      https://github.com/01org/tpm2-tools/commit/cebaf0299e2e4d11ed4313bf64=
f3bb5eee9d2c64
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_quote.8.in
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fa635d40265a021d6747530c1d73c90c8e859a5b
      https://github.com/01org/tpm2-tools/commit/fa635d40265a021d6747530c1d=
73c90c8e859a5b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_takeownership.8.in
    M tools/tpm2_takeownership.c

  Log Message:
  -----------
  tpm2_takeownership: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9a08e3916408e0b37d7d581e8c49e883914698a9
      https://github.com/01org/tpm2-tools/commit/9a08e3916408e0b37d7d581e8c=
49e883914698a9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_getpubek.8.in
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cd38d1063529c822308b017e53936aa65c0ca7ec
      https://github.com/01org/tpm2-tools/commit/cd38d1063529c822308b017e53=
936aa65c0ca7ec
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_getpubak.8.in
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: eb5329910adc01db5f546ac91a98951af5e7ddd7
      https://github.com/01org/tpm2-tools/commit/eb5329910adc01db5f546ac91a=
98951af5e7ddd7
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_activatecredential.8.in
    M tools/tpm2_activatecredential.c

  Log Message:
  -----------
  tpm2_activatecredential: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c8668ca792c5a141cea09f87e432b7619dd4acd9
      https://github.com/01org/tpm2-tools/commit/c8668ca792c5a141cea09f87e4=
32b7619dd4acd9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_nvread.8.in
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8bae75b636f6b94892f6e225695a91e85674126d
      https://github.com/01org/tpm2-tools/commit/8bae75b636f6b94892f6e22569=
5a91e85674126d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_nvreadlock.8.in
    M tools/tpm2_nvreadlock.c

  Log Message:
  -----------
  tpm2_nvreadlock: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 00bfade94740e43c508f8c4a6adea0c3ff039fe2
      https://github.com/01org/tpm2-tools/commit/00bfade94740e43c508f8c4a6a=
dea0c3ff039fe2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_nvwrite.8.in
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fada19ac95ba8f7b1e45f156acabc0760df3344b
      https://github.com/01org/tpm2-tools/commit/fada19ac95ba8f7b1e45f156ac=
abc0760df3344b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_nvdefine.8.in
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9218d8af61667879a7c4d0fa28c9e9b97f79283f
      https://github.com/01org/tpm2-tools/commit/9218d8af61667879a7c4d0fa28=
c9e9b97f79283f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_nvrelease.8.in
    M tools/tpm2_nvrelease.c

  Log Message:
  -----------
  tpm2_nvrelease: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6cd750320040eb07074d7e0d02bc564df48be4f7
      https://github.com/01org/tpm2-tools/commit/6cd750320040eb07074d7e0d02=
bc564df48be4f7
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_hmac.8.in
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0cf5762fe53806d90e156b05a55260d5ae3d38f1
      https://github.com/01org/tpm2-tools/commit/0cf5762fe53806d90e156b05a5=
5260d5ae3d38f1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_certify.8.in
    M tools/tpm2_certify.c

  Log Message:
  -----------
  tpm2_certify: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ea887fc87950eec479d05b27c6969811465aeb6f
      https://github.com/01org/tpm2-tools/commit/ea887fc87950eec479d05b27c6=
969811465aeb6f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_encryptdecrypt.8.in
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: bf777e831d077d7abae501c46845fbacaf321feb
      https://github.com/01org/tpm2-tools/commit/bf777e831d077d7abae501c468=
45fbacaf321feb
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_evictcontrol.8.in
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cb916b5159a459de3a81fd1749a891fdff041749
      https://github.com/01org/tpm2-tools/commit/cb916b5159a459de3a81fd1749=
a891fdff041749
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_rsadecrypt.8.in
    M tools/tpm2_rsadecrypt.c

  Log Message:
  -----------
  tpm2_rsadecrypt: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f12f1bafc989c29df77fd68e2ce39c4812d5c4cc
      https://github.com/01org/tpm2-tools/commit/f12f1bafc989c29df77fd68e2c=
e39c4812d5c4cc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_sign.8.in
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3d45fc0ea8fda3819d7cf95de090a6d725c2e05e
      https://github.com/01org/tpm2-tools/commit/3d45fc0ea8fda3819d7cf95de0=
90a6d725c2e05e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_unseal.8.in
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3bd32b963cb09adeadf8b64331ab7d9a729aaef3
      https://github.com/01org/tpm2-tools/commit/3bd32b963cb09adeadf8b64331=
ab7d9a729aaef3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M man/tpm2_dictionarylockout.8.in
    M tools/tpm2_dictionarylockout.c

  Log Message:
  -----------
  tpm2_dictionarylockout: switch to use tpm2_password_util_from_optarg

Drop the -X argument and use tpm2_password_util_from_optarg.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 11bd769936164f3508414325090c8cb0d00a523c
      https://github.com/01org/tpm2-tools/commit/11bd769936164f350841432509=
0c8cb0d00a523c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M lib/tpm2_password_util.c
    M lib/tpm2_password_util.h

  Log Message:
  -----------
  tpm2_password_util: drop unused routines

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 325ebaef74be289a4d02e2a8ba7cae9204e9742a
      https://github.com/01org/tpm2-tools/commit/325ebaef74be289a4d02e2a8ba=
7cae9204e9742a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M tools/tpm2_readpublic.c

  Log Message:
  -----------
  tpm2_readpublic.c: drop unused include

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 32eefa105062c40db18154b3627010710dfd61fe
      https://github.com/01org/tpm2-tools/commit/32eefa105062c40db18154b362=
7010710dfd61fe
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-18 (Fri, 18 Aug 2017)

  Changed paths:
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  tpm2_getrandom.c: drop unused include


Compare: https://github.com/01org/tpm2-tools/compare/35d14a93292b...32eefa1=
05062

--===============4605209110037984662==--

