Content-Type: multipart/mixed; boundary="===============3936187851901750593=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] eeccb6: public: marshall the tss version of
 public
Date: Tue, 28 Nov 2017 11:07:04 -0800
Message-ID: <5a1db3d8a553d_46be3fc03ae61c409849b@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3936187851901750593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
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


Compare: https://github.com/intel/tpm2-tools/compare/48ed8546941c...55f5400=
144ca

--===============3936187851901750593==--

