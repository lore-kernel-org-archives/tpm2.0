Content-Type: multipart/mixed; boundary="===============1562033193878567579=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] dbd5f1: tpm2_create: support pipe based
 stdin
Date: Wed, 08 Nov 2017 09:27:55 -0800
Message-ID: <5a033e9b77d8b_3ebc3fcba9737c3835484@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1562033193878567579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: dbd5f1a732e4a8ed9dd0f9f50e816cd2329d94e5
      https://github.com/01org/tpm2-tools/commit/dbd5f1a732e4a8ed9dd0f9f50e=
816cd2329d94e5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-08 (Wed, 08 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_unseal.sh
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: support pipe based stdin

The file routines used for reading from stdin uses
ftell() under the hood to get the file size and then
veirfy that sizes are sane. In the case of stdin
occuring from a pipe, an Illegal Seek is trigered
from ftell().

Correct this by supressing error reporting and attempting
a fall back file read mechanism.

Fixes: #425

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b9fdfaf94cf32388e543de957e2f4eb16d34c75b
      https://github.com/01org/tpm2-tools/commit/b9fdfaf94cf32388e543de957e=
2f4eb16d34c75b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-08 (Wed, 08 Nov 2017)

  Changed paths:
    M lib/tpm2_errata.c

  Log Message:
  -----------
  lib/tpm2_errata: clean up error handling

When the tpm's revision didn't match, a bunch of
errneous error messages were generated, remove these.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/1f46f6e545e0...b9fdfaf=
94cf3

--===============1562033193878567579==--

