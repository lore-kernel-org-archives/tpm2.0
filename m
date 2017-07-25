Content-Type: multipart/mixed; boundary="===============4788720646862456892=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2.0-tools] 9bb66c: tpm2_createpolicy: check earlier
 if PCR bank ids w...
Date: Tue, 25 Jul 2017 16:47:03 -0700
Message-ID: <5977d877942d5_38343ffb7f583c2412078@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4788720646862456892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2.0-tools
  Commit: 9bb66c9372fa32151a9b322c060a51cad49eafb4
      https://github.com/01org/tpm2.0-tools/commit/9bb66c9372fa32151a9b322c=
060a51cad49eafb4
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: check earlier if PCR bank ids were selected

When building a PCR policy, a check is made if the list of PCR bank ids
were set using the -L option. The check can happen much earlier so move
it outside the build_pcr_policy() function. That way this function does
not depend on this flag that's specific to the tpm2_createpolicy tool.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 11e84469848803308cf9a9d3a3f43ccca0c61d9c
      https://github.com/01org/tpm2.0-tools/commit/11e84469848803308cf9a9d3=
a3f43ccca0c61d9c
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: don't end auth session for extend_policy_session

The build_policy() function has a boolean extend_policy_session parameter
that's used to decide if the policy session is an "extended" one. This
means that the function won't flush the policy session on exit so it can
be used by tools after bulding a policy.

But the function removes the session unconditionally, so also only remove
the session when the caller passed a false extend_policy_session argument.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 812cfa7eb639470fe45793e2741ca0b405abb209
      https://github.com/01org/tpm2.0-tools/commit/812cfa7eb639470fe45793e2=
741ca0b405abb209
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: remove redundant .is_raw_pcrs_file field

The struct tpm2_pcr_policy_options has a boolean .is_raw_pcrs_file field
that's used to inform if a raw_pcrs_file was passed as an option.

But this is not necessary since is enough to check if the raw_pcrs_file
char pointer is not NULL. So just remove the redundant field.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: e8965949803375b3e434c87d2bc4ea675865571b
      https://github.com/01org/tpm2.0-tools/commit/e8965949803375b3e434c87d=
2bc4ea675865571b
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: move out createpolicy ad-hoc logic from build_policy()

The build_policy() policy function logic is quite generic, but it has some
custom logic that's only related to the tpm2_createpolicy that prevents it
to be reused by other tools. For example it prints the policy digest when
using TPM_SE_POLICY and saves it to a file when using TPM_SE_TRIAL.

Move this custom logic out of build_policy() so the function can be reused.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: cde9d9c13430cd97e8d452d444e705a9780b12e3
      https://github.com/01org/tpm2.0-tools/commit/cde9d9c13430cd97e8d452d4=
44e705a9780b12e3
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: make evaluate_populate_pcr_digests() more generic

The evaluate_populate_pcr_digests() function gets as a parameter a struct
create_policy_ctx pointer, but the function logic is really quite general
so can be made more general by not tying it to a specifc context struct.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 11b9049f9c0dd3dcbb3dc4bdd9ff66c7702fb1a5
      https://github.com/01org/tpm2.0-tools/commit/11b9049f9c0dd3dcbb3dc4bd=
d9ff66c7702fb1a5
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: make build_pcr_policy() more generic

The build_pcr_policy() function gets a struct create_policy_ctx pointer
as a parameter, but the function logic is quite general so it can made
more generic by not tying it to a specifc tool context structure.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 449fc5abb67b332a35c7ebae661558b32f933ada
      https://github.com/01org/tpm2.0-tools/commit/449fc5abb67b332a35c7ebae=
661558b32f933ada
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: make start_policy_session() more generic

The start_policy_session() function gets a struct create_policy_ctx pointer
as a parameter, but the function logic is quite general so it can made more
generic by not tying it to a specifc tool context structructure.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 95f87e939d2dda130dbc2d91f4fee23515c54f4d
      https://github.com/01org/tpm2.0-tools/commit/95f87e939d2dda130dbc2d91=
f4fee23515c54f4d
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: make build_policy() more generic

The build_policy() function gets a struct create_policy_ctx pointer as a
parameter, but the function logic is quite general so can made much more
generic by not tying it to a specifc tool context structructure.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: cc50262c13056c6564c0d4251c11fb2a15d62578
      https://github.com/01org/tpm2.0-tools/commit/cc50262c13056c6564c0d425=
1c11fb2a15d62578
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M Makefile.am
    A lib/tpm2_policy.c
    A lib/tpm2_policy.h
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: move build_policy() function to tpm2 policy library

The build_policy() function logic is quite generic and so it can be used
by other tools. For example the tpm2_unseal tool also needs to build PCR
policies, so it can reuse this function instead of open coding it again.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 287eeb92555a0ac7f21bc41735b119886c647af5
      https://github.com/01org/tpm2.0-tools/commit/287eeb92555a0ac7f21bc417=
35b119886c647af5
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: use build_policy() from tpm2 policy instead open coding it

The tpm2_unseal tool had duplicated logic that's already present in the
build_policy() function that exists in the PCR lib. Instead duplicating
this logic, just use the existing function.

Also the code in tpm2_unseal was not parsing correctly the raw PCR file
that contained the hashes, only the first TPM2B_DIGEST buffer was filed
which lead to the following error when trying to use more than 3 PCRs:

$ tpm2_unseal -c load.context -L 0x4:0,1,2,3 -F pcrs.bin
ERROR: File "pcrs.bin" size is larger than buffer, got 80 expected less tha=
n 64

Fixes: #364

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 654bcafbc2f8271e7d82ded62c706196bdaf439e
      https://github.com/01org/tpm2.0-tools/commit/654bcafbc2f8271e7d82ded6=
2c706196bdaf439e
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M test/system/test_tpm2_unseal.sh

  Log Message:
  -----------
  test_tpm2_unseal: use a set of PCRs for policy session on object sealing

Instead of using a single Platform Configuration Register for the policy
session used for authentication when sealing objects, use a set of PCRs
to better stress the tools PCR digest writing and parsing logic.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2.0-tools/compare/66430e173092...654bc=
afbc2f8

--===============4788720646862456892==--

