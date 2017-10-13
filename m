Content-Type: multipart/mixed; boundary="===============8218797129848523266=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c65be9: nvread: fix missing 'f' in optstring
Date: Fri, 13 Oct 2017 12:26:51 -0700
Message-ID: <59e1137be8c15_43593f844d9ebc34685d4@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8218797129848523266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: c65be9b68c01f1eb9baa45cde5823dd1b45dbff9
      https://github.com/01org/tpm2-tools/commit/c65be9b68c01f1eb9baa45cde5=
823dd1b45dbff9
  Author: Fabien Parent <fparent(a)baylibre.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  nvread: fix missing 'f' in optstring

nvread is not understanding the "-f" parameter because the
option is missing from the optstring. Add it to the optstring.

Signed-off-by: Fabien Parent <fparent(a)baylibre.com>



--===============8218797129848523266==--

