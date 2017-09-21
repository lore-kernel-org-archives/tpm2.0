Content-Type: multipart/mixed; boundary="===============3664376064412844563=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] d4b658: test: use ECC algorithm instead of
 RSA for primary...
Date: Thu, 21 Sep 2017 07:44:22 -0700
Message-ID: <59c3d04657229_550d3fd84be07c30557b7@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3664376064412844563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: d4b658ed6be705301af5240f05e9eea41effa821
      https://github.com/01org/tpm2-tools/commit/d4b658ed6be705301af5240f05=
e9eea41effa821
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_unseal.sh

  Log Message:
  -----------
  test: use ECC algorithm instead of RSA for primary key in tpm2_unseal

Creating a primary key may take a lot of time, specially when using the
RSA algorithm. Since for test we can use any algorithm, use ECC instead
to speed up the test on most systems.

While being there, do other cleanups like using pretty names instead of
hexadecimal values and use the -E option in the tpm2_create command so
the needed object attributes are set by the tool.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============3664376064412844563==--

