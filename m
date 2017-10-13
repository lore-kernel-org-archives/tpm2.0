Content-Type: multipart/mixed; boundary="===============3409190382992207679=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 49cfc0: test_tpm2_pcrextend.sh: add sm3_256
 hash
Date: Fri, 13 Oct 2017 12:01:32 -0700
Message-ID: <59e10d8c48710_44963f8cf8dabc3065765@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3409190382992207679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 49cfc027fbd315b524c990e584743b9afa3b78e0
      https://github.com/01org/tpm2-tools/commit/49cfc027fbd315b524c990e584=
743b9afa3b78e0
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_pcrextend.sh

  Log Message:
  -----------
  test_tpm2_pcrextend.sh: add sm3_256 hash

This fix resolves the following errors printed if sm3_256 is supported
by TPM.

ERROR: Algorithm "sm3_256" expects a size of 32 bytes, got: 0
Could not perform command: tpm2_pcrextend 9:sm3_256=3D - 0

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>



--===============3409190382992207679==--

