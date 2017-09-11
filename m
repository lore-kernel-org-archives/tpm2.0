Content-Type: multipart/mixed; boundary="===============2413223141381118226=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] e72f4b: tpm2_nvread: fix memcpy() arguments
Date: Sun, 10 Sep 2017 18:47:43 -0700
Message-ID: <59b5eb3fa0a3e_4ba73ff616469c445516a@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2413223141381118226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: e72f4b4e8055280b9176dd5f824498db30457bf0
      https://github.com/01org/tpm2-tools/commit/e72f4b4e8055280b9176dd5f82=
4498db30457bf0
  Author: Doug Goldstein <cardoe(a)cardoe.com>
  Date:   2017-09-10 (Sun, 10 Sep 2017)

  Changed paths:
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: fix memcpy() arguments

The first argument is the destination which needs to be offset based on
how much has already been read. The third argument is the size that we
should be reading. Correct the spelling of the variable name.

Signed-off-by: Doug Goldstein <cardoe(a)cardoe.com>



--===============2413223141381118226==--

