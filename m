Content-Type: multipart/mixed; boundary="===============4675170810092879788=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] c711e7: tools: add tpm2_startauthsession
Date: Sun, 14 Jan 2018 13:52:45 -0800
Message-ID: <5a5bd12ddfc55_37d52adcaa799bfc4336e@hookshot-fe-265448d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4675170810092879788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: c711e7655018e4c2bf1d6d046fed2d324a079169
      https://github.com/intel/tpm2-tools/commit/c711e7655018e4c2bf1d6d046f=
ed2d324a079169
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M Makefile.am
    M lib/files.c
    M lib/files.h
    M lib/tpm2_session.c
    M lib/tpm2_session.h
    A man/tpm2_startauthsession.1.md
    M tools/tpm2_activatecredential.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_hmac.c
    M tools/tpm2_load.c
    M tools/tpm2_loadexternal.c
    M tools/tpm2_quote.c
    M tools/tpm2_readpublic.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_sign.c
    A tools/tpm2_startauthsession.c
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tools: add tpm2_startauthsession

Add a tool for starting an auth session with the tpm.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e811be09d5a9f533780ae473bd9098ce7aa71c18
      https://github.com/intel/tpm2-tools/commit/e811be09d5a9f533780ae473bd=
9098ce7aa71c18
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M Makefile.am
    A man/tpm2_policypcr.1.md
    A tools/tpm2_policypcr.c

  Log Message:
  -----------
  tools: add tpm2_policypcr

Add a tool that can take an existing session and perform a policyPCR
event.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 21f3083578101a0ffdf989d864b57527a33c0fbb
      https://github.com/intel/tpm2-tools/commit/21f3083578101a0ffdf989d864=
b57527a33c0fbb
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_unseal.1.md
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tools: tpm2_unseal add session file support

Support tpm2_unseal using a session file.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 411ee54bb342eeb58d54c8d9d2006ad38d987fd4
      https://github.com/intel/tpm2-tools/commit/411ee54bb342eeb58d54c8d9d2=
006ad38d987fd4
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh
    M test/system/test.sh
    A test/system/tests/tcti/abrmd/extended-sessions.sh

  Log Message:
  -----------
  tests: add cross client session support

abrmd since version 1.2 has the ability to keep sessions
alive for clients across IPC connections if clients
mark them with a ContextSave call.

Test that this works with tpm2_startauthsession, tpm2_policypcr
and tpm2_unseal as expected.

Since this test is tcti specific, add an option to enable tcti
specific test scripts to test.sh. Update test.sh to use getopt
which drops the long option support.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0facb94282ba575381780b30e2875573a7083434
      https://github.com/intel/tpm2-tools/commit/0facb94282ba575381780b30e2=
875573a7083434
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh

  Log Message:
  -----------
  ci: enable tcti abrmd tests

Enable the tcti specific tests for abrmd on the CI system.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a85190f8553099f675987ea75910396325ee700d
      https://github.com/intel/tpm2-tools/commit/a85190f8553099f675987ea759=
10396325ee700d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M Makefile.am
    M test/unit/test_tpm2_session.c

  Log Message:
  -----------
  test: add session unit tests

Add tests for:
  - tpm2_session_save()
  - tpm2_session_restore()

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fd13559c779ab24344619f8485feb30979d8ef16
      https://github.com/intel/tpm2-tools/commit/fd13559c779ab24344619f8485=
feb30979d8ef16
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M lib/tpm2_util.h

  Log Message:
  -----------
  tpm2_util: set session attributes default to continue

Commands using sessions should be chainable, so by default
we want the session attribute "continue" bit set, so the tpm
doesn't unload the session after a command invocation.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 475c999c49c466957441d8d271172c0446e91c9a
      https://github.com/intel/tpm2-tools/commit/475c999c49c466957441d8d271=
172c0446e91c9a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M Makefile.am
    M lib/tpm2_session.c
    M lib/tpm2_session.h
    M test/unit/test_tpm2_session.c

  Log Message:
  -----------
  tpm2_session: add a session restart command

Add and test a session interface to Tss2_Sys_PolicyRestart

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 86db5c1e3af131c25683ae9ecdb8034b8972609c
      https://github.com/intel/tpm2-tools/commit/86db5c1e3af131c25683ae9ecd=
b8034b8972609c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: only flush internal sessions

Don't flush externally generated sessions passed via -S option.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 861fe796aa802af18ff98b445be1f81276c505fe
      https://github.com/intel/tpm2-tools/commit/861fe796aa802af18ff98b445b=
