Content-Type: multipart/mixed; boundary="===============1034231260814629574=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] ce66d8: test: fix
 test_tpm2_activatecredential
Date: Wed, 27 Sep 2017 15:13:20 -0700
Message-ID: <59cc22808122e_3ebb3fe0852d9c404598@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1034231260814629574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: ce66d8bd3ed8c1abc105d01eb04f6afee60e9f6a
      https://github.com/01org/tpm2-tools/commit/ce66d8bd3ed8c1abc105d01eb0=
4f6afee60e9f6a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_activecredential.sh

  Log Message:
  -----------
  test: fix test_tpm2_activatecredential

Update to use trap handlers for file cleanup and evict
persistent objects when done.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ddd8484b7f96e02de78c1d709af6b01f83270f48
      https://github.com/01org/tpm2-tools/commit/ddd8484b7f96e02de78c1d709a=
f6b01f83270f48
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_akparse.sh

  Log Message:
  -----------
  test: fix test_tpm2_akparse

Update to use trap handlers for file cleanup and evict
persistent objects when done.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 876985884a0a9d30193b706325f1ef407b5b76d6
      https://github.com/01org/tpm2-tools/commit/876985884a0a9d30193b706325=
f1ef407b5b76d6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_certify.sh

  Log Message:
  -----------
  test: fix test_tpm2_certify

Update to use trap handlers for file cleanup.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1ea34b69c11ad9517d4014a5f4c55b1c7c0dafe2
      https://github.com/01org/tpm2-tools/commit/1ea34b69c11ad9517d4014a5f4=
c55b1c7c0dafe2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_createpolicy.sh

  Log Message:
  -----------
  test: fix test_tpm2_policy

Update to use trap handlers for file cleanup.
Add assertion that PCR 0 sha and sha256 banks
are equal to 3.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5344f4c8d59383f842b35f77b4cdfb0b722a54c9
      https://github.com/01org/tpm2-tools/commit/5344f4c8d59383f842b35f77b4=
cdfb0b722a54c9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  tpm2_dump_capability: support quiet option

Use tpm2_tool_output to support the quiet option.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ee7b07342f403e7f349ce197c5fb73296bbeb019
      https://github.com/01org/tpm2-tools/commit/ee7b07342f403e7f349ce197c5=
fb73296bbeb019
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_dump_capability.sh

  Log Message:
  -----------
  test: fix test_tpm2_dump_capability

Update to use trap handlers for error reporting.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ac5b2e4cff42d2da099ce720bb1db3c7792bd5bd
      https://github.com/01org/tpm2-tools/commit/ac5b2e4cff42d2da099ce720bb=
1db3c7792bd5bd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  Makefile.am: fix include dir

Including src was still present after the rename of src --> tools.
It should be tools directory, not src, fix it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7311eb7d1f146decce51ff87bbf33588cf88355b
      https://github.com/01org/tpm2-tools/commit/7311eb7d1f146decce51ff87bb=
f33588cf88355b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M lib/tpm2_util.c

  Log Message:
  -----------
  lib/tpm2_util.c: tpm2_util_print_tpm2b respect -Q

Make the tpm2_util_print_tpm2b routine respect the quiet option.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 42a775f611a792a87c6a8fef558c520781921fc0
      https://github.com/01org/tpm2-tools/commit/42a775f611a792a87c6a8fef55=
8c520781921fc0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: respect the quiet option

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 439acc44567d2f2e6ca1f1e97f51915e3acf5a9e
      https://github.com/01org/tpm2-tools/commit/439acc44567d2f2e6ca1f1e97f=
51915e3acf5a9e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_encryptdecrypt.sh

  Log Message:
  -----------
  test: fix test_tpm2_encryptdecrypt

Use trap handlers for file cleanup and error reporting.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 71541ea68b17a9a0940604fbb86bb5bce407bac8
      https://github.com/01org/tpm2-tools/commit/71541ea68b17a9a0940604fbb8=
6bb5bce407bac8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getpubak.sh

  Log Message:
  -----------
  test: tpm2_getpubak clear tpm state

Clear the tpm state with a takeownership -c call before running
the test.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2a8ccbf0828cf40d2966a2ddbc1af9e13f46f35b
      https://github.com/01org/tpm2-tools/commit/2a8ccbf0828cf40d2966a2ddbc=
1af9e13f46f35b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    A test/system/test.sh
    M test/system/test_all.sh

  Log Message:
  -----------
  test: test_all.sh generate test list vs hardcode

Rather than hardcode the test scripts, just take the list
of test files and execute them.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/08dcfa4381fb...2a8ccbf=
0828c

--===============1034231260814629574==--

