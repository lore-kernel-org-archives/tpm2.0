Content-Type: multipart/mixed; boundary="===============9204388491487189868=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 12f596: remove abrmd patches
Date: Wed, 27 Sep 2017 13:33:15 -0700
Message-ID: <59cc0b0b5710a_6cc73fb6fa927c28987ec@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9204388491487189868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 12f59673d4ba9ef25cf1d0528b8fb7c88420b69f
      https://github.com/01org/tpm2-tools/commit/12f59673d4ba9ef25cf1d0528b=
8fb7c88420b69f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    R .ci/patches/abrmd/0001-tpm2-command-fix-compile-errors.patch
    R .ci/patches/abrmd/0002-bump-sapi-version-to-2.0.patch

  Log Message:
  -----------
  remove abrmd patches

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ea31ec23e2d29a5647c5eb60934383bd452a454d
      https://github.com/01org/tpm2-tools/commit/ea31ec23e2d29a5647c5eb6093=
4383bd452a454d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    R test/system/test_algs_tpm2_encryptdecrypt.sh
    R test/system/test_algs_tpm2_getpubak.sh
    R test/system/test_algs_tpm2_getpubek.sh
    R test/system/test_algs_tpm2_hmac.sh
    R test/system/test_algs_tpm2_quote.sh
    R test/system/test_algs_tpm2_readpublic.sh
    R test/system/test_algs_tpm2_sign.sh
    R test/system/test_algs_tpm2_unseal.sh
    R test/system/test_algs_tpm2_verifysignature.sh
    M test/system/test_all.sh
    M test/system/test_tpm2_create_all.sh

  Log Message:
  -----------
  test: fix test_tpm2_create_all

This test was not running, fix it and update to
use trap handlers for file cleanup.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0c91b43c9140ef3790fc51cfa7ef5dc25e198f2d
      https://github.com/01org/tpm2-tools/commit/0c91b43c9140ef3790fc51cfa7=
ef5dc25e198f2d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_all.sh
    M test/system/test_tpm2_createprimary_all.sh

  Log Message:
  -----------
  test: fix test_tpm2_createprimary_all

This test was not running, fix it and update to
use trap handlers for file cleanup.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 46e1eed4f6b85e9527d044a2dd166651a32bcd00
      https://github.com/01org/tpm2-tools/commit/46e1eed4f6b85e9527d044a2dd=
166651a32bcd00
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    R test/system/test_algs.sh

  Log Message:
  -----------
  test: remove test_algs.sh since already tested

The following tests test this functionality:
  * test_tpm2_create_all.sh
  * test_tpm2_createprimary_all.sh

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 08dcfa4381fbfdb1a735aaa2439f255659dee7d1
      https://github.com/01org/tpm2-tools/commit/08dcfa4381fbfdb1a735aaa243=
9f255659dee7d1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    R test/system/test_smoking.sh

  Log Message:
  -----------
  test: remove test_smoking.sh

Unused broken test

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/a55ad7d40410...08dcfa4=
381fb

--===============9204388491487189868==--

