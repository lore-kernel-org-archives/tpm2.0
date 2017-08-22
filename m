Content-Type: multipart/mixed; boundary="===============0527232393621321639=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] fe2f8f: tpm2_listpersistent: remove
 leftover debugLevel va...
Date: Tue, 22 Aug 2017 15:00:55 -0700
Message-ID: <599ca99754908_1e89d3fe12cf7dc38505fd@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0527232393621321639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: fe2f8f5d6691420abff3efcffda1c4a2fdabaab1
      https://github.com/01org/tpm2-tools/commit/fe2f8f5d6691420abff3efcffd=
a1c4a2fdabaab1
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tpm2_listpersistent: remove leftover debugLevel variable

The code using this variable was removed by commit 931a8d597dd9
("tpm2_listpersistent: Port to use common infrastructure.") so
the variable isn't used anymore.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: b048fceb768893d4ce04d3c17995ccb2e3e03e74
      https://github.com/01org/tpm2-tools/commit/b048fceb768893d4ce04d3c179=
95ccb2e3e03e74
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    M lib/options.c
    M lib/tpm2_policy.c
    M tools/main.c
    M tools/tpm2_activatecredential.c
    M tools/tpm2_akparse.c
    M tools/tpm2_certify.c
    M tools/tpm2_create.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_dictionarylockout.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_getmanufec.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_getpubek.c
    M tools/tpm2_getrandom.c
    M tools/tpm2_hash.c
    M tools/tpm2_hmac.c
    M tools/tpm2_load.c
    M tools/tpm2_loadexternal.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvreadlock.c
    M tools/tpm2_nvrelease.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_pcrlist.c
    M tools/tpm2_quote.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_send_command.c
    M tools/tpm2_sign.c
    M tools/tpm2_unseal.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  log: remove unneeded new line character in log message strings

The LOG_* macros already add a new line to the end of the message strings,
so there's no need to add it on the log messages.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 87d769cc7fa1e3652c77e546d7a500575d78d14d
      https://github.com/01org/tpm2-tools/commit/87d769cc7fa1e3652c77e546d7=
a500575d78d14d
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    M tools/main.h

  Log Message:
  -----------
  main: add a macro to conditionally print the tools output

Currently tools prints their output using printf(), but would be nice to
have a way to conditionally print their output. That way users can have
a quiet mode where the tools output are not printed.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 17dcebb1a23e4f479340b698b0c681825bb5848a
      https://github.com/01org/tpm2-tools/commit/17dcebb1a23e4f479340b698b0=
c681825bb5848a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    M lib/options.c
    M lib/options.h
    M man/common-options.troff
    M tools/main.c

  Log Message:
  -----------
  options: add quiet option

In some cases users may want the tools to not print any output (e.g: when
the tools are used in scripts), so add a quiet mode to disable printing a
message if was done using the TOOL_OUTPUT() macro.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 45c222d99a1bd037e2b631746dfc41f23eb3021e
      https://github.com/01org/tpm2-tools/commit/45c222d99a1bd037e2b631746d=
fc41f23eb3021e
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: use TOOL_OUTPUT() and LOG_ERR() instead of printf()

Instead of printing messages using the printf() function, use the tools
macros to allow users a more fine grained control of what is printed.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 77ef4d5ce926c65d265eeccce71aa609048c3f5b
      https://github.com/01org/tpm2-tools/commit/77ef4d5ce926c65d265eeccce7=
1aa609048c3f5b
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: use TOOL_OUTPUT() and LOG_ERR() macros instead of printf()

Instead of printing messages using the printf() function, use the tools
macros to allow users a more fine grained control of what is printed.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 450888a15b6703df2affe1882b961be9b429cd92
      https://github.com/01org/tpm2-tools/commit/450888a15b6703df2affe1882b=
961be9b429cd92
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: use TOOL_OUTPUT() and LOG_ERR() macros instead of printf()

Instead of printing messages using the printf() function, use the tools
macros to allow users a more fine grained control of what is printed.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 30b6abe8ddd6cab38672fa63e36ca450bd569b45
      https://github.com/01org/tpm2-tools/commit/30b6abe8ddd6cab38672fa63e3=
6ca450bd569b45
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-22 (Tue, 22 Aug 2017)

  Changed paths:
    M tools/tpm2_pcrlist.c

  Log Message:
  -----------
  tpm2_pcrlist: use TOOL_OUTPUT() macro instead of printf()

Instead of printing messages using the printf() function, use the tools
macro to allow users a more fine grained control of what is printed.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/4343708e5a24...30b6abe=
8ddd6

--===============0527232393621321639==--

