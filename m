Content-Type: multipart/mixed; boundary="===============6164742433931339983=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] d6644a: Makefile.am: fix custom install
 locations
Date: Wed, 16 Aug 2017 09:06:41 -0700
Message-ID: <59946d91ea5f8_65733fc76393dc347826f@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6164742433931339983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: d6644a07c02d6adb9b613e992968706b1296b5b7
      https://github.com/01org/tpm2-tools/commit/d6644a07c02d6adb9b613e9929=
68706b1296b5b7
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-16 (Wed, 16 Aug 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  Makefile.am: fix custom install locations

Configure.ac was correctly checking the sapi library via
PKG_CHECK_MODULES and thus setting SAPI_CFLAGS with the
include path. However, this was never being propagated to
AM_CFLAGS. The end result is that custom install locations
wouldn't work without hacking on CFLAGS, as it couldn't
find the sapi headers. Correct this by passing SAPI_CFLAGS
to AM_CFLAGS.

Fixes: #402

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 657c72eb1bdf2b741eef99dd5439ca8a83e04a4b
      https://github.com/01org/tpm2-tools/commit/657c72eb1bdf2b741eef99dd54=
39ca8a83e04a4b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-16 (Wed, 16 Aug 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  Makefile.am: CFLAGS and LIBS cleanups

* Remove dead package config prefixs
* Drop lines at 80 characters
* Add any missing package config prefix variables

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e8cbac8ec152715ae842367c47f0171804ef1db8
      https://github.com/01org/tpm2-tools/commit/e8cbac8ec152715ae842367c47=
f0171804ef1db8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-16 (Wed, 16 Aug 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  Makefile.am: fix make distcheck

Fix the errors with make distcheck:

1. Include header files in source lists.
2. Add the manpage sources.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/374c799edb46...e8cbac8=
ec152

--===============6164742433931339983==--

