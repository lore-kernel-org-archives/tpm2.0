Content-Type: multipart/mixed; boundary="===============4689521051452876253=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] e5d4c5: travis.yml: fix issue with trying
 to download unav...
Date: Mon, 13 Nov 2017 10:31:09 -0800
Message-ID: <5a09e4edd874f_e6e3f8be374dc3c9727e@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4689521051452876253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
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


Compare: https://github.com/intel/tpm2-tools/compare/8378cab298dc...d60d899=
eb121

--===============4689521051452876253==--

