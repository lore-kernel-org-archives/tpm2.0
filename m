Content-Type: multipart/mixed; boundary="===============3070273142017027476=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 1c2027: add missing license header to files
Date: Wed, 30 Aug 2017 08:22:10 -0700
Message-ID: <59a6d82210e33_1e34f3fcfafa7bc3c30578@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3070273142017027476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 1c202719675193d062bd93292b748b166c95d4cc
      https://github.com/01org/tpm2-tools/commit/1c202719675193d062bd93292b=
748b166c95d4cc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-30 (Wed, 30 Aug 2017)

  Changed paths:
    M .ci/coveralls-upload.sh
    M .ci/travis-build-and-run-tests.sh
    M lib/files.c
    M lib/files.h
    M lib/log.c
    M lib/log.h
    M lib/pcr.c
    M lib/pcr.h
    M lib/tpm2_alg_util.c
    M lib/tpm2_alg_util.h
    M lib/tpm2_nv_util.c
    M lib/tpm2_nv_util.h
    M lib/tpm2_password_util.c
    M lib/tpm2_password_util.h
    M lib/tpm2_policy.c
    M lib/tpm2_policy.h
    M lib/tpm2_util.c
    M lib/tpm2_util.h
    M lib/tpm_hash.c
    M lib/tpm_hash.h
    M test/system/yaml_get.py

  Log Message:
  -----------
  add missing license header to files

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 534d72d82d248a382a4130459fa1b10acc27114d
      https://github.com/01org/tpm2-tools/commit/534d72d82d248a382a4130459f=
a1b10acc27114d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-30 (Wed, 30 Aug 2017)

  Changed paths:
    M test/system/test_algs.sh
    M test/system/test_algs_tpm2_encryptdecrypt.sh
    M test/system/test_algs_tpm2_getpubak.sh
    M test/system/test_algs_tpm2_getpubek.sh
    M test/system/test_algs_tpm2_hmac.sh
    M test/system/test_algs_tpm2_quote.sh
    M test/system/test_algs_tpm2_readpublic.sh
    M test/system/test_algs_tpm2_sign.sh
    M test/system/test_algs_tpm2_unseal.sh
    M test/system/test_algs_tpm2_verifysignature.sh
    M test/system/test_all.sh
    M test/system/test_smoking.sh
    M test/system/test_tpm2_activecredential.sh
    M test/system/test_tpm2_akparse.sh
    M test/system/test_tpm2_certify.sh
    M test/system/test_tpm2_create_all.sh
    M test/system/test_tpm2_createpolicy.sh
    M test/system/test_tpm2_createprimary_all.sh
    M test/system/test_tpm2_dictionarylockout.sh
    M test/system/test_tpm2_dump_capability.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_evictcontrol.sh
    M test/system/test_tpm2_getmanufec.sh
    M test/system/test_tpm2_getpubak.sh
    M test/system/test_tpm2_getpubek.sh
    M test/system/test_tpm2_getrandom.sh
    M test/system/test_tpm2_getrandom_func.sh
    M test/system/test_tpm2_hash.sh
    M test/system/test_tpm2_hash_all.sh
    M test/system/test_tpm2_hmac.sh
    M test/system/test_tpm2_load.sh
    M test/system/test_tpm2_loadexternal.sh
    M test/system/test_tpm2_makecredential.sh
    M test/system/test_tpm2_nv.sh
    M test/system/test_tpm2_pcrevent.sh
    M test/system/test_tpm2_pcrextend.sh
    M test/system/test_tpm2_pcrlist.sh
    M test/system/test_tpm2_quote.sh
    M test/system/test_tpm2_rc_decode.sh
    M test/system/test_tpm2_readpublic.sh
    M test/system/test_tpm2_rsadecrypt.sh
    M test/system/test_tpm2_rsaencrypt.sh
    M test/system/test_tpm2_send_command.sh
    M test/system/test_tpm2_sign.sh
    M test/system/test_tpm2_startup.sh
    M test/system/test_tpm2_takeownership_all.sh
    M test/system/test_tpm2_unseal.sh
    M test/system/test_tpm2_verifysignature.sh

  Log Message:
  -----------
  test: fix shebang interpreter magic

The kernel checks the first two bytes of a file for certain
magic values. If they are a particular value, the kernel
invokes the path after the magic (ie the interpreter).

The shell scripts started with a comment block, so when
passed directly to an exec family of calls, they fail.

Fix this by putting the shebang magic at the begining,
before the license stanza.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/c9b3d9a34aec...534d72d=
82d24

--===============3070273142017027476==--

