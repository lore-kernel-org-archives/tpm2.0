Content-Type: multipart/mixed; boundary="===============7074962860778296850=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c16b18: tpm2_sign: remove incorrect UNUSED
 usage
Date: Wed, 06 Sep 2017 11:47:35 -0700
Message-ID: <59b042c7730f6_4993f82e5db3c403365c@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7074962860778296850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: c16b18b1e40ac2fa4b1284824e728fecdb04c145
      https://github.com/01org/tpm2-tools/commit/c16b18b1e40ac2fa4b1284824e=
728fecdb04c145
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: remove incorrect UNUSED usage

The variable is being used, so remove the UNUSED macro on it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 109187c4bce85367df81dca591331928a4c974ed
      https://github.com/01org/tpm2-tools/commit/109187c4bce85367df81dca591=
331928a4c974ed
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_rsaencrypt.c

  Log Message:
  -----------
  tpm2_rsaencrypt: port to new opts inf

$ ./test_tpm2_rsaencrypt.sh

CreatePrimary Succeed ! Handle: 0x800000ff

ObjectAttribute: 0x00060072

Create Object Succeed !
$ echo $?
0

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b58b2daa4671c2a2e6b942b5ecd89bfa8e148040
      https://github.com/01org/tpm2-tools/commit/b58b2daa4671c2a2e6b942b5ec=
d89bfa8e148040
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_rsadecrypt.c

  Log Message:
  -----------
  tpm2_rsadecrypt: port to new opt inf

$ ./test_tpm2_rsadecrypt.sh

CreatePrimary Succeed ! Handle: 0x800000ff

ObjectAttribute: 0x00060072

Create Object Succeed !

Load succ.
LoadedHandle: 0x80000100

$ echo $?
0

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7b928b04fc5c43b743d78d18188c1b7ff9c0250f
      https://github.com/01org/tpm2-tools/commit/7b928b04fc5c43b743d78d1818=
8c1b7ff9c0250f
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_readpublic.c

  Log Message:
  -----------
  tpm2_readpublic: port to new opt inf

$ ./test_tpm2_readpublic.sh

CreatePrimary Succeed ! Handle: 0x800000ff

ObjectAttribute: 0x00040072

Create Object Succeed !

Load succ.
LoadedHandle: 0x80000100

name:000b1a85b7338965015df93af22bb829003cadd16bc011ba0770c9cb714019d0e722
qualified_name:000b655d8d96fd00d869e20c0a5d43dd888b103044f55920f9d63cfe999d=
d1bc0243
persistentHandle: 0x81010014
name:000b1a85b7338965015df93af22bb829003cadd16bc011ba0770c9cb714019d0e722
qualified_name:000b655d8d96fd00d869e20c0a5d43dd888b103044f55920f9d63cfe999d=
d1bc0243
readpublic test OK!

$ echo $?
0

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5246c366bd904278a5a9d6017e35cd07e55058ad
      https://github.com/01org/tpm2-tools/commit/5246c366bd904278a5a9d6017e=
35cd07e55058ad
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  fix null shortopts

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 4b233a4da45a34bcc19f5a4e3c81d5bf87a98f39
      https://github.com/01org/tpm2-tools/commit/4b233a4da45a34bcc19f5a4e3c=
81d5bf87a98f39
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_rc_decode.c

  Log Message:
  -----------
  tpm2_rc_decode: port to new opt inf

Test:
ran: ./test/system/test_tpm2_rc_decode.sh
echo $?
0

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 5f213cd95d23c51f55c1981d7439f315ecf2edcc
      https://github.com/01org/tpm2-tools/commit/5f213cd95d23c51f55c1981d74=
39f315ecf2edcc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_quote.c

  Log Message:
  -----------
  tpm2_quote: port to new opt inf

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 142b420f7d4bab5142499738245a0714b9489bdb
      https://github.com/01org/tpm2-tools/commit/142b420f7d4bab514249973824=
5a0714b9489bdb
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_pcrlist.c

  Log Message:
  -----------
  tpm2_pcrlist: port to new opt inf

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a41804a25332c2c913db1f9d27715b7e9756492b
      https://github.com/01org/tpm2-tools/commit/a41804a25332c2c913db1f9d27=
715b7e9756492b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_pcrextend.c

  Log Message:
  -----------
  tpm2_pcrextend: port to common inf

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2dda22470d69853efe367b3194c5b2ebd1e02386
      https://github.com/01org/tpm2-tools/commit/2dda22470d69853efe367b3194=
c5b2ebd1e02386
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-06 (Wed, 06 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_pcrevent.c

  Log Message:
  -----------
  tpm2_pcrevent: port to common opt inf

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/1a23a5927ab3...2dda224=
70d69

--===============7074962860778296850==--

