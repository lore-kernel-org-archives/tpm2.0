Content-Type: multipart/mixed; boundary="===============7263064446624955733=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] df96b4: lib: use the exelp() exec* wrapper
 instead of exec...
Date: Mon, 08 Jan 2018 09:42:20 -0800
Message-ID: <5a53ad7c4bb1c_6c362aed43f1fc10339b8@hookshot-fe-6e9b612.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7263064446624955733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: df96b4a35b5cab06e5d37805c95466f714e0c5ff
      https://github.com/intel/tpm2-tools/commit/df96b4a35b5cab06e5d37805c9=
5466f714e0c5ff
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2018-01-08 (Mon, 08 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  lib: use the exelp() exec* wrapper instead of execvpe()

The execvpe() wrapper is a GNU extension, but there isn't a reason to use
it. The command-line arguments array only contains the man pager command
and page, and the calling program's environment variables is used anyways.

So just use the execlp() wrapper that has the same behaviour, but it's a
POSIX standard execve() wrapper and leads simpler code.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: f3c0e94bc4f9cd0790c3e05533091e28d9a09f13
      https://github.com/intel/tpm2-tools/commit/f3c0e94bc4f9cd0790c3e05533=
091e28d9a09f13
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2018-01-08 (Mon, 08 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  lib: check for the man pager exit status

When passing the --help option to the tools, its manual page is displayed
but there's no check for the man command exit status.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 30d8053e196cfa7af5e8b603911c038585e95e6e
      https://github.com/intel/tpm2-tools/commit/30d8053e196cfa7af5e8b60391=
1c038585e95e6e
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2018-01-08 (Mon, 08 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_options.h
    M tools/tpm2_tool.c

  Log Message:
  -----------
  lib: print usage text for the tool if the manual page can't be displayed

When passing the --help option to the tools, its manual page is displayed
but this can fail (i.e: if the manual pages are not installed) so in that
case print the summary usage text as a fallback.

Suggested-by: William Roberts <william.c.roberts(a)intel.com>
Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/intel/tpm2-tools/compare/bd2265283b73...30d8053=
e196c

--===============7263064446624955733==--

