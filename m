Content-Type: multipart/mixed; boundary="===============1120769423132065922=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 9fbb0c: tpm2_encryptdecrypt: remove magic
 size calculation
Date: Thu, 30 Nov 2017 14:06:38 -0800
Message-ID: <5a2080ee62268_161c3fa279ffdc2c1367b5@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1120769423132065922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 9fbb0cc630e789ac9e41d1eb9ee49c99c914da83
      https://github.com/intel/tpm2-tools/commit/9fbb0cc630e789ac9e41d1eb9e=
e49c99c914da83
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-30 (Thu, 30 Nov 2017)

  Changed paths:
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: remove magic size calculation

Use the sizeof the buffer rather than the whole struct
adn subtract the magic 2 bytes for the UINT16 length
field.

We do not use BUFFER_SIZE() as that should be deprecated
now that the .t .b unions of doom are gone.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e81ce451189103e05f5184e1ff4aac7d14e3750c
      https://github.com/intel/tpm2-tools/commit/e81ce451189103e05f5184e1ff=
4aac7d14e3750c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-30 (Thu, 30 Nov 2017)

  Changed paths:
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: stop using strcasecmp

Make auth hierachy match manpage and not be case insensitive.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7c17997cddf38b37e8b5528920291f4236ca64a2
      https://github.com/intel/tpm2-tools/commit/7c17997cddf38b37e8b5528920=
291f4236ca64a2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-30 (Thu, 30 Nov 2017)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: stop using strcasecmp

Make auth hierachy match manpage and not be case insensitive.

Fixes: #514

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/01269b0cc8b2...7c17997=
cddf3

--===============1120769423132065922==--

