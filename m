Content-Type: multipart/mixed; boundary="===============3962398183021253753=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2.0-tools] 66430e: Treat file sizes as unsigned
 integers
Date: Tue, 25 Jul 2017 13:10:37 -0700
Message-ID: <5977a5bd2f160_1e813fe484275c3877477@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3962398183021253753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2.0-tools
  Commit: 66430e1730921b0899d4075ff1d090399bc7af74
      https://github.com/01org/tpm2.0-tools/commit/66430e1730921b0899d4075f=
f1d090399bc7af74
  Author: Alexander Steffen <Alexander.Steffen(a)infineon.com>
  Date:   2017-07-25 (Tue, 25 Jul 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M test/unit/test_files.c
    M tools/tpm2_createpolicy.c
    M tools/tpm2_hash.c
    M tools/tpm2_sign.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  Treat file sizes as unsigned integers

The size of a file cannot be negative, therefore use unsigned variables.

Signed-off-by: Alexander Steffen <Alexander.Steffen(a)infineon.com>



--===============3962398183021253753==--

