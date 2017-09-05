Content-Type: multipart/mixed; boundary="===============4308050756774063700=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 027239: tpm2_getpubak: port to the new tool
 options parsin...
Date: Tue, 05 Sep 2017 11:30:27 -0700
Message-ID: <59aeed43ba74c_45d13ff0cc149c3431712@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4308050756774063700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: 02723951a2a2f0feb57107fb2485563ba787ff5a
      https://github.com/01org/tpm2-tools/commit/02723951a2a2f0feb57107fb24=
85563ba787ff5a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_getpubak.sh
Name of loaded key: 00 0b cc 35 d5 15 8c fe 28 be 38 51 ff 2f 47 95
d3 97 a5 6f 01 2d 04 2a 5d 69 05 72 3c 35 f9 7d
bb 4b

Loaded key handle:  80ffffff
getpubak successfully!

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 1c0226ae9acfd1e616a3298cf745085f7a2480ef
      https://github.com/01org/tpm2-tools/commit/1c0226ae9acfd1e616a3298cf7=
45085f7a2480ef
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_getpubek.sh
getpubek successfully!

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 3b782d34fadcc68e8281b3794a5e0949472a06d0
      https://github.com/01org/tpm2-tools/commit/3b782d34fadcc68e8281b3794a=
5e0949472a06d0
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  tpm2_random: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_getrandom.sh
getrandom  succeed

And after the trivial test_tpm2_getrandom_func.sh fix:

$ ./test_tpm2_getrandom_func.sh
random test Pass

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: fa5f9c7529d135f0810cf0b6c5afc8aef2f33e3a
      https://github.com/01org/tpm2-tools/commit/fa5f9c7529d135f0810cf0b6c5=
afc8aef2f33e3a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: port to the new tool options parsing infra

Tested with:

$ ./test_tpm2_hmac.sh

CreatePrimary Succeed ! Handle: 0x80ffffff

ObjectAttribute: 0x00040072

Create Object Succeed !
contextParentFile =3D context.p_0x000B_0x0001
contextFile =3D ctx_load_out_0x000B_0x0001-0x000B_0x0008

Load succ.
LoadedHandle: 0x80fffffe

hmac(sha256):93de5c0b3e2b86b6a9ccd9cbfc3d890cfe790bbae99f9388d8f19e5fb007d0=
3d
hmac(sha256):34a65b33c7717c598ff58cfa73dc89a1e0a3ecd1f6ff20e17ccc7ba52be861=
a3
persistentHandle: 0x81010013
persistentHandle: 0x81010013
hmac(sha256):93de5c0b3e2b86b6a9ccd9cbfc3d890cfe790bbae99f9388d8f19e5fb007d0=
3d

CreatePrimary Succeed ! Handle: 0x80ffffff

ObjectAttribute: 0x00040072

Create Object Succeed !
contextParentFile =3D context.p_0x000B_0x0001
contextFile =3D ctx_load_out_0x000B_0x0001-0x000B_0x0008

Load succ.
LoadedHandle: 0x80fffffe

hmac(sha):46b37666cdfa9eb57fde78dc4851e1acf0f015ae
hmac(sha):46b37666cdfa9eb57fde78dc4851e1acf0f015ae
hmac(sha):46b37666cdfa9eb57fde78dc4851e1acf0f015ae

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/ac4974e82e15...fa5f9c7=
529d1

--===============4308050756774063700==--

