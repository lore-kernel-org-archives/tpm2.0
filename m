Content-Type: multipart/mixed; boundary="===============8804732285838231710=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 0b0994: tpm2_dump_capability: correct the
 max count of alg...
Date: Wed, 18 Oct 2017 10:01:53 -0700
Message-ID: <59e789018fd24_12793fcd736a7c34128285@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8804732285838231710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 0b099405c5790b8511c52a18a1c087f26ae00b82
      https://github.com/01org/tpm2-tools/commit/0b099405c5790b8511c52a18a1=
c087f26ae00b82
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-18 (Wed, 18 Oct 2017)

  Changed paths:
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  tpm2_dump_capability: correct the max count of algorithms queried

MAX_ALG_LIST_SIZE is only used for the definition of TPML_ALG
structure. Instead, should use MAX_CAP_ALGS.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


  Commit: 577e3a98ea3497f4f04580f27862aab97e8e4978
      https://github.com/01org/tpm2-tools/commit/577e3a98ea3497f4f04580f278=
62aab97e8e4978
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-18 (Wed, 18 Oct 2017)

  Changed paths:
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  tpm2_dump_capability: prompt a warning if more_data is set

It may need to implement a more robust way to handle more_data =3D=3D YES.
Currently, just print a warning to let end user know it.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


  Commit: a1d332b8bab3e7275b0f023c516994b82e03ca67
      https://github.com/01org/tpm2-tools/commit/a1d332b8bab3e7275b0f023c51=
6994b82e03ca67
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-18 (Wed, 18 Oct 2017)

  Changed paths:
    M man/tpm2_dump_capability.1.md
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  tpm2_dump_capability: support dumping out handles

This commit implements showing the category of TPM2_CAP_HANDLES
returned. According to different properties, the corresponding
option values for -c option are added.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


Compare: https://github.com/01org/tpm2-tools/compare/fa9fe7a74952...a1d332b=
8bab3

--===============8804732285838231710==--

