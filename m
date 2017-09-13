Content-Type: multipart/mixed; boundary="===============1613802370518044568=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 0833e4: man: use links in manpages for
 common options
Date: Wed, 13 Sep 2017 09:22:49 -0700
Message-ID: <59b95b599c7f0_2d6443fb3f523dc306686d@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1613802370518044568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 0833e4c6e278420982e39a8a18f9026fe37d7704
      https://github.com/01org/tpm2-tools/commit/0833e4c6e278420982e39a8a18=
f9026fe37d7704
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    M man/tpm2_pcrevent.8.md

  Log Message:
  -----------
  man: use links in manpages for common options

Rather than using the @@ decorators to mark where options
are, use relative links.

The @@ decarotors are not useable in the markdown rendering on
github, but the relative links, are. Thus, the non-built man
pages will render in a useable way on github.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 273c783dbd8652c19cb8e08f0186bbe5c0cb76d6
      https://github.com/01org/tpm2-tools/commit/273c783dbd8652c19cb8e08f01=
86bbe5c0cb76d6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    A man/common/password.md
    R man/tpm2_activatecredential.8.in
    A man/tpm2_activatecredential.8.md

  Log Message:
  -----------
  man: port activatecredential to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: eec064e9b7cd1c98a8a7245d7a90d7f220957b90
      https://github.com/01org/tpm2-tools/commit/eec064e9b7cd1c98a8a7245d7a=
90d7f220957b90
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_akparse.8.in
    A man/tpm2_akparse.8.md

  Log Message:
  -----------
  man: port akparse to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 72ad5347f8866a9114754d980dfe63b3fd324866
      https://github.com/01org/tpm2-tools/commit/72ad5347f8866a9114754d980d=
fe63b3fd324866
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_certify.8.in
    A man/tpm2_certify.8.md

  Log Message:
  -----------
  man: port certify to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 508f00e718b32aa516d92ebf933892428d763957
      https://github.com/01org/tpm2-tools/commit/508f00e718b32aa516d92ebf93=
3892428d763957
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    A man/common/alg.md
    A man/common/hash.md
    R man/tpm2_create.8.in
    A man/tpm2_create.8.md

  Log Message:
  -----------
  man: port create to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5d78dd79b9caf5afc96e7935b814ae285e6e3dd6
      https://github.com/01org/tpm2-tools/commit/5d78dd79b9caf5afc96e7935b8=
14ae285e6e3dd6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_createpolicy.8.in
    A man/tpm2_createpolicy.8.md

  Log Message:
  -----------
  man: port createpolicy to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e983b213a204e07e84250c18b0f1e817e0676171
      https://github.com/01org/tpm2-tools/commit/e983b213a204e07e84250c18b0=
f1e817e0676171
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    A man/common/object-alg.md
    R man/tpm2_createprimary.8.in
    A man/tpm2_createprimary.8.md

  Log Message:
  -----------
  man: port createprimary to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8d086ae2351c27270bff465eaca31c2f3f2da4bf
      https://github.com/01org/tpm2-tools/commit/8d086ae2351c27270bff465eac=
a31c2f3f2da4bf
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M man/common/tcti.md

  Log Message:
  -----------
  man: update TCTI options man according to the new options handling

Commit 1cb24d62d6b ("option fixing: move to single getopt") reworked how
the options are handled by the tools, but it also changed how the TCTI
specific options are passed to the TCTI initialization code.

The man pages were not updated and still list the old way to specify the
TCTI specific options, users reading the man page will face this issue:

$ tpm2_pcrlist -L sha1:7 -T device -d /dev/tpm0
tpm2_pcrlist: invalid option -- 'd'
ERROR: Unknown Argument: d

Update man pages so users know that they instead need to do following:

$ tpm2_pcrlist -L sha1:7 -T device:/dev/tpm0

Bank/Algorithm: sha(0x0004)
PCR_07:6d7206871c9c6f38ad3997baceebee95dadec04d

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b991067be0aea22f9e5aebc36317005b5739ef04
      https://github.com/01org/tpm2-tools/commit/b991067be0aea22f9e5aebc363=
