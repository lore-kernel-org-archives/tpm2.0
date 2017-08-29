Content-Type: multipart/mixed; boundary="===============5375920736955184335=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 73f228: tpm2_akparse: drop duplicate
 routines
Date: Tue, 29 Aug 2017 09:50:27 -0700
Message-ID: <59a59b53e0cc0_10b43fc3a7133c388664f@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5375920736955184335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 73f2281f0b2b0ebfcaa15f5d102bc9a8fef66f5d
      https://github.com/01org/tpm2-tools/commit/73f2281f0b2b0ebfcaa15f5d10=
2bc9a8fef66f5d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-29 (Tue, 29 Aug 2017)

  Changed paths:
    M tools/tpm2_akparse.c

  Log Message:
  -----------
  tpm2_akparse: drop duplicate routines

tpm2_akparse had bigendian conversion and file saving routines.
These duplicated the routines available in files.h, drop them
and replace with the files.h versions.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============5375920736955184335==--

