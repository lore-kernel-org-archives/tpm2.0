Content-Type: multipart/mixed; boundary="===============8510650670845782438=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 6d6656: Rename *_ERROR_LEVEL macros
 *_RC_LAYER to account ...
Date: Wed, 06 Dec 2017 08:48:30 -0800
Message-ID: <5a281f5e1f6fc_78452ac1cf447c109897e@hookshot-fe-8867ff3.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8510650670845782438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 6d6656f91e5fc9999247dfc73d4c3d8f06abc8de
      https://github.com/intel/tpm2-tools/commit/6d6656f91e5fc9999247dfc73d=
4c3d8f06abc8de
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2017-12-06 (Wed, 06 Dec 2017)

  Changed paths:
    M lib/rc-decode.c
    M lib/rc-decode.h
    M lib/tpm2_util.h
    M lib/tpm_hash.c
    M lib/tpm_session.h
    M test/unit/tpm2-rc-decode_unit.c
    M test/unit/tpm2-rc-entry_unit.c
    M tools/tpm2_hmac.c
    M tools/tpm2_pcrevent.c
    M tools/tpm2_rc_decode.c

  Log Message:
  -----------
  Rename *_ERROR_LEVEL macros *_RC_LAYER to account for spec changes.

This accounts for the change in the TSS headers from commit
e66804b9ad5864a73a3a6260c22a98a125dce3ca.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>



--===============8510650670845782438==--

