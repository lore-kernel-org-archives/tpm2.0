Content-Type: multipart/mixed; boundary="===============0533554966309250130=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 0e2203: fixup! option fixing: move to
 single getopt
Date: Wed, 06 Sep 2017 08:11:53 -0700
Message-ID: <59b0103924f1d_225b83fca555f1c34137593@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0533554966309250130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: 0e22030d2f84e8b90283d1dfd9482c59cce1ac00
      https://github.com/01org/tpm2-tools/commit/0e22030d2f84e8b90283d1dfd9=
482c59cce1ac00
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M lib/tpm2_options.c
    M tools/tpm2_tool.c

  Log Message:
  -----------
  fixup! option fixing: move to single getopt

Some tools may not define a list of options, so it's not correct to free
the tpm2_options pointer unconditionally. Also there's a mistake on a
check for !opts when !opts->short_opts was more certainly meant.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 432c63cb1592196da8ae43b8c934b65c820835e8
      https://github.com/01org/tpm2-tools/commit/432c63cb1592196da8ae43b8c9=
34b65c820835e8
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tpm2_listpersistent: port to new option handler

There isn't a test for this tool yet, tested manually with the following:

$ tpm2_listpersistent
0 persistent objects defined.

$ tpm2_createprimary -A e -g sha1 -G ecc -C primary.context

CreatePrimary Succeed ! Handle: 0x80ffffff

$ tpm2_evictcontrol -A o -c primary.context -S 0x81010003
persistentHandle: 0x81010003

$ tpm2_listpersistent
1 persistent objects defined.

  0. Persistent handle: 0x81010003
  {
  Type: 0x23
  Hash algorithm(nameAlg): 0x4
  Attributes: 0x30072
  }

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 18f5f81b841339ca1fb9d0f03eabc8a8ecf347f5
      https://github.com/01org/tpm2-tools/commit/18f5f81b841339ca1fb9d0f03e=
abc8a8ecf347f5
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_load.c

  Log Message:
  -----------
  tpm2_load: port to new option handler

Tested with:

$ ./test_tpm2_load.sh

CreatePrimary Succeed ! Handle: 0x80ffffff

ObjectAttribute: 0x00040072

Create Object Succeed !

Load succ.
LoadedHandle: 0x80fffffe

persistentHandle: 0x81010018
ObjectAttribute: 0x00040072

Create Object Succeed !

Load succ.
LoadedHandle: 0x80ffffff

load test OK!

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 92a7112f3157a90380fd4bebd24728121d508ea9
      https://github.com/01org/tpm2-tools/commit/92a7112f3157a90380fd4bebd2=
4728121d508ea9
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_loadexternal.c

  Log Message:
  -----------
  tpm2_loadexternal: port to new option handler

Tested with:

$ ./test_tpm2_loadexternal.sh

CreatePrimary Succeed ! Handle: 0x80ffffff

ObjectAttribute: 0x00040072

Create Object Succeed !
persistentHandle: 0x81010019
ObjectAttribute: 0x00040072

Create Object Succeed !
loadexternal test OK!

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 1a94906a423d106e573a378ca126a607c8e23bc6
      https://github.com/01org/tpm2-tools/commit/1a94906a423d106e573a378ca1=
26a607c8e23bc6
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_makecredential.c

  Log Message:
  -----------
  tpm2_makecredential: port to new option handler

Tested with:

$ ./test_tpm2_makecredential.sh
Name of loaded key: 00 0b d7 f9 16 46 a9 c0 c1 7d 62 57 43 7b ad a4
ad 83 f2 c5 11 23 a4 bb 94 e1 29 be dc 5b da 9e
13 16

Loaded key handle:  80ffffff
makecredential successfully!

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: ddedb2aca6746ec6c7bd9f27ca28a661d12a4827
      https://github.com/01org/tpm2-tools/commit/ddedb2aca6746ec6c7bd9f27ca=
28a661d12a4827
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: port to new option handler

Tested with:

$ tpm2_nvdefine -x 0x1500018 -a 0x40000001 -s 32 -t "ownerread|policywrite|=
ownerwrite"
$ echo $?
0
$ tpm2_nvlist
1 NV indexes defined.

  0. NV Index: 0x1500018
  {
  Hash algorithm(nameAlg):11
  attributes: ownerwrite|policywrite|ownerread(0xA000200)
  The size of the data area(dataSize):32
  Authorization Policy for R/W/D:
  }

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: ec5b7efe7460e1469c1b19fb733a5558701fa936
      https://github.com/01org/tpm2-tools/commit/ec5b7efe7460e1469c1b19fb73=
