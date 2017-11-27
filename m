Content-Type: multipart/mixed; boundary="===============4465586613595345772=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] e753ac: Switch to new TPMA layout of
 tpm2-tss
Date: Mon, 27 Nov 2017 10:33:30 -0800
Message-ID: <5a1c5a7a2b2ea_7e643fc4f2dbfc30220396@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4465586613595345772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: e753acf46d0dd5f604404b6b3ecdc4c16bbd478a
      https://github.com/intel/tpm2-tools/commit/e753acf46d0dd5f604404b6b3e=
cdc4c16bbd478a
  Author: Andreas Fuchs <andreas.fuchs(a)sit.fraunhofer.de>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M lib/tpm2_attr_util.c
    M lib/tpm2_errata.c
    M lib/tpm2_util.h
    M lib/tpm_hash.c
    M lib/tpm_hmac.c
    M test/unit/test_tpm2_attr_util.c
    M test/unit/test_tpm2_errata.c
    M tools/tpm2_activatecredential.c
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_getcap.c
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_import.c
    M tools/tpm2_listpersistent.c
    M tools/tpm2_load.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvlist.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_takeownership.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  Switch to new TPMA layout of tpm2-tss

tpm2-tss and spec changed the definition of TPMAs from bitfield
structs to a signel value and defines.
This patch adapts this change.

Signed-off-by: Andreas Fuchs <andreas.fuchs(a)sit.fraunhofer.de>


  Commit: 68d88d55261c8a9d5c21511c80a4ee4a3cf13821
      https://github.com/intel/tpm2-tools/commit/68d88d55261c8a9d5c21511c80=
a4ee4a3cf13821
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M lib/conversion.c
    M test/system/test_tpm2_createprimary.sh
    M tools/tpm2_getpubek.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_readpublic.c

  Log Message:
  -----------
  public: marshall the tss version of public

Don't dump the tss version with structure padding. Use
the libmarshal marshal and unmarshal routines.

Fixes: #635

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1e79bfc270632cd199c65746781c1a9cdd29c73b
      https://github.com/intel/tpm2-tools/commit/1e79bfc270632cd199c6574678=
1c1a9cdd29c73b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M lib/conversion.c
    M lib/conversion.h
    M lib/files.c
    M lib/files.h
    M tools/tpm2_akparse.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_makecredential.c

  Log Message:
  -----------
  tpm2_getpubak: fix serialization to disk with public

Fixes: #636

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8d6ef49c621ac3ed56817847076ac4258b723a35
      https://github.com/intel/tpm2-tools/commit/8d6ef49c621ac3ed5681784707=
6ac4258b723a35
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

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


  Commit: 1942d28b7b1d3451dc35f41aa4a876abc785c8b9
      https://github.com/intel/tpm2-tools/commit/1942d28b7b1d3451dc35f41aa4=
a876abc785c8b9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

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


  Commit: 7f30333d928ca49e8e49efa12edf0d096e400c17
      https://github.com/intel/tpm2-tools/commit/7f30333d928ca49e8e49efa12e=
df0d096e400c17
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


  Commit: 94b19cabe72bc7c4d187b6b1943eef3cf8edcdf8
      https://github.com/intel/tpm2-tools/commit/94b19cabe72bc7c4d187b6b194=
3eef3cf8edcdf8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

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


  Commit: 116763b850317b57cc163d5d206e41f7faba8572
      https://github.com/intel/tpm2-tools/commit/116763b850317b57cc163d5d20=
6e41f7faba8572
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M lib/tpm2_util.c
    M lib/tpm2_util.h
    M test/system/test_tpm2_create.sh
    M tools/tpm2_create.c
    M tools/tpm2_load.c
    M tools/tpm2_loadexternal.c
    M tools/tpm2_readpublic.c

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


  Commit: 58d95f9da8f37f7620032685de0eba6369e01c28
      https://github.com/intel/tpm2-tools/commit/58d95f9da8f37f7620032685de=
0eba6369e01c28
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


  Commit: b2f944d37a57e77d6d8d594c8edb9a01dd0baecc
      https://github.com/intel/tpm2-tools/commit/b2f944d37a57e77d6d8d594c8e=
db9a01dd0baecc
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


  Commit: 3166dbe6cbd6c1bd250491055d284523ec68c4b6
      https://github.com/intel/tpm2-tools/commit/3166dbe6cbd6c1bd250491055d=
284523ec68c4b6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M lib/tpm2_util.h

  Log Message:
  -----------
  lib/tpm2_util.h: drop duplicate fn protoype


  Commit: d1af7ff570e60714d5bc00433ec0f765d89e0577
      https://github.com/intel/tpm2-tools/commit/d1af7ff570e60714d5bc00433e=
c0f765d89e0577
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: drop superfluous cast

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5e7f2b080fc0d36ed16f7ab1ca1b26e08a9d46c6
      https://github.com/intel/tpm2-tools/commit/5e7f2b080fc0d36ed16f7ab1ca=
1b26e08a9d46c6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

  Changed paths:
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  tpm2_getrandom: drop superfluous cast

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0ca1cb8194e0c36db3628b91dc3588ff6a823196
      https://github.com/intel/tpm2-tools/commit/0ca1cb8194e0c36db3628b91dc=
3588ff6a823196
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-27 (Mon, 27 Nov 2017)

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


  Commit: ee14edec739e21868d50139277ef1a124fddf083
      https://github.com/intel/tpm2-tools/commit/ee14edec739e21868d50139277=
ef1a124fddf083
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


  Commit: 97255879a42ded37d9db35c3c673890df567698c
      https://github.com/intel/tpm2-tools/commit/97255879a42ded37d9db35c3c6=
73890df567698c
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


  Commit: 106b325a4a57e77861748b4d2dafb77614dddceb
      https://github.com/intel/tpm2-tools/commit/106b325a4a57e77861748b4d2d=
afb77614dddceb
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


Compare: https://github.com/intel/tpm2-tools/compare/72a759b5a4ff...106b325=
a4a57

--===============4465586613595345772==--

