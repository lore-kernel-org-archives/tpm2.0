Content-Type: multipart/mixed; boundary="===============4128869587370938660=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] be3cca: tools: remove sentinel entry in
 struct options arr...
Date: Thu, 21 Dec 2017 08:41:07 -0800
Message-ID: <5a3be423ac16f_76272ae0abc27c14457fe@hookshot-fe-7191cb1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4128869587370938660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: be3ccacfde1cb89a9cdafc278dcc21f7e436d1eb
      https://github.com/intel/tpm2-tools/commit/be3ccacfde1cb89a9cdafc278d=
cc21f7e436d1eb
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-21 (Thu, 21 Dec 2017)

  Changed paths:
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_hmac.c
    M tools/tpm2_load.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tools: remove sentinel entry in struct options array

There's no need for a sentinel entry in the options array, remove them.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: c92d1664aa217af9fabcc98e14e33e0b4e489be7
      https://github.com/intel/tpm2-tools/commit/c92d1664aa217af9fabcc98e14=
e33e0b4e489be7
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-21 (Thu, 21 Dec 2017)

  Changed paths:
    M tools/tpm2_activatecredential.c
    M tools/tpm2_flushcontext.c
    M tools/tpm2_hmac.c
    M tools/tpm2_loadexternal.c
    M tools/tpm2_makecredential.c

  Log Message:
  -----------
  tools: fix error codes returned in the tpm2_tool_onrun() functions

Some tools are still returning false instead of a non-zero value as an
error when they fail. This will wrongly report an exit status that is
for success.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: c7b9fb58a0a5d172c19efb13af60947d2b70474d
      https://github.com/intel/tpm2-tools/commit/c7b9fb58a0a5d172c19efb13af=
60947d2b70474d
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-21 (Thu, 21 Dec 2017)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_options.h

  Log Message:
  -----------
  lib: move struct tpm2_options definition to header file

The structure fields will need to be accessed from the tool to parse the
options so move its definition to the header file.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 0b74c8c99de6fe1cdaf53317d1fc772fdaeef91f
      https://github.com/intel/tpm2-tools/commit/0b74c8c99de6fe1cdaf53317d1=
fc772fdaeef91f
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-21 (Thu, 21 Dec 2017)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_options.h
    M tools/tpm2_activatecredential.c
    M tools/tpm2_certify.c
    M tools/tpm2_changeauth.c
    M tools/tpm2_clear.c
    M tools/tpm2_create.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_dictionarylockout.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_flushcontext.c
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
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tools: add a boolean to display or not usage text

Not all tools require an option in order to be executed correctly, some
tools can be executed without providing any option to them.

Add a boolean so tools can choose whether they want their usage text to
be displayed or not if a user executes them without providing an option.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 5190f1c892bb1b39f969522b8a04f935342699a2
      https://github.com/intel/tpm2-tools/commit/5190f1c892bb1b39f969522b8a=
04f935342699a2
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-21 (Thu, 21 Dec 2017)

  Changed paths:
    M tools/tpm2_tool.c

  Log Message:
  -----------
  tools: add support to print usage summary when executed with no options

When the tools are executed with no options, print a usage text so users
know what are the available options. This may be useful in systems where
the man pages are not installed.

After this patch the tools will print a usage text like the following:

$ tpm2_activatecredential
usage: tpm2_activatecredential [OPTIONS]
[ -H | --handle=3DVALUE] [ -c | --context=3DVALUE] [ -k | --key-handle=3DVA=
LUE] [ -C | --key-context=3DVALUE]
[ -P | --Password=3DVALUE] [ -e | --endorse-passwd=3DVALUE] [ -f | --in-fil=
e=3DVALUE] [ -o | --out-file=3DVALUE]
[ -X | --passwdInHex]

Fixes: #730

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/intel/tpm2-tools/compare/881048996a51...5190f1c=
892bb

--===============4128869587370938660==--

