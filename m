Content-Type: multipart/mixed; boundary="===============3612567796302821855=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 8bb6ae: Update Algorithm Defines
Date: Fri, 04 Aug 2017 15:18:06 -0700
Message-ID: <5984f29e288de_73473f9bff799c3c382c5@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3612567796302821855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 8bb6ae16453e3a6fe2a96ef08fcb3242c76a4db2
      https://github.com/01org/tpm2-tools/commit/8bb6ae16453e3a6fe2a96ef08f=
cb3242c76a4db2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-04 (Fri, 04 Aug 2017)

  Changed paths:
    M lib/tpm2_alg_util.c
    M lib/tpm2_alg_util.h
    M lib/tpm_kdfa.c
    M test/unit/test_tpm2_alg_util.c

  Log Message:
  -----------
  Update Algorithm Defines

Commit https://github.com/01org/tpm2-tss/commit/87feb17d81b8f3de31578347ec7=
af7fc3a3d350f
removes the macro magic between ALG and VALUE defines, so switch over to AL=
G defines.

Update the tests to use the new defines.

Drop duplicate defines on ALG_SHA3_256|512_VALUE (Bug #375)

Fixes: #375

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a7eb5b85ccb27d51a14eaf641548e20a40dbf020
      https://github.com/01org/tpm2-tools/commit/a7eb5b85ccb27d51a14eaf6415=
48e20a40dbf020
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-04 (Fri, 04 Aug 2017)

  Changed paths:
    M lib/tpm2_alg_util.c
    M lib/tpm2_alg_util.h
    M test/unit/test_tpm2_alg_util.c

  Log Message:
  -----------
  tpm2_alg_util: add tpm2_alg_util_get_hash_size

Add a routine for getting the hash size and add a test
for it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2f932da6e46eabee89261cca5deecd37212415e4
      https://github.com/01org/tpm2-tools/commit/2f932da6e46eabee89261cca5d=
eecd37212415e4
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-04 (Fri, 04 Aug 2017)

  Changed paths:
    M lib/tpm2_policy.c
    M lib/tpm_session.c
    M lib/tpm_session.h
    M tools/tpm2_activatecredential.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  sessions: get rid of funky session handling code

Session code was memory leaking, and the session list code
was non-functioning. Remove the list code, and simplify.

Update the tools that use these routines.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 03f5a85d10e5c3e1ac4f6874f4abcffa53efcb8d
      https://github.com/01org/tpm2-tools/commit/03f5a85d10e5c3e1ac4f6874f4=
abcffa53efcb8d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-04 (Fri, 04 Aug 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: simplify error logic

No need for the goto, just bail on a failure.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2b8bfc12d8dcff327ab87abad6f28f7d2a4f4bcd
      https://github.com/01org/tpm2-tools/commit/2b8bfc12d8dcff327ab87abad6=
f28f7d2a4f4bcd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-04 (Fri, 04 Aug 2017)

  Changed paths:
    M test/system/test_tpm2_createpolicy.sh

  Log Message:
  -----------
  test_tpm2_createpolicy.sh: make failures verbose

Add the failed command and rc to the failure message.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 802052c032bc6ea3e11a51f556182388faaffd9a
      https://github.com/01org/tpm2-tools/commit/802052c032bc6ea3e11a51f556=
182388faaffd9a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-04 (Fri, 04 Aug 2017)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh
    M test/system/test_all.sh

  Log Message:
  -----------
  ci: Enable ASAN when building with clang

Use CLANGs asan feature to find memory issues during the CI
process.

Clang ASAN info can be found at:
https://clang.llvm.org/docs/AddressSanitizer.html

Also, disable test:
test_tpm2_getmanufec:

When using ASAN. ASAN is reporting a leak in tpm2_getmanufec
that cannot be suppressed with version 3.6 of clang. It is
undiagnosed if it is a bug in tpm2_getmanufec, OpenSSL or
a false positive.

For now, skip the test, as checking everything else is more
prident, and it gets functional tested under GCC builds.

File a bug to come back and try to fix it better:
https://github.com/01org/tpm2-tools/issues/390

Fixes: #387

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7d69113640401196b4e5c29168783fc1514b168b
      https://github.com/01org/tpm2-tools/commit/7d69113640401196b4e5c29168=
783fc1514b168b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-04 (Fri, 04 Aug 2017)

  Changed paths:
    M lib/tpm2_nv_util.h

  Log Message:
  -----------
  tpm2_nv_util: add space between preceeding function

Add a space between the preceeding routine and the start
of the doxygen comment block.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b32a4bdd7f4461503eaf7f0076e573fefc779476
      https://github.com/01org/tpm2-tools/commit/b32a4bdd7f4461503eaf7f0076=
e573fefc779476
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-04 (Fri, 04 Aug 2017)

  Changed paths:
    M .ci/travis-build-and-run-tests.sh
    M .travis.yml

  Log Message:
  -----------
  travis: enable clang-3.8

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/1e013129cd88...b32a4bd=
d7f44

--===============3612567796302821855==--

