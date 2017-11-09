Content-Type: multipart/mixed; boundary="===============8899172151013147118=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 889946: tpm2_create: fix -I - option
 argument
Date: Thu, 09 Nov 2017 10:19:32 -0800
Message-ID: <5a049c34ddbc_11803f8f77a83c347499e@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8899172151013147118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 8899465bec27070474d365733fb051b994033e59
      https://github.com/intel/tpm2-tools/commit/8899465bec27070474d365733f=
b051b994033e59
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

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


  Commit: 4516991b46b08bc25c9d3f792ed5b04e6c630aca
      https://github.com/intel/tpm2-tools/commit/4516991b46b08bc25c9d3f792e=
d5b04e6c630aca
  Author: Tadeusz Struk <tadeusz.struk(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

  Changed paths:
    M lib/conversion.c
    M lib/files.c
    M lib/tpm2_alg_util.c
    M lib/tpm2_password_util.c
    M lib/tpm2_policy.c
    M lib/tpm2_util.c
    M lib/tpm2_util.h
    M lib/tpm_hash.c
    M lib/tpm_hmac.c
    M lib/tpm_kdfa.c
    M lib/tpm_session.c
    M test/unit/test_tpm2_password_util.c
    M tools/tpm2_activatecredential.c
    M tools/tpm2_akparse.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_getrandom.c
    M tools/tpm2_hash.c
    M tools/tpm2_hmac.c
    M tools/tpm2_import.c
    M tools/tpm2_listpersistent.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvlist.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_pcrevent.c
    M tools/tpm2_pcrlist.c
    M tools/tpm2_quote.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tools: follow up update after tss tpm2b change

TSS changed the TPM2B structure definitions.
This update reflects this change.

Signed-off-by: Tadeusz Struk <tadeusz.struk(a)intel.com>


  Commit: 843b1379470d265aff5fd5a0b62a3ffdd8a3d887
      https://github.com/intel/tpm2-tools/commit/843b1379470d265aff5fd5a0b6=
2a3ffdd8a3d887
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-09 (Thu, 09 Nov 2017)

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


Compare: https://github.com/intel/tpm2-tools/compare/e13a2b0d71ad...843b137=
9470d

--===============8899172151013147118==--

