Content-Type: multipart/mixed; boundary="===============6087026670137902287=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 9ad908: test: fix compilation
Date: Thu, 22 Feb 2018 16:41:33 -0800
Message-ID: <5a8f633d75b36_5352b2094b03bfc210828@hookshot-fe-d252ca1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6087026670137902287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 9ad90862b0d66e003c625885e235c88bc5ffafb9
      https://github.com/tpm2-software/tpm2-tools/commit/9ad90862b0d66e003c=
625885e235c88bc5ffafb9
  Author: Tadeusz Struk <tadeusz.struk(a)intel.com>
  Date:   2018-02-22 (Thu, 22 Feb 2018)

  Changed paths:
    M test/unit/test_tpm2_alg_util.c

  Log Message:
  -----------
  test: fix compilation

With gcc v7.3.1 test_tpm2_alg_util.c fails with:
In file included from test/unit/test_tpm2_alg_util.c:33:0:
test/unit/test_tpm2_alg_util.c: In function =E2=80=98test_pcr_parse_digest_=
list_compound=E2=80=99:
test/unit/test_tpm2_alg_util.c:349:78: error: array subscript is above arra=
y bounds [-Werror=3Darray-bounds]
       fail_msg("Missing algorithm test for: %u", dspec->digests.digests[i]=
.hashAlg);
                                                  ~~~~~~~~~~~~~~~~~~~~~~^~~

Fix this by explicitly checking the array bounds.

Signed-off-by: Tadeusz Struk <tadeusz.struk(a)intel.com>



--===============6087026670137902287==--

