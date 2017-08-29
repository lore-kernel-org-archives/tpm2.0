Content-Type: multipart/mixed; boundary="===============8166008310701832927=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 7e8b7b: version: display configured tcti
Date: Tue, 29 Aug 2017 09:00:39 -0700
Message-ID: <59a58fa75a982_17bd3fa4ead5fc4034081@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8166008310701832927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 7e8b7b9c3ef02080429874c5d2b601e1cbf81674
      https://github.com/01org/tpm2-tools/commit/7e8b7b9c3ef02080429874c5d2=
b601e1cbf81674
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-29 (Tue, 29 Aug 2017)

  Changed paths:
    M lib/options.h

  Log Message:
  -----------
  version: display configured tcti

Having only the manpage contain the mapping of configured tctis can be quite
challenging, if one is trying to figure out how this software is confogured
in an environment where manpages are not available. Add, to the version
a list of configured tctis, so a simple -v provides supported, configure
information.

This information will help bug reports, as a version of the software with
different configurations may have different bugs.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8bef749f04c990750e29f30cf29c4e993ff77bdd
      https://github.com/01org/tpm2-tools/commit/8bef749f04c990750e29f30cf2=
9c4e993ff77bdd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-29 (Tue, 29 Aug 2017)

  Changed paths:
    M .travis.yml
    M Makefile.am
    M lib/tpm2_util.h
    A man/common/options.md
    A man/common/tcti.md
    A man/tpm2_pcrevent.8.md
    M test/system/test_all.sh
    A test/system/test_tpm2_pcrevent.sh
    A tools/tpm2_pcrevent.c

  Log Message:
  -----------
  tpm2_pcrevent: add tool

Add the tpm2_pcrevent tool. It uses either the
TPM2_PCREvent if the data to hash is under 1024
and uses the sequence API if it is larger.

This command can optionally take a pcr index and perform
a pcrextend on the digest data.

The man page is a departure from the raw troff manpages
and now uses md2man (mark down to man).

Add a test script for testing tpm2_pcrevent.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 81ba912c8c7fbfa1574b6982c7bdfebb6ade3201
      https://github.com/01org/tpm2-tools/commit/81ba912c8c7fbfa1574b6982c7=
bdfebb6ade3201
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-29 (Tue, 29 Aug 2017)

  Changed paths:
    M CHANGELOG

  Log Message:
  -----------
  CHANGELOG: update

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 041a6ba41950d95082cd6296565b9d0f3be1da42
      https://github.com/01org/tpm2-tools/commit/041a6ba41950d95082cd629656=
5b9d0f3be1da42
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-29 (Tue, 29 Aug 2017)

  Changed paths:
    M tools/tpm2_pcrlist.c

  Log Message:
  -----------
  tpm2_pcrlist: support yaml output

Support yaml output to stdout so it can be parsed easily.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 73e3b2ca2486348b1455dfcc85465aa9ffc43ebe
      https://github.com/01org/tpm2-tools/commit/73e3b2ca2486348b1455dfcc85=
465aa9ffc43ebe
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-29 (Tue, 29 Aug 2017)

  Changed paths:
    M CHANGELOG

  Log Message:
  -----------
  CHANGELOG: update

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1966918dd70e6be7abaca1245cf9b53824a23290
      https://github.com/01org/tpm2-tools/commit/1966918dd70e6be7abaca1245c=
f9b53824a23290
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-29 (Tue, 29 Aug 2017)

  Changed paths:
    A test/system/yaml_get.py

  Log Message:
  -----------
  test: add tool for parsing yaml pcrlist

Add a tool that can parse the yaml output from tpm2_pcrlist.

This tool can be used in tests that extend pcr's to verify
that the value has changed.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cb2a45c0eeca3fb7fa29866dee1caae62fc518d3
      https://github.com/01org/tpm2-tools/commit/cb2a45c0eeca3fb7fa29866dee=
1caae62fc518d3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-29 (Tue, 29 Aug 2017)

  Changed paths:
    M test/system/test_all.sh
    M test/system/test_tpm2_pcrevent.sh

  Log Message:
  -----------
  test_tpm2_pcrevent.sh: verify that pcr values change

Verify that tpm2_pcrevent when given a pcr index actually
extends the pcr.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/0f22b29c40ee...cb2a45c=
0eeca

--===============8166008310701832927==--

