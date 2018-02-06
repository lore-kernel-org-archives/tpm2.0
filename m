Content-Type: multipart/mixed; boundary="===============6123571649775603879=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] a89db7: lib: add routine for
 printing obj attrs
Date: Tue, 06 Feb 2018 09:49:51 -0800
Message-ID: <5a79eabf138e6_5b8a2acf7f8a9c14295d0@hookshot-fe-32b5f5b.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6123571649775603879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: a89db7a76dd2212ab06d7bbd6468117474026e98
      https://github.com/tpm2-software/tpm2-tools/commit/a89db7a76dd2212ab0=
6d7bbd6468117474026e98
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-06 (Tue, 06 Feb 2018)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h

  Log Message:
  -----------
  lib: add routine for printing obj attrs

Add a YAML print routine for TPMA_OBJECT attributes.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9922d7466587d77ebdea00ff432de7f14d56a145
      https://github.com/tpm2-software/tpm2-tools/commit/9922d7466587d77ebd=
ea00ff432de7f14d56a145
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-06 (Tue, 06 Feb 2018)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: clean up object attribute output

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 78a79961b7c72c437539d94a28886ed94607cc7a
      https://github.com/tpm2-software/tpm2-tools/commit/78a79961b7c72c4375=
39d94a28886ed94607cc7a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-06 (Tue, 06 Feb 2018)

  Changed paths:
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: clean up object attribute output

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 58a7a02113466562ae59a6fb65b1ff5d6f677212
      https://github.com/tpm2-software/tpm2-tools/commit/58a7a02113466562ae=
59a6fb65b1ff5d6f677212
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-06 (Tue, 06 Feb 2018)

  Changed paths:
    M test/system/tests/listpersistent.sh
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tpm2_listpersistent: clean up output

listpersist now outputs a YAML compliant list of dictionaries.

For exmaple:
- { persistent-handle: 0x81000000, key-alg: ecc, hash-alg: sha1, object-att=
r: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricted|decrypt=
 }
- { persistent-handle: 0x81000001, key-alg: keyedhash, hash-alg: sha256, ob=
ject-attr: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|restricted=
|decrypt }

Fixes: #557

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/b4952b5f8b30..=
.58a7a0211346

--===============6123571649775603879==--

