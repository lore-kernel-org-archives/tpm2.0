Content-Type: multipart/mixed; boundary="===============0470534900691724849=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] d87908: tpm2_send_command: drop unused
 header
Date: Fri, 20 Oct 2017 09:10:39 -0700
Message-ID: <59ea1ffff070b_9c5f3fdb1ab2bc381183ae@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0470534900691724849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: d87908e8c7d035fd8061e7d8f93bf38435483a35
      https://github.com/01org/tpm2-tools/commit/d87908e8c7d035fd8061e7d8f9=
3bf38435483a35
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M tools/tpm2_send_command.c

  Log Message:
  -----------
  tpm2_send_command: drop unused header

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3ca06649c0744b53ed3d1e0d1aa0d32737a06d2a
      https://github.com/01org/tpm2-tools/commit/3ca06649c0744b53ed3d1e0d1a=
a0d32737a06d2a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_send_command.sh
    M tools/tpm2_send_command.c

  Log Message:
  -----------
  tpm2_send_command: drop -i option and make argument.

Partial-Fix: #509

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 55791c205da431c7b22300861ebdade670adea4d
      https://github.com/01org/tpm2-tools/commit/55791c205da431c7b22300861e=
bdade670adea4d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M Makefile.am
    A man/tpm2_send.1.md
    R man/tpm2_send_command.1.md
    A test/system/test_tpm2_send.sh
    R test/system/test_tpm2_send_command.sh
    A tools/tpm2_send.c
    R tools/tpm2_send_command.c

  Log Message:
  -----------
  tpm2_send: rename from tpm2_send_command

Fixes: #509

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3d2b07beda1f5d29d398052fccd3cde442c15876
      https://github.com/01org/tpm2-tools/commit/3d2b07beda1f5d29d398052fcc=
d3cde442c15876
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  CHANGELOG.md: Update to include tpm2_send

tpm2_send was renamed from tpm2_send_command.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d9e09ff078e696f6ac33d8819adad56a151f44c2
      https://github.com/01org/tpm2-tools/commit/d9e09ff078e696f6ac33d8819a=
dad56a151f44c2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_dump_capability.1.md
    A man/tpm2_getcap.1.md
    M test/system/test_helpers.sh
    M test/system/test_tpm2_dictionarylockout.sh
    R test/system/test_tpm2_dump_capability.sh
    M test/system/test_tpm2_encryptdecrypt.sh
    A test/system/test_tpm2_getcap.sh
    M test/system/test_tpm2_nv.sh
    M test/system/test_tpm2_quote.sh
    R tools/tpm2_dump_capability.c
    A tools/tpm2_getcap.c

  Log Message:
  -----------
  tpm2_getcap: rename form tpm2_dump_capability

tpm2_dump_capability, while annoyingly long to type, also
doesn't convey the underlying TPM command being invoked.

Rename it to tpm2_getcap which calls invokes the getcapability
command.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0a99a25e42acdccb97a61a104e69c834399f322b
      https://github.com/01org/tpm2-tools/commit/0a99a25e42acdccb97a61a104e=
69c834399f322b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_import.sh

  Log Message:
  -----------
  test_tpm2_import: cleanup noisy output

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: da8151de6e01dc4ea13a895e04a1ee319c285905
      https://github.com/01org/tpm2-tools/commit/da8151de6e01dc4ea13a895e04=
a1ee319c285905
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M CHANGELOG.md

  Log Message:
  -----------
  CHANGELOG.md: tpm2_getcap

Capture the rename of tpm2_dump_capability to tpm2_getcap
in the next changelog.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 64fb40de6297809cfee8e95bdcab214b8103c12f
      https://github.com/01org/tpm2-tools/commit/64fb40de6297809cfee8e95bdc=
ab214b8103c12f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  make dist: fix errors

Fix:
 * make[1]: *** No rule to make target '""', needed by 'distdir'.  Stop.
 * make[1]: *** No rule to make target 'tools/tool.h', needed by 'distdir'.=
  Stop.
 * Numerous missing h files.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2f933f688a5a2d04fad469bb0b4ccfe0fbb354c7
      https://github.com/01org/tpm2-tools/commit/2f933f688a5a2d04fad469bb0b=
4ccfe0fbb354c7
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh

  Log Message:
  -----------
  travis: enable distcheck as a test

We have had numerous make dist issues, make this a part
of the build checks.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fe47bc68653f6412a80d7e333066d39405fce5cb
      https://github.com/01org/tpm2-tools/commit/fe47bc68653f6412a80d7e3330=
66d39405fce5cb
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-20 (Fri, 20 Oct 2017)

  Changed paths:
    M RELEASE.md

  Log Message:
  -----------
  RELEASE.md: add process for release tarballs

Fixes: #554

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/102e5c16bef6...fe47bc6=
8653f

--===============0470534900691724849==--

