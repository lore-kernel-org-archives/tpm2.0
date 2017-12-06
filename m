Content-Type: multipart/mixed; boundary="===============2714648762313218049=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 15553d: tpm2_load: save nameExt TPM2B as
 straight bytes
Date: Wed, 06 Dec 2017 15:40:50 -0800
Message-ID: <5a28800264382_57d72abfe5ac5c0475717@hookshot-fe-6b2eebc.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2714648762313218049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/intel/tpm2-tools
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


Compare: https://github.com/intel/tpm2-tools/compare/581b5af2eb40...4ab96a4=
e76e4

--===============2714648762313218049==--

