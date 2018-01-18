Content-Type: multipart/mixed; boundary="===============5593772421186443861=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 401968: tcti: support dynamic tctis
Date: Thu, 18 Jan 2018 14:28:31 -0800
Message-ID: <5a611f8fb4466_2ff22b0ff26dfc0448613@hookshot-fe-6b2eebc.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5593772421186443861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 4019681908487bb26829f564d1384857de1ce012
      https://github.com/intel/tpm2-tools/commit/4019681908487bb26829f564d1=
384857de1ce012
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-18 (Thu, 18 Jan 2018)

  Changed paths:
    M Makefile.am
    M configure.ac
    R lib/tcti/tpm2_tools_tcti_abrmd.c
    R lib/tcti/tpm2_tools_tcti_abrmd.h
    R lib/tcti/tpm2_tools_tcti_device.c
    R lib/tcti/tpm2_tools_tcti_device.h
    R lib/tcti/tpm2_tools_tcti_socket.c
    R lib/tcti/tpm2_tools_tcti_socket.h
    M lib/tpm2_options.c
    A lib/tpm2_tcti_ldr.c
    A lib/tpm2_tcti_ldr.h
    M tools/tpm2_tool.c

  Log Message:
  -----------
  tcti: support dynamic tctis

XXX
Requires: https://github.com/intel/tpm2-abrmd/pull/290

----

Use the dynamic TCTI interface mechanism to remove the
link time dependency on tctis.

Now, tcti's can be specified via the old, friendly name,
and new tcti's can be added without relinking the tools.

The code performs a fixup of abrmd to tabrmd as to maintain
backwards compatibility with old users specifying it via
abrmd.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 516c265192e119753b93a2dd828b8da61330a3cd
      https://github.com/intel/tpm2-tools/commit/516c265192e119753b93a2dd82=
8b8da61330a3cd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-18 (Thu, 18 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  help: show tool output when -h is specified

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2d5bd1e869888b04603fd1e790ea31ccc1339601
      https://github.com/intel/tpm2-tools/commit/2d5bd1e869888b04603fd1e790=
ea31ccc1339601
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-18 (Thu, 18 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_tcti_ldr.c
    M lib/tpm2_tcti_ldr.h
    M man/common/tcti.md

  Log Message:
  -----------
  help: show tcti-help output on -h

Update the TCTI manpage for how to deal with TCTIs.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 130582559d7c51d18e3ce82803c30bc161d9c34d
      https://github.com/intel/tpm2-tools/commit/130582559d7c51d18e3ce82803=
c30bc161d9c34d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-18 (Thu, 18 Jan 2018)

  Changed paths:
    M configure.ac
    M lib/tpm2_options.c
    M lib/tpm2_tcti_ldr.c

  Log Message:
  -----------
  configure: add --disable-dlclose bug work-around

I have found a few mentions of dlclose/atexit handlers
not working right. Even though I find no explicit
atexit handlers in tss/abrmd code, perhaps libc is
registering stuff (not sure).

For example, I found this:
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D74345

With that said, travis is using EGLIBC in 14.04, where as
my 16.04 system is using glibc 2.23. I cannot reproduce
locally, and Ubuntu only migrated to EGLIBC for a brief
period of time. We will enable this config option for
those who are afflicted, but enable dlclose by default
and see what reports we get back to root cause this
for sure.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 28acecf4f6375950f992d6121b8d3c210a5366cd
      https://github.com/intel/tpm2-tools/commit/28acecf4f6375950f992d6121b=
8d3c210a5366cd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-18 (Thu, 18 Jan 2018)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh

  Log Message:
  -----------
  travis: stop building for static tctis

Now that dynamic TCTIs are supported, there is no need to
build with all the various TCTI options. This should also
help speed up our builds.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 633b2edb7880868aa04b087b467e8d09e244a75b
      https://github.com/intel/tpm2-tools/commit/633b2edb7880868aa04b087b46=
7e8d09e244a75b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-18 (Thu, 18 Jan 2018)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh

  Log Message:
  -----------
  travis: add disable-dlclose workaround

Travis is using EGLIBC which is having some weird issue
with dlclose() with program exit.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d6e08042266505ae8c05f021c2fd796a9bac9c23
      https://github.com/intel/tpm2-tools/commit/d6e08042266505ae8c05f021c2=
fd796a9bac9c23
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-18 (Thu, 18 Jan 2018)

  Changed paths:
    M test/system/test.sh

  Log Message:
  -----------
  replace realpath with readlink -f

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 8a398eca88e93f9a0151cbb526bf1ed47f126294
      https://github.com/intel/tpm2-tools/commit/8a398eca88e93f9a0151cbb526=
bf1ed47f126294
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-01-18 (Thu, 18 Jan 2018)

  Changed paths:
    M test/system/test.sh
    M test/system/tests/getmanufec.sh

  Log Message:
  -----------
  test.sh: run tests on clang build

test.sh had a hack to not run getmanufec test when clang was
enabled on travis. That hack was removing ALL the tests, and
thus running no system integration tests when clang
with asan was enabled. Correct this.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/a350ab1052bb...8a398ec=
a88e9

--===============5593772421186443861==--

