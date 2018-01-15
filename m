Content-Type: multipart/mixed; boundary="===============0609430434056033986=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 221401: tools: avoid sapi init if tool
 doesn't need it
Date: Mon, 15 Jan 2018 13:03:08 -0800
Message-ID: <5a5d170ced15_3b502aec9ad47c0c885ba@hookshot-fe-265448d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0609430434056033986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 221401729d2ee7d56f90585c1faabde20e25c585
      https://github.com/intel/tpm2-tools/commit/221401729d2ee7d56f90585c1f=
aabde20e25c585
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-15 (Mon, 15 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_options.h
    M tools/tpm2_activatecredential.c
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
    M tools/tpm2_listpersistent.c
    M tools/tpm2_load.c
    M tools/tpm2_loadexternal.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_nvdefine.c
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
  tools: avoid sapi init if tool doesn't need it

Avoid the sapi initialization if tools request that
they don't need it via a flags argument to
tpm2_options_new();

Fixes: #737

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============0609430434056033986==--

