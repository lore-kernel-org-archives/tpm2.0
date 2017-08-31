Content-Type: multipart/mixed; boundary="===============7047483413329504992=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 57feb3: tpm2_hash: Drop -I option in man
 page example
Date: Thu, 31 Aug 2017 11:39:05 -0700
Message-ID: <59a857c9f1b06_fae3fe3edf23c38420384@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7047483413329504992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 57feb39b33570a2dd59c4d7aa6f8256b32b24ff6
      https://github.com/01org/tpm2-tools/commit/57feb39b33570a2dd59c4d7aa6=
f8256b32b24ff6
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-08-31 (Thu, 31 Aug 2017)

  Changed paths:
    M man/tpm2_hash.8.in

  Log Message:
  -----------
  tpm2_hash: Drop -I option in man page example

The commit 6388831 ("tpm2_hash: drop -I option") changed tpm2_hash tool
to get the data to hash from either the standard input or a file. So it
removed the -I option.

But forgot to update the example in the man page. While being there, do
as other examples in man pages and show a specific command instead of a
generic one.

Fixes: #441

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============7047483413329504992==--

