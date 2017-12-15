Content-Type: multipart/mixed; boundary="===============2706125648401317745=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 56d44a: tpm2_clear: add tool
Date: Fri, 15 Dec 2017 09:43:18 -0800
Message-ID: <5a3409b61483b_1a812ab67c33dc1072226@hookshot-fe-6e9b612.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2706125648401317745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 56d44ad104cc381ae7921c84affd15d3e280e287
      https://github.com/intel/tpm2-tools/commit/56d44ad104cc381ae7921c84af=
fd15d3e280e287
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M Makefile.am
    A man/tpm2_clear.1.md
    A tools/tpm2_clear.c

  Log Message:
  -----------
  tpm2_clear: add tool

Add a new tpm2_clear tool whose goal is to provide a way to clear a TPM2
- i.e. remove all (owner + endorse + lockout) authorization values from it.

This tool can be used to work on the lockout hierarchy (default
behavior) or on the platform hierarchy when option -p is provided.

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: e0e4806998fa6f0b8c893fcb52b7049beb6c97fa
      https://github.com/intel/tpm2-tools/commit/e0e4806998fa6f0b8c893fcb52=
b7049beb6c97fa
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M Makefile.am
    A man/tpm2_changeauth.1.md
    R man/tpm2_takeownership.1.md
    M test/system/test_output_formats.sh
    M test/system/test_tpm2_certify.sh
    A test/system/test_tpm2_changeauth.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_evictcontrol.sh
    M test/system/test_tpm2_flushcontext.sh
    M test/system/test_tpm2_getmanufec.sh
    M test/system/test_tpm2_getpubak.sh
    M test/system/test_tpm2_hmac.sh
    M test/system/test_tpm2_listpersistent.sh
    M test/system/test_tpm2_load.sh
    M test/system/test_tpm2_loadexternal.sh
    M test/system/test_tpm2_nv.sh
    M test/system/test_tpm2_quote.sh
    M test/system/test_tpm2_readpublic.sh
    M test/system/test_tpm2_rsadecrypt.sh
    M test/system/test_tpm2_rsaencrypt.sh
    M test/system/test_tpm2_sign.sh
    R test/system/test_tpm2_takeownership.sh
    M test/system/test_tpm2_unseal.sh
    M test/system/test_tpm2_verifysignature.sh
    A tools/tpm2_changeauth.c
    R tools/tpm2_takeownership.c

  Log Message:
  -----------
  tpm2_takeowership: rename to tpm2_changeauth

With the introduction of tpm2_clear, the purpose of this tool is to be
limited to the handling of authorizations - meaning that the -c part is
to be removed.

Change the name to reflect the change in functionnality.

Fixes: #706

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: 25fe2890ffc8030eeb7c2da38d6992979822c451
      https://github.com/intel/tpm2-tools/commit/25fe2890ffc8030eeb7c2da38d=
6992979822c451
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M man/tpm2_changeauth.1.md
    M test/system/test_output_formats.sh
    M test/system/test_tpm2_certify.sh
    M test/system/test_tpm2_changeauth.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    M test/system/test_tpm2_evictcontrol.sh
    M test/system/test_tpm2_flushcontext.sh
    M test/system/test_tpm2_getmanufec.sh
    M test/system/test_tpm2_getpubak.sh
    M test/system/test_tpm2_hmac.sh
    M test/system/test_tpm2_listpersistent.sh
    M test/system/test_tpm2_load.sh
    M test/system/test_tpm2_loadexternal.sh
    M test/system/test_tpm2_nv.sh
    M test/system/test_tpm2_quote.sh
    M test/system/test_tpm2_readpublic.sh
    M test/system/test_tpm2_rsadecrypt.sh
    M test/system/test_tpm2_rsaencrypt.sh
    M test/system/test_tpm2_sign.sh
    M test/system/test_tpm2_unseal.sh
    M test/system/test_tpm2_verifysignature.sh
    M tools/tpm2_changeauth.c

  Log Message:
  -----------
  tpm2_changeauth: remove option -c

Clearing authorizations is now handled by tpm2_clear, meaning that
option -c on tpm2_changeauth is no longer needed.

Removing this option means that all tests that were using
tpm2_changeauth -c must now use tpm2_clear instead.

As a side note, the description in the corresponding man page is changed
to reflect the goal of the tool (it was previously wrongly copied from
tpm2_hash).

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


Compare: https://github.com/intel/tpm2-tools/compare/566040000fdd...25fe289=
0ffc8

--===============2706125648401317745==--

