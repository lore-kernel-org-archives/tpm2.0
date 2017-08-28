Content-Type: multipart/mixed; boundary="===============7361979356790120363=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] ef1aab: man pages: include some
 clarifications and fix som...
Date: Mon, 28 Aug 2017 11:00:11 -0700
Message-ID: <59a45a2b44dbd_64723fe13c4ebc2485237@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7361979356790120363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: ef1aab2c39a1f15fe913361a923b3c4948f395c6
      https://github.com/01org/tpm2-tools/commit/ef1aab2c39a1f15fe913361a92=
3b3c4948f395c6
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-08-28 (Mon, 28 Aug 2017)

  Changed paths:
    M Makefile.am
    M man/alg-common.troff
    A man/alg-notes-common.troff
    M man/tpm2_akparse.8.in
    M man/tpm2_getpubak.8.in
    M man/tpm2_getpubek.8.in
    M man/tpm2_quote.8.in

  Log Message:
  -----------
  man pages: include some clarifications and fix some typos

For new users it is helpful to know which key lengths and parameters are
actually produced by tpm2_getpub*, also what kind of data is output for
public key portions and by tpm2_akparse.


  Commit: 0f22b29c40ee31f3dd1f6bf99db60d27e810aac1
      https://github.com/01org/tpm2-tools/commit/0f22b29c40ee31f3dd1f6bf99d=
b60d27e810aac1
  Author: Matthias Gerstner <matthias.gerstner(a)suse.de>
  Date:   2017-08-28 (Mon, 28 Aug 2017)

  Changed paths:
    M man/tpm2_akparse.8.in

  Log Message:
  -----------
  tpm2_akparse man page: remove format details from description

According to PR #426 comment it's supposed to be opaque.


Compare: https://github.com/01org/tpm2-tools/compare/57e0e4d40e64...0f22b29=
c40ee

--===============7361979356790120363==--

