Content-Type: multipart/mixed; boundary="===============4492532279587194140=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c13c7d: tpm2_alg_util: remove duplicated
 SHA-1 entry in al...
Date: Thu, 28 Sep 2017 10:08:58 -0700
Message-ID: <59cd2caaa5492_12c03ff02d9b5c3c2839a@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4492532279587194140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: c13c7df88db73f67e4417eaacc3478ea0269c179
      https://github.com/01org/tpm2-tools/commit/c13c7df88db73f67e4417eaacc=
3478ea0269c179
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-28 (Thu, 28 Sep 2017)

  Changed paths:
    M lib/tpm2_alg_util.c
    M test/system/test_tpm2_create.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_hmac.sh
    M test/system/test_tpm2_pcrextend.sh
    M test/system/yaml_get.py
    M test/unit/test_tpm2_alg_util.c

  Log Message:
  -----------
  tpm2_alg_util: remove duplicated SHA-1 entry in algorithms table and tests

The specification makes it clear that both TPM_ALG_SHA and TPM_ALG_SHA1
refer to the SHA-1 algorithm, but the algorithms table has entries for
both even when they have the same hexadecimal value (0x0004).

That means that TPM_ALG_SHA1 will never be matched, since a match will
happen with TPM_ALG_SHA before. So all tools are currently printing a
"sha" string when a "sha1" should be printed instead:

$ tpm2_dump_capability -c algorithms | grep sha
TPMA_ALGORITHM for ALG_ID: 0x4 - sha
TPMA_ALGORITHM for ALG_ID: 0xb - sha256

After this patch:

$ tpm2_dump_capability -c algorithms | grep sha
TPMA_ALGORITHM for ALG_ID: 0x4 - sha1
TPMA_ALGORITHM for ALG_ID: 0xb - sha256

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============4492532279587194140==--

