Content-Type: multipart/mixed; boundary="===============8206463958908585215=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 0d7b5d: configure.ac: enable silent-rules
 configure option...
Date: Fri, 01 Dec 2017 05:43:01 -0800
Message-ID: <5a215c65ecf64_6ca23fe21c2e7c3012134f@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8206463958908585215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 0d7b5d964201feede4bfb0c5c3125f6e2f3cadf0
      https://github.com/intel/tpm2-tools/commit/0d7b5d964201feede4bfb0c5c3=
125f6e2f3cadf0
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-01 (Fri, 01 Dec 2017)

  Changed paths:
    M Makefile.am
    M configure.ac

  Log Message:
  -----------
  configure.ac: enable silent-rules configure option by default

This change is inspired by Andreas Fuchs enabling the silent-rules option
by default on tpm2-tss. The output is much nicer and one can have the old
output anyways by either disabling the silent-rules option or "make V=3D1".

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============8206463958908585215==--

