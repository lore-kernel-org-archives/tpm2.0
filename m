Content-Type: multipart/mixed; boundary="===============1397300421992427408=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 6b3279: tpm2_nvlist: review changes for
 yaml output
Date: Wed, 15 Nov 2017 10:40:39 -0800
Message-ID: <5a0c8a273ea39_253f3faa09899c3c8472f@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1397300421992427408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 6b32795a28abe18558e2270c67de64e0f0c7bd86
      https://github.com/intel/tpm2-tools/commit/6b32795a28abe18558e2270c67=
de64e0f0c7bd86
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_nvlist.c

  Log Message:
  -----------
  tpm2_nvlist: review changes for yaml output

Only display the authorization policy if specified.
Output in a human readable and machine parseable YAML output.

Example output:
0x1500015:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|ownerread
    value: 0x2000200
  size: 32

0x1500017:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly: ownerwrite|ownerread
    value: 0x2000200
  size: 32
  authorization policy: 00112233 ...

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============1397300421992427408==--

