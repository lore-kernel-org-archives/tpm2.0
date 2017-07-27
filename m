Content-Type: multipart/mixed; boundary="===============1919356644232229992=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2.0-tools] 5ac845: Restrict nonce length to
 TPM_PT_MAX_DIGEST
Date: Thu, 27 Jul 2017 09:46:52 -0700
Message-ID: <597a18fc20a32_24223f839df39c3c13061d@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1919356644232229992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2.0-tools
  Commit: 5ac845f18d3f04fe9a0c07f6cb7d24e5bad3759a
      https://github.com/01org/tpm2.0-tools/commit/5ac845f18d3f04fe9a0c07f6=
cb7d24e5bad3759a
  Author: Alexander Steffen <webmeister(a)users.noreply.github.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M test/system/test_tpm2_quote.sh

  Log Message:
  -----------
  Restrict nonce length to TPM_PT_MAX_DIGEST

The qualifying data in a TPM2_Quote call may not be larger than the maximum=
 size of a digest.



--===============1919356644232229992==--

