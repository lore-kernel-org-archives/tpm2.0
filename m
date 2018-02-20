Content-Type: multipart/mixed; boundary="===============2495447210263355831=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 2096ee: ci: Disable ESAPI build in
 tss.
Date: Tue, 20 Feb 2018 09:24:32 -0800
Message-ID: <5a8c59d0b9688_42fa2b2877dd9c106952c@hookshot-fe-6b2eebc.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2495447210263355831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 2096ee2f223a3a7afe9c07cdd99cd3de45a01f2f
      https://github.com/tpm2-software/tpm2-tools/commit/2096ee2f223a3a7afe=
9c07cdd99cd3de45a01f2f
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2018-02-20 (Tue, 20 Feb 2018)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  ci: Disable ESAPI build in tss.

Enabling the ESAPI library requires that we have libgcrypt 2.0 and its
development packages. Installing the libgcrypt20-dev and
libcurl4-openssl-dev package at the same time causes travis to freak out
though. Till somone has the wearwithal to debug the broken / old Ubuntu
packages that travis-ci still uses the easiest thing to do is to disable
the ESAPI library since the tools don't need it.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>


  Commit: 6f6f47a919eb1bc0068f0314f25dc702b26e9a7a
      https://github.com/tpm2-software/tpm2-tools/commit/6f6f47a919eb1bc006=
8f0314f25dc702b26e9a7a
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2018-02-20 (Tue, 20 Feb 2018)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  ci: Set sudo to 'false' to use container build.

This also removes the duplicate 'dist' entry.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/d3d4838bfe2d..=
.6f6f47a919eb

--===============2495447210263355831==--

