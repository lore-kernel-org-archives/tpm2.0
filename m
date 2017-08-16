Content-Type: multipart/mixed; boundary="===============5050440516553532140=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] de307e: autotools: move tools from sbin to
 bin
Date: Wed, 16 Aug 2017 10:07:01 -0700
Message-ID: <59947bb5a3f03_38c73fc33a3e5c3c7309b@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5050440516553532140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: de307e867be3e14dca202939b1d0edf5ee9870cd
      https://github.com/01org/tpm2-tools/commit/de307e867be3e14dca202939b1=
d0edf5ee9870cd
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-16 (Wed, 16 Aug 2017)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  autotools: move tools from sbin to bin

sbin is for critical startup utilities. tpm2-tools should
be in regular bin.

Verified by setting DESTDIR=3D~/tmp and that make install sends
it to /tmp/usr/local/bin.

Fixes: #404

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============5050440516553532140==--

