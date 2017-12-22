Content-Type: multipart/mixed; boundary="===============5436452776800835419=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 18d428: tpm2_createpolicy: remove un-needed
 variable
Date: Fri, 22 Dec 2017 09:14:52 -0800
Message-ID: <5a3d3d8cef1b2_6a232ad8ebc79c0c53232@hookshot-fe-32b5f5b.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5436452776800835419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 18d428cc3aaef393e14fe3723dced8ff9eac964f
      https://github.com/intel/tpm2-tools/commit/18d428cc3aaef393e14fe3723d=
ced8ff9eac964f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-22 (Fri, 22 Dec 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: remove un-needed variable

is_policy_type_selected was used, but not needed. Remove it
from the tool.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 927f32f8864f1bd4aebd4a7741dcf2f8c7125aa3
      https://github.com/intel/tpm2-tools/commit/927f32f8864f1bd4aebd4a7741=
dcf2f8c7125aa3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-22 (Fri, 22 Dec 2017)

  Changed paths:
    M Makefile.am
    M lib/tpm2_policy.c
    M lib/tpm2_policy.h
    A lib/tpm2_session.c
    A lib/tpm2_session.h
    R lib/tpm_session.c
    R lib/tpm_session.h
    M test/unit/test_tpm2_errata.c
    A test/unit/test_tpm2_session.c
    M tools/tpm2_activatecredential.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_getpubak.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  refactor session and policy designs

Split out the policy building and session initiation code.

The session code has a lot of inputs, use a builder pattern
to build a data structure with sane session defaults and
allow the caller to override if needed.

By splitting the policy building code out from session
creation, this reduces the number of arguments required
to the policy routines.

This also (finally), documents the internal APIs for session
and policy handling, and adds much needed unit tests for
session handling. Tests for policy building will be
done in subsequent patches.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a3565b10c849a8e32d73aa77dfd075a9f2244cba
      https://github.com/intel/tpm2-tools/commit/a3565b10c849a8e32d73aa77df=
d075a9f2244cba
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-22 (Fri, 22 Dec 2017)

  Changed paths:
    M Makefile.am
    A lib/tpm2_openssl.c
    A lib/tpm2_openssl.h
    M lib/tpm2_policy.c
    M lib/tpm_kdfa.c

  Log Message:
  -----------
  openssl interface for hashing

Rather than hash the pcr digests for the final policy digest
with the tpm, which is slow, use openssl for the hashing.

This has the side affect of making the policy tests easier
to write as one doesn't have to mock the tpm hash interface
with openssl.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e52699a375ced5b9e6b642a751b7c6639a7e4070
      https://github.com/intel/tpm2-tools/commit/e52699a375ced5b9e6b642a751=
b7c6639a7e4070
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-22 (Fri, 22 Dec 2017)

  Changed paths:
    M Makefile.am
    A test/unit/test_tpm2_policy.c

  Log Message:
  -----------
  tests: add policy tests

Add unit tests for tpm2_policy_build_pcr() and
tpm2_policy_get_digest().

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2275011886c79f1ccab13ac281bcdb3d48e7cbd8
      https://github.com/intel/tpm2-tools/commit/2275011886c79f1ccab13ac281=
bcdb3d48e7cbd8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-22 (Fri, 22 Dec 2017)

  Changed paths:
    M test/system/tests/flushcontext.sh

  Log Message:
  -----------
  tests/flushcontext.sh: silence tpm2_createpolicy stdout

Remove this noise from the test output.

Fixes:
tests/startup.sh ... PASSED
tests/hmac.sh ... PASSED
\TPM2_SE_POLICY: 0x33E36E786C878632494217C3F490E74CA0A3A122A8A4F3C5302500DF=
3B32B3B8
|TPM2_SE_POLICY: 0x33E36E786C878632494217C3F490E74CA0A3A122A8A4F3C5302500DF=
3B32B3B8
tests/flushcontext.sh ... PASSED

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/24556fda8138...2275011=
886c7

--===============5436452776800835419==--

