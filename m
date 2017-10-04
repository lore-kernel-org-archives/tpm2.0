Content-Type: multipart/mixed; boundary="===============7687083924285858704=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 5f1089: travis: install pandoc to build man
 pages
Date: Wed, 04 Oct 2017 08:53:39 -0700
Message-ID: <59d50403590db_68b3f904de83c2c1725ab@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7687083924285858704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 5f10895e2844b6f4fdf5d47a83605110e54e945e
      https://github.com/01org/tpm2-tools/commit/5f10895e2844b6f4fdf5d47a83=
605110e54e945e
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-04 (Wed, 04 Oct 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis: install pandoc to build man pages

The commit fd034b2fe2f0 ("man: use pandoc instead of md2man for man pages
generation") replaced the tool used to generate the man pages. But forgot
to update the Travis CI yaml to install pandoc, so man pages are created.

Using pandoc also has the side effect of getting rid of the ruby version
manager shenanigans that were in the Travis CI yaml configuration file.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============7687083924285858704==--

