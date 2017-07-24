Content-Type: multipart/mixed; boundary="===============1751771052852809648=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2.0-tools] 62cad8: tpm2_nvwrite: fix offset for
 writing
Date: Mon, 24 Jul 2017 11:00:01 -0700
Message-ID: <597635a1a8d26_34e23fac25e11c3c2754b@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1751771052852809648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2.0-tools
  Commit: 62cad8a458f7188cefd945b43bf2ac9c120dac64
      https://github.com/01org/tpm2.0-tools/commit/62cad8a458f7188cefd945b4=
3bf2ac9c120dac64
  Author: Imran Desai <imran.desai(a)intel.com>
  Date:   2017-07-24 (Mon, 24 Jul 2017)

  Changed paths:
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: fix offset for writing

The tpm2_nvwrite command calls:
Tss2_Sys_NV_Write()
Which can write at most MAX_NV_BUFFER_SIZE(1024) bytes. Thus,
when writing larger values to the nvindex, it makes multiple
calls to Tss2_Sys_NV_Write() updating the write offset along
the way.

However, each loop invocation was resetting offset, so the data
would just keep getting clobbered.

The tests currently write smaller values, and thus never hit this
issue.

Fix this by not resetting offset inside the loop.

Fix for nv writes the first 1024 bytes and repeats


  Commit: 581896e7b04d64902a379ab7ddca7df11f48f9e9
      https://github.com/01org/tpm2.0-tools/commit/581896e7b04d64902a379ab7=
ddca7df11f48f9e9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-24 (Mon, 24 Jul 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test: add large nv write test

Add a test to ensure that nv write can handle writes
> 1024 bytes in length.

Fixes: #358

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b77a5cfcbdc8133815ae3bf9ecfb4bde7642b455
      https://github.com/01org/tpm2.0-tools/commit/b77a5cfcbdc8133815ae3bf9=
ecfb4bde7642b455
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-24 (Mon, 24 Jul 2017)

  Changed paths:
    M lib/tpm2_util.h
    M tools/tpm2_certify.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_takeownership.c

  Log Message:
  -----------
  tpm2_util: make ARRAY_LEN available in tools

Many tools were defining ARRAY_LEN, just add it to the utils.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 376ae1bee5b38f608f5591d6b9f196f7ba6f7f41
      https://github.com/01org/tpm2.0-tools/commit/376ae1bee5b38f608f5591d6=
b9f196f7ba6f7f41
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-24 (Mon, 24 Jul 2017)

  Changed paths:
    M Makefile.am
    A lib/tpm2_nv_util.c
    A lib/tpm2_nv_util.h
    A test/unit/test_tpm2_nv_util.c

  Log Message:
  -----------
  tpm2_nv_util: add routine for nice names

Add a routine for nice names for nv index attributes
per the TPMA_NV.

This allows for things like tpm2_nvdefine to specify:
-t ownerread|ownerwrite|policywrite

instead of:
-t 0x2000A

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 92f34ecb05f12bc1caad56e41d56a599a4909f09
      https://github.com/01org/tpm2.0-tools/commit/92f34ecb05f12bc1caad56e4=
1d56a599a4909f09
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-24 (Mon, 24 Jul 2017)

  Changed paths:
    M man/tpm2_nvdefine.8.in
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: add nice-name nv attribute support

Rather than requiring raw masks be used for nv attributes
during creation, allow the use of nice string names. This
also allows for removing the policy read, write and delete
options, as they were just setting nv attributes and
can easily be accomplished with the nice-name mechanism.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9a8f121c6494ffe18c0c2b3eb6feff037f2130f2
      https://github.com/01org/tpm2.0-tools/commit/9a8f121c6494ffe18c0c2b3e=
b6feff037f2130f2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-24 (Mon, 24 Jul 2017)

  Changed paths:
    M lib/tpm2_nv_util.c
    M lib/tpm2_nv_util.h
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvlist.c
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: fix reads greater than 1024

tpm2_ncread would just call read once, thus if you try
to read more than the max single read value of 1024, it
fails.

Make tpm2_nvread behave like tpm2_nvwrite and call multiple
reads if teh size is greater than 1024.

The tool will warn if offset + size is greater than the data
stored at the index, and adjust size so that it can perform
the read.

Add a test to the suite to verify large reads.

Fixes: #358

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b1e9f019188816e29f142157b0e7b0022936942a
      https://github.com/01org/tpm2.0-tools/commit/b1e9f019188816e29f142157=
b0e7b0022936942a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-24 (Mon, 24 Jul 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: make 0 size implicit read of all data

When -s 0 or -s is ommited, no read occurs. Even if it goes
through the loop and hits the tpm, the TPM returns success
with no data.

Make this 0 size, implicit for read the whole thing.

Adjust a test to omit the -s option so it gets tested.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8a8f69942639d9f2671b3f6dfaf014919acee8dc
      https://github.com/01org/tpm2.0-tools/commit/8a8f69942639d9f2671b3f6d=
faf014919acee8dc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-24 (Mon, 24 Jul 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: output in hex dump format

tpm2_nvread now outputs the data in a format consumable
by xxd -r.

$ tpm2_nvread -x 0x1000000 -a 0x40000001 | xxd -r
LEyhH9nQa4ZmzE1gIbBfMNeShpFzDXmdmuQMiKixJxk9JKlmAemMo
<truncated>

Add a test for large files that the bytes wrote match the
bytes read.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2.0-tools/compare/8c9eed22f604...8a8f6=
9942639

--===============1751771052852809648==--

