Content-Type: multipart/mixed; boundary="===============9073240206769559133=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 89b146: lib: rename
 file_load_tpm_context_from_file() to f...
Date: Mon, 21 Aug 2017 11:04:44 -0700
Message-ID: <599b20bc1e8dc_71323fd46bda5c301740c8@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9073240206769559133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 89b14666f6cb26e4a51ce086fda8ac78544073af
      https://github.com/01org/tpm2-tools/commit/89b14666f6cb26e4a51ce086fd=
a8ac78544073af
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-21 (Mon, 21 Aug 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M tools/tpm2_activatecredential.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_hmac.c
    M tools/tpm2_load.c
    M tools/tpm2_quote.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_sign.c
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  lib: rename file_load_tpm_context_from_file() to follow coding standard

The coding standard document says that a function that is exported should
be prefixed with the source file (or object module) name it was defined.

But file_load_tpm_context_from_file() is using file as prefix instead of
files. This is trivial but since there is a bug filled for this, fix it.

Fixes: #367

Reported-by: =E5=88=98=E7=BE=A4 <qunliu(a)zyhx-group.com>
Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============9073240206769559133==--

