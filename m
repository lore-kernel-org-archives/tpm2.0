Content-Type: multipart/mixed; boundary="===============7292834550603948523=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2.0-tools] 16bfcc: gitignore: don't ignore files in
 subdirs
Date: Thu, 27 Jul 2017 09:45:54 -0700
Message-ID: <597a18c2edced_295ed3f7e3410bc3c786b2@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7292834550603948523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2.0-tools
  Commit: 16bfccca1cf6f517ca7845b217585f805082f29e
      https://github.com/01org/tpm2.0-tools/commit/16bfccca1cf6f517ca7845b2=
17585f805082f29e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M test/.gitignore

  Log Message:
  -----------
  gitignore: don't ignore files in subdirs

The .gitignore was missing an exception to not include the
files when they were in subdirectories. This caused git
to not be aware of added test cases.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7eba1653313eafda681c85fc8768f83a79433345
      https://github.com/01org/tpm2.0-tools/commit/7eba1653313eafda681c85fc=
8768f83a79433345
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M Makefile.am
    A lib/tpm2_alg_util.c
    A lib/tpm2_alg_util.h
    A test/unit/test_tpm2_alg_util.c

  Log Message:
  -----------
  lib: add routines for converting algorithm names

Like nv attributes, rather than knowing the raw values for
algorithms, convert from human friendly names to algorithm
id.

For instance, rather than specifing -g 0x4, one could specify
-g sha1.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3fbd168c90c546b0d8f3f3666f42ad2f25e69ca1
      https://github.com/01org/tpm2.0-tools/commit/3fbd168c90c546b0d8f3f366=
6f42ad2f25e69ca1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M Makefile.am
    A man/alg-common.troff
    A man/hash-alg-common.troff
    M man/tpm2_hash.8.in
    M test/system/test_tpm2_hash.sh
    M test/system/test_tpm2_hash_all.sh
    M tools/tpm2_hash.c

  Log Message:
  -----------
  tpm2_hash: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man pages so:
1. halg option is updated to include nice name support.
2. halg option is moved to a common file.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3642c1b84a136c8cb601c59637776b3f5de89d75
      https://github.com/01org/tpm2.0-tools/commit/3642c1b84a136c8cb601c596=
37776b3f5de89d75
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_hmac.8.in
    M test/system/test_algs_tpm2_hmac.sh
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 35122d0b643915955bffd329ff56794d97c100fb
      https://github.com/01org/tpm2.0-tools/commit/35122d0b643915955bffd329=
ff56794d97c100fb
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_certify.8.in
    M test/system/test_tpm2_certify.sh
    M tools/tpm2_certify.c

  Log Message:
  -----------
  tpm2_certify: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2b0c4b720e124d628e9b235641bcdd8492e2c780
      https://github.com/01org/tpm2.0-tools/commit/2b0c4b720e124d628e9b2356=
41bcdd8492e2c780
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M Makefile.am
    M lib/pcr.c
    A test/unit/test_pcr.c

  Log Message:
  -----------
  pcr: add pcr friendly algorithm name support

Allow pcr list parsing to handle nice algorithm names:

For instance the strings:
sha256:16,17,18+0x0b:16,17,18
0xB:16,17,18+0x0b:16,17,18

are identical pcr selection lists.

Add a test_pcr.c into unit test to test this behavior.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 37a400b406444997dcb8cbd0b9545b17ea1e922e
      https://github.com/01org/tpm2.0-tools/commit/37a400b406444997dcb8cbd0=
b9545b17ea1e922e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M Makefile.am
    A man/object-alg-common.troff
    M man/tpm2_create.8.in
    M test/system/test_tpm2_create_all.sh
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5528b4fca64603d5b91938a0fbd6dc7b6ccb5cf9
      https://github.com/01org/tpm2.0-tools/commit/5528b4fca64603d5b91938a0=
fbd6dc7b6ccb5cf9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  Makefile.am: add missing dependency for man pages

The man page re-generation was missing the dependency:
man/common-options.troff

Add it to the dependency line.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 272f05958a6e9ce7f0a866f6bc5519def64323fa
      https://github.com/01org/tpm2.0-tools/commit/272f05958a6e9ce7f0a866f6=
bc5519def64323fa
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_createpolicy.8.in
    M test/system/test_tpm2_createpolicy.sh
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cb21b653ffe5b2505e3533119715dc86457beb4c
      https://github.com/01org/tpm2.0-tools/commit/cb21b653ffe5b2505e353311=
9715dc86457beb4c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_createprimary.8.in
    M test/system/test_tpm2_createprimary_all.sh
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 93bfd17c5091a098aa41062c4d0768d45211d56b
      https://github.com/01org/tpm2.0-tools/commit/93bfd17c5091a098aa41062c=
4d0768d45211d56b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  tpm2_dump_capability: add algorithm friendly name

Add the algorithm friendly name to the output. If it isn't
known, print unknown. Hex algorithm identifiers are still
printed no matter what.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3aa51e9e63fb0d8ebc894b88a723dd6394873d61
      https://github.com/01org/tpm2.0-tools/commit/3aa51e9e63fb0d8ebc894b88=
a723dd6394873d61
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_getmanufec.8.in
    M test/system/test_tpm2_getmanufec.sh
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ed1e66e5ef1ce8139b287c3d4e81f1c04b78b3d0
      https://github.com/01org/tpm2.0-tools/commit/ed1e66e5ef1ce8139b287c3d=
4e81f1c04b78b3d0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M Makefile.am
    A man/sign-alg-common.troff
    M man/tpm2_getpubak.8.in
    M test/system/test_algs_tpm2_getpubak.sh
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d986d42a6e3f339700adb1a8f15f811cea25ba6f
      https://github.com/01org/tpm2.0-tools/commit/d986d42a6e3f339700adb1a8=
f15f811cea25ba6f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_getpubek.8.in
    M test/system/test_algs_tpm2_getpubek.sh
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d39e1c5b9e3479e223752c1474096258638fbe5a
      https://github.com/01org/tpm2.0-tools/commit/d39e1c5b9e3479e223752c14=
74096258638fbe5a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_listpcrs.8.in
    M test/system/test_tpm2_listpcrs.sh
    M tools/tpm2_listpcrs.c

  Log Message:
  -----------
  tpm2_listpcrs: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 36724d008986b5ab3af2ed3a610152b4dc5e4500
      https://github.com/01org/tpm2.0-tools/commit/36724d008986b5ab3af2ed3a=
610152b4dc5e4500
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_quote.8.in
    M test/system/test_tpm2_quote.sh
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a033570122d5ba05dd6ece35020efa7d4abca4bc
      https://github.com/01org/tpm2.0-tools/commit/a033570122d5ba05dd6ece35=
020efa7d4abca4bc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_sign.8.in
    M test/system/test_tpm2_sign.sh
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 92fc718d1ccc66645f7d5f9a60360d24590ed236
      https://github.com/01org/tpm2.0-tools/commit/92fc718d1ccc66645f7d5f9a=
60360d24590ed236
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-27 (Thu, 27 Jul 2017)

  Changed paths:
    M man/tpm2_verifysignature.8.in
    M test/system/test_tpm2_verifysignature.sh
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tpm2_verifysignature: add support for friendly algorithm names

Allow -g sha1 instead of -g 0x4.

Update some of the tests to use the new method.
Update the man page for the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2.0-tools/compare/c2cc8a799a2f...92fc7=
18d1ccc

--===============7292834550603948523==--

