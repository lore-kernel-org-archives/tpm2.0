Content-Type: multipart/mixed; boundary="===============8535724279350583996=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 7a9aee: tpm2_createprimary: add
 missing newline
Date: Thu, 01 Mar 2018 14:08:19 -0800
Message-ID: <5a9879d3b9973_485b2b056a069c04296b8@hookshot-fe-b0febf1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8535724279350583996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 7a9aee07c453a1db822726e1d26ab30002facf3e
      https://github.com/tpm2-software/tpm2-tools/commit/7a9aee07c453a1db82=
2726e1d26ab30002facf3e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: add missing newline

The handle output was missing a newline, which makes
command line output a bit of a struggle as the shell
cursor is on the same line as the output.

Fix this by adding a newline.

Fixes: #914

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============8535724279350583996==--

