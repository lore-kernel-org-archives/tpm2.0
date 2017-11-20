Content-Type: multipart/mixed; boundary="===============1818880466362608851=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 2864d1: test_tpm2_dictionarylockout: fix
 missing quotes
Date: Mon, 20 Nov 2017 10:46:04 -0800
Message-ID: <5a1322ecbe9b0_2aa93fc3cc9edc3c1088b0@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1818880466362608851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 2864d1341aefe7dfc36573285f94f4fc7a94a35c
      https://github.com/intel/tpm2-tools/commit/2864d1341aefe7dfc36573285f=
94f4fc7a94a35c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-20 (Mon, 20 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_dictionarylockout.sh

  Log Message:
  -----------
  test_tpm2_dictionarylockout: fix missing quotes

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 54a5cd1f8a529ace0f0f4102017d2a0e16df1ea4
      https://github.com/intel/tpm2-tools/commit/54a5cd1f8a529ace0f0f410201=
7d2a0e16df1ea4
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-20 (Mon, 20 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_quote.sh

  Log Message:
  -----------
  test_tpm2_quote: fix test when maxdigest is empty

Ensure that maxdigest is a valid number.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ef9c6e82e99a97b6189b584ecca556fdf5f55a67
      https://github.com/intel/tpm2-tools/commit/ef9c6e82e99a97b6189b584ecc=
a556fdf5f55a67
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2017-11-20 (Mon, 20 Nov 2017)

  Changed paths:
    M test/system/test.sh

  Log Message:
  -----------
  test.sh: Disable tpm2_import test.

The recent changes in the TSS headers have uncovered a few issues in the
way we're reading / writing key blobs to / from disk. For the sake of
getting the build working after accounting for the header changes, this
commit disables the tpm2_import test. It should be reverted as part of
reworking the key blob serialization.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>


  Commit: c1df650ae72077712de56cb7279dee35e7f7831b
      https://github.com/intel/tpm2-tools/commit/c1df650ae72077712de56cb727=
9dee35e7f7831b
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2017-11-20 (Mon, 20 Nov 2017)

  Changed paths:
    M lib/conversion.c
    M lib/files.c
    M lib/files.h
    M lib/pcr.c
    M lib/pcr.h
    M lib/rc-decode.c
    M lib/rc-decode.h
    M lib/tcti/tpm2_tools_tcti_abrmd.c
    M lib/tcti/tpm2_tools_tcti_device.c
    M lib/tcti/tpm2_tools_tcti_socket.c
    M lib/tpm2_alg_util.c
    M lib/tpm2_alg_util.h
    M lib/tpm2_attr_util.c
    M lib/tpm2_errata.c
    M lib/tpm2_header.h
    M lib/tpm2_nv_util.h
    M lib/tpm2_policy.c
    M lib/tpm2_policy.h
    M lib/tpm2_util.c
    M lib/tpm2_util.h
    M lib/tpm_hash.c
    M lib/tpm_hash.h
    M lib/tpm_hmac.c
    M lib/tpm_hmac.h
    M lib/tpm_kdfa.c
    M lib/tpm_kdfa.h
    M lib/tpm_session.c
    M lib/tpm_session.h
    M test/system/test_tpm2_dictionarylockout.sh
    M test/system/test_tpm2_nv.sh
    M test/system/test_tpm2_quote.sh
    M test/system/test_tpm2_rc_decode.sh
    M test/unit/test_tpm2_alg_util.c
    M test/unit/test_tpm2_attr_util.c
    M test/unit/test_tpm2_header.c
    M test/unit/tpm2-rc-decode_unit.c
    M test/unit/tpm2-rc-entry_unit.c
    M tools/tpm2_activatecredential.c
    M tools/tpm2_akparse.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_dictionarylockout.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_getcap.c
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_getrandom.c
    M tools/tpm2_hash.c
    M tools/tpm2_hmac.c
    M tools/tpm2_import.c
    M tools/tpm2_listpersistent.c
    M tools/tpm2_load.c
    M tools/tpm2_loadexternal.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvlist.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvreadlock.c
    M tools/tpm2_nvrelease.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_pcrevent.c
    M tools/tpm2_pcrextend.c
    M tools/tpm2_pcrlist.c
    M tools/tpm2_quote.c
    M tools/tpm2_rc_decode.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_send.c
    M tools/tpm2_sign.c
    M tools/tpm2_startup.c
    M tools/tpm2_takeownership.c
    M tools/tpm2_tool.c
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  Account for type and API changes in the tpm2-tss libraries and headers.

These are all simple renames. There are no functional changes in this patch.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/9f389320ae2f...c1df650=
ae720

--===============1818880466362608851==--

