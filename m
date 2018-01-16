Content-Type: multipart/mixed; boundary="===============7240625641204181168=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 2e9198: tpm2_options: Replace "show_usage"
 with "flags" in...
Date: Tue, 16 Jan 2018 07:55:20 -0800
Message-ID: <5a5e206857aa7_3d542ad5d6495c107718@hookshot-fe-b0febf1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7240625641204181168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 2e9198eb1dd0d2673def3c92e12812b47b56f76d
      https://github.com/intel/tpm2-tools/commit/2e9198eb1dd0d2673def3c92e1=
2812b47b56f76d
  Author: Haris Okanovic <haris.okanovic(a)ni.com>
  Date:   2018-01-16 (Tue, 16 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_options.h
    M tools/tpm2_activatecredential.c
    M tools/tpm2_certify.c
    M tools/tpm2_changeauth.c
    M tools/tpm2_clear.c
    M tools/tpm2_clearlock.c
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
    M tools/tpm2_policypcr.c
    M tools/tpm2_policyrestart.c
    M tools/tpm2_quote.c
    M tools/tpm2_rc_decode.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_send.c
    M tools/tpm2_sign.c
    M tools/tpm2_startauthsession.c
    M tools/tpm2_startup.c
    M tools/tpm2_tool.c
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tpm2_options: Replace "show_usage" with "flags" in tpm2_options_new()

Replace the "show_usage" bool param with "flags" bit mask so that tools
may pass multiple flags in a single field.

Add "TPM2_OPTIONS_SHOW_USAGE" flag to replace "show_usage" behavior and
refactor tools to use it.

Signed-off-by: Haris Okanovic <haris.okanovic(a)ni.com>


  Commit: 6293f714f70a6c4b067e9e638dfd4efabb23662f
      https://github.com/intel/tpm2-tools/commit/6293f714f70a6c4b067e9e638d=
fd4efabb23662f
  Author: Haris Okanovic <haris.okanovic(a)ni.com>
  Date:   2018-01-16 (Tue, 16 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_options.h
    M tools/tpm2_tool.c

  Log Message:
  -----------
  tpm2_options: Add TPM2_OPTIONS_NO_SAPI flag

A flag to disable SAPI initialization. Setting this flag also removes
the "-T" common option.

Signed-off-by: Haris Okanovic <haris.okanovic(a)ni.com>


  Commit: 7b90b216426bfdb3140ed9d4d87e38b870d69eab
      https://github.com/intel/tpm2-tools/commit/7b90b216426bfdb3140ed9d4d8=
7e38b870d69eab
  Author: Haris Okanovic <haris.okanovic(a)ni.com>
  Date:   2018-01-16 (Tue, 16 Jan 2018)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h

  Log Message:
  -----------
  tpm2_util.c: Add tpm2_util_hexdump_file()

A function to dump specified number of bytes from a FILE*
via tpm2_util_hexdump().

Add `const` to tpm2_util_hexdump()'s `data` param.

Signed-off-by: Haris Okanovic <haris.okanovic(a)ni.com>


  Commit: fafe5a49b2d2c6002c99094e44d0a7e0e3705cc0
      https://github.com/intel/tpm2-tools/commit/fafe5a49b2d2c6002c99094e44=
d0a7e0e3705cc0
  Author: Haris Okanovic <haris.okanovic(a)ni.com>
  Date:   2018-01-16 (Tue, 16 Jan 2018)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h

  Log Message:
  -----------
  tpm2_util.c: Add Add tpm2_util_print_tpm2b_file()

Reads a TPM2B object from FILE* and dumps hex.

Signed-off-by: Haris Okanovic <haris.okanovic(a)ni.com>


  Commit: 7819a719b5a46f01f37069989c04492c3503a699
      https://github.com/intel/tpm2-tools/commit/7819a719b5a46f01f37069989c=
04492c3503a699
  Author: Haris Okanovic <haris.okanovic(a)ni.com>
  Date:   2018-01-16 (Tue, 16 Jan 2018)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h

  Log Message:
  -----------
  tpm2_util.c: Add print_yaml_indent()

Signed-off-by: Haris Okanovic <haris.okanovic(a)ni.com>


  Commit: a350ab1052bb62f4ab41d55adba0e72ce210feff
      https://github.com/intel/tpm2-tools/commit/a350ab1052bb62f4ab41d55adb=
a0e72ce210feff
  Author: Haris Okanovic <haris.okanovic(a)ni.com>
  Date:   2018-01-16 (Tue, 16 Jan 2018)

  Changed paths:
    M Makefile.am
    A man/tpm2_print.1.md
    A tools/aux/tpm2_print.c

  Log Message:
  -----------
  tpm2_print: A tool to print TPM data structures

Takes an object type + file path as inputs and prints enclosed elements
to stdout in YAML.

Presently only supports TPMS_ATTEST objects for the purpose of printing
TPM generated quotes. Does NOT authenticate input file, which can be
done using other tools -- E.g. see edc3e022 for openssl example.

Signed-off-by: Haris Okanovic <haris.okanovic(a)ni.com>


Compare: https://github.com/intel/tpm2-tools/compare/8f318a115e76...a350ab1=
052bb

--===============7240625641204181168==--

