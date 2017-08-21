Content-Type: multipart/mixed; boundary="===============6006981039759383063=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 58f675: tpm2_dump_capability: Display
 specification minor ...
Date: Mon, 21 Aug 2017 11:37:42 -0700
Message-ID: <599b2876e48eb_90b3fd2973e7c3c6086f@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6006981039759383063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 58f675bbdac451e4ae98a1d72fb6733497a97302
      https://github.com/01org/tpm2-tools/commit/58f675bbdac451e4ae98a1d72f=
b6733497a97302
  Author: Alexander Steffen <webmeister(a)users.noreply.github.com>
  Date:   2017-08-21 (Mon, 21 Aug 2017)

  Changed paths:
    M tools/tpm2_dump_capability.c

  Log Message:
  -----------
  tpm2_dump_capability: Display specification minor version correctly

value needs to be converted to float before doing the division, otherwise t=
he minor version will be truncated to zero.



--===============6006981039759383063==--

