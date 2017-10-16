Content-Type: multipart/mixed; boundary="===============6705009690870937275=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 47662b: update travis to use openssl 1.0.1g
Date: Mon, 16 Oct 2017 09:11:06 -0700
Message-ID: <59e4da1adc75c_9ef33fac566c9c28495f1@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6705009690870937275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 47662b002757e8fdb9862aad9a94b6510e957d56
      https://github.com/01org/tpm2-tools/commit/47662b002757e8fdb9862aad9a=
94b6510e957d56
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-16 (Mon, 16 Oct 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  update travis to use openssl 1.0.1g

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e7e2ccf76b44059058f2f3ca9ed2355609293b4d
      https://github.com/01org/tpm2-tools/commit/e7e2ccf76b44059058f2f3ca9e=
d2355609293b4d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-16 (Mon, 16 Oct 2017)

  Changed paths:
    M configure.ac

  Log Message:
  -----------
  configure: libcrypto must be newer than 1.0.2g

tpm2_import has a dependency on:
RSA_padding_add_PKCS1_OAEP_mgf1

This is not available in older version of libcrypto.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: eccba17e6ce1beb4721088c12f1b39016913361c
      https://github.com/01org/tpm2-tools/commit/eccba17e6ce1beb4721088c12f=
1b39016913361c
  Author: Imran Desai <imran.desai(a)intel.com>
  Date:   2017-10-16 (Mon, 16 Oct 2017)

  Changed paths:
    M Makefile.am
    M lib/tpm2_util.h
    A man/tpm2_import.1.md
    A test/system/test_tpm2_import.sh
    A tools/tpm2_import.c

  Log Message:
  -----------
  [WIP] tpm2_import: new tool that uses tpm2_import to import a key

TODO:
1. --parent-key-public should be optional, just read it in if not specified.

Limited to importing a symmetric AES-128 key.
^^^
Is this true? Can we import asymmetric keys through import command?

Add tests.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/1e1ba978f7ab...eccba17=
e6ce1

--===============6705009690870937275==--

