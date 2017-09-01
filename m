Content-Type: multipart/mixed; boundary="===============6360611747079007765=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] e09c09: option fixing: move to single getopt
Date: Fri, 01 Sep 2017 07:56:25 -0700
Message-ID: <59a97519c7e7_40e93fbb9dfffc38587c7@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6360611747079007765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: e09c09506fe9f052daf9864df85646345eba27f1
      https://github.com/01org/tpm2-tools/commit/e09c09506fe9f052daf9864df8=
5646345eba27f1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-01 (Fri, 01 Sep 2017)

  Changed paths:
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

TODO:
 - clean ups
 - port other tools
 - error handling from main exits, tools need to
   clean up, do we have a tool_exit() call or
   just tell tools to set an at exit handler
   during 1.
   - maybe rename entry point 1 to tool_start?
     I personally like this flow:
     - tool_start
     - tool_execute
     - tool_exit

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6b1f4847e0ec96b88e2c6e4c817e5fa3a7e6ea99
      https://github.com/01org/tpm2-tools/commit/6b1f4847e0ec96b88e2c6e4c81=
7e5fa3a7e6ea99
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-01 (Fri, 01 Sep 2017)

  Changed paths:
    R .travis.yml

  Log Message:
  -----------
  [REVERTME]remove travis.yml to prevent buildingwq

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/5b244047e445...6b1f484=
7e0ec

--===============6360611747079007765==--

