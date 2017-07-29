Content-Type: multipart/mixed; boundary="===============0686045380634064913=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2.0-tools] eeea15: tpm2_nvdefine: remove un-needed
 flag
Date: Sat, 29 Jul 2017 16:53:42 -0700
Message-ID: <597d2006bff6d_68683f93f7349c3c69814@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0686045380634064913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2.0-tools
  Commit: eeea150cd2e4e81a9dd8939d0b3bdfe6a5540452
      https://github.com/01org/tpm2.0-tools/commit/eeea150cd2e4e81a9dd8939d=
0b3bdfe6a5540452
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-29 (Sat, 29 Jul 2017)

  Changed paths:
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: remove un-needed flag

There was no need for a seperate flag when a NULL
check could be performed on policy_file.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7c5c0597330c03522d58ea97a12f0a2f5433e170
      https://github.com/01org/tpm2.0-tools/commit/7c5c0597330c03522d58ea97=
a12f0a2f5433e170
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-29 (Sat, 29 Jul 2017)

  Changed paths:
    M lib/tpm2_policy.c
    M lib/tpm2_util.c
    M lib/tpm2_util.h
    M test/unit/test_string_bytes.c

  Log Message:
  -----------
  tpm2_util: add popcount routine and test

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 52d99f424a9e25ed8645c345dcee010ba94fb5e2
      https://github.com/01org/tpm2.0-tools/commit/52d99f424a9e25ed8645c345=
dcee010ba94fb5e2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-29 (Sat, 29 Jul 2017)

  Changed paths:
    M lib/tpm2_nv_util.c
    M lib/tpm2_nv_util.h
    M test/unit/test_tpm2_nv_util.c

  Log Message:
  -----------
  convert NVATTRs to friendly names

Add routines for converting from NVATTR values to friendly names.

Add tests for it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 78c19494123167f126324da97d947194b92bd0a9
      https://github.com/01org/tpm2.0-tools/commit/78c19494123167f126324da9=
7d947194b92bd0a9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-29 (Sat, 29 Jul 2017)

  Changed paths:
    M lib/tpm2_nv_util.c
    M lib/tpm2_nv_util.h
    M test/unit/test_tpm2_nv_util.c
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm_nv_util: rename routine

Rename tpm2_nv_util_attrs_to_val to tpm2_nv_util_strtoattr
so it follows the conventions set by the algorithm
conversion routines.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: baceb27d909b495b5019a713e9f2af8101dd5620
      https://github.com/01org/tpm2.0-tools/commit/baceb27d909b495b5019a713=
e9f2af8101dd5620
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-29 (Sat, 29 Jul 2017)

  Changed paths:
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: add attribute nice-name resolution

Use the newley introduced routine XXX to convert the attribute
values to strings. This will make it easier for humans to
decipher and underdstand what is going on.

Old Output:
1 NV indexes defined.

  0. NV Index: 0x1500016
  {
	Hash algorithm(nameAlg):11
 	The Index attributes(attributes):0xa000a
 	The size of the data area(dataSize):32
 	Authorization Policy for R/W/D:
  }

New Output:
1 NV indexes defined.

  0. NV Index: 0x1500016
  {
	Hash algorithm(nameAlg):11
 	attributes: ownerwrite|policywrite|ownerread|policyread(0xa000a)
 	The size of the data area(dataSize):32
 	Authorization Policy for R/W/D:
  }

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b2c32c630501c5ac1559e1651963e5d94b4a4c64
      https://github.com/01org/tpm2.0-tools/commit/b2c32c630501c5ac1559e165=
1963e5d94b4a4c64
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-29 (Sat, 29 Jul 2017)

  Changed paths:
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: fix byte order in output

Listing the attribute value, a UINT32, the bytes were not
converted from big endian (tpm endianess) to host endianess.

Thus, unless you converted them, the attribute value in hex
was wrong.

Fixes: #383

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5a1788db6260f91a7b7a73c85e09bf91ddbe71e0
      https://github.com/01org/tpm2.0-tools/commit/5a1788db6260f91a7b7a73c8=
5e09bf91ddbe71e0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-29 (Sat, 29 Jul 2017)

  Changed paths:
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: convert hex output to bug numbers

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2.0-tools/compare/bb856ded2c85...5a178=
8db6260

--===============0686045380634064913==--

