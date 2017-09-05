Content-Type: multipart/mixed; boundary="===============7523034907870750470=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 6e30c2: tpm2_getrandom: pass proper -o
 option in tpm2_getr...
Date: Tue, 05 Sep 2017 11:31:42 -0700
Message-ID: <59aeed8e94e87_32f83f973cdc5c2c171894@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7523034907870750470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 6e30c257155c3836248dc44d7e023e92be7aea8a
      https://github.com/01org/tpm2-tools/commit/6e30c257155c3836248dc44d7e=
023e92be7aea8a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getrandom_func.sh

  Log Message:
  -----------
  tpm2_getrandom: pass proper -o option in tpm2_getrandom_func test

The test has a typo in one of the commands, causing the following error:

$ ./test_tpm2_getrandom_func.sh
ERROR: Error converting size to a number, got: "o".
 create random_1.out fail, please check the environment or parameters!

While being there, also remove a commented out code that seems to be
a left over.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: ed3c6e56e50efd99f2070997126ce2179c215a91
      https://github.com/01org/tpm2-tools/commit/ed3c6e56e50efd99f207099712=
6ce2179c215a91
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M test/system/test_all.sh

  Log Message:
  -----------
  test: wire test_tpm2_getrandom_func.sh to test_all.sh

The test was broken since commit 6dba52d06f82 ("tpm2_getrandom: update
help and simplify interface"), but nobody noticed since wasn't executed
by the Travis CI. Add the test the test_all.sh set so it has coverage.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/0811d6dac0be...ed3c6e5=
6e50e

--===============7523034907870750470==--

