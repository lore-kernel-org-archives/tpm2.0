Content-Type: multipart/mixed; boundary="===============7352238749550208677=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 4e4306: test: work around TPM 2.0 spec 1.16
 errata on decr...
Date: Wed, 18 Oct 2017 19:38:29 -0700
Message-ID: <59e81025bd534_480f3fe265951c30127422@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7352238749550208677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 4e43061fe9e6edef1d37fe11cbd697df27d58563
      https://github.com/01org/tpm2-tools/commit/4e43061fe9e6edef1d37fe11cb=
d697df27d58563
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-18 (Wed, 18 Oct 2017)

  Changed paths:
    M test/system/test_helpers.sh
    M test/system/test_tpm2_create.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_quote.sh

  Log Message:
  -----------
  test: work around TPM 2.0 spec 1.16 errata on decrypt and sign set for a =
symcipher object

Certain TPM 2.0 chip, e.g, Nationz Z32H320TC, and tpm2simulator
referring to TPM 2.0 spec 1.16 may have an errata, disallowing both
decrypt and sign set for a symcipher object, and in response to
RC_ATTRIBUTES.

In order to work around it, we attempt to run tpm2_create again with
sign bit clear.

This workaround works for the testcases:
- test_tpm2_encryptdecrypt.sh
- test_tpm2_create.sh
- test_tpm2_quote.sh

This change partially resolves the issue #335 (Make sure that all
tests work on a real TPM hardware) for helping on it regard

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>



--===============7352238749550208677==--

