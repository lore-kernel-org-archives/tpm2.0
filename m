Content-Type: multipart/mixed; boundary="===============7126514864689094216=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 0d24eb: tpm2_listpersistent: improve the
 tool output
Date: Mon, 18 Sep 2017 09:56:42 -0700
Message-ID: <59bffaca89fdd_5d893ff7d3c3fc349358c@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7126514864689094216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 0d24eba2b5f626e50d2f8095c6475bd0f153312c
      https://github.com/01org/tpm2-tools/commit/0d24eba2b5f626e50d2f8095c6=
475bd0f153312c
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-18 (Mon, 18 Sep 2017)

  Changed paths:
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tpm2_listpersistent: improve the tool output

The tool output was far from ideal, it was neither easy for other tools
to parse nor human readable. So convert to a better format that is also
aligned with what other tpm2-tools print, for example tpm2_pcrlist.

Old outout:

2 persistent objects defined.

  0. Persistent handle: 0x81010000
  {
  Type: 0x1
  Hash algorithm(nameAlg): 0xb
  Attributes: 0x30072
  }

  1. Persistent handle: 0x81020000
  {
  Type: 0x23
  Hash algorithm(nameAlg): 0xb
  Attributes: 0x30072
  }

New output:

persistent-handle[0]:0x81010000 key-alg:rsa hash-alg:sha256 object-attr:0x3=
0072
persistent-handle[1]:0x81020000 key-alg:ecc hash-alg:sha256 object-attr:0x3=
0072

Suggested-by: William Roberts <william.c.roberts(a)intel.com>
Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: d75eb31b3426b12697afd03e9351ec233e51f97a
      https://github.com/01org/tpm2-tools/commit/d75eb31b3426b12697afd03e93=
51ec233e51f97a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-18 (Mon, 18 Sep 2017)

  Changed paths:
    M man/tpm2_listpersistent.1.md
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tpm2_listpersistent: add options to filter output by key and hash algorit=
hm

The tool always prints all the persistent objects, but it may be useful
for users to use the key and hash algorithms as filters for the output.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/5937c646e45e...d75eb31=
b3426

--===============7126514864689094216==--

