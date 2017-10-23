Content-Type: multipart/mixed; boundary="===============3408216059313618108=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 5948f7: tpm2_sign: Move and rename
 set_scheme() to tpm2_al...
Date: Mon, 23 Oct 2017 08:02:19 -0700
Message-ID: <59ee047b38ae_72e13ffce48edc3c5458e@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3408216059313618108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 5948f73faa32e0935fad430471c0913c38f32a0d
      https://github.com/01org/tpm2-tools/commit/5948f73faa32e0935fad430471=
c0913c38f32a0d
  Author: Haris Okanovic <haris.okanovic(a)ni.com>
  Date:   2017-10-23 (Mon, 23 Oct 2017)

  Changed paths:
    M lib/tpm2_alg_util.c
    M lib/tpm2_alg_util.h
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: Move and rename set_scheme() to tpm2_alg_util.c

Move set_scheme() to tpm2_alg_util.c (as get_signature_scheme()) so
that it may be used by other tools.

Signed-off-by: Haris Okanovic <haris.okanovic(a)ni.com>


  Commit: 243e9ed0fce47c31c2ee3d232b4c8cc13ba9aa5f
      https://github.com/01org/tpm2-tools/commit/243e9ed0fce47c31c2ee3d232b=
4c8cc13ba9aa5f
  Author: Haris Okanovic <haris.okanovic(a)ni.com>
  Date:   2017-10-23 (Mon, 23 Oct 2017)

  Changed paths:
    M man/tpm2_quote.1.md
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: Add -G option to sign quote

Signed-off-by: Haris Okanovic <haris.okanovic(a)ni.com>


Compare: https://github.com/01org/tpm2-tools/compare/fe47bc68653f...243e9ed=
0fce4

--===============3408216059313618108==--

