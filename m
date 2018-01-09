Content-Type: multipart/mixed; boundary="===============8059888471705754718=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] e783ea: tools: don't use optarg, use value
Date: Tue, 09 Jan 2018 11:58:47 -0800
Message-ID: <5a551ef7ca363_6f622af5f6669c04182f3@hookshot-fe-2cc8887.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8059888471705754718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: e783ea258ca6f0a0ea70159f8957ab155c3add99
      https://github.com/intel/tpm2-tools/commit/e783ea258ca6f0a0ea70159f89=
57ab155c3add99
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2018-01-09 (Tue, 09 Jan 2018)

  Changed paths:
    M tools/tpm2_certify.c
    M tools/tpm2_changeauth.c
    M tools/tpm2_getmanufec.c
    M tools/tpm2_load.c
    M tools/tpm2_loadexternal.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_pcrevent.c
    M tools/tpm2_quote.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_sign.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tools: don't use optarg, use value

on_option() static functions have a 'value' parameter which is feeded
with getopt_long() optarg, so we never need to directly access the
global optarg variable (which is an implementation details within the
context of any tool).

So let's do a s/optarg/value/ where it makes sense.

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


  Commit: 34f49b298730568b08513bcb6ae64d21201dd3fb
      https://github.com/intel/tpm2-tools/commit/34f49b298730568b08513bcb6a=
e64d21201dd3fb
  Author: Emmanuel Deloget <logout(a)free.fr>
  Date:   2018-01-09 (Tue, 09 Jan 2018)

  Changed paths:
    M man/tpm2_sign.1.md
    M test/system/tests/sign.sh
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: add option -D to sign a pre-computed digest

Option -D can be used to sign a digest that has been pre-computed. Since
the digest is not computed on the TPM, the specified key handle must not
reference a restricted signing key (otherwise you'll get an error).

Fixes: #753

Signed-off-by: Emmanuel Deloget <logout(a)free.fr>


Compare: https://github.com/intel/tpm2-tools/compare/a5f0d027b660...34f49b2=
98730

--===============8059888471705754718==--