e1f81276c505fe
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M Makefile.am
    M lib/tpm2_session.c
    A man/tpm2_policyrestart.1.md
    M test/system/tests/tcti/abrmd/extended-sessions.sh
    A tools/tpm2_policyrestart.c

  Log Message:
  -----------
  tpm2_policyrestart: add tool

Add a tool for restarting a policy session and add integration
tests.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 4c545cefbe106b035fb4929b8aa1beb5970fdaa6
      https://github.com/intel/tpm2-tools/commit/4c545cefbe106b035fb4929b8a=
a1beb5970fdaa6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_flushcontext.1.md
    M test/system/tests/tcti/abrmd/extended-sessions.sh
    M tools/tpm2_flushcontext.c

  Log Message:
  -----------
  tpm2_flushcontext: add session file support

Support passing the session file to tpm2_flushcontext as a way
to pass the handle to be flushed.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 16b13feecb9addb0e340c92d10a49dbd1eb59f5b
      https://github.com/intel/tpm2-tools/commit/16b13feecb9addb0e340c92d10=
a49dbd1eb59f5b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M lib/tpm2_session.c
    M lib/tpm2_session.h
    M test/unit/test_tpm2_session.c

  Log Message:
  -----------
  tpm2_session: add getters for session type

Add getters for tpm session type and test.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: df517d39d5f944f5c1bdf367048049907b9de5f2
      https://github.com/intel/tpm2-tools/commit/df517d39d5f944f5c1bdf36704=
8049907b9de5f2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: test that a session is not a trial

Trial sessions should not be used when authenticating for object
use. Thus test that a session is a proper type and issue
a friendly error to the user, rather than just an attribute error
during the TPM call.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 965fd3ef4282c5d3e0cd42f66fc813b8005247c8
      https://github.com/intel/tpm2-tools/commit/965fd3ef4282c5d3e0cd42f66f=
c813b8005247c8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: drop explicit CONTINUE_SESSION

Now that the TPMS_AUTH_COMMAND_INIT sets the attribute
bits to continue, there is no need to set it again, so
just delete it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7b1c2b1aab7cbff31aae70280b5482a83f35852e
      https://github.com/intel/tpm2-tools/commit/7b1c2b1aab7cbff31aae70280b=
5482a83f35852e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M lib/tpm2_policy.c
    M lib/tpm2_session.c
    M lib/tpm2_session.h
    M test/unit/test_tpm2_session.c
    M tools/tpm2_activatecredential.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_flushcontext.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_startauthsession.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_session: rename handle interface

tpm2_session_get_session_handle() was way too long and repetitive.
Rename to tpm2_session_get_handle()

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9203fdb9b94271a3de4f9da68298c7dd2c628160
      https://github.com/intel/tpm2-tools/commit/9203fdb9b94271a3de4f9da682=
98c7dd2c628160
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_create.1.md
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: af5e24c8cc21e2253a8c12b869da52425d09c5ad
      https://github.com/intel/tpm2-tools/commit/af5e24c8cc21e2253a8c12b869=
da52425d09c5ad
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_createpolicy.1.md
    M test/system/tests/flushcontext.sh
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: remove -S and -e options

There is no point to having session saving in tpm2_createpolicy,
as tpm2_createpolicy is designed for environments where sessions
would be flushed on IPC disconnection with the RM.

In the case the RM supports sessions accross clients connections,
or direct TPM access is used, then the decomposed policy tools
can be used.

They were also unused in tests:
 * -e was never used
 * -S was used, but it's output was never chained to anything.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e51cfe24b20b1ce703183c4a37b7025e9c5ff312
      https://github.com/intel/tpm2-tools/commit/e51cfe24b20b1ce703183c4a37=
b7025e9c5ff312
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_createprimary.1.md
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: bc36afed985e8598491c96dbd39541318036c95d
      https://github.com/intel/tpm2-tools/commit/bc36afed985e8598491c96dbd3=
9541318036c95d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_dictionarylockout.1.md
    M tools/tpm2_dictionarylockout.c

  Log Message:
  -----------
  tpm2_dictionarylockout: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 88cc5999c2f2b3f54c8b402b9c987b8d382e33b0
      https://github.com/intel/tpm2-tools/commit/88cc5999c2f2b3f54c8b402b9c=
987b8d382e33b0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_encryptdecrypt.1.md
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 502b9b75ff682023b15b168f846beb0fe686398b
      https://github.com/intel/tpm2-tools/commit/502b9b75ff682023b15b168f84=
6beb0fe686398b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_evictcontrol.1.md
    M test/system/tests/disabled/import.sh
    M test/system/tests/evictcontrol.sh
    M test/system/tests/hmac.sh
    M test/system/tests/listpersistent.sh
    M test/system/tests/load.sh
    M test/system/tests/loadexternal.sh
    M test/system/tests/quote.sh
    M test/system/tests/readpublic.sh
    M test/system/tests/sign.sh
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: add session file support

