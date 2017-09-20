Content-Type: multipart/mixed; boundary="===============4023662085619613439=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 3c380c: man: port tpm2_nvrelease to markdown
Date: Wed, 20 Sep 2017 08:58:25 -0700
Message-ID: <59c29021846de_5ded3f847b669c2c1601a0@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4023662085619613439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 3c380c6545681abbbb3a5cf8941224821f9e51a1
      https://github.com/01org/tpm2-tools/commit/3c380c6545681abbbb3a5cf894=
1224821f9e51a1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_nvrelease.1.in
    A man/tpm2_nvrelease.1.md

  Log Message:
  -----------
  man: port tpm2_nvrelease to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8cc33cd52993f6950332e4c00a23684001871963
      https://github.com/01org/tpm2-tools/commit/8cc33cd52993f6950332e4c00a=
23684001871963
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_nvwrite.1.in
    A man/tpm2_nvwrite.1.md

  Log Message:
  -----------
  man: port tpm2_nvwrite to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9154cc5b6a47afe1977816e0b4d9355979f0ac8c
      https://github.com/01org/tpm2-tools/commit/9154cc5b6a47afe1977816e0b4=
d9355979f0ac8c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_pcrextend.1.in
    A man/tpm2_pcrextend.1.md

  Log Message:
  -----------
  man: port tpm2_pcrextend to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e94773959a595a6eeb0797af0110f3ceafcc93d9
      https://github.com/01org/tpm2-tools/commit/e94773959a595a6eeb0797af01=
10f3ceafcc93d9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_pcrlist.1.in
    A man/tpm2_pcrlist.1.md

  Log Message:
  -----------
  man: port tpm2_pcrlist to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 13414e402aefd46066c4227571b12616b041f9fb
      https://github.com/01org/tpm2-tools/commit/13414e402aefd46066c4227571=
b12616b041f9fb
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    A man/common/pcr.md
    R man/tpm2_quote.1.in
    A man/tpm2_quote.1.md

  Log Message:
  -----------
  man: port tpm2_quote to markdown

Add a common section for PCR list specification.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a95052715eedc275e50e1cab841145f882f31cae
      https://github.com/01org/tpm2-tools/commit/a95052715eedc275e50e1cab84=
1145f882f31cae
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M man/tpm2_pcrlist.1.md

  Log Message:
  -----------
  man: update tpm2_pcrlist to use pcr common

Use the common pcr.md file that describes the PCR selection
formatting in the tpm2_pcrlist -L option.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b2d100d86c42f6a17400e18ad3eb0de5ef2a1190
      https://github.com/01org/tpm2-tools/commit/b2d100d86c42f6a17400e18ad3=
eb0de5ef2a1190
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M man/tpm2_pcrevent.1.md

  Log Message:
  -----------
  tpm2_pcrevent: update to section 1

tpm2_pcrevent wasn't updated to section 1 and was left behind
in section 8. Correct this in the manpage header.


  Commit: d9c4eddfc7f03f8c2677b56ce341cf751684dbb0
      https://github.com/01org/tpm2-tools/commit/d9c4eddfc7f03f8c2677b56ce3=
41cf751684dbb0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_rc_decode.1.in
    A man/tpm2_rc_decode.1.md

  Log Message:
  -----------
  man: port tpm2_rc_decode to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 659ed3a2ed4aa9b7519a26d009239d832a9d4ecc
      https://github.com/01org/tpm2-tools/commit/659ed3a2ed4aa9b7519a26d009=
239d832a9d4ecc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_readpublic.1.in
    A man/tpm2_readpublic.1.md

  Log Message:
  -----------
  man: port tpm2_readpublic to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b69a6613e957035f2f2a24e26ea6d521b72175d6
      https://github.com/01org/tpm2-tools/commit/b69a6613e957035f2f2a24e26e=
