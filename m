Content-Type: multipart/mixed; boundary="===============9105331068117823361=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 3b87c2: tpm2_getmanufec: make server url an
 argument
Date: Mon, 23 Oct 2017 14:27:13 -0700
Message-ID: <59ee5eb137197_4e933fbcf22b3c2c104986@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9105331068117823361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 3b87c250c4b57c4aa7f97eb53a8dcc9a3a5acd08
      https://github.com/01org/tpm2-tools/commit/3b87c250c4b57c4aa7f97eb53a=
8dcc9a3a5acd08
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-23 (Mon, 23 Oct 2017)

  Changed paths:
    M man/tpm2_getmanufec.1.md
    M test/system/test_tpm2_getmanufec.sh
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: make server url an argument

Server URL is required, make it an option and assign
-S to the session input handle.

Fixes: #484

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7b824e0ac9afdebd776775e40ba1d7d1510dc8dc
      https://github.com/01org/tpm2-tools/commit/7b824e0ac9afdebd776775e40b=
a1d7d1510dc8dc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-23 (Mon, 23 Oct 2017)

  Changed paths:
    M man/tpm2_getmanufec.1.md
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: correct Capitalized options

Some options were not camel cased but rather started
with a capital. Fix these.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f3eb247ff2affc09e9d1e2997dbc2d1cce8ae585
      https://github.com/01org/tpm2-tools/commit/f3eb247ff2affc09e9d1e2997d=
bc2d1cce8ae585
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-23 (Mon, 23 Oct 2017)

  Changed paths:
    M man/tpm2_getmanufec.1.md
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: make long option for output output

Rather than --file for output to a file, use --output.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/bced5d646c23...f3eb247=
ff2af

--===============9105331068117823361==--

