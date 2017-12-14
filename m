Content-Type: multipart/mixed; boundary="===============0480605781476013803=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 438059: travis.yml: build and install
 autoconf-archive fro...
Date: Thu, 14 Dec 2017 08:53:13 -0800
Message-ID: <5a32ac795f390_8a12ac33e261c14425b@hookshot-fe-d2afb11.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0480605781476013803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 438059053b5545226f993986d36b6ed78b6a78da
      https://github.com/intel/tpm2-tools/commit/438059053b5545226f993986d3=
6b6ed78b6a78da
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

While being there, clone the tpm2-{tss,abrmd} repos from the latest URL.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: b08643267775aa45d71dfe41b01da60879f160a3
      https://github.com/intel/tpm2-tools/commit/b08643267775aa45d71dfe41b0=
1da60879f160a3
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


Compare: https://github.com/intel/tpm2-tools/compare/771a1831d01a...b086432=
67775

--===============0480605781476013803==--