3a5558701fa936
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: port to new option handler

Tested with:

$ tpm2_nvdefine -x 0x1500018 -a 0x40000001 -s 32 -t "ownerread|policywrite|=
ownerwrite"

$ tpm2_nvlist
1 NV indexes defined.

  0. NV Index: 0x1500018
  {
  Hash algorithm(nameAlg):11
  attributes: ownerwrite|policywrite|ownerread(0xA000200)
  The size of the data area(dataSize):32
  Authorization Policy for R/W/D:
  }

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: b398505d01dbf962d420cb231eb6855d56b9e5a8
      https://github.com/01org/tpm2-tools/commit/b398505d01dbf962d420cb231e=
b6855d56b9e5a8
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: port to the new option handler

Tested with:

$ tpm2_nvread -x 0x1500018 -a 0x40000001 -s 32 -o 0
000000: e8 ad d9 ae b8 7f 00 00 e8 ad d9 ae b8 7f 00 00  ................
000010: 30 30 92 ea 3a 56 00 00 05 00 00 00 00 00 00 00  00..:V..........

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 49f5d415e3542604f74ae1e7c4f8a18dc5d251a7
      https://github.com/01org/tpm2-tools/commit/49f5d415e3542604f74ae1e7c4=
f8a18dc5d251a7
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_nvreadlock.c

  Log Message:
  -----------
  tpm2_nvreadlock: port to the new option handler

Tested with:

$ tpm2_nvdefine -x 0x1500018 -a 0x40000001 -s 32 -t "ownerread|policywrite|=
ownerwrite|read_stclear"

$ tpm2_nvwrite -x 0x1500018 -a 0x40000001 -f data.txt
66 6f 6f 62 61 72 0a

$ tpm2_nvread -x 0x1500018 -a 0x40000001 -s 14 -o 0
000000: e8 0d cd a9 c0 7f 00 00 e8 0d cd a9 c0 7f 00 00  ................
000010: 30 e0 50 f4 e7 55 00 00 05 00 00 00 00 00 00 00  0.P..U..........

$ tpm2_nvreadlock -x 0x1500018 -a 0x40000001

$ tpm2_nvread -x 0x1500018 -a 0x40000001 -s 14 -o 0
ERROR: Failed to read NVRAM area at index 0x1500018 (22020120). Error:0x148

$ tpm2_rc_decode 0x148
error layer
  hex: 0x0
  identifier: TSS2_TPM_ERROR_LEVEL
  description: Error produced by the TPM
format 0 error code
  hex: 0x48
  name: TPM_RC_NV_LOCKED
  description: NV access locked.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: a9675b4961a0910fd9c6b26602b695ad8ebc06b7
      https://github.com/01org/tpm2-tools/commit/a9675b4961a0910fd9c6b26602=
b695ad8ebc06b7
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_nvrelease.c

  Log Message:
  -----------
  tpm2_release: port to the new option handler

Tested with (after fixing the test):

$ ./test_tpm2_nv.sh
70 6c 65 61 73 65 31 32 33 61 62 63 0a

000000: e8 ed 05 5e f1 7f 00 00 e8 ed 05 5e f1 7f 00 00  ...^.......^....
000010: 30 e0 e7 43 9e 55 00 00 05 00 00 00 00 00 00 00  0..C.U..........
  0. NV Index: 0x1500018
release the nv index OK!
...

  0. NV Index: 0x1000000

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 1a23a5927ab327868c6acf952aad8bd5fbbaad44
      https://github.com/01org/tpm2-tools/commit/1a23a5927ab327868c6acf952a=
ad8bd5fbbaad44
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_release: port to the new option handler

Tested with (after fixing the test):

$ ./test_tpm2_nv.sh
70 6c 65 61 73 65 31 32 33 61 62 63 0a

000000: e8 ed 05 5e f1 7f 00 00 e8 ed 05 5e f1 7f 00 00  ...^.......^....
000010: 30 e0 e7 43 9e 55 00 00 05 00 00 00 00 00 00 00  0..C.U..........
  0. NV Index: 0x1500018
release the nv index OK!
...

  0. NV Index: 0x1000000

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/a1b451db2087...1a23a59=
27ab3

--===============0533554966309250130==--

