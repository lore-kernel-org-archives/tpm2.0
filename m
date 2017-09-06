Content-Type: multipart/mixed; boundary="===============6239607651362470803=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] b410e7: test: fix tpm2_nv.sh passing a hex
 number as head ...
Date: Wed, 06 Sep 2017 08:13:46 -0700
Message-ID: <59b010aa95b39_1e133fe1f7169c342254c1@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6239607651362470803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: b410e7f4a4a0d0af8623175654384ec2e0fafa31
      https://github.com/01org/tpm2-tools/commit/b410e7f4a4a0d0af8623175654=
384ec2e0fafa31
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test: fix tpm2_nv.sh passing a hex number as head command -c argument

The test TPM_PT_NV_INDEX_MAX fixed TPM2 property to know the NV index data
area maximum size:

$ tpm2_dump_capability -c properties-fixed | grep TPM_PT_NV_INDEX_MAX | sed=
 -r -e 's/.*(0x[0-9a-f]+)/\1/g'
0x00000800

And then passes this value to the head command as a -c option argument:

$ base64 /dev/urandom | head -c 0x00000800
head: invalid number of bytes: =E2=80=980x00000800=E2=80=99

This is making the test to fail, but since the exit code for the mentioned
command is not checked, it's still reported as if the test succeed.

$ ./test_tpm2_nv.sh
70 6c 65 61 73 65 31 32 33 61 62 63 0a

000000: e8 5d ca 86 cc 7f 00 00 e8 5d ca 86 cc 7f 00 00  .].......]......
000010: 30 e0 87 5a 79 55 00 00 05 00 00 00 00 00 00 00  0..ZyU..........
  0. NV Index: 0x1500018
release the nv index OK!
head: invalid number of bytes: =E2=80=980x00000800=E2=80=99
ERROR: Failed to read NVRAM area at index 0x1000000 (16777216). Error:0x14a
  0. NV Index: 0x1000000

$ echo $?
0

Fixes: #463

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============6239607651362470803==--

