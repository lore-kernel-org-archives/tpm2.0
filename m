Content-Type: multipart/mixed; boundary="===============4768302615658024337=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] d33a71: lib: add an xxd compatible hexdump
 routine
Date: Thu, 09 Nov 2017 08:59:45 -0800
Message-ID: <5a048981d7168_17223f986bde7c3453276@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4768302615658024337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: d33a71cb95a3ca598d22eac460c08d5c7d91c5f6
      https://github.com/intel/tpm2-tools/commit/d33a71cb95a3ca598d22eac460=
c08d5c7d91c5f6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h

  Log Message:
  -----------
  lib: add an xxd compatible hexdump routine

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ec2fb0153abe87589e4a0e78dfc9108fa33b3b1e
      https://github.com/intel/tpm2-tools/commit/ec2fb0153abe87589e4a0e78df=
c9108fa33b3b1e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread.c: use public hexdump routine

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7359baca4669efd02ef6875385996377112cce9d
      https://github.com/intel/tpm2-tools/commit/7359baca4669efd02ef6875385=
996377112cce9d
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


  Commit: 6b855b3308a19d612213c408ac66a10d7650bd50
      https://github.com/intel/tpm2-tools/commit/6b855b3308a19d612213c408ac=
66a10d7650bd50
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


Compare: https://github.com/intel/tpm2-tools/compare/6352ede2337e...6b855b3=
308a1

--===============4768302615658024337==--

