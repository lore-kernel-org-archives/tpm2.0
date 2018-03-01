Content-Type: multipart/mixed; boundary="===============4200348393147275200=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 62d2ce: tests/encryptdecrypt: fix
 errors that cause passin...
Date: Thu, 01 Mar 2018 14:25:40 -0800
Message-ID: <5a987de48a630_26512ae5fb58fc087165d@hookshot-fe-32b5f5b.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4200348393147275200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 62d2ce72f0e84bb47e58ee5a40217453ac415e4e
      https://github.com/tpm2-software/tpm2-tools/commit/62d2ce72f0e84bb47e=
58ee5a40217453ac415e4e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M test/system/tests/encryptdecrypt.sh

  Log Message:
  -----------
  tests/encryptdecrypt: fix errors that cause passing

The error trap was cleared when using tpm2_getcap
to verify if command encryptdecrypt was supported.

If it wasn't supported, by checking the grep return
code via $?, then a warning is printed and the test
is skipped.

When tpm2_getcap fails, $? is 1 and the test is reported
as passing, which is incorrect.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============4200348393147275200==--

