Content-Type: multipart/mixed; boundary="===============2300544750490780183=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] a22a25: tpm2_nvlist: fix property endian
 conversion
Date: Tue, 14 Nov 2017 13:25:00 -0800
Message-ID: <5a0b5f2cd6ecd_d9f13fadcf227c2c5838d@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2300544750490780183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: a22a25b5a884c95db2eae59f342db6534c5de87c
      https://github.com/intel/tpm2-tools/commit/a22a25b5a884c95db2eae59f34=
2db6534c5de87c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-14 (Tue, 14 Nov 2017)

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


  Commit: b42c2daf32c94ff0af88ea7f649fa8e9615261fe
      https://github.com/intel/tpm2-tools/commit/b42c2daf32c94ff0af88ea7f64=
9fa8e9615261fe
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-14 (Tue, 14 Nov 2017)

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
  authorization policy:

0x1500017:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|ownerread
    value: 0x2000200
  size: 32
  authorization policy:

Fixes #513

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: db89a48e009817862276a210fd23c6e3904d9667
      https://github.com/intel/tpm2-tools/commit/db89a48e009817862276a210fd=
23c6e3904d9667
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-14 (Tue, 14 Nov 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/2582891bd4d1...db89a48=
e0098

--===============2300544750490780183==--