a6d521b72175d6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_rsadecrypt.1.in
    A man/tpm2_rsadecrypt.1.md

  Log Message:
  -----------
  man: port tpm2_rsadecrypt to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3be048e526c0b4128ddfef578c2a6e80eb9b1b65
      https://github.com/01org/tpm2-tools/commit/3be048e526c0b4128ddfef578c=
2a6e80eb9b1b65
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_rsaencrypt.1.in
    A man/tpm2_rsaencrypt.1.md

  Log Message:
  -----------
  man: port tpm2_rsadencrypt to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ef801b3319dcdd09dcbfc5d1e5420986ff50130b
      https://github.com/01org/tpm2-tools/commit/ef801b3319dcdd09dcbfc5d1e5=
420986ff50130b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_send_command.1.in
    A man/tpm2_send_command.1.md

  Log Message:
  -----------
  man: port tpm2_send_command to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 67852c1e1c7c3d28915b7c66a0b7b04107132661
      https://github.com/01org/tpm2-tools/commit/67852c1e1c7c3d28915b7c66a0=
b7b04107132661
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_sign.1.in
    A man/tpm2_sign.1.md

  Log Message:
  -----------
  man: port tpm2_sign to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 66eaf83bb75d94bba0dc3e1c731835d69ccf5e71
      https://github.com/01org/tpm2-tools/commit/66eaf83bb75d94bba0dc3e1c73=
1835d69ccf5e71
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_startup.1.in
    A man/tpm2_startup.1.md

  Log Message:
  -----------
  man: port tpm2_startup to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 59109ca20c51dd3aa0728552816b10cd2599d8e9
      https://github.com/01org/tpm2-tools/commit/59109ca20c51dd3aa072855281=
6b10cd2599d8e9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_takeownership.1.in
    A man/tpm2_takeownership.1.md

  Log Message:
  -----------
  man: port tpm2_takeownership to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3ff5477ea0ffcd4035b1f035af93e5a1ea1b7afa
      https://github.com/01org/tpm2-tools/commit/3ff5477ea0ffcd4035b1f035af=
93e5a1ea1b7afa
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_unseal.1.in
    A man/tpm2_unseal.1.md

  Log Message:
  -----------
  man: port tpm2_unseal to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b34fa141c8d3b90e2f2cd47c9b3b084903ef5980
      https://github.com/01org/tpm2-tools/commit/b34fa141c8d3b90e2f2cd47c9b=
3b084903ef5980
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_verifysignature.1.in
    A man/tpm2_verifysignature.1.md

  Log Message:
  -----------
  man: port tpm2_verifysignature to markdown

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ca7faad15f720e6db3aed4914ac6b0da63960ca0
      https://github.com/01org/tpm2-tools/commit/ca7faad15f720e6db3aed4914a=
c6b0da63960ca0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M Makefile.am
    R man/alg-common.troff
    R man/alg-notes-common.troff
    R man/common-options.troff
    R man/hash-alg-common.troff
    R man/object-alg-common.troff
    R man/password-fmt-common.troff
    R man/sign-alg-common.troff
    R man/tcti-environment.troff
    R man/tcti-options.troff

  Log Message:
  -----------
  man: kill off all troff cruft

Now that all the manpages are in Markdown, kill off the
Recipes for the older troff built manpages.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9770f1df0a846446b7c2feb72761fd3b4ff1b8ed
      https://github.com/01org/tpm2-tools/commit/9770f1df0a846446b7c2feb727=
61fd3b4ff1b8ed
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-20 (Wed, 20 Sep 2017)

  Changed paths:
    M configure.ac

  Log Message:
  -----------
  configure: update script output for md2man-roff

When md2man-roff is not found, the markdown manpages
will not be built into man(1) consumable input. A
warning is generated for this condition. Update that
warning to indicate that *ALL* manpages will not be
built.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/0dd15d2eb77c...9770f1d=
f0a84

--===============4023662085619613439==--

