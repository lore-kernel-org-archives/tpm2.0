Content-Type: multipart/mixed; boundary="===============2994155206671882863=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 56f22f: tpm2_createpolicy: port to the new
 tool options pa...
Date: Tue, 05 Sep 2017 09:47:32 -0700
Message-ID: <59aed52421aa0_11bda3f993918dc3097361@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2994155206671882863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: 56f22f483273f4ee37292fa5b3d589066d65e3dd
      https://github.com/01org/tpm2-tools/commit/56f22f483273f4ee37292fa5b3=
d589066d65e3dd
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_unseal.sh
nameAlg =3D 0x0004
type =3D 0x0001
contextFile =3D context.p_0x0004_0x0001

CreatePrimary Succeed ! Handle: 0x80ffffff

ObjectAttribute: 0x00000052

Create Object Succeed !
contextParentFile =3D context.p_0x0004_0x0001
contextFile =3D ctx_load_out_0x0004_0x0001-0x000B_0x0008

Load succ.
LoadedHandle: 0x80fffffe

Bank/Algorithm: sha(0x0004)
PCR_00:c72ec9e6cbc2b6a95f334dddd6513981da00f0c2
PCR_01:2455942631ba0d81130c0b31aebfd1775e29fe8a
PCR_02:b2a83b0ebf2f8374299a5b2bdfc31ea955ad7236
PCR_03:b2a83b0ebf2f8374299a5b2bdfc31ea955ad7236
ObjectAttribute: 0x00000492

Create Object Succeed !
contextParentFile =3D context.p_0x0004_0x0001
contextFile =3D ctx_load_out_0x0004_0x0001-0x000B_0x0008

Load succ.
LoadedHandle: 0x80fffffe

tpm2_unseal success

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 6cf8e637a0b5d212d8a21e3b583254e2ac53d51f
      https://github.com/01org/tpm2-tools/commit/6cf8e637a0b5d212d8a21e3b58=
3254e2ac53d51f
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: port to the new tool options parsing infra

$ ./test_tpm2_unseal.sh

CreatePrimary Succeed ! Handle: 0x80ffffff

ObjectAttribute: 0x00000052

Create Object Succeed !
contextParentFile =3D context.p_0x0004_0x0001
contextFile =3D ctx_load_out_0x0004_0x0001-0x000B_0x0008

Load succ.
LoadedHandle: 0x80fffffe

Bank/Algorithm: sha(0x0004)
PCR_00:c72ec9e6cbc2b6a95f334dddd6513981da00f0c2
PCR_01:2455942631ba0d81130c0b31aebfd1775e29fe8a
PCR_02:b2a83b0ebf2f8374299a5b2bdfc31ea955ad7236
PCR_03:b2a83b0ebf2f8374299a5b2bdfc31ea955ad7236
ObjectAttribute: 0x00000492

Create Object Succeed !
contextParentFile =3D context.p_0x0004_0x0001
contextFile =3D ctx_load_out_0x0004_0x0001-0x000B_0x0008

Load succ.
LoadedHandle: 0x80fffffe

tpm2_unseal success

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 9eb1200591dce232192fea2dbe6c2a05f87ad203
      https://github.com/01org/tpm2-tools/commit/9eb1200591dce232192fea2dbe=
6c2a05f87ad203
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_dictionarylockout.c

  Log Message:
  -----------
  tpm2_dictionarylockout: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_dictionarylockout.sh
Success: setting up the number of allowed tries in the lockout parameters
Success: setting up the lockout period in the lockout parameters
Success: setting up the lockout recovery period in the lockout parameters
passed tpm2_dictionarylockout tests

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 66a9d8262f4204f38f8f8c8ff1a84995f86c2850
      https://github.com/01org/tpm2-tools/commit/66a9d8262f4204f38f8f8c8ff1=
a84995f86c2850
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  tpm2_dump_capability: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_dump_capability.sh  | head -n10
TPM_PT_FAMILY_INDICATOR:
  as UINT32:                0x08322e3000
  as string:                "2.0"
TPM_PT_LEVEL:               0
TPM_PT_REVISION:            1.16
TPM_PT_DAY_OF_YEAR:         0x0000012f
TPM_PT_YEAR:                0x000007de
TPM_PT_MANUFACTURER:        0x494e5443
TPM_PT_VENDOR_STRING_1:
  as UINT32:                0x496e7465
...
  cHandles:     0x1
  rHandle:      clear
  V:            clear
  Res:          0x0
tpm2_dump_capability success.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 334cb6fcef526f869ed6ee90a2814ae011c5a65c
      https://github.com/01org/tpm2-tools/commit/334cb6fcef526f869ed6ee90a2=
814ae011c5a65c
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_encryptdecrypt.sh
  commandIndex: 0x164

CreatePrimary Succeed ! Handle: 0x80ffffff

ObjectAttribute: 0x00060072

Create Object Succeed !
contextParentFile =3D context.p_0x0004_0x0001
contextFile =3D ctx_load_out_0x0004_0x0001-0x000B_0x0025

Load succ.
LoadedHandle: 0x80fffffe

encryptdecrypt test OK!

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 0353948b3c4c3f29260b4f4453e2cd5c124f6345
      https://github.com/01org/tpm2-tools/commit/0353948b3c4c3f29260b4f4453=
e2cd5c124f6345
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_evictcontrol.sh

CreatePrimary Succeed ! Handle: 0x80ffffff

ObjectAttribute: 0x00040072

Create Object Succeed !
contextParentFile =3D context.p_B1
contextFile =3D context_load_out_B1_B8

Load succ.
LoadedHandle: 0x80fffffe

persistentHandle: 0x81010003
persistentHandle: 0x81010003

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: ac4974e82e15810cd8f9108112d32f0decb2e747
      https://github.com/01org/tpm2-tools/commit/ac4974e82e15810cd8f9108112=
d32f0decb2e747
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_getmanufec.sh
Successful: retrieving endorsement certificate

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/79916dde783d...ac4974e=
82e15

--===============2994155206671882863==--

