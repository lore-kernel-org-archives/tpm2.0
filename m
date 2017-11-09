Content-Type: multipart/mixed; boundary="===============3201030808839793788=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 7eb26d: man/tpm2_quote: add missing -s
 option
Date: Thu, 09 Nov 2017 09:22:30 -0800
Message-ID: <5a048ed6a6463_44c3fb65c799c3899b3@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3201030808839793788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 7eb26d482c9fa63e90289f308e7ff5ebffe4a959
      https://github.com/intel/tpm2-tools/commit/7eb26d482c9fa63e90289f308e=
7ff5ebffe4a959
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M man/tpm2_quote.1.md

  Log Message:
  -----------
  man/tpm2_quote: add missing -s option

The -s option was not recorded in the man page,
record it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5bdab63d0a1ca4f5ce2f4f667bc45d53049b1aea
      https://github.com/intel/tpm2-tools/commit/5bdab63d0a1ca4f5ce2f4f667b=
c45d53049b1aea
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M man/tpm2_quote.1.md

  Log Message:
  -----------
  man/tpm2_quote: fix whitespace error

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 01054bc7d3a0faaac38e666e90349da4b2a223e0
      https://github.com/intel/tpm2-tools/commit/01054bc7d3a0faaac38e666e90=
349da4b2a223e0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M man/tpm2_quote.1.md
    M test/system/test_output_formats.sh
    M test/system/test_tpm2_quote.sh
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: drop -o option

Not only were the output files not used and in a near
unuseable state, teh tool now has output formats for
either tss or openssl structures. Use the -m and -s
options which output the same data as the old -o option,
in a cleaner, useable way.

Fixes: #495

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e13a2b0d71ad20057c981dc1d773e6abf92a6188
      https://github.com/intel/tpm2-tools/commit/e13a2b0d71ad20057c981dc1d7=
73e6abf92a6188
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: drop if 0 code

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/ce7c160cdd17...e13a2b0=
d71ad

--===============3201030808839793788==--

