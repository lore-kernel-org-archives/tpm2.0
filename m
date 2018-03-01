Content-Type: multipart/mixed; boundary="===============7621338887124530638=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 5de7fd: tpm2_createak: fix manpage
 double -g options
Date: Thu, 01 Mar 2018 14:06:53 -0800
Message-ID: <5a98797df0e8a_127c2b1136f63c14184ad@hookshot-fe-88eb02d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7621338887124530638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 5de7fd4b655dc019d56f534ce5be6f8437afb990
      https://github.com/tpm2-software/tpm2-tools/commit/5de7fd4b655dc019d5=
6f534ce5be6f8437afb990
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M man/tpm2_createak.1.md

  Log Message:
  -----------
  tpm2_createak: fix manpage double -g options

There was a double -g option, and one of them should
have been -D. Fix this, by correcting the tpm options.

Fixes: #916

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============7621338887124530638==--

