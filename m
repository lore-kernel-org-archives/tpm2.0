Content-Type: multipart/mixed; boundary="===============4327046747786769700=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 97271d: tpm2_nvlist: fix property endian
 conversion
Date: Wed, 15 Nov 2017 12:12:51 -0800
Message-ID: <5a0c9fc33be58_33d3ff8cdb1bc401010db@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4327046747786769700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 97271da9f48a08161baed157c68ca8a30024d385
      https://github.com/intel/tpm2-tools/commit/97271da9f48a08161baed157c6=
8ca8a30024d385
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: fix property endian conversion

property endianess was always being swapped from
the tpm provided big endian version to little endian.
Thus, this only worked on LE hosts, only convert if
the host is little endian.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d56c6b3cbaa4e5d48f01bc44ccbfb5194fee508e
      https://github.com/intel/tpm2-tools/commit/d56c6b3cbaa4e5d48f01bc44cc=
bfb5194fee508e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M man/tpm2_nvlist.1.md
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: output in yaml

Output in a human readable and machine parseable YAML output.

Example output:
0x1500015:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|ownerread
    value: 0x2000200
  size: 32

0x1500017:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|ownerread
    value: 0x2000200
  size: 32
  authorization policy: 0011223344

Fixes #513

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6a6cb54815215e89262ef827bb7613641378fbb5
      https://github.com/intel/tpm2-tools/commit/6a6cb54815215e89262ef827bb=
7613641378fbb5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/6b4f25725709...6a6cb54=
81521

--===============4327046747786769700==--

