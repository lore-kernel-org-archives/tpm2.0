Content-Type: multipart/mixed; boundary="===============6448507943196668890=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 4e96ee: tpm2_dump_capability: add dumping
 ECC curves
Date: Thu, 28 Sep 2017 09:42:54 -0700
Message-ID: <59cd268e6b9ba_508d3fb94c7a3c2c13489@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6448507943196668890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 4e96ee811e0705bbdee85f4fcc7004f73de66f2a
      https://github.com/01org/tpm2-tools/commit/4e96ee811e0705bbdee85f4fcc=
7004f73de66f2a
  Author: Anton Gerasimov <anton(a)advancedtelematic.com>
  Date:   2017-09-28 (Thu, 28 Sep 2017)

  Changed paths:
    M man/tpm2_dump_capability.1.md
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  tpm2_dump_capability: add dumping ECC curves

Add option to dump elliptic curves supported by the device.
Corresponding capability selector is TPM_CAM_ECC_CURVES.
Since the capabilities list is growing, from now on we'll try to keep
it sorted.

Signed-off-by: Anton Gerasimov <anton(a)advancedtelematic.com>



--===============6448507943196668890==--