Update tpm2_evictcontrol to take a session file and
swap out the arguments so -S is consistent.

Old -S becomes -p and -i becomes -S for a session file.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ef817106f83b8c7e2343238e955d1b7d83961ac2
      https://github.com/intel/tpm2-tools/commit/ef817106f83b8c7e2343238e95=
5d1b7d83961ac2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_getmanufec.1.md
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 75ffd1c07937b8285b757f649aa55b5a54dcdafd
      https://github.com/intel/tpm2-tools/commit/75ffd1c07937b8285b757f649a=
a55b5a54dcdafd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_getpubek.1.md
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8e366180a5d7bb7148ac74e7d99205268f419ae6
      https://github.com/intel/tpm2-tools/commit/8e366180a5d7bb7148ac74e7d9=
9205268f419ae6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_hmac.1.md
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5e4096d3fa21431c53e5212b903e5fce63aabfba
      https://github.com/intel/tpm2-tools/commit/5e4096d3fa21431c53e5212b90=
3e5fce63aabfba
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_load.1.md
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 233c3b7dc7f91800413a57982747d1f9b2c7105b
      https://github.com/intel/tpm2-tools/commit/233c3b7dc7f91800413a579827=
47d1f9b2c7105b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_nvdefine.1.md
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 82ae37b740d2e07f3be9562d0ac6d4b449fb8601
      https://github.com/intel/tpm2-tools/commit/82ae37b740d2e07f3be9562d0a=
c6d4b449fb8601
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_nvread.1.md
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b643631a8f35698a321525b55404b538253e4d1f
      https://github.com/intel/tpm2-tools/commit/b643631a8f35698a321525b554=
04b538253e4d1f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M tools/tpm2_nvreadlock.c

  Log Message:
  -----------
  tpm2_nvreadlock: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a6855ce4c62db3d61f2d31bdc916ddeb9944a61d
      https://github.com/intel/tpm2-tools/commit/a6855ce4c62db3d61f2d31bdc9=
16ddeb9944a61d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_nvrelease.1.md
    M tools/tpm2_nvrelease.c

  Log Message:
  -----------
  tpm2_nvrelease: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a411a38bdff90b15a5c7443a66adb3a2ebe840c5
      https://github.com/intel/tpm2-tools/commit/a411a38bdff90b15a5c7443a66=
adb3a2ebe840c5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_nvwrite.1.md
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8fe85ac6ad2242e6f0685e09ec88531f50b46b42
      https://github.com/intel/tpm2-tools/commit/8fe85ac6ad2242e6f0685e09ec=
88531f50b46b42
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_pcrevent.1.md
    M tools/tpm2_pcrevent.c

  Log Message:
  -----------
  tpm2_pcrevent: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 82940bfef42239920a8bd00014a92cccf6e56944
      https://github.com/intel/tpm2-tools/commit/82940bfef42239920a8bd00014=
a92cccf6e56944
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_quote.1.md
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5be5748e5430c1cf50b4f31bdbcaada9e37c5e85
      https://github.com/intel/tpm2-tools/commit/5be5748e5430c1cf50b4f31bdb=
caada9e37c5e85
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_rsadecrypt.1.md
    M tools/tpm2_rsadecrypt.c

  Log Message:
  -----------
  tpm2_rsadecrypt: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 13a1942205dd4b14d3eae65699c3eca9f1cb9ca9
      https://github.com/intel/tpm2-tools/commit/13a1942205dd4b14d3eae65699=
c3eca9f1cb9ca9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_rsaencrypt.1.md

  Log Message:
  -----------
  tpm2_rsaencrypt: remove -S option

Encryption with an RSA key requires no authentication
to use the key, thus no command authorization array header
is present. Therefore, -S makes no sense, and should be
removed from the manpage. The tool never supported -S
at any time, would issue an error if one tried.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 117941a1081c6ade68633fb3f42eed03eeae2252
      https://github.com/intel/tpm2-tools/commit/117941a1081c6ade68633fb3f4=
2eed03eeae2252
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M man/tpm2_sign.1.md
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: update -S to session file

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 15a457c7a760819d635ca11ca8447a37794e212a
      https://github.com/intel/tpm2-tools/commit/15a457c7a760819d635ca11ca8=
447a37794e212a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-14 (Sun, 14 Jan 2018)

  Changed paths:
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: update headers and copyright

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/dbaf76f07e89...15a457c=
7a760

--===============4675170810092879788==--

