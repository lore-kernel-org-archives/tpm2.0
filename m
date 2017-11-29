Content-Type: multipart/mixed; boundary="===============9104935705683179091=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 01269b: tpm2_encryptdecrypt: drop -D YES|NO
 argument
Date: Tue, 28 Nov 2017 18:11:55 -0800
Message-ID: <5a1e176bae863_14c3f86b953bc34114928@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9104935705683179091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 01269b0cc8b2ed86cf828f6224ff123ff34fd8a9
      https://github.com/intel/tpm2-tools/commit/01269b0cc8b2ed86cf828f6224=
ff123ff34fd8a9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_import.sh
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



--===============9104935705683179091==--

