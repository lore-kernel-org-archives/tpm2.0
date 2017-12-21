Content-Type: multipart/mixed; boundary="===============7219905679063625949=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 2f4b0c: man: make tpm2_clear.1.md similar
 to other .md fil...
Date: Thu, 21 Dec 2017 08:39:29 -0800
Message-ID: <5a3be3c12f6d7_79d32ad8b5a8dc083510@hookshot-fe-b0febf1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7219905679063625949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 2f4b0cb4286e7effe626156f341529e15790b1b7
      https://github.com/intel/tpm2-tools/commit/2f4b0cb4286e7effe626156f34=
1529e15790b1b7
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-21 (Thu, 21 Dec 2017)

  Changed paths:
    M man/tpm2_clear.1.md

  Log Message:
  -----------
  man: make tpm2_clear.1.md similar to other .md files

For unknown reasons, the previous commiter of this file decided
to use an out of date presentation for this markdown file and
not to follow the exemples given by the other .1.md files.

Change this to use the presentation used in the other similar files.

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: 475fe5a678eae0b73d161b057f4dd5e9af3859f4
      https://github.com/intel/tpm2-tools/commit/475fe5a678eae0b73d161b057f=
4dd5e9af3859f4
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-21 (Thu, 21 Dec 2017)

  Changed paths:
    M man/tpm2_hmac.1.md
    M man/tpm2_verifysignature.1.md

  Log Message:
  -----------
  man: fix a few formating issues

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: 881048996a51d23151c310172d4421b914b4898b
      https://github.com/intel/tpm2-tools/commit/881048996a51d23151c310172d=
4421b914b4898b
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-21 (Thu, 21 Dec 2017)

  Changed paths:
    M Makefile.am
    A man/common/footer.md
    M man/tpm2_activatecredential.1.md
    M man/tpm2_certify.1.md
    M man/tpm2_changeauth.1.md
    M man/tpm2_clear.1.md
    M man/tpm2_create.1.md
    M man/tpm2_createpolicy.1.md
    M man/tpm2_createprimary.1.md
    M man/tpm2_dictionarylockout.1.md
    M man/tpm2_encryptdecrypt.1.md
    M man/tpm2_evictcontrol.1.md
    M man/tpm2_flushcontext.1.md
    M man/tpm2_getcap.1.md
    M man/tpm2_getmanufec.1.md
    M man/tpm2_getpubak.1.md
    M man/tpm2_getpubek.1.md
    M man/tpm2_getrandom.1.md
    M man/tpm2_hash.1.md
    M man/tpm2_hmac.1.md
    M man/tpm2_import.1.md
    M man/tpm2_listpersistent.1.md
    M man/tpm2_load.1.md
    M man/tpm2_loadexternal.1.md
    M man/tpm2_makecredential.1.md
    M man/tpm2_nvdefine.1.md
    M man/tpm2_nvlist.1.md
    M man/tpm2_nvread.1.md
    M man/tpm2_nvreadlock.1.md
    M man/tpm2_nvrelease.1.md
    M man/tpm2_nvwrite.1.md
    M man/tpm2_pcrevent.1.md
    M man/tpm2_pcrextend.1.md
    M man/tpm2_pcrlist.1.md
    M man/tpm2_quote.1.md
    M man/tpm2_rc_decode.1.md
    M man/tpm2_readpublic.1.md
    M man/tpm2_rsadecrypt.1.md
    M man/tpm2_rsaencrypt.1.md
    M man/tpm2_send.1.md
    M man/tpm2_sign.1.md
    M man/tpm2_startup.1.md
    M man/tpm2_unseal.1.md
    M man/tpm2_verifysignature.1.md

  Log Message:
  -----------
  man: move the footer definition in its own included file

This change simplify further modification of the BUGS or HELP sections
of the man pages.

It also update the BUGS address to match the current, correct one
(https://github.com/intel/tpm2-tools/issues instead of
https://github.com/01org/tpm2-tools/issues).

Fixes: #745

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


Compare: https://github.com/intel/tpm2-tools/compare/da1045acace8...8810489=
96a51

--===============7219905679063625949==--

