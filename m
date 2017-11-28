Content-Type: multipart/mixed; boundary="===============7383761962177069962=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] c10484: tpm2_rsaencrypt: fix file argument
Date: Tue, 28 Nov 2017 15:01:00 -0800
Message-ID: <5a1deaacd9731_41603f9afa0c7c34119090@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7383761962177069962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: c104848f6d8f24dfa891a94ce0a169544ad86bd8
      https://github.com/intel/tpm2-tools/commit/c104848f6d8f24dfa891a94ce0=
a169544ad86bd8
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



--===============7383761962177069962==--

