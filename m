Content-Type: multipart/mixed; boundary="===============2080213161167887012=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 377002: tpm2_create: support pipe based
 stdin
Date: Wed, 08 Nov 2017 09:29:12 -0800
Message-ID: <5a033ee889921_282a3ff987ecdc34100483@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2080213161167887012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/01org/tpm2-tools
  Commit: 377002137137e75b60fcc1c294ce77443abfd26f
      https://github.com/01org/tpm2-tools/commit/377002137137e75b60fcc1c294=
ce77443abfd26f
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


  Commit: 57bc09f3b8b8d5dd93d71a95235f019c2886769a
      https://github.com/01org/tpm2-tools/commit/57bc09f3b8b8d5dd93d71a9523=
5f019c2886769a
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


Compare: https://github.com/01org/tpm2-tools/compare/281471587003...57bc09f=
3b8b8

--===============2080213161167887012==--

