Content-Type: multipart/mixed; boundary="===============0266466294390807897=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 69769d: tpm2_encryptdecrypt: drop -D YES|NO
 argument
Date: Tue, 28 Nov 2017 18:11:52 -0800
Message-ID: <5a1e1768a50cb_6e9a3fee68169c341450bd@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0266466294390807897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 69769d4cd1e20caba59c87de58eba77b743dc50b
      https://github.com/intel/tpm2-tools/commit/69769d4cd1e20caba59c87de58=
eba77b743dc50b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_encryptdecrypt.sh
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: drop -D YES|NO argument

tpm2_encryptdecrypt takes a -D argument to indicate to the
tool to perform a decrypt operation. The option currently
requires an argument of YES or NO. Remove this requirment
and make the default operation encrypt and the -D option
trigger a decryption.

No update to the manpage is required, as this change places it
in line with the man page.

Fixes: #614

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============0266466294390807897==--

