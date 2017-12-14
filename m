Content-Type: multipart/mixed; boundary="===============4982115067575797501=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] e467da: configure: fix check for bash shell
Date: Thu, 14 Dec 2017 08:52:21 -0800
Message-ID: <5a32ac4595882_7aed2abd81855c14544d0@hookshot-fe-88eb02d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4982115067575797501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: e467da975d819cacebd24060923b45d809f363ee
      https://github.com/intel/tpm2-tools/commit/e467da975d819cacebd2406092=
3b45d809f363ee
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-06 (Mon, 06 Nov 2017)

  Changed paths:
    M configure.ac

  Log Message:
  -----------
  configure: fix check for bash shell

The bash shell sets the BASH variable with the full path name used to
execute the current instance of bash. But the configure script uses it
to attempt to check if the bash binary is present on a given system.

The configure script uses the #!/bin/sh shebang, so on a system where
/bin/sh is the bash shell, the configure script will fail to find the
bash binary due BASH being set to /bin/sh:

checking for bash... /bin/sh
configure: WARNING: Required executable bash not found, system tests requir=
e a bash shell!

Use instead a variable name that isn't an internal one used by bash.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 51aeaabbc5ef9ce07026e68aeae1cba3ad450855
      https://github.com/intel/tpm2-tools/commit/51aeaabbc5ef9ce07026e68aea=
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
      https://github.com/intel/tpm2-tools/commit/f1c64d50fbe4774808421e70c1=
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
      https://github.com/intel/tpm2-tools/commit/cbda767231850505ea92fe1a11=
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
      https://github.com/intel/tpm2-tools/commit/4552b9edb2ab74a3ae0a48b8a1=
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
      https://github.com/intel/tpm2-tools/commit/289bb848e629f696e5e439e548=
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
      https://github.com/intel/tpm2-tools/commit/9d503ba5bf5e81ed831666b745=
ff8ab4a155327c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2814715870034c5fd0203f5732d2e5f2da45f5ce
      https://github.com/intel/tpm2-tools/commit/2814715870034c5fd0203f5732=
d2e5f2da45f5ce
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-07 (Tue, 07 Nov 2017)

  Changed paths:
    M README.md

  Log Message:
  -----------
  Update README.md

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 377002137137e75b60fcc1c294ce77443abfd26f
      https://github.com/intel/tpm2-tools/commit/377002137137e75b60fcc1c294=
