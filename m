Content-Type: multipart/mixed; boundary="===============1790051462633584044=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 76a4c6: tpm2_rsaencrypt: fix file argument
Date: Tue, 28 Nov 2017 15:00:56 -0800
Message-ID: <5a1deaa89e98f_6e9e3ffb4a995c34100593@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1790051462633584044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 76a4c6ecfeca9772675bf2e117e57c8d204d530e
      https://github.com/intel/tpm2-tools/commit/76a4c6ecfeca9772675bf2e117=
e57c8d204d530e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M tools/tpm2_rsaencrypt.c

  Log Message:
  -----------
  tpm2_rsaencrypt: fix file argument

Based on argument ordering and getopt handling, the code was getting lucky =
and
actually properly grabing the input file at argv[1]. However, the first
item in the array is really argv[0].

A result could be that the input file is NULL, which means read data
from stdin and the tool will hang.

Fixes: #664

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============1790051462633584044==--

