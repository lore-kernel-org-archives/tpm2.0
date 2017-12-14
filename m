Content-Type: multipart/mixed; boundary="===============9153394291700626372=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] bdcb7d: travis.yml: build and install
 autoconf-archive fro...
Date: Thu, 14 Dec 2017 09:05:19 -0800
Message-ID: <5a32af4feaa0a_34bc2b176e13fc1c800af@hookshot-fe-265448d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9153394291700626372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: bdcb7d66f1a0b909a7de9a4322ac54c00d9fcf72
      https://github.com/intel/tpm2-tools/commit/bdcb7d66f1a0b909a7de9a4322=
ac54c00d9fcf72
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-14 (Thu, 14 Dec 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis.yml: build and install autoconf-archive from source

Commit 590ed9d2ed21 ("travis: fix autconf dependency on tss") fixed the
tpm2-tss dependency with the AX_CODE_COVERAGE macro, by fetching latest
autoconf-archive and copying the macro into the tpm2-tss source code m4
directory.

But now tpm2-abrmd also uses the macro for code coverage and so instead
of duplicating the same logic, install autoconf-archive in the machine.

While being there, clone the tpm2-abrmd repo from the latest URL.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 077524f627bc39cad61886c9991085dffe3ca590
      https://github.com/intel/tpm2-tools/commit/077524f627bc39cad61886c999=
1085dffe3ca590
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-14 (Thu, 14 Dec 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis.yml: fix travis error by fetching latest OpenSSL packages

The OpenSSL packages version changed so Travis CI was failing due trying
to download the ones that are no longer available.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/intel/tpm2-tools/compare/a725cde27a24...077524f=
627bc

--===============9153394291700626372==--

