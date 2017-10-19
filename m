Content-Type: multipart/mixed; boundary="===============5140938185713881038=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] fef8e5: test_tpm2_create.sh,
 test_tpm2_createpolicy.sh: tes...
Date: Wed, 18 Oct 2017 19:37:06 -0700
Message-ID: <59e80fd244ca0_29d43ff5b3199c3410199a@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5140938185713881038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: fef8e544e2953401ece4bcdfefb4e35071032cb7
      https://github.com/01org/tpm2-tools/commit/fef8e544e2953401ece4bcdfef=
b4e35071032cb7
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-18 (Wed, 18 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_create.sh
    M test/system/test_tpm2_createprimary.sh

  Log Message:
  -----------
  test_tpm2_create.sh,test_tpm2_createpolicy.sh: test owner instead of plat=
form hierarchy

This commit resolves the following error with a real TPM hardware.
ERROR:
CreatePrimary Failed ! ErrorCode: 0x9a2

tpm2_createprimary -Q -A p -g sha1 -G rsa -C context.out on line 54
failed: 1

Usually, the platform hierarchy is locked on a real hardware. In order
to make the test more compatible, just test owner hierarchy instead of
platform hierarchy.

This change partially resolves the issue #335 (Make sure that all tests
work on a real TPM hardware) for helping on it regard.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>



--===============5140938185713881038==--

