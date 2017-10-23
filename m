Content-Type: multipart/mixed; boundary="===============4738183441622093568=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 03f51f: [REVERTME] travis: get build working
Date: Mon, 23 Oct 2017 10:30:53 -0700
Message-ID: <59ee274dbfde6_4c823fe558f53c3c108135@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4738183441622093568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 03f51f5fd262de6b7deb459d5f1791a39efc8568
      https://github.com/01org/tpm2-tools/commit/03f51f5fd262de6b7deb459d5f=
1791a39efc8568
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-23 (Mon, 23 Oct 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  [REVERTME] travis: get build working

commit c54e876b906361984bf7e6d65e1b28525fcac425
in the tss introduces a regression in the tools.

The marshaling routine is expecting a non-null src
buffer, and using an empty src buffer results in
more invalid issues.

For now, while we trouble shoot, freeze the tss on this
commit.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============4738183441622093568==--

