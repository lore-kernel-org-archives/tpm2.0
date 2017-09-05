Content-Type: multipart/mixed; boundary="===============4354891232955679055=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 25c6ef: tpm2_getrandom: cleanup temporary
 files created by...
Date: Tue, 05 Sep 2017 11:58:34 -0700
Message-ID: <59aef3daa8768_3bad3fe580af9c4012429a@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4354891232955679055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 25c6ef6e742a0b65cad2a4886a95b17fa1fd9170
      https://github.com/01org/tpm2-tools/commit/25c6ef6e742a0b65cad2a4886a=
95b17fa1fd9170
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getrandom_func.sh

  Log Message:
  -----------
  tpm2_getrandom: cleanup temporary files created by test

The tpm2_getrandom_func test leaves a lot of temporary files around,
make sure those are cleaned up correctly when the script exits.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============4354891232955679055==--

