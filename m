Content-Type: multipart/mixed; boundary="===============5274461106741041803=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RC] tpm2-pkcs11: 1.0-RC1 is now available
Date: Mon, 23 Dec 2019 16:58:15 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E61CA1@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5274461106741041803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
1.0-RC1 of the tpm2-pkcs11 project is now available. This fixes the dist pa=
ckaging to now include tpm2_ptool
as well is issue #264 where command createloaded was used, and some TPM's d=
o not support that command.
It will now fall back to the individual create/load commands.
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.0-RC1

--===============5274461106741041803==--

