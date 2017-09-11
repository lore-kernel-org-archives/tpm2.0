Content-Type: multipart/mixed; boundary="===============7218308491485069970=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 0d4aed: tpm2_nvread: only print the number
 of bytes read
Date: Mon, 11 Sep 2017 10:53:44 -0700
Message-ID: <59b6cda8333a_11c63f93e1443c3477068@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7218308491485069970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 0d4aedd09b9e8e9764525aa8c9f49a659f1721aa
      https://github.com/01org/tpm2-tools/commit/0d4aedd09b9e8e9764525aa8c9=
f49a659f1721aa
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-11 (Mon, 11 Sep 2017)

  Changed paths:
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  tpm2_nvread: only print the number of bytes read

The nv_read() function queries the NV index public data size to know how
much bytes have to be read. But the reported size may be bigger than the
actual size read from the NV area.

So instead of using the reported NV area public data size for printing,
use the read NV area size.

For example using the NV are public data size may lead to the following:

$ echo -n foobar > data.txt

$ hexdump -C -v data.txt
00000000  66 6f 6f 62 61 72                                 |foobar|
00000006

$ tpm2_nvwrite -x 0x1500018 -a 0x40000001 -f data.txt
66 6f 6f 62 61 72

$ tpm2_nvread -x 0x1500018 -a 0x40000001 -s 6 -o 0
data_size 32 ctx.size_to_read 0 data_offset 6
000000: 66 6f 6f 62 61 72 00 00 c8 ad 07 91 78 7f 00 00  foobar......x...
000010: 10 60 b2 e9 92 55 00 00 05 00 00 00 00 00 00 00  .`...U..........

But after this patch using the read size, the data is correctly printed:

$ tpm2_nvread -x 0x1500018 -a 0x40000001 -s 6 -o 0
000000: 66 6f 6f 62 61 72                                foobar

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============7218308491485069970==--