ce77443abfd26f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-08 (Wed, 08 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_unseal.sh
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: support pipe based stdin

The file routines used for reading from stdin uses
ftell() under the hood to get the file size and then
veirfy that sizes are sane. In the case of stdin
occuring from a pipe, an Illegal Seek is trigered
from ftell().

Correct this by supressing error reporting and attempting
a fall back file read mechanism.

Fixes: #425

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 57bc09f3b8b8d5dd93d71a95235f019c2886769a
      https://github.com/intel/tpm2-tools/commit/57bc09f3b8b8d5dd93d71a9523=
5f019c2886769a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-08 (Wed, 08 Nov 2017)

  Changed paths:
    M lib/tpm2_errata.c

  Log Message:
  -----------
  lib/tpm2_errata: clean up error handling

When the tpm's revision didn't match, a bunch of
errneous error messages were generated, remove these.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6352ede2337ea57312d2479c0e688a15221f3937
      https://github.com/intel/tpm2-tools/commit/6352ede2337ea57312d2479c0e=
688a15221f3937
  Author: =E5=88=98=E7=BE=A4 <qunliu(a)zyhx-group.com>
  Date:   2017-11-08 (Wed, 08 Nov 2017)

  Changed paths:
    M INSTALL.md

  Log Message:
  -----------
  Update INSTALL.md

correct one typo/spelling error


  Commit: d33a71cb95a3ca598d22eac460c08d5c7d91c5f6
      https://github.com/intel/tpm2-tools/commit/d33a71cb95a3ca598d22eac460=
c08d5c7d91c5f6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h

  Log Message:
  -----------
  lib: add an xxd compatible hexdump routine

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ec2fb0153abe87589e4a0e78dfc9108fa33b3b1e
      https://github.com/intel/tpm2-tools/commit/ec2fb0153abe87589e4a0e78df=
c9108fa33b3b1e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread.c: use public hexdump routine

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7359baca4669efd02ef6875385996377112cce9d
      https://github.com/intel/tpm2-tools/commit/7359baca4669efd02ef6875385=
996377112cce9d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M man/tpm2_rsaencrypt.1.md
    M test/system/test_tpm2_rsaencrypt.sh
    M tools/tpm2_rsaencrypt.c

  Log Message:
  -----------
  tpm2_rsaencrypt.c: make -o optional

Make -o option optional and default to stdout. When
printing to stdout, use an xxd compatible hexdump
format.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6b855b3308a19d612213c408ac66a10d7650bd50
      https://github.com/intel/tpm2-tools/commit/6b855b3308a19d612213c408ac=
66a10d7650bd50
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M man/tpm2_rsaencrypt.1.md
    M test/system/test_tpm2_rsadecrypt.sh
    M test/system/test_tpm2_rsaencrypt.sh
    M tools/tpm2_create.c
    M tools/tpm2_rsaencrypt.c

  Log Message:
  -----------
  tpm2_rsaencrypt: support -I as an argument

Make -I an argument and default to stdin.

Update tpm2_create to use a common helper since both these
tools have similair stdin logic.

Drop unused routines from files.h

Fixes: #508

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c2ed43dfd0f1415d65f2aca8ac001ceb72a1c719
      https://github.com/intel/tpm2-tools/commit/c2ed43dfd0f1415d65f2aca8ac=
001ceb72a1c719
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md


  Commit: 8378cab298dccf48e31c9b272a6f04560762b18a
      https://github.com/intel/tpm2-tools/commit/8378cab298dccf48e31c9b272a=
6f04560762b18a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M README.md

  Log Message:
  -----------
  README.md: update travis for 01org to intel rename

Update the travis badge for the 01org to intel rename and update to the 3.X=
 branch


  Commit: e5d4c5f6d55cb6e47bab91cd938c6fa658ec1b13
      https://github.com/intel/tpm2-tools/commit/e5d4c5f6d55cb6e47bab91cd93=
8c6fa658ec1b13
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis.yml: fix issue with trying to download unavailable OpenSSL pkgs

The CI build is failing since Travis tries to download OpenSSL packages
that are not longer available. Update the configuration file to fetch
the latest version of these packages.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: ceaf4b0f817a70eb34a593241c50f1413d5bcde2
      https://github.com/intel/tpm2-tools/commit/ceaf4b0f817a70eb34a593241c=
50f1413d5bcde2
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M .ci/travis-tss-install.sh
    M .travis.yml

  Log Message:
  -----------
  travis.yml: build tpm2-tools against tpm2-{tss,abrmd} 1.x branch

The upcoming tpm2-tools 3 release will be compatible with the tpm2-tss and
tpm2-abrmd 1.x release. Update the Travis config file to build against the
correct branches.

While being there, change the repo URI to reflect the latest repo location
and project name.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: ada5df32b2fd03859d92c142766aa18a5c248c47
      https://github.com/intel/tpm2-tools/commit/ada5df32b2fd03859d92c14276=
6aa18a5c248c47
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M configure.ac

  Log Message:
  -----------
  configure: add check to build against tpm2-tss 1.x version

The upcoming tpm2-tools 3 release will be compatible with tpm2-tss 1.x and
not with tpm2-tss next (2.0), so instead of giving a lot of build errors,
check for the correct version of the SAPI library.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 60f235db85104242a6bb6fe362bf980d14691f14
      https://github.com/intel/tpm2-tools/commit/60f235db85104242a6bb6fe362=
bf980d14691f14
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M lib/tpm2_util.h
    M tools/tpm2_import.c
    M tools/tpm2_pcrevent.c

  Log Message:
  -----------
  lib: rename TPM2B_INIT() macro to TPM2B_INIT_SIZE()

A TPM2B_INIT() macro is already defined in tpm2-tss 1.x SAPI headers, so
lets rename it to TPM2B_INIT_SIZE() to prevent the following build error
when building the tpm2-tools against that tpm2-tss version:

In file included from lib/tcti/tpm2_tools_tcti_abrmd.c:39:0:
./lib/tpm2_util.h:49:0: error: "TPM2B_INIT" redefined [-Werror]
 #define TPM2B_INIT(xsize) { .t =3D { .size =3D xsize, }, }

In file included from /usr/include/sapi/tpm20.h:42:0,
           from /usr/local/include/tcti/tcti-tabrmd.h:34,
           from lib/tcti/tpm2_tools_tcti_abrmd.c:33:
/usr/include/sapi/tpmb.h:75:0: note: this is the location of the previous d=
efinition
 #define TPM2B_INIT(TYPE, name)     \

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 8e7c52bf7cec447044e2b6338486695dd2c496a8
      https://github.com/intel/tpm2-tools/commit/8e7c52bf7cec447044e2b63384=
86695dd2c496a8
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M lib/tpm2_alg_util.c

  Log Message:
  -----------
  lib: just copy the TPMU_HA union instead of copying its member

The TPMU_HA is just a union data type, so instead of attempting to copy
.na field, copy the union since both refer to the same memory location.

This also allows the tpm2-tools to be built against the tpm2-tss 1.x
since the TPMU_HA union doesn't have a .na field in that version. So it
prevents the following build error:

lib/tpm2_alg_util.c: In function =E2=80=98tpm2_extract_plain_signature=E2=
=80=99:
lib/tpm2_alg_util.c:348:33: error: =E2=80=98TPMU_HA {aka union <anonymous>}=
=E2=80=99 has no member named =E2=80=98na=E2=80=99
   memcpy(buffer, &hmac_sig->na, *size);
                           ^~
make: *** [Makefile:1871: lib/tpm2_alg_util.o] Error 1

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 1e2188449b3862ab88a0c0c08b99896fdb309113
      https://github.com/intel/tpm2-tools/commit/1e2188449b3862ab88a0c0c08b=
99896fdb309113
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M lib/tpm2_alg_util.h

  Log Message:
  -----------
  tpm2_alg_util: add definitions for algorithms not defined in tpm2-tss 1.x

Some algorithms are not defined in the tpm2-tss 1.x branch, so this causes
the following build error when building the tpm2-tools against that branch:

lib/tpm2_alg_util.c: In function =E2=80=98tpm2_alg_util_for_each_alg=E2=80=
=99:
lib/tpm2_alg_util.c:74:34: error: =E2=80=98TPM_ALG_ECMQV=E2=80=99 undeclare=
d (first use in this function); did you mean =E2=80=98TPM_ALG_ECB=E2=80=99?
   { .name =3D "ecmqv", .id =3D TPM_ALG_ECMQV },
                            ^~~~~~~~~~~~~
                            TPM_ALG_ECB
lib/tpm2_alg_util.c:74:34: note: each undeclared identifier is reported onl=
y once for each function it appears in
lib/tpm2_alg_util.c:76:33: error: =E2=80=98TPM_ALG_KDF2=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98TPMI_ALG_KDF=E2=80=99?
   { .name =3D "kdf2", .id =3D TPM_ALG_KDF2 },
                           ^~~~~~~~~~~~
                           TPMI_ALG_KDF
lib/tpm2_alg_util.c:80:37: error: =E2=80=98TPM_ALG_CAMELLIA=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98ALG_CAMELLIA=E2=80=
=99?
   { .name =3D "camellia", .id =3D TPM_ALG_CAMELLIA },
                               ^~~~~~~~~~~~~~~~
                               ALG_CAMELLIA
lib/tpm2_alg_util.c:81:37: error: =E2=80=98TPM_ALG_SHA3_256=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98TPM_ALG_SHA256=E2=
=80=99?
   { .name =3D "sha3_256", .id =3D TPM_ALG_SHA3_256 },
                               ^~~~~~~~~~~~~~~~
                               TPM_ALG_SHA256
lib/tpm2_alg_util.c:82:37: error: =E2=80=98TPM_ALG_SHA3_384=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98TPM_ALG_SHA384=E2=
=80=99?
   { .name =3D "sha3_384", .id =3D TPM_ALG_SHA3_384 },
                               ^~~~~~~~~~~~~~~~
                               TPM_ALG_SHA384
lib/tpm2_alg_util.c:83:37: error: =E2=80=98TPM_ALG_SHA3_512=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98TPM_ALG_SHA512=E2=
=80=99?
   { .name =3D "sha3_512", .id =3D TPM_ALG_SHA3_512 },
                               ^~~~~~~~~~~~~~~~
                               TPM_ALG_SHA512
make: *** [Makefile:1871: lib/tpm2_alg_util.o] Error 1

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 859bf9604c539154c3050c7cb2fda33c512bfe6e
      https://github.com/intel/tpm2-tools/commit/859bf9604c539154c3050c7cb2=
fda33c512bfe6e
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M Makefile.am
    R test/system/test_tpm2_import.sh

  Log Message:
  -----------
  tpm2_import: drop from 3.X release.

The tpm2_import tool uses uses marshalling helpers that are only available
in the tpm2-tss SAPI version 2.0 so for now just disable building the tool
until is proplery converted to not use these functions.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 45a564f82b43a3300f3e7e8b268c9bdb67b312f9
      https://github.com/intel/tpm2-tools/commit/45a564f82b43a3300f3e7e8b26=
8c9bdb67b312f9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M tools/tpm2_activatecredential.c
    M tools/tpm2_makecredential.c

  Log Message:
  -----------
  tpm2_[make|activate]credential: serialization fix

The credential format was just raw struct dumps to disk and
is prone to failing.

Serialize this correctly and agree on a version between these
tools.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 009e4df19bc81766cf0c19376267ce44f92b7407
      https://github.com/intel/tpm2-tools/commit/009e4df19bc81766cf0c193762=
67ce44f92b7407
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: fix -I - option argument

A regression was introduced that caused -I - to report that file "-"
does not exist. This is because the check for "-" was removed, and
that indicates that stdin should be used. When "-" is used, set
the path to NULL so the load routine grabs from stdin and not
path "-".

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ae7daf1140ac7a4380b2c687d11be267c7b03dae
      https://github.com/intel/tpm2-tools/commit/ae7daf1140ac7a4380b2c687d1=
1be267c7b03dae
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M man/tpm2_quote.1.md

  Log Message:
  -----------
  man/tpm2_quote: add missing -s option

The -s option was not recorded in the man page,
record it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0606abea00cdfbd8a076c33513219c78a2a73dee
      https://github.com/intel/tpm2-tools/commit/0606abea00cdfbd8a076c33513=
219c78a2a73dee
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M man/tpm2_quote.1.md

  Log Message:
  -----------
  man/tpm2_quote: fix whitespace error

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2f4e0d06f5ea572dcc0455b1d561323492a56f36
      https://github.com/intel/tpm2-tools/commit/2f4e0d06f5ea572dcc0455b1d5=
61323492a56f36
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M man/tpm2_quote.1.md
    M test/system/test_output_formats.sh
    M test/system/test_tpm2_quote.sh
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: drop -o option

Not only were the output files not used and in a near
unuseable state, teh tool now has output formats for
either tss or openssl structures. Use the -m and -s
options which output the same data as the old -o option,
in a cleaner, useable way.

Fixes: #495

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2c843c3de753bebbb1971af768d2fd7e45e036f5
      https://github.com/intel/tpm2-tools/commit/2c843c3de753bebbb1971af768=
d2fd7e45e036f5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: drop if 0 code

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1417ab2995e82203b478d56f0541956debbf25cf
      https://github.com/intel/tpm2-tools/commit/1417ab2995e82203b478d56f05=
41956debbf25cf
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M man/tpm2_nvwrite.1.md

  Log Message:
  -----------
  man/tpm2_nvwrite: correct man page

Issue #606 points out two issues in the manpage:
1. The default output file should be stdout, not stdin.
   Introduced in: e844904
2. The example still showed the -f output option which
   was replaced to a positional argument it in e844904

Fixes: #606

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9de3aecf6b0f61230e8867f15198e56d3261c8fc
      https://github.com/intel/tpm2-tools/commit/9de3aecf6b0f61230e8867f151=
98e56d3261c8fc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: only print data on verbose

Only print the written data when -V is specified and print
the data in an xxd compatable hexdump.

Fixes: #605

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c1d6908c0f57a839ac7f30994cfe40ec4dafd323
      https://github.com/intel/tpm2-tools/commit/c1d6908c0f57a839ac7f30994c=
fe40ec4dafd323
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c18c332308f409c0a2972f1cc785281b2b62bb7d
      https://github.com/intel/tpm2-tools/commit/c18c332308f409c0a2972f1cc7=
85281b2b62bb7d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_activecredential.sh
    M tools/tpm2_makecredential.c

  Log Message:
  -----------
  test: fix test regression

Bad commit:
commit 71586ebba51a2776fd6d4c93340a3279f16727e3
Author: William Roberts <william.c.roberts(a)intel.com>
Date:   Wed Nov 8 16:08:59 2017 -0800

    lib: add an xxd compatible hexdump routine

    Signed-off-by: William Roberts <william.c.roberts(a)intel.com>

The test script uses tpm2_getpubak which was modified by bad commit
and the loaded key handle parsed from stdout was incorrect. This is
because the output format changed.

Modify the test to use the name file directly.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 268d161019dbf3cbef35f3e88313774bdb69add8
      https://github.com/intel/tpm2-tools/commit/268d161019dbf3cbef35f3e883=
13774bdb69add8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  options: output error msg on args provided no args expected

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 197401ca4ecee115e928484419eef13d1a43343c
      https://github.com/intel/tpm2-tools/commit/197401ca4ecee115e928484419=
eef13d1a43343c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M man/tpm2_getpubak.1.md
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: make -n optional

Make -n an optional argument.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0e7b948a75c3e5af3bd518d4c3d4d8a357f8a5bd
      https://github.com/intel/tpm2-tools/commit/0e7b948a75c3e5af3bd518d4c3=
d4d8a357f8a5bd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  hexdump: support both plain and xxd formats

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8262be02fb9ead0f64090d9f013ddfa9452751ba
      https://github.com/intel/tpm2-tools/commit/8262be02fb9ead0f64090d9f01=
3ddfa9452751ba
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M man/tpm2_getpubak.1.md
    M test/system/test_tpm2_activecredential.sh
    M test/system/test_tpm2_makecredential.sh
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: output in yaml format

Output to stdout in a yaml format that can easily be parsed.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3521314dcd76977fbaef31c13c0c34b7f3648215
      https://github.com/intel/tpm2-tools/commit/3521314dcd76977fbaef31c13c=
0c34b7f3648215
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_pcrevent.sh
    R test/system/yaml_get.py

  Log Message:
  -----------
  test: remove yaml.get

Use a bash "HERE" document to embed the python script inside
the bash script.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7ac0d018b8fb68ef97cde92adeb86e2c23a66167
      https://github.com/intel/tpm2-tools/commit/7ac0d018b8fb68ef97cde92ade=
b86e2c23a66167
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M man/tpm2_pcrlist.1.md
    M test/system/test_tpm2_pcrevent.sh
    M tools/tpm2_pcrlist.c

  Log Message:
  -----------
  tpm2_pcrlist: drop format option and make YAML default

Rather than adding more complexity, just use YAML for output
to stdout.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d60d899eb1210b66167639ff8e7645388b9c8f6c
      https://github.com/intel/tpm2-tools/commit/d60d899eb1210b66167639ff8e=
7645388b9c8f6c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-13 (Mon, 13 Nov 2017)

  Changed paths:
    M README.md

  Log Message:
  -----------
  Update README.md


  Commit: 58a94147f0797bf3705d93e91c69be65ff9ac372
      https://github.com/intel/tpm2-tools/commit/58a94147f0797bf3705d93e91c=
69be65ff9ac372
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M man/tpm2_pcrlist.1.md

  Log Message:
  -----------
  tpm2_pcrlist: document in the man page the --output option

The -o option is not documented in the tool man page, add it.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: cb7b3c2f01eb94df9d2955eea5d678eada1c8755
      https://github.com/intel/tpm2-tools/commit/cb7b3c2f01eb94df9d2955eea5=
d678eada1c8755
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_pcrextend.sh

  Log Message:
  -----------
  test: tpm2_pcrextend: remove undefined supported_algs array

The test tries to check if a given PCR hash algorithm is supported by using
an supported_algs array but this is never defined and also the tpm2_pcrlist
already only reports the PCR banks for the supported hash algoritms.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 9f46ff0a7b5da9f39269c291ec87dbde13d36a92
      https://github.com/intel/tpm2-tools/commit/9f46ff0a7b5da9f39269c291ec=
87dbde13d36a92
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: flush session handle and end authentication session

When using PCR policy sessions for authentication, the session handle
should be flushed from the TPM2 and the authentication ended. But the
tpm2_nvwrite tool was not doing this cleanup.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 38981a6f84bcd5ba5b1fa5ee88c5fda380f40a9e
      https://github.com/intel/tpm2-tools/commit/38981a6f84bcd5ba5b1fa5ee88=
c5fda380f40a9e
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_create: fix typo for algorithm

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 6b4f25725709b5b0659c9f08c895843268d70ae0
      https://github.com/intel/tpm2-tools/commit/6b4f25725709b5b0659c9f08c8=
95843268d70ae0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_tool.c

  Log Message:
  -----------
  log: fix verbose option

log_set_level() was never being called when verbose
was enabled. So set it when verbose is enabled.

This fixes LOG_INFO not showing up.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 97271da9f48a08161baed157c68ca8a30024d385
      https://github.com/intel/tpm2-tools/commit/97271da9f48a08161baed157c6=
8ca8a30024d385
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: fix property endian conversion

property endianess was always being swapped from
the tpm provided big endian version to little endian.
Thus, this only worked on LE hosts, only convert if
the host is little endian.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d56c6b3cbaa4e5d48f01bc44ccbfb5194fee508e
      https://github.com/intel/tpm2-tools/commit/d56c6b3cbaa4e5d48f01bc44cc=
bfb5194fee508e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M man/tpm2_nvlist.1.md
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: output in yaml

Output in a human readable and machine parseable YAML output.

Example output:
0x1500015:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|ownerread
    value: 0x2000200
  size: 32

0x1500017:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|ownerread
    value: 0x2000200
  size: 32
  authorization policy: 0011223344

Fixes #513

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6a6cb54815215e89262ef827bb7613641378fbb5
      https://github.com/intel/tpm2-tools/commit/6a6cb54815215e89262ef827bb=
7613641378fbb5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: bd5cf1072c2d945b6c461d5f81e513db4fbb0ebf
      https://github.com/intel/tpm2-tools/commit/bd5cf1072c2d945b6c461d5f81=
e513db4fbb0ebf
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-17 (Fri, 17 Nov 2017)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_options.h
    M man/common/options.md
    M tools/tpm2_tool.c

  Log Message:
  -----------
  tpm2_errata: enable with -Z

Disable the application of errata fixups by default and require the user to=
 enable them.

Fixes #622

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 23d8b817c6095d81e1cb939d119d1d6464e182ed
      https://github.com/intel/tpm2-tools/commit/23d8b817c6095d81e1cb939d11=
9d1d6464e182ed
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-17 (Fri, 17 Nov 2017)

  Changed paths:
    M Makefile.am
    A test/unit/test_tpm2_errata.c

  Log Message:
  -----------
  test: add unit tests for tpm2_errata

Add tests to validate that the errata routines are functioning.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 478ef949ab548f4acf90a310c80479576fd05ccd
      https://github.com/intel/tpm2-tools/commit/478ef949ab548f4acf90a310c8=
0479576fd05ccd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-17 (Fri, 17 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_dictionarylockout.sh

  Log Message:
  -----------
  test_tpm2_dictionarylockout: fix missing quotes

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: eb0e57c69ce8f1659c8256c2e129799ab1a9b167
      https://github.com/intel/tpm2-tools/commit/eb0e57c69ce8f1659c8256c2e1=
29799ab1a9b167
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-17 (Fri, 17 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_quote.sh

  Log Message:
  -----------
  test_tpm2_quote: fix test when maxdigest is empty

Ensure that maxdigest is a valid number.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 581b5af2eb40675e0b959f203ee015163f96636a
      https://github.com/intel/tpm2-tools/commit/581b5af2eb40675e0b959f203e=
e015163f96636a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-17 (Fri, 17 Nov 2017)

  Changed paths:
    M README.md

  Log Message:
  -----------
  Update README.md


  Commit: 15553df5df426f71c6fce39b33092685dc6bd565
      https://github.com/intel/tpm2-tools/commit/15553df5df426f71c6fce39b33=
092685dc6bd565
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: save nameExt TPM2B as straight bytes

No need to save the size field of the TPM2B structure
as it can be ascertained via the file size. Just
write the straight bytes to disk.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1c08558a4ddf9d34ea9fcd0dd1c3ecb10df549e8
      https://github.com/intel/tpm2-tools/commit/1c08558a4ddf9d34ea9fcd0dd1=
c3ecb10df549e8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M lib/tpm2_util.c

  Log Message:
  -----------
  tpm2_util: add keydata to public yaml output

Add the keydata to public yaml output so tools
like tpm2_readpublic output it.

Example output from tpm2_readpublic:
name: 000bfe48934296de88c16382c3a661c2b220c4ed179bc9b9daeb7ea2bab89496db1b
qualified name: 000be90a9f639cb17b879169ba0a7f00926a32df7c84198247408e2c251=
2be0b80a0
algorithm:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|sign
  raw: 0x40072
type:
  value: keyedhash
  raw: 0x8
  keyedhash: c0eb441d6b138fce2e94e8c9292c015b7a89a934c379bd7aafea27c9011d5c=
8c

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0f9f04e35530d1e39c938078fd618a6ddbaf7327
      https://github.com/intel/tpm2-tools/commit/0f9f04e35530d1e39c938078fd=
618a6ddbaf7327
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_akparse.1.md
    R test/system/test_tpm2_akparse.sh
    R tools/tpm2_akparse.c

  Log Message:
  -----------
  tpm2_akparse: remove tool

This tool didn't excercise any core functionality of the TPM
and outputing the public information via YAML makes its
arbitrary binary format not needed.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: abd933f230f2098455256058446ab092698883db
      https://github.com/intel/tpm2-tools/commit/abd933f230f209845525605844=
6ab092698883db
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M lib/tpm2_util.h

  Log Message:
  -----------
  lib/tpm2_util.h: drop duplicate fn protoype


  Commit: 85200770980d48e24ae3012b87694a8ceb547a0f
      https://github.com/intel/tpm2-tools/commit/85200770980d48e24ae3012b87=
694a8ceb547a0f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: drop superfluous cast

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a58484e8fa629a10e3b4eb0caa350ef022fc3e6f
      https://github.com/intel/tpm2-tools/commit/a58484e8fa629a10e3b4eb0caa=
350ef022fc3e6f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  tpm2_getrandom: drop superfluous cast

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 574cbebcad81470caf63cb6a2adb72b41a756d0c
      https://github.com/intel/tpm2-tools/commit/574cbebcad81470caf63cb6a2a=
db72b41a756d0c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: properly serialize hmac to disk

Don't output the structure as raw bytes as it includes
padding and size field. Output the straight hmac buffer
bytes and let file size indicate size.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 937d234cbdbf1bd753c65651283875991a5024e5
      https://github.com/intel/tpm2-tools/commit/937d234cbdbf1bd753c6565128=
3875991a5024e5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M lib/tpm2_nv_util.h
    M tools/tpm2_nvread.c
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nv(read|write): query tpm for max buffer size

Do not use TPM2_MAX_NV_BUFFER_SIZE as it's incorrect. Query the
TPM via the capabilities interface to dynamicaly figure out
what the maximum read/write chunk is.

Fixes: #637

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 99654e03bbf0cf9357cc9ae8e658c2fc59836eb0
      https://github.com/intel/tpm2-tools/commit/99654e03bbf0cf9357cc9ae8e6=
58c2fc59836eb0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M CHANGELOG.md
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: drop hexdump output

Just output nv index data as is without a hexdump that
is compatible with xxd. Either send to a file if -o
is specified or stdout if -o is not specified and
quiet is not specified.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 13a62dc705356aa42a21875627335c3f0ec74c94
      https://github.com/intel/tpm2-tools/commit/13a62dc705356aa42a21875627=
335c3f0ec74c94
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/rc-decode.c

  Log Message:
  -----------
  lib: sort TPM2_RC entries for base response code values

The response code can come from different layers of the software stack,
and these are defined in the entries of the tpm2_tss_layer_entry array.

Sort the entries using the base value for each response code group. It
makes easier to map the entries to the response code levels defined in
the specifications and add more entries.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: d45afa832aab6d7df0a1985a255dc64128455627
      https://github.com/intel/tpm2-tools/commit/d45afa832aab6d7df0a1985a25=
5dc64128455627
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/rc-decode.c
    M tools/tpm2_rc_decode.c

  Log Message:
  -----------
  tpm2_rc_decode: add support for Resource Manager level errors

Add entries for the TSS2_RESMGR_ERROR_LEVEL and TSS2_RESMGRTPM_ERROR_LEVEL
error levels in the TPM2_RC array. This will allow the tpm2_rc_decode tool
to decode response codes sent by the Resource Manager layer.

For example, if a resource manager validates the command header instead of
leaving it to the TPM2 and returns a command response buffer with the code
for command not supported, the response code would be decoded as following:

$ tpm2_rc_decode 0xb0143
error layer
  hex: 0xb0000
  identifier: TSS2_RESMGRTPM_ERROR_LEVEL
  description: Error from the Resource Manager duplicating TPM error check
format 0 error code
  hex: 0x43
  name: TPM2_RC_COMMAND_CODE
  description: command code not supported

Fixes: #647

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 11c784076962a035f753704455e638cebc4e0e4f
      https://github.com/intel/tpm2-tools/commit/11c784076962a035f753704455=
e638cebc4e0e4f
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    A test/system/test_tpm2_listpersistent.sh

  Log Message:
  -----------
  tpm2_listpersistent: add integration test

The tool is exercised as a part of the tpm2_getmanufec integration test,
but there should also be a test specific for the tpm2_listpersistent tool.

Fixes: #461

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 48ed8546941cfb2c5f347072fcb3e1015f31e1ef
      https://github.com/intel/tpm2-tools/commit/48ed8546941cfb2c5f347072fc=
b3e1015f31e1ef
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/tpm2_util.h
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  lib: mask TPM_RC to only get the bits set by the TPM

The TPM only uses the lower 12 bits from the 32 bits of TPM_RC, the other
layers uses some of the higher unused 20 bits to indicate from which layer
of the stack the error comes from.

So mask the low-order 12 bits of the TPM_RC variable instead comparing TPM
response codes directly. There's no need to mask when the check is against
TPM_RC_SUCCESS, since in this case the upper 20 bits are going to be zero.

Fixes: #646

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: eeccb68b72e3e75e9d2186375d8c70ed7eaca72e
      https://github.com/intel/tpm2-tools/commit/eeccb68b72e3e75e9d2186375d=
8c70ed7eaca72e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M Makefile.am
    A lib/base-types.c
    M lib/conversion.c
    M lib/tpm2_alg_util.h
    M lib/tpm2_util.h
    A lib/tpm2b-types.c
    A lib/tpma-types.c
    A lib/tpml-types.c
    A lib/tpms-types.c
    A lib/tpmt-types.c
    A lib/tpmu-types.c
    A lib/tss2_endian.h
    A lib/tss2_mu.h
    M test/system/test_tpm2_createprimary.sh
    M tools/tpm2_getpubek.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_readpublic.c

  Log Message:
  -----------
  public: marshall the tss version of public

Don't dump the tss version with structure padding. Use
the libmarshal marshal and unmarshal routines.

This adds a backport of libmu.

Fixes: #635

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8355849dabffe277332ece070d59116cb1cbfb0f
      https://github.com/intel/tpm2-tools/commit/8355849dabffe277332ece070d=
59116cb1cbfb0f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/conversion.c
    M lib/conversion.h
    M lib/files.c
    M lib/files.h
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: fix serialization to disk with public

Fixes: #636

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 49e056270de2e2b84241191d13d9f6702d6171e1
      https://github.com/intel/tpm2-tools/commit/49e056270de2e2b84241191d13=
d9f6702d6171e1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/conversion.c
    M lib/files.c
    M lib/files.h
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  conversion: fix TPMT_SIGNATURE tss disk serialization

The TPMT_SIGNATURE struct was incorectly being dumped to
disk without considering endiness and padding. Correct this
by using the libmarshal routines.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ee0c4777c4236ad99b21ea813ae1d7f87d0a747a
      https://github.com/intel/tpm2-tools/commit/ee0c4777c4236ad99b21ea813a=
e1d7f87d0a747a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M CHANGELOG.md
    M man/tpm2_getmanufec.1.md
    M test/system/test_tpm2_getmanufec.sh
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: fix TPM2B_PUBLIC tss disk serialization

The TPM2B_PUBLIC struct was incorectly being dumped to
disk without considering endiness and padding. Correct this
by using the libmarshal routines.

Changes -O to be existing EKpub vs -f as just an output
for a generated EK pub. The whole -f as in in-out
paramter was confusing.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: eae05cde7768b4099466df27dc9a4ce287f0b1f1
      https://github.com/intel/tpm2-tools/commit/eae05cde7768b4099466df27dc=
9a4ce287f0b1f1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tpm2_verifysignature: fix validation ticket serialization

Properly serialize the validation ticket to disk accounting
for padding and endianess.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fc4e06ba1d19b1c9d87867d3bd7c9eb7fa3d060a
      https://github.com/intel/tpm2-tools/commit/fc4e06ba1d19b1c9d87867d3bd=
7c9eb7fa3d060a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M test/system/test_tpm2_create.sh
    M tools/tpm2_create.c
    M tools/tpm2_load.c
    M tools/tpm2_loadexternal.c

  Log Message:
  -----------
  tpm2_create: fix serialization of structures to disk

Properly serialize the public and private data structures to
disk. Update tpm2_create to output the public information
via YAML so it's easier to get to in tests, rather than
encoding the tests with the structure offsets.

Fixes: #638
Fixes: #639

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 55f5400144ca4f012cc2c8b22f7d0b21c159f5cf
      https://github.com/intel/tpm2-tools/commit/55f5400144ca4f012cc2c8b22f=
7d0b21c159f5cf
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M test/system/test_tpm2_hash.sh
    M tools/tpm2_hash.c
    M tools/tpm2_sign.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tpm2_hash: properly serialize to disk

The hash and ticket output were incorrectly being serialized.

Serialize correctly to disk and update the tests to compare hash
file output to expected output from shasum family of tools.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 76a4c6ecfeca9772675bf2e117e57c8d204d530e
      https://github.com/intel/tpm2-tools/commit/76a4c6ecfeca9772675bf2e117=
e57c8d204d530e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M tools/tpm2_rsaencrypt.c

  Log Message:
  -----------
  tpm2_rsaencrypt: fix file argument

Based on argument ordering and getopt handling, the code was getting lucky =
and
actually properly grabing the input file at argv[1]. However, the first
item in the array is really argv[0].

A result could be that the input file is NULL, which means read data
from stdin and the tool will hang.

Fixes: #664

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


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


  Commit: 0a815894d37d03de5580788e95b4c48786f046ab
      https://github.com/intel/tpm2-tools/commit/0a815894d37d03de5580788e95=
b4c48786f046ab
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-30 (Thu, 30 Nov 2017)

  Changed paths:
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: remove magic size calculation

Use the sizeof the buffer rather than the whole struct
adn subtract the magic 2 bytes for the UINT16 length
field.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1423b9d9c06c38862b346a1301283904ddbfcdd8
      https://github.com/intel/tpm2-tools/commit/1423b9d9c06c38862b346a1301=
283904ddbfcdd8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-30 (Thu, 30 Nov 2017)

  Changed paths:
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: stop using strcasecmp

Make auth hierachy match manpage and not be case insensitive.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ab82b35dd591858172842047fbd69f68838ddc2d
      https://github.com/intel/tpm2-tools/commit/ab82b35dd591858172842047fb=
d69f68838ddc2d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-30 (Thu, 30 Nov 2017)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: stop using strcasecmp

Make auth hierachy match manpage and not be case insensitive.

Fixes: #514

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 4ab96a4e76e498d826a8f67906bf30556effcf2b
      https://github.com/intel/tpm2-tools/commit/4ab96a4e76e498d826a8f67906=
bf30556effcf2b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-01 (Fri, 01 Dec 2017)

  Changed paths:
    M man/tpm2_unseal.1.md

  Log Message:
  -----------
  man/tpm2_unseal: correct manpage

The manpage had a copy+paste error when porting the
manpages to markdown. Correct this.

Fixes: #670

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a7ac8a61d653e2b79afc9a85c6133b299a6dbb3d
      https://github.com/intel/tpm2-tools/commit/a7ac8a61d653e2b79afc9a85c6=
133b299a6dbb3d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M .travis.yml
    M README.md

  Log Message:
  -----------
  coverity: fix scan issue

coverity_scan builds are failing with API access issues:
https://travis-ci.org/intel/tpm2-tools/builds/312695074

Error:
Coverity Scan analysis selected for branch coverity_scan.
Coverity Scan API access denied. Check $PROJECT_NA

The project name in Coverity was accidnetally renamed and the
project public key likely changed with the project rename/move,
so re-encrypt the coverity scan token.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 426e56ce7133a1df0b092abe6f54b97f53fd6253
      https://github.com/intel/tpm2-tools/commit/426e56ce7133a1df0b092abe6f=
54b97f53fd6253
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tpm2_listpersistent: Fix tmp assignment out of scope

Fixes Coverity Scan Bug: #1462506
https://scan7.coverity.com/reports.htm#v31687/p15508/fileInstanceId=3D42447=
779&defectInstanceId=3D9024616&mergedDefectId=3D1462506

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d1ec86db5c35f738d6b5bbfc0f1a20f1142ea015
      https://github.com/intel/tpm2-tools/commit/d1ec86db5c35f738d6b5bbfc0f=
1a20f1142ea015
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  tpm2_options: Fix NULL deref when a tool takes no options

Fixes Coverity Scan Bug: #1462505
https://scan7.coverity.com/reports.htm#v31687/p15508/fileInstanceId=3D42447=
757&defectInstanceId=3D9024615&mergedDefectId=3D1462505

Fixes: #684

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a5604dfd9ede00487ba8238efd3a1969d5380c8b
      https://github.com/intel/tpm2-tools/commit/a5604dfd9ede00487ba8238efd=
3a1969d5380c8b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_import.1.md
    R tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: remove all traces

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: db3d0b2a4e193ae367e12281b5ca50a069c92086
      https://github.com/intel/tpm2-tools/commit/db3d0b2a4e193ae367e12281b5=
ca50a069c92086
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M configure.ac

  Log Message:
  -----------
  configure: set sapi version >=3D 1.3.0 and < 2.0

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: bc7f07a45b22eb3adbc26c06e0705eec37127e41
      https://github.com/intel/tpm2-tools/commit/bc7f07a45b22eb3adbc26c06e0=
705eec37127e41
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M README.md

  Log Message:
  -----------
  Update README.md


  Commit: f60b144673f8c9df4f64bd992111f52d9fe6a007
      https://github.com/intel/tpm2-tools/commit/f60b144673f8c9df4f64bd9921=
11f52d9fe6a007
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md


  Commit: 4b9174236515736fc9e966ada6c597750fc5a586
      https://github.com/intel/tpm2-tools/commit/4b9174236515736fc9e966ada6=
c597750fc5a586
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-10 (Sun, 10 Dec 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  Makefile.am: Add LICENSE in tarball generated by the make dist target

The LICENSE file that's present in the source code is not distributed in the
tarball generated by the make dist target. Including full license text makes
it easier for people to comply with the desired license terms.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 9acbaa3a6eca685ecb970f293603fe0365f15063
      https://github.com/intel/tpm2-tools/commit/9acbaa3a6eca685ecb970f2936=
03fe0365f15063
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-11 (Mon, 11 Dec 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  Makefile.am: include rest of the markdown files to the generated tarball

These files should also be included in the tarball generated by make dist.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 771a1831d01a90c761e77157f4a6ff0deb977889
      https://github.com/intel/tpm2-tools/commit/771a1831d01a90c761e77157f4=
a6ff0deb977889
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-11 (Mon, 11 Dec 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  Update CHANGELOG.md


  Commit: 5e887dfb26256b1102f4273bf9f3dd5c3d5ecd67
      https://github.com/intel/tpm2-tools/commit/5e887dfb26256b1102f4273bf9=
f3dd5c3d5ecd67
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-12 (Tue, 12 Dec 2017)

  Changed paths:
    M .ci/travis-tss-install.sh
    M CHANGELOG.md

  Log Message:
  -----------
  Merge 3.X into master

Updates master git describe


  Commit: 9e7cd907508cfd1f1951d1ddb438b98a2db2a3e9
      https://github.com/intel/tpm2-tools/commit/9e7cd907508cfd1f1951d1ddb4=
38b98a2db2a3e9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-12 (Tue, 12 Dec 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis: Update pull location for tss library

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a725cde27a24e96fbe39c0c83ba7ba382bf8449b
      https://github.com/intel/tpm2-tools/commit/a725cde27a24e96fbe39c0c83b=
a7ba382bf8449b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-14 (Thu, 14 Dec 2017)

  Changed paths:
    M .ci/travis-tss-install.sh
    M .travis.yml
    M CHANGELOG.md

  Log Message:
  -----------
  Merge pull request #697 from williamcroberts/master

merge 3.X into master


Compare: https://github.com/intel/tpm2-tools/compare/459a42b24d87...a725cde=
27a24

--===============4982115067575797501==--

