Content-Type: multipart/mixed; boundary="===============9151984677196335077=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 15553d: tpm2_load: save nameExt TPM2B as
 straight bytes
Date: Mon, 27 Nov 2017 12:52:46 -0800
Message-ID: <5a1c7b1ebf968_68c33fe24548fc3013488b@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9151984677196335077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
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


Compare: https://github.com/intel/tpm2-tools/compare/581b5af2eb40...99654e0=
3bbf0

--===============9151984677196335077==--

