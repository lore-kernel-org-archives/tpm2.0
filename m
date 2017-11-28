Content-Type: multipart/mixed; boundary="===============1833388092682238816=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 53784b: tpm2_flushcontext: new tool that
 remove handles
Date: Tue, 28 Nov 2017 15:48:18 -0800
Message-ID: <5a1df5c21d78d_706c3f85dc13fc44100334@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1833388092682238816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 53784b6a75790cc8061e0458a69c5067a1d045f7
      https://github.com/intel/tpm2-tools/commit/53784b6a75790cc8061e0458a6=
9c5067a1d045f7
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M Makefile.am
    A man/tpm2_flushcontext.1.md
    A tools/tpm2_flushcontext.c

  Log Message:
  -----------
  tpm2_flushcontext: new tool that remove handles

This tool is used to remove a specified handle, or all contexts
associated with a transient object, persistent object, hmac session
or policy session from the TPM.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


  Commit: 7e3b0a37a90b1a7b30b5dc576605a5ec35ddc249
      https://github.com/intel/tpm2-tools/commit/7e3b0a37a90b1a7b30b5dc5766=
05a5ec35ddc249
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    A test/system/test_tpm2_flushcontext.sh

  Log Message:
  -----------
  test: add system test for tpm2_flushcontext

Add test to validate that the tool tpm2_flushcontext is functioning.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


Compare: https://github.com/intel/tpm2-tools/compare/faec469f3f56...7e3b0a3=
7a90b

--===============1833388092682238816==--

