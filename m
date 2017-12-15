Content-Type: multipart/mixed; boundary="===============4855172236563968342=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 368e5a: configure: enable code coverage
Date: Fri, 15 Dec 2017 10:01:02 -0800
Message-ID: <5a340dde9533a_6a3f2af11b131c087207c@hookshot-fe-88eb02d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4855172236563968342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 368e5a13743bb131cc15300bc156a01f11763433
      https://github.com/intel/tpm2-tools/commit/368e5a13743bb131cc15300bc1=
56a01f11763433
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh
    M .travis.yml
    M Makefile.am
    M configure.ac

  Log Message:
  -----------
  configure: enable code coverage

This patch adds support for code coverage calculation
using gcov and lcov by configures --enable-code-coverage
and make check-code-coverage.

Use this option in the travis build.

Fixes: #711

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 68aaeddeda98379b29837218f12ad7eb1e234687
      https://github.com/intel/tpm2-tools/commit/68aaeddeda98379b29837218f1=
2ad7eb1e234687
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M Makefile.am
    M configure.ac

  Log Message:
  -----------
  configure.ac: enable silent-rules configure option by default

This change is inspired by Andreas Fuchs enabling the silent-rules option
by default on tpm2-tss. The output is much nicer and one can have the old
output anyways by either disabling the silent-rules option or "make V=3D1".

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 0c366e6addcfd5c0444a2039904d80226dfc05d8
      https://github.com/intel/tpm2-tools/commit/0c366e6addcfd5c0444a203990=
4d80226dfc05d8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  CHANGELOG.md: update for code-coverage

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/a3f568ce40ca...0c366e6=
addcf

--===============4855172236563968342==--

