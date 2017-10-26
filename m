Content-Type: multipart/mixed; boundary="===============0236909385501477906=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 049a42: tpm2_errata: implement a generic
 handling for erra...
Date: Thu, 26 Oct 2017 13:20:57 -0700
Message-ID: <59f243a9d7610_393f3f7f7e0d1c3043559@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0236909385501477906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 049a424dd85bc0c82d550b1824a589a0a6945022
      https://github.com/01org/tpm2-tools/commit/049a424dd85bc0c82d550b1824=
a589a0a6945022
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-26 (Thu, 26 Oct 2017)

  Changed paths:
    M Makefile.am
    A lib/tpm2_errata.c
    A lib/tpm2_errata.h
    M tools/tpm2_tool.c

  Log Message:
  -----------
  tpm2_errata: implement a generic handling for errata

The TPM errata should be addressed and handled transparently by design.

In order to handle an errata, the errata info should be recorded in
tpm2_errata.[ch], and the tools need to query the errata handler with
a pre-defined errata index number and fixup handler.

During the initialization, the TPM spec and errata info will be
remembered and used to check the errata query issued by the callers.

If the errata is omitted, nothing would happen. In contrast, the log
records which errata is applied.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


  Commit: 81b20dd81c22a1c95603a16d2778e8c65980b526
      https://github.com/01org/tpm2-tools/commit/81b20dd81c22a1c95603a16d27=
78e8c65980b526
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-26 (Thu, 26 Oct 2017)

  Changed paths:
    M tools/tpm2_create.c
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_create, tpm2_import: work around a spec 1.16 errata

TPM 2.0 spec 1.16 errata on decrypt and sign set for a symcipher.

Certain TPM 2.0 chip, e.g, Nationz Z32H320TC, and tpm2simulator
referring to TPM 2.0 spec 1.16 may have an errata, disallowing both
decrypt and sign set for a symcipher object, and in response to
RC_ATTRIBUTES.

This change partially resolves the issue #335 (Make sure that all
tests work on a real TPM hardware) for helping on it regard.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


  Commit: 67aee61995fa91ceca7d4dc15c1481e523d03808
      https://github.com/01org/tpm2-tools/commit/67aee61995fa91ceca7d4dc15c=
1481e523d03808
  Author: Jia Zhang <qianyue.zj(a)alibaba-inc.com>
  Date:   2017-10-26 (Thu, 26 Oct 2017)

  Changed paths:
    M test/system/test_helpers.sh
    M test/system/test_tpm2_create.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_quote.sh

  Log Message:
  -----------
  test: clean up errata wrapper create_object()

This errata is already transparently handled in tools.

Signed-off-by: Jia Zhang <qianyue.zj(a)alibaba-inc.com>


Compare: https://github.com/01org/tpm2-tools/compare/41b14163d20e...67aee61=
995fa

--===============0236909385501477906==--

