Content-Type: multipart/mixed; boundary="===============5572998590779569199=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] e24040: tpm2_akparse: port to the new tool
 options parsing...
Date: Mon, 04 Sep 2017 14:40:08 -0700
Message-ID: <59adc83894851_4de63fd5d702dc3466738@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5572998590779569199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: e24040610c2616a8ee7d9fb80da09ac250bbe3ef
      https://github.com/01org/tpm2-tools/commit/e24040610c2616a8ee7d9fb80d=
a09ac250bbe3ef
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-04 (Mon, 04 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_akparse.c

  Log Message:
  -----------
  tpm2_akparse: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_akparse.sh
ee bd b4 e7 7d 87 fd fc b0 7a e8 d4 9d 3d 4d 55
fb b9 38 93 fe 3a 10 f4 11 25 a5 9d 42 7b 08 e6
b9 c2 d6 18 4a db f0 e3 1f 04 d3 f4 4b 93 4c 9a
d1 8e fa e6 54 60 09 d9 c4 15 36 dc ce a7 b1 da
f5 e7 92 74 49 4a a2 86 3a 93 60 e8 e9 7c ef 80
3a 73 fa 4f c3 fc 8b e7 40 13 79 e5 1b 13 7b 7c
67 9b 6d 26 e6 d2 74 32 38 64 4a 3e 49 f1 d5 25
e5 92 fa b3 d0 66 3d 26 ad fe dd 5d 61 14 41 f7
6a 25 53 d0 5f c7 f5 81 78 1f 9b 3a 68 61 19 c4
31 68 62 fb d4 5d 82 f3 0b 86 53 30 34 df b2 00
a2 19 a2 93 68 dc fb d7 6c 8a 93 7a be 69 e1 6b
06 a8 f7 2c 8c db 7f 63 cf 7c d0 71 1c 34 25 b6
78 b1 64 16 a8 49 c6 7c f0 9a 6c bf 6f e4 80 f5
cf 9d e2 67 5e f0 1a f1 bb 1a 99 60 6b ab b0 5b
d9 18 02 c9 0c 70 c7 4f fe 2f 6b 4b 30 1e 1c 3c
9c b5 8b 6c b4 f8 a6 b2 3f 74 38 b5 14 88 f6 2b

akparse successfully!

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 64a4cecdf9a2d036457795187d4189a917224f67
      https://github.com/01org/tpm2-tools/commit/64a4cecdf9a2d036457795187d=
4189a917224f67
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-04 (Mon, 04 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_certify.c

  Log Message:
  -----------
  tpm2_certify: port to the new tool options parsing infra

Tested with:

$ ./test/system/test_tpm2_certify.sh
nameAlg =3D 0x000b
type =3D 0x0001
contextFile =3D context.p_B1

CreatePrimary Succeed ! Handle: 0x80ffffff

nameAlg =3D 0x000b
type =3D 0x0001
contextParentFile =3D context.p_B1
ObjectAttribute: 0x00060072

Create Object Succeed !
contextParentFile =3D context.p_B1
contextFile =3D context_load_out_B1_B8

Load succ.
LoadedHandle: 0x80fffffe

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 79916dde783dd8098482cfb195b0a8606d639c0a
      https://github.com/01org/tpm2-tools/commit/79916dde783dd8098482cfb195=
b0a8606d639c0a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-04 (Mon, 04 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: port to the new tool options parsing infra

Tested with:

$ ./test/system/test_tpm2_unseal.sh
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


Compare: https://github.com/01org/tpm2-tools/compare/6b1f4847e0ec...79916dd=
e783d

--===============5572998590779569199==--

