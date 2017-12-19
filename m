Content-Type: multipart/mixed; boundary="===============8998977691575903134=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 13f11a: travis.yml: build and install
 autoconf-archive fro...
Date: Tue, 19 Dec 2017 08:23:47 -0800
Message-ID: <5a393d13b170a_16182b086eae5c1c83694@hookshot-fe-6b2eebc.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8998977691575903134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/2.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 13f11a4e038ad0bce37aa73340572ab3e2020932
      https://github.com/intel/tpm2-tools/commit/13f11a4e038ad0bce37aa73340=
572ab3e2020932
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-19 (Tue, 19 Dec 2017)

  Changed paths:
    M .ci/travis-tss-install.sh
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



--===============8998977691575903134==--

