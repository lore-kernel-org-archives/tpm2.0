Content-Type: multipart/mixed; boundary="===============1030596082034980253=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 51aeaa: lib: add object attribute firendly
 name support
Date: Tue, 07 Nov 2017 07:55:22 -0800
Message-ID: <5a01d76abbb6d_6fb43fe643e3fc244872d@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1030596082034980253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/01org/tpm2-tools
  Commit: 51aeaabbc5ef9ce07026e68aeae1cba3ad450855
      https://github.com/01org/tpm2-tools/commit/51aeaabbc5ef9ce07026e68aea=
e1cba3ad450855
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


  Commit: f1c64d50fbe4774808421e70c1eff4716f8b9502
      https://github.com/01org/tpm2-tools/commit/f1c64d50fbe4774808421e70c1=
eff4716f8b9502
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


  Commit: cbda767231850505ea92fe1a114f066616f242fe
      https://github.com/01org/tpm2-tools/commit/cbda767231850505ea92fe1a11=
4f066616f242fe
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


  Commit: 4552b9edb2ab74a3ae0a48b8a12704301b0a0066
      https://github.com/01org/tpm2-tools/commit/4552b9edb2ab74a3ae0a48b8a1=
2704301b0a0066
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


  Commit: 289bb848e629f696e5e439e5480086c1c599c4b9
      https://github.com/01org/tpm2-tools/commit/289bb848e629f696e5e439e548=
0086c1c599c4b9
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


  Commit: 9d503ba5bf5e81ed831666b745ff8ab4a155327c
      https://github.com/01org/tpm2-tools/commit/9d503ba5bf5e81ed831666b745=
ff8ab4a155327c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/e467da975d81...9d503ba=
5bf5e

--===============1030596082034980253==--

