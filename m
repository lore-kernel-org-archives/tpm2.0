Content-Type: multipart/mixed; boundary="===============9117045706340895004=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 58a941: tpm2_pcrlist: document in the man
 page the --outpu...
Date: Wed, 15 Nov 2017 09:19:20 -0800
Message-ID: <5a0c77185a4a4_9423fd10e7a3c347562e@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9117045706340895004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 58a94147f0797bf3705d93e91c69be65ff9ac372
      https://github.com/intel/tpm2-tools/commit/58a94147f0797bf3705d93e91c=
69be65ff9ac372
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M man/tpm2_pcrlist.1.md

  Log Message:
  -----------
  tpm2_pcrlist: document in the man page the --output option

The -o option is not documented in the tool man page, add it.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: cb7b3c2f01eb94df9d2955eea5d678eada1c8755
      https://github.com/intel/tpm2-tools/commit/cb7b3c2f01eb94df9d2955eea5=
d678eada1c8755
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_pcrextend.sh

  Log Message:
  -----------
  test: tpm2_pcrextend: remove undefined supported_algs array

The test tries to check if a given PCR hash algorithm is supported by using
an supported_algs array but this is never defined and also the tpm2_pcrlist
already only reports the PCR banks for the supported hash algoritms.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 9f46ff0a7b5da9f39269c291ec87dbde13d36a92
      https://github.com/intel/tpm2-tools/commit/9f46ff0a7b5da9f39269c291ec=
87dbde13d36a92
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: flush session handle and end authentication session

When using PCR policy sessions for authentication, the session handle
should be flushed from the TPM2 and the authentication ended. But the
tpm2_nvwrite tool was not doing this cleanup.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 38981a6f84bcd5ba5b1fa5ee88c5fda380f40a9e
      https://github.com/intel/tpm2-tools/commit/38981a6f84bcd5ba5b1fa5ee88=
c5fda380f40a9e
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_create: fix typo for algorithm

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/intel/tpm2-tools/compare/d60d899eb121...38981a6=
f84bc

--===============9117045706340895004==--

