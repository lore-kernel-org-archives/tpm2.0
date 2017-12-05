Content-Type: multipart/mixed; boundary="===============7250405503796989210=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 20df3a: Update SetCmdAuths and GetRspAuths
 to new paramete...
Date: Tue, 05 Dec 2017 15:48:44 -0800
Message-ID: <5a27305cf2dc4_78fa2b0e0e337c04763f8@hookshot-fe-8867ff3.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7250405503796989210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 20df3a07b5972a69f7d436352305c45feea4f900
      https://github.com/intel/tpm2-tools/commit/20df3a07b5972a69f7d4363523=
05c45feea4f900
  Author: Andreas Fuchs <andreas.fuchs(a)sit.fraunhofer.de>
  Date:   2017-12-05 (Tue, 05 Dec 2017)

  Changed paths:
    M lib/tpm2_alg_util.c
    M lib/tpm2_util.h
    M lib/tpm_hash.c
    M lib/tpm_hmac.c
    M test/unit/test_tpm2_errata.c
    M tools/tpm2_activatecredential.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_dictionarylockout.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_hmac.c
    M tools/tpm2_import.c
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
    M tools/tpm2_quote.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_sign.c
    M tools/tpm2_takeownership.c
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  Update SetCmdAuths and GetRspAuths to new parameter type

Since the last iteration of the specification there is just a struct
with an array directly embedded.
This is a large change, but removes a lot of complexity.

Signed-off-by: Andreas Fuchs <andreas.fuchs(a)sit.fraunhofer.de>
Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============7250405503796989210==--