17005b5739ef04
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    M man/.gitignore
    A man/tpm2_activatecredential.1.md
    R man/tpm2_activatecredential.8.md
    A man/tpm2_akparse.1.md
    R man/tpm2_akparse.8.md
    A man/tpm2_certify.1.md
    R man/tpm2_certify.8.md
    A man/tpm2_create.1.md
    R man/tpm2_create.8.md
    A man/tpm2_createpolicy.1.md
    R man/tpm2_createpolicy.8.md
    A man/tpm2_createprimary.1.md
    R man/tpm2_createprimary.8.md
    A man/tpm2_dictionarylockout.1.in
    R man/tpm2_dictionarylockout.8.in
    A man/tpm2_dump_capability.1.in
    R man/tpm2_dump_capability.8.in
    A man/tpm2_encryptdecrypt.1.in
    R man/tpm2_encryptdecrypt.8.in
    A man/tpm2_evictcontrol.1.in
    R man/tpm2_evictcontrol.8.in
    A man/tpm2_getmanufec.1.in
    R man/tpm2_getmanufec.8.in
    A man/tpm2_getpubak.1.in
    R man/tpm2_getpubak.8.in
    A man/tpm2_getpubek.1.in
    R man/tpm2_getpubek.8.in
    A man/tpm2_getrandom.1.in
    R man/tpm2_getrandom.8.in
    A man/tpm2_hash.1.in
    R man/tpm2_hash.8.in
    A man/tpm2_hmac.1.in
    R man/tpm2_hmac.8.in
    A man/tpm2_listpersistent.1.in
    R man/tpm2_listpersistent.8.in
    A man/tpm2_load.1.in
    R man/tpm2_load.8.in
    A man/tpm2_loadexternal.1.in
    R man/tpm2_loadexternal.8.in
    A man/tpm2_makecredential.1.in
    R man/tpm2_makecredential.8.in
    A man/tpm2_nvdefine.1.in
    R man/tpm2_nvdefine.8.in
    A man/tpm2_nvlist.1.in
    R man/tpm2_nvlist.8.in
    A man/tpm2_nvread.1.in
    R man/tpm2_nvread.8.in
    A man/tpm2_nvreadlock.1.in
    R man/tpm2_nvreadlock.8.in
    A man/tpm2_nvrelease.1.in
    R man/tpm2_nvrelease.8.in
    A man/tpm2_nvwrite.1.in
    R man/tpm2_nvwrite.8.in
    A man/tpm2_pcrevent.1.md
    R man/tpm2_pcrevent.8.md
    A man/tpm2_pcrextend.1.in
    R man/tpm2_pcrextend.8.in
    A man/tpm2_pcrlist.1.in
    R man/tpm2_pcrlist.8.in
    A man/tpm2_quote.1.in
    R man/tpm2_quote.8.in
    A man/tpm2_rc_decode.1.in
    R man/tpm2_rc_decode.8.in
    A man/tpm2_readpublic.1.in
    R man/tpm2_readpublic.8.in
    A man/tpm2_rsadecrypt.1.in
    R man/tpm2_rsadecrypt.8.in
    A man/tpm2_rsaencrypt.1.in
    R man/tpm2_rsaencrypt.8.in
    A man/tpm2_send_command.1.in
    R man/tpm2_send_command.8.in
    A man/tpm2_sign.1.in
    R man/tpm2_sign.8.in
    A man/tpm2_startup.1.in
    R man/tpm2_startup.8.in
    A man/tpm2_takeownership.1.in
    R man/tpm2_takeownership.8.in
    A man/tpm2_unseal.1.in
    R man/tpm2_unseal.8.in
    A man/tpm2_verifysignature.1.in
    R man/tpm2_verifysignature.8.in

  Log Message:
  -----------
  man: switch to man 1

Switch the man pages to section 1 since they are no longer
in sbin.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2e52861b1f16088dc71da38de2d33e747006065d
      https://github.com/01org/tpm2-tools/commit/2e52861b1f16088dc71da38de2=
d33e747006065d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_dictionarylockout.1.in
    A man/tpm2_dictionarylockout.1.md

  Log Message:
  -----------
  man: port dictionarylockout to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b716af33b2f402aecda9f76a2a6690dacd3b852f
      https://github.com/01org/tpm2-tools/commit/b716af33b2f402aecda9f76a2a=
6690dacd3b852f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_dump_capability.1.in
    A man/tpm2_dump_capability.1.md

  Log Message:
  -----------
  man: port dump_capability to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: dc1268c203fdad5e9f67de2f6d343374ec156d08
      https://github.com/01org/tpm2-tools/commit/dc1268c203fdad5e9f67de2f6d=
343374ec156d08
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_encryptdecrypt.1.in
    A man/tpm2_encryptdecrypt.1.md

  Log Message:
  -----------
  man: port encryptdecrypt to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 16563b541fc9d5a7d8182effa0d87ccbb0a30a5f
      https://github.com/01org/tpm2-tools/commit/16563b541fc9d5a7d8182effa0=
d87ccbb0a30a5f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_evictcontrol.1.in
    A man/tpm2_evictcontrol.1.md

  Log Message:
  -----------
  man: port evictcontrol to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5794e58952cf52b6dc94d2a7b3e60ce3fdb2f2b6
      https://github.com/01org/tpm2-tools/commit/5794e58952cf52b6dc94d2a7b3=
e60ce3fdb2f2b6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_getmanufec.1.in
    A man/tpm2_getmanufec.1.md

  Log Message:
  -----------
  man: port getmanufec to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 542f0ac4e7499d42daf74258783ffa7e045f698e
      https://github.com/01org/tpm2-tools/commit/542f0ac4e7499d42daf7425878=
3ffa7e045f698e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-13 (Wed, 13 Sep 2017)

  Changed paths:
    M Makefile.am
    A man/common/sign-alg.md
    R man/tpm2_getpubak.1.in
    A man/tpm2_getpubak.1.md

  Log Message:
  -----------
  man: port tpm2_getpubak to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/691a7e519dbe...542f0ac=
4e749

--===============1613802370518044568==--

