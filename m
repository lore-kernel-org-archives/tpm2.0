Content-Type: multipart/mixed; boundary="===============4233520722624345537=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 71586e: lib: add an xxd compatible hexdump
 routine
Date: Thu, 09 Nov 2017 08:55:46 -0800
Message-ID: <5a048892192ff_bf53fcce099dc38206cc@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4233520722624345537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 71586ebba51a2776fd6d4c93340a3279f16727e3
      https://github.com/intel/tpm2-tools/commit/71586ebba51a2776fd6d4c9334=
0a3279f16727e3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h

  Log Message:
  -----------
  lib: add an xxd compatible hexdump routine

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cc66580c03eb59c703fed2d009a352ffb35fdca3
      https://github.com/intel/tpm2-tools/commit/cc66580c03eb59c703fed2d009=
a352ffb35fdca3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread.c: use public hexdump routine

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c937989767835f4751536163f3b78af0a480c51f
      https://github.com/intel/tpm2-tools/commit/c937989767835f4751536163f3=
b78af0a480c51f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M man/tpm2_rsaencrypt.1.md
    M test/system/test_tpm2_rsaencrypt.sh
    M tools/tpm2_rsaencrypt.c

  Log Message:
  -----------
  tpm2_rsaencrypt.c: make -o optional

Make -o option optional and default to stdout. When
printing to stdout, use an xxd compatible hexdump
format.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ce7c160cdd174c4a14b6e9f1aed7bd5aee17b288
      https://github.com/intel/tpm2-tools/commit/ce7c160cdd174c4a14b6e9f1ae=
d7bd5aee17b288
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M man/tpm2_rsaencrypt.1.md
    M test/system/test_tpm2_rsadecrypt.sh
    M test/system/test_tpm2_rsaencrypt.sh
    M tools/tpm2_create.c
    M tools/tpm2_rsaencrypt.c

  Log Message:
  -----------
  tpm2_rsaencrypt: support -I as an argument

Make -I an argument and default to stdin.

Update tpm2_create to use a common helper since both these
tools have similair stdin logic.

Drop unused routines from files.h

Fixes: #508

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/3ed305a013aa...ce7c160=
cdd17

--===============4233520722624345537==--

