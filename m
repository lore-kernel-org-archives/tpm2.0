Content-Type: multipart/mixed; boundary="===============8914251229113113746=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 224e0e: tpm2_util: Add TSS2_RETRY_EXP macro
 to cope with T...
Date: Tue, 31 Oct 2017 09:57:14 -0700
Message-ID: <59f8ab6ad8b76_1d38f3fd8c2ed3c2880411@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8914251229113113746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 224e0eb1696d02d05e4e620115df87ee0937d83a
      https://github.com/01org/tpm2-tools/commit/224e0eb1696d02d05e4e620115=
df87ee0937d83a
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M lib/tpm2_util.h
    M tools/tpm2_activatecredential.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_dictionarylockout.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_getcap.c
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_getrandom.c
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
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_sign.c
    M tools/tpm2_startup.c
    M tools/tpm2_takeownership.c
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tpm2_util: Add TSS2_RETRY_EXP macro to cope with TPM_RC_RETRY & use in to=
ols.

This is required to support the latest version 974 simulator. It now
returns TPM_RC_RETRY in some cases. The tools code should be resiliant
to this response code. This is accomplished through a macro
(TSS2_RETRY_EXP) that's modeled after the GNU TEMP_FAILURE_RETRY
macro.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>


  Commit: c9de2ad1c996d981382ac18262043b7a907b66c0
      https://github.com/01org/tpm2-tools/commit/c9de2ad1c996d981382ac18262=
043b7a907b66c0
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis.yml: Upgrade TPM2 simulator from version 532 to 974.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>


  Commit: 1fde3c308bd69e5c21d3c2ad43dae07aa06fe901
      https://github.com/01org/tpm2-tools/commit/1fde3c308bd69e5c21d3c2ad43=
dae07aa06fe901
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: Try EncryptDecrypt2 first, fallback to EncryptDecryp=
t.

The EncryptDecrypt command has been deprecated. The specification
identifies the EncryptDecrypt2 command as preferred. We now only try
the older function if EncryptDecrypt2 isn't supported.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/7108b529eee8...1fde3c3=
08bd6

--===============8914251229113113746==--

