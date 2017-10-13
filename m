Content-Type: multipart/mixed; boundary="===============6368497702456730555=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 750c39: tpm2_listpcrs: use
 TPM2_GetCapability to determine...
Date: Fri, 13 Oct 2017 11:55:22 -0700
Message-ID: <59e10c1a37dc0_36423fb284999c30359d6@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6368497702456730555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/2.X
  Home:   https://github.com/01org/tpm2-tools
  Commit: 750c39c767471f61ed93a39dfe966f001861ddf6
      https://github.com/01org/tpm2-tools/commit/750c39c767471f61ed93a39dfe=
966f001861ddf6
  Author: Jerry Snitselaar <jsnitsel(a)redhat.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_listpcrs.c

  Log Message:
  -----------
  tpm2_listpcrs: use TPM2_GetCapability to determine PCRs to read

Allow TPM to tell us PCRs that are available to be read in a bank
instead of assuming there will be 24. This resolves an issue on
a system where in the bios you can choose between hash functions
(sha1 and sha256 in this case). Both will show up as supported,
but when it tries reading the bank that isn't selected in the bios
it makes no progress, and then fails saying that there are too many
PCRs to read.

This consolidates the pcr_selections init code into one function.

Also a minor change to show_pcr_values to use sizeofSelect to
determine loop iteration instead of hardcoding 24.

Signed-off-by: Jerry Snitselaar <jsnitsel(a)redhat.com>


  Commit: 26b0f22cbc8a5b280f152e7168c93c2f177ec776
      https://github.com/01org/tpm2-tools/commit/26b0f22cbc8a5b280f152e7168=
c93c2f177ec776
  Author: Gang Wei <gang.wei(a)intel.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_listpcrs.c

  Log Message:
  -----------
  listpcrs: remove one redundant call to tpm get cap

Signed-of-by: Gang Wei <gang.wei(a)intel.com>


  Commit: 7592cd75dd1181e78652f6698895a8942841baa4
      https://github.com/01org/tpm2-tools/commit/7592cd75dd1181e78652f66988=
95a8942841baa4
  Author: Gang Wei <gang.wei(a)intel.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/tpm2_listpcrs.c

  Log Message:
  -----------
  listpcrs: fix for unsupported/disabled alg in -L

Sign-off-by: Gang Wei <gang.wei(a)intel.com>


  Commit: a0be072cb92b417aa2f7ed1d0b24dc3f6db098cd
      https://github.com/01org/tpm2-tools/commit/a0be072cb92b417aa2f7ed1d0b=
24dc3f6db098cd
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M tools/main.c
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  build: use supported comment to suppress GCC7 fallthrough warning

GCC7 warns when a case in a switch statement falls through the next case
block, this leads to the following build error due using -Werror option:

tools/main.c:62:9: error: this statement may fall through [-Werror=3Dimplic=
it-fallthrough=3D]
   fprintf (stderr,
   ^~~~~~~~~~~~~~~~
            "failed to load manpage, check your environment / PATH\n");
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tools/main.c:65:5: note: here
     case 2:
     ^~~~
cc1: all warnings being treated as errors

The commit 054b1f3e85a7 ("main: explicitly state fall through in switch
is expected") added a comment to avoid some tools to complain about it,
but let's change to one that matches the regular expression defined by
GCC's -Wimplicit-fallthrough=3D3 (the default when the option is enabled).

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: aedfe48357d06d4219eba29581eb2b917aa26048
      https://github.com/01org/tpm2-tools/commit/aedfe48357d06d4219eba29581=
eb2b917aa26048
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M lib/tpm_kdfa.c

  Log Message:
  -----------
  kdfa: allow to build with OpenSSL 1.1.x

OpenSSL version 1.1 has some API changes that makes many data structures
to be opaque as explained in [0]. The changes causes the following build
error when using OpenSSL 1.1.x libs:

lib/tpm_kdfa.c: In function =E2=80=98tpm_kdfa=E2=80=99:
lib/tpm_kdfa.c:93:14: error: storage size of =E2=80=98ctx=E2=80=99 isn=E2=
=80=99t known
     HMAC_CTX ctx;
        ^~~
lib/tpm_kdfa.c:94:5: error: implicit declaration of function =E2=80=98HMAC_=
CTX_init=E2=80=99; did you mean =E2=80=98HMAC_CTX_new=E2=80=99? [-Werror=3D=
implicit-function-declaration]
     HMAC_CTX_init(&ctx);
     ^~~~~~~~~~~~~
     HMAC_CTX_new
lib/tpm_kdfa.c:150:5: error: implicit declaration of function =E2=80=98HMAC=
_CTX_cleanup=E2=80=99; did you mean =E2=80=98HMAC_CTX_get_md=E2=80=99? [-We=
rror=3Dimplicit-function-declaration]
     HMAC_CTX_cleanup(&ctx);
     ^~~~~~~~~~~~~~~~

[0]: https://wiki.openssl.org/index.php/OpenSSL_1.1.0_Changes

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 1c39fd82e2b7fbc60f5cf8b35c7420d7cc854026
      https://github.com/01org/tpm2-tools/commit/1c39fd82e2b7fbc60f5cf8b35c=
7420d7cc854026
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-13 (Fri, 13 Oct 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  Makefile: include abrmd TCTI man page section

The information about the abrmd TCTI isn't shown in the man pages, fix it.

Suggested-by: Jerry Snitselaar <jsnitsel(a)redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/5bc083d8a362...1c39fd8=
2e2b7

--===============6368497702456730555==--

