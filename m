Content-Type: multipart/mixed; boundary="===============8463896588670962236=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] ad947b: test: ignore testing the hash
 algorithm without th...
Date: Mon, 02 Oct 2017 09:04:39 -0700
Message-ID: <59d26397e4829_141493fd04013bc30120798@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8463896588670962236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: ad947b30c3551625e01aacf4d253a89a65761236
      https://github.com/01org/tpm2-tools/commit/ad947b30c3551625e01aacf4d2=
53a89a65761236
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-02 (Mon, 02 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_pcrevent.sh

  Log Message:
  -----------
  test: ignore testing the hash algorithm without the corresponding sum pro=
gram

Currently, there is no equivalent like sha256sum for sm3_256. So just simpl=
y ignore
testing this sort of hash algorithm.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>



--===============8463896588670962236==--

