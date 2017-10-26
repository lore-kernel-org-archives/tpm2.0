Content-Type: multipart/mixed; boundary="===============3534137310718868019=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 4f2a45: tpm2_pcrlist: update selection list
 man page info
Date: Thu, 26 Oct 2017 13:23:03 -0700
Message-ID: <59f2442762aee_21743f9cd9201c2c1689d7@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3534137310718868019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 4f2a454eddcb3c3728983852bf412d54abb5f958
      https://github.com/01org/tpm2-tools/commit/4f2a454eddcb3c3728983852bf=
412d54abb5f958
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-26 (Thu, 26 Oct 2017)

  Changed paths:
    M man/common/pcr.md
    M man/tpm2_pcrlist.1.md

  Log Message:
  -----------
  tpm2_pcrlist: update selection list man page info

Add details and correct the pcr selection information
in the man page.

Fixes: #480

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cb530375b95d70eb2d0221aa58cdfe9020145d6b
      https://github.com/01org/tpm2-tools/commit/cb530375b95d70eb2d0221aa58=
cdfe9020145d6b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-26 (Thu, 26 Oct 2017)

  Changed paths:
    M man/tpm2_pcrlist.1.md

  Log Message:
  -----------
  tpm2_pcrlist: update manpage to include format option

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f6a9255a8a0e67beb0f6d0bbc1a244db66c0fb98
      https://github.com/01org/tpm2-tools/commit/f6a9255a8a0e67beb0f6d0bbc1=
a244db66c0fb98
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-26 (Thu, 26 Oct 2017)

  Changed paths:
    M man/tpm2_pcrlist.1.md

  Log Message:
  -----------
  tpm2_pcrlist: remove extra newline from manpage

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cd835f1cfd186f7c6cb3b6a24321dbfd636532c0
      https://github.com/01org/tpm2-tools/commit/cd835f1cfd186f7c6cb3b6a243=
21dbfd636532c0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-26 (Thu, 26 Oct 2017)

  Changed paths:
    M Makefile.am
    M man/common/pcr.md
    M man/common/signature.md
    M man/tpm2_certify.1.md
    M man/tpm2_quote.1.md
    M man/tpm2_sign.1.md
    M tools/tpm2_certify.c

  Log Message:
  -----------
  tpm2_certify: correct signature file saving to disk

Use the new plain/tss output format routines when
saving the signature file to disk in tpm2_certify.

Fixes: #229

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/b1cb1de2f634...cd835f1=
cfd18

--===============3534137310718868019==--

