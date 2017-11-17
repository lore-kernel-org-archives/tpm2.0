Content-Type: multipart/mixed; boundary="===============6970772018688173108=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 23d8b8: test: add unit tests for tpm2_errata
Date: Fri, 17 Nov 2017 10:26:29 -0800
Message-ID: <5a0f29d512feb_4d9b3fe0dcd7dc3069173@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6970772018688173108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 23d8b817c6095d81e1cb939d119d1d6464e182ed
      https://github.com/intel/tpm2-tools/commit/23d8b817c6095d81e1cb939d11=
9d1d6464e182ed
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-17 (Fri, 17 Nov 2017)

  Changed paths:
    M Makefile.am
    A test/unit/test_tpm2_errata.c

  Log Message:
  -----------
  test: add unit tests for tpm2_errata

Add tests to validate that the errata routines are functioning.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 478ef949ab548f4acf90a310c80479576fd05ccd
      https://github.com/intel/tpm2-tools/commit/478ef949ab548f4acf90a310c8=
0479576fd05ccd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-17 (Fri, 17 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_dictionarylockout.sh

  Log Message:
  -----------
  test_tpm2_dictionarylockout: fix missing quotes

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: eb0e57c69ce8f1659c8256c2e129799ab1a9b167
      https://github.com/intel/tpm2-tools/commit/eb0e57c69ce8f1659c8256c2e1=
29799ab1a9b167
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-17 (Fri, 17 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_quote.sh

  Log Message:
  -----------
  test_tpm2_quote: fix test when maxdigest is empty

Ensure that maxdigest is a valid number.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/bd5cf1072c2d...eb0e57c=
69ce8

--===============6970772018688173108==--

