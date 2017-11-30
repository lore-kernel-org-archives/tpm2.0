Content-Type: multipart/mixed; boundary="===============1718274299798269485=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 0a8158: tpm2_encryptdecrypt: remove magic
 size calculation
Date: Thu, 30 Nov 2017 14:06:41 -0800
Message-ID: <5a2080f141e1c_245a63fcf82e5fc2c94427@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1718274299798269485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 0a815894d37d03de5580788e95b4c48786f046ab
      https://github.com/intel/tpm2-tools/commit/0a815894d37d03de5580788e95=
b4c48786f046ab
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

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1423b9d9c06c38862b346a1301283904ddbfcdd8
      https://github.com/intel/tpm2-tools/commit/1423b9d9c06c38862b346a1301=
283904ddbfcdd8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-30 (Thu, 30 Nov 2017)

  Changed paths:
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: stop using strcasecmp

Make auth hierachy match manpage and not be case insensitive.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ab82b35dd591858172842047fbd69f68838ddc2d
      https://github.com/intel/tpm2-tools/commit/ab82b35dd591858172842047fb=
d69f68838ddc2d
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


Compare: https://github.com/intel/tpm2-tools/compare/69769d4cd1e2...ab82b35=
dd591

--===============1718274299798269485==--

