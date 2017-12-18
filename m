Content-Type: multipart/mixed; boundary="===============4129954125783302576=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 4b57ff: tests: move test scripts to
 seperate directory
Date: Mon, 18 Dec 2017 08:44:27 -0800
Message-ID: <5a37f06bdae20_55d02afc4e083c1421427@hookshot-fe-2cc8887.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4129954125783302576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 4b57fffb5787901ebc441ed9e06e519e07416f72
      https://github.com/intel/tpm2-tools/commit/4b57fffb5787901ebc441ed9e0=
6e519e07416f72
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-18 (Mon, 18 Dec 2017)

  Changed paths:
    A test/system/helpers.sh
    M test/system/test.sh
    R test/system/test_helpers.sh
    R test/system/test_output_formats.sh
    R test/system/test_tpm2_activecredential.sh
    R test/system/test_tpm2_certify.sh
    R test/system/test_tpm2_changeauth.sh
    R test/system/test_tpm2_create.sh
    R test/system/test_tpm2_createpolicy.sh
    R test/system/test_tpm2_createprimary.sh
    R test/system/test_tpm2_dictionarylockout.sh
    R test/system/test_tpm2_encryptdecrypt.sh
    R test/system/test_tpm2_evictcontrol.sh
    R test/system/test_tpm2_flushcontext.sh
    R test/system/test_tpm2_getcap.sh
    R test/system/test_tpm2_getmanufec.sh
    R test/system/test_tpm2_getpubak.sh
    R test/system/test_tpm2_getpubek.sh
    R test/system/test_tpm2_getrandom.sh
    R test/system/test_tpm2_hash.sh
    R test/system/test_tpm2_hmac.sh
    R test/system/test_tpm2_import.sh
    R test/system/test_tpm2_listpersistent.sh
    R test/system/test_tpm2_load.sh
    R test/system/test_tpm2_loadexternal.sh
    R test/system/test_tpm2_makecredential.sh
    R test/system/test_tpm2_nv.sh
    R test/system/test_tpm2_pcrevent.sh
    R test/system/test_tpm2_pcrextend.sh
    R test/system/test_tpm2_pcrlist.sh
    R test/system/test_tpm2_quote.sh
    R test/system/test_tpm2_rc_decode.sh
    R test/system/test_tpm2_readpublic.sh
    R test/system/test_tpm2_rsadecrypt.sh
    R test/system/test_tpm2_rsaencrypt.sh
    R test/system/test_tpm2_send.sh
    R test/system/test_tpm2_sign.sh
    R test/system/test_tpm2_startup.sh
    R test/system/test_tpm2_unseal.sh
    R test/system/test_tpm2_verifysignature.sh
    A test/system/tests/activecredential.sh
    A test/system/tests/certify.sh
    A test/system/tests/changeauth.sh
    A test/system/tests/create.sh
    A test/system/tests/createpolicy.sh
    A test/system/tests/createprimary.sh
    A test/system/tests/dictionarylockout.sh
    A test/system/tests/disabled/import.sh
    A test/system/tests/encryptdecrypt.sh
    A test/system/tests/evictcontrol.sh
    A test/system/tests/flushcontext.sh
    A test/system/tests/getcap.sh
    A test/system/tests/getmanufec.sh
    A test/system/tests/getpubak.sh
    A test/system/tests/getpubek.sh
    A test/system/tests/getrandom.sh
    A test/system/tests/hash.sh
    A test/system/tests/hmac.sh
    A test/system/tests/listpersistent.sh
    A test/system/tests/load.sh
    A test/system/tests/loadexternal.sh
    A test/system/tests/makecredential.sh
    A test/system/tests/nv.sh
    A test/system/tests/output_formats.sh
    A test/system/tests/pcrevent.sh
    A test/system/tests/pcrextend.sh
    A test/system/tests/pcrlist.sh
    A test/system/tests/quote.sh
    A test/system/tests/rc_decode.sh
    A test/system/tests/readpublic.sh
    A test/system/tests/rsadecrypt.sh
    A test/system/tests/rsaencrypt.sh
    A test/system/tests/send.sh
    A test/system/tests/sign.sh
    A test/system/tests/startup.sh
    A test/system/tests/unseal.sh
    A test/system/tests/verifysignature.sh

  Log Message:
  -----------
  tests: move test scripts to seperate directory

Organize the test scripts into a supordinate directory.

This makes finding tests easier as it doesn't really rely on
magic name prefixes.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: cc51f9fe188a7894c541d533ab53947737c06bed
      https://github.com/intel/tpm2-tools/commit/cc51f9fe188a7894c541d533ab=
53947737c06bed
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-18 (Mon, 18 Dec 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: fix a memory leak

free() the malloc'd b64 decoded buffer.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/955c1689c1ef...cc51f9f=
e188a

--===============4129954125783302576==--

