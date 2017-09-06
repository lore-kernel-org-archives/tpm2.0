Content-Type: multipart/mixed; boundary="===============1048003303919124314=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] f046d8: option fixing: move to single getopt
Date: Wed, 06 Sep 2017 13:13:07 -0700
Message-ID: <59b056d326a08_6ec43fec6e829c2899726@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1048003303919124314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: f046d8d198fa59a1b52b0f9a20b665304edc0bc7
      https://github.com/01org/tpm2-tools/commit/f046d8d198fa59a1b52b0f9a20=
b665304edc0bc7
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    R .travis.yml
    M Makefile.am
    R lib/context-util.c
    R lib/context-util.h
    R lib/options.c
    R lib/options.h
    A lib/tcti/tpm2_tools_tcti_abrmd.c
    A lib/tcti/tpm2_tools_tcti_abrmd.h
    A lib/tcti/tpm2_tools_tcti_device.c
    A lib/tcti/tpm2_tools_tcti_device.h
    A lib/tcti/tpm2_tools_tcti_socket.c
    A lib/tcti/tpm2_tools_tcti_socket.h
    A lib/tpm2_options.c
    A lib/tpm2_options.h
    M lib/tpm2_util.h
    M man/tpm2_startup.8.in
    M test/system/test_tpm2_startup.sh
    R tools/main.c
    R tools/main.h
    M tools/tpm2_activatecredential.c
    M tools/tpm2_akparse.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_dictionarylockout.c
    M tools/tpm2_dump_capability.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
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
    M tools/tpm2_nvlist.c
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
    M tools/tpm2_send_command.c
    M tools/tpm2_sign.c
    M tools/tpm2_startup.c
    M tools/tpm2_takeownership.c
    A tools/tpm2_tool.c
    A tools/tpm2_tool.h
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  option fixing: move to single getopt

Parsing with multiple invocations of getopt
and strpping known options before invoking the
tool has resulted in some bugs. getopt is set
up to have all known options set up before the
call. A side affect of the old design was that
tool options could end up in a weird state.

For instance -I- for tpm2_create would not be parsed
correctly and an extra optarg would be added to
argv.

Redesign the option handling to use a single getopt
call, and develop new entry points for the tools.

New Entry Points:
1. tpm2_tool_onstart - The initial entry point to get
   the option arguments for getopt. This entry point
   also sets callbacks for:
    - option handling
    - argument handling

2. tpm2_tool_onrun - The tool executes the requested
   functionality.

3. tpm2_tool_exit - this is guarenteed to be called
   before exiting while the tcti context is still
   valid. This can be used for any cleanup done in a
   previous stage.

Major Contributors:
 - Javier Martinez Canillas <javierm(a)redhat.com>

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============1048003303919124314==--

