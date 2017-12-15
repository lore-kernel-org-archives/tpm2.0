Content-Type: multipart/mixed; boundary="===============7512247277466155193=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 1cbbbd: Allow to enable errata through
 defining an environ...
Date: Fri, 15 Dec 2017 09:42:03 -0800
Message-ID: <5a34096b85b05_43ec2ad4c135bc0c939c4@hookshot-fe-265448d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7512247277466155193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 1cbbbd08d920b156290cc1c720b73be2a943a855
      https://github.com/intel/tpm2-tools/commit/1cbbbd08d920b156290cc1c720=
b73be2a943a855
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M lib/tpm2_options.c
    M man/common/options.md

  Log Message:
  -----------
  Allow to enable errata through defining an environment variable

The environment variable TPM2TOOLS_ENABLE_ERRATA is equivalent to
-Z option. It is practical to globally enable errata instead of
specifying -Z option everywhere.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


  Commit: 566040000fdde669ccf7c3b77e4d742c78c78ae4
      https://github.com/intel/tpm2-tools/commit/566040000fdde669ccf7c3b77e=
4d742c78c78ae4
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M test/system/test.sh

  Log Message:
  -----------
  test.sh: support to enable errata with -Z option

Useful when intending to apply errata to all testcases.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


Compare: https://github.com/intel/tpm2-tools/compare/341241ed9aac...5660400=
00fdd

--===============7512247277466155193==--

