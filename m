Content-Type: multipart/mixed; boundary="===============0190719548438015511=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 5d3837: options: fix no-sapi init
Date: Mon, 12 Feb 2018 13:11:01 -0800
Message-ID: <5a8202e5466a5_6e0b2b00048b7c00884d2@hookshot-fe-6b2eebc.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0190719548438015511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 5d3837d22c5675f0ddab0d672a528b9f136ebfa1
      https://github.com/tpm2-software/tpm2-tools/commit/5d3837d22c5675f0dd=
ab0d672a528b9f136ebfa1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-12 (Mon, 12 Feb 2018)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  options: fix no-sapi init

The code for skipping sapi initilization was removed,
add it back for aux tools.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f165635d4e907fc6ceef7a0bdd558a3fc6cdbe71
      https://github.com/tpm2-software/tpm2-tools/commit/f165635d4e907fc6ce=
ef7a0bdd558a3fc6cdbe71
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-12 (Mon, 12 Feb 2018)

  Changed paths:
    M tools/tpm2_tool.c

  Log Message:
  -----------
  tpm2_tool: add NULL check on sapi_init

If a tcti/sapi context is requested by the tool, and sapi_init fails,
return an error rather than handing the tool a NULL sapi context.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b08dd6738d2d98706e68e31da14be7d4df195bd6
      https://github.com/tpm2-software/tpm2-tools/commit/b08dd6738d2d98706e=
68e31da14be7d4df195bd6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-12 (Mon, 12 Feb 2018)

  Changed paths:
    M tools/aux/tpm2_rc_decode.c

  Log Message:
  -----------
  tpm2_rc_decode: request no sapi-init

tpm2_rc_decode doesn't need a sapi context, thus request
that it is not initialized.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/1c74ad7f9622..=
.b08dd6738d2d

--===============0190719548438015511==--

