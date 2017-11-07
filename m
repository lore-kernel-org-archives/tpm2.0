Content-Type: multipart/mixed; boundary="===============4107688825625413040=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] debf70: lib: add object attribute firendly
 name support
Date: Tue, 07 Nov 2017 07:35:05 -0800
Message-ID: <5a01d2a94a50a_11b33fdd18293c38822a4@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4107688825625413040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: debf70b716356ae42b00368ef5589ff007fa64a5
      https://github.com/01org/tpm2-tools/commit/debf70b716356ae42b00368ef5=
589ff007fa64a5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M Makefile.am
    A lib/tpm2_attr_util.c
    A lib/tpm2_attr_util.h
    R lib/tpm2_nv_util.c
    M lib/tpm2_nv_util.h
    M lib/tpm2_util.h
    M test/unit/test_tpm2_alg_util.c
    A test/unit/test_tpm2_attr_util.c
    R test/unit/test_tpm2_nv_util.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvlist.c
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  lib: add object attribute firendly name support

Create an attribute friendly system for the TPMA_OBJECT
type. This way, tools like tpm2_create can use a friendly
name syntax for object attributes similair to tpm2_nvdefine
for nv attributes.

Rename the headers, utilities and tests to reflect this change
and add newe tests for the object attribute routines.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b56cb4a5472092df0a46be6019dde2c5d0a3af78
      https://github.com/01org/tpm2-tools/commit/b56cb4a5472092df0a46be6019=
dde2c5d0a3af78
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tools: tpm2_listpersistent add friendly attr output

Rather than just dumping raw hex for object attribute output,
output the human readable names.

Output this:
persistent-handle[0]:0x81000000 key-alg:rsa hash-alg:sha256 object-attr:fix=
edtpm|fixedparent|sensitivedataorigin|adminwithpolicy|restricted|decrypt

versus:
persistent-handle[0]:0x81000000 key-alg:rsa hash-alg:sha256 object-attr:0x3=
00b2

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2cba83be35cab3806b0b2bb1e7bb7abac2798d0e
      https://github.com/01org/tpm2-tools/commit/2cba83be35cab3806b0b2bb1e7=
bb7abac2798d0e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M lib/tpm2_attr_util.c
    M lib/tpm2_attr_util.h
    M test/unit/test_tpm2_attr_util.c

  Log Message:
  -----------
  lib: add a from optarg attribute friendly converter

Object attributes from the command line can be in hex
or friendly name attribute list, try to convert hex
before handing off to the friendly conversion routine.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 035d7bc81cea7b8504f14312175d106efde64db0
      https://github.com/01org/tpm2-tools/commit/035d7bc81cea7b8504f1431217=
5d106efde64db0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M Makefile.am
    A man/common/obj-attrs.md
    M man/tpm2_create.1.md
    M test/system/test_tpm2_create.sh
    M test/system/test_tpm2_unseal.sh
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: add friendly object attributes

Add a common manpage for describing object attributes.
Add a common macro for setting object attr defaults.
Drop -E from tpm2_create since -A can support it easily.
Update tests that use -E to use -A.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 634ea6a795e5f350e82fd66a1b76dcc5f99bf07a
      https://github.com/01org/tpm2-tools/commit/634ea6a795e5f350e82fd66a1b=
76dcc5f99bf07a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M man/tpm2_createprimary.1.md
    M test/system/test_tpm2_certify.sh
    M test/system/test_tpm2_create.sh
    M test/system/test_tpm2_createprimary.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_evictcontrol.sh
    M test/system/test_tpm2_hmac.sh
    M test/system/test_tpm2_import.sh
    M test/system/test_tpm2_load.sh
    M test/system/test_tpm2_loadexternal.sh
    M test/system/test_tpm2_quote.sh
    M test/system/test_tpm2_readpublic.sh
    M test/system/test_tpm2_rsadecrypt.sh
    M test/system/test_tpm2_rsaencrypt.sh
    M test/system/test_tpm2_sign.sh
    M test/system/test_tpm2_unseal.sh
    M test/system/test_tpm2_verifysignature.sh
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: add attribute support

Add object attribute support but retain old defaults.
This includes "friendly" object attribute name support.

Drop -A as "Authorization Hierachy" and change to -H to
free -A to be used for object attributes. This is
consistent with tpm2_create for the -A option.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: aae96585c24f25a36089d2368c7ecc6ec76253e8
      https://github.com/01org/tpm2-tools/commit/aae96585c24f25a36089d2368c=
7ecc6ec76253e8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/97658a53ef54...aae9658=
5c24f

--===============4107688825625413040==--

