Content-Type: multipart/mixed; boundary="===============4751643969754919765=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 590ed9: travis: fix autconf dependency on
 tss
Date: Tue, 28 Nov 2017 13:36:43 -0800
Message-ID: <5a1dd6eb28d97_11fd3fd697485c3097691@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4751643969754919765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 590ed9d2ed219d8461777647c7f027d686d7a03c
      https://github.com/intel/tpm2-tools/commit/590ed9d2ed219d8461777647c7=
f027d686d7a03c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis: fix autconf dependency on tss

Commit:
https://github.com/intel/tpm2-tss/commit/61cb7fbe76ac35d7b7162e62750064292d=
a9d6f0

Added AX_CODE_COVERAGE as a configure option and it includes
a dependency on autoconf archive, or this error occurs:

checking whether the linker accepts -Wl,-z,relro... yes
checking whether C compiler accepts -Wno-missing-braces... yes
./configure: line 12491: AX_CODE_COVERAGE: command not found
checking that generated files are newer than configure... done
configure: creating ./config.status

Fix it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 222c54fe6bff6aee19343ca3dae12a866b8c6318
      https://github.com/intel/tpm2-tools/commit/222c54fe6bff6aee19343ca3da=
e12a866b8c6318
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/tpm2_alg_util.c

  Log Message:
  -----------
  lib: just copy the TPMU_HA union instead of copying its member

The TPMU_HA is just a union data type, so instead of attempting to copy
.na field, copy the union since both refer to the same memory location.

This also allows the tpm2-tools to be built against the tpm2-tss 1.x
since the TPMU_HA union doesn't have a .na field in that version. So it
prevents the following build error:

lib/tpm2_alg_util.c: In function =E2=80=98tpm2_extract_plain_signature=E2=
=80=99:
lib/tpm2_alg_util.c:348:33: error: =E2=80=98TPMU_HA {aka union <anonymous>}=
=E2=80=99 has no member named =E2=80=98na=E2=80=99
   memcpy(buffer, &hmac_sig->na, *size);
                           ^~
make: *** [Makefile:1871: lib/tpm2_alg_util.o] Error 1

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/intel/tpm2-tools/compare/122e8f05f8de...222c54f=
e6bff

--===============4751643969754919765==--

