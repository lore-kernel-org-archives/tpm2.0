Content-Type: multipart/mixed; boundary="===============8790835423317083451=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] db54db: lib: fix error array
Date: Mon, 26 Feb 2018 14:15:09 -0800
Message-ID: <5a9486edd8d60_6fb42b0fc6789c08505b1@hookshot-fe-d252ca1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8790835423317083451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: db54dbf23696075336a5a2c25d5544cd66fc0fd9
      https://github.com/tpm2-software/tpm2-tools/commit/db54dbf23696075336=
a5a2c25d5544cd66fc0fd9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-26 (Mon, 26 Feb 2018)

  Changed paths:
    M lib/tpm2_error.c

  Log Message:
  -----------
  lib: fix error array

The indices were off in the array, fix this.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a8d13a160f46d87f403c6b80ab16ae91bb109e0f
      https://github.com/tpm2-software/tpm2-tools/commit/a8d13a160f46d87f40=
3c6b80ab16ae91bb109e0f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-26 (Mon, 26 Feb 2018)

  Changed paths:
    M Makefile.am
    R lib/conversion.c
    R lib/conversion.h
    A lib/tpm2_convert.c
    A lib/tpm2_convert.h
    M tools/tpm2_certify.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_quote.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_sign.c

  Log Message:
  -----------
  lib/conversion: rename to tpm2_convert

Update routines/enums to coding standard.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2496a869141d9ea32dd8e1a1f83061076c767240
      https://github.com/tpm2-software/tpm2-tools/commit/2496a869141d9ea32d=
d8e1a1f83061076c767240
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-26 (Mon, 26 Feb 2018)

  Changed paths:
    M tools/tpm2_rsadecrypt.c

  Log Message:
  -----------
  tpm2_rsadecrypt: fix error output

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7a09eaf32c13c3bf07906db86675aa0e966b6fc3
      https://github.com/tpm2-software/tpm2-tools/commit/7a09eaf32c13c3bf07=
906db86675aa0e966b6fc3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-26 (Mon, 26 Feb 2018)

  Changed paths:
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: fix missing hex identifier on handle

FIx the missing 0x base identifier on the loaded-key handle output.

Before:
loaded-key:
  handle: 80000001

After:
loaded-key:
  handle: 0x80000001

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/ea9f944051da..=
.7a09eaf32c13

--===============8790835423317083451==--

