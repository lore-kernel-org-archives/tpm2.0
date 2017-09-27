Content-Type: multipart/mixed; boundary="===============5348103983046026205=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 5f0121: test_tpm2_dictionarylockout:
 cleanup tests
Date: Wed, 27 Sep 2017 16:54:26 -0700
Message-ID: <59cc3a327e733_1f183f998befdc386309f@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5348103983046026205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 5f012189b51798e8015515a4beb3b91467b81e06
      https://github.com/01org/tpm2-tools/commit/5f012189b51798e8015515a4be=
b3b91467b81e06
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_dictionarylockout.sh

  Log Message:
  -----------
  test_tpm2_dictionarylockout: cleanup tests

Add an error handler and clean up testing output.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fe09aa97673c0faffe17b489aa1e1c47d3870395
      https://github.com/01org/tpm2-tools/commit/fe09aa97673c0faffe17b489aa=
1e1c47d3870395
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getmanufec.sh

  Log Message:
  -----------
  test_tpm2_getmanufec: cleanup tests

Add an error handler and clean up testing output.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d4bcf494a38a75e5afbce1d5619acfc97b9cc11e
      https://github.com/01org/tpm2-tools/commit/d4bcf494a38a75e5afbce1d561=
9acfc97b9cc11e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getpubak.sh

  Log Message:
  -----------
  test_tpm2_getpubak: cleanup tests

Add an error handler and clean up testing output.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 15880ea0bff4de95d1aac1219f8545f912d94036
      https://github.com/01org/tpm2-tools/commit/15880ea0bff4de95d1aac1219f=
8545f912d94036
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getpubek.sh

  Log Message:
  -----------
  test_tpm2_getpubek: cleanup tests

Add an error handler and clean up testing output.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: db3f7cd48e68272368b97c45134719110d712eb3
      https://github.com/01org/tpm2-tools/commit/db3f7cd48e68272368b97c4513=
4719110d712eb3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getrandom.sh

  Log Message:
  -----------
  test_tpm2_getrandom: cleanup tests

Add an error handler and clean up testing output.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 57baccb0795674ba1c52526dc99feb29ba596648
      https://github.com/01org/tpm2-tools/commit/57baccb0795674ba1c52526dc9=
9feb29ba596648
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    R test/system/test_tpm2_getrandom_func.sh

  Log Message:
  -----------
  test: remove test_tpm2_getrandom_func.sh

This is already tested by test_tpm2_getrandom.sh

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 96af03778819a919ccf997aa201d806c5ae89c9c
      https://github.com/01org/tpm2-tools/commit/96af03778819a919ccf997aa20=
1d806c5ae89c9c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_evictcontrol.sh

  Log Message:
  -----------
  test: fix test_tpm2_evictcontrol

Update to use trap handler for error reporting and
cleanup duties.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: db879566a6c281a318b3697e65c403291e49cc7c
      https://github.com/01org/tpm2-tools/commit/db879566a6c281a318b3697e65=
c403291e49cc7c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    A test/system/test_tpm2_createprimary.sh
    R test/system/test_tpm2_createprimary_all.sh

  Log Message:
  -----------
  renamse test_tpm2_createprimary_all.sh

Rename test_tpm2_createprimary_all.sh to test_tpm2_createprimary.sh
to follow the test naming conventions.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 58458fcfd5b2a769115bde1d93f702d0bef28f2e
      https://github.com/01org/tpm2-tools/commit/58458fcfd5b2a769115bde1d93=
f702d0bef28f2e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    A test/system/test_tpm2_create.sh
    R test/system/test_tpm2_create_all.sh

  Log Message:
  -----------
  renamse test_tpm2_create_all.sh

Rename test_tpm2_create_all.sh to test_tpm2_create.sh
to follow the test naming conventions.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0a3ac62ac0f2326b63595f3c94b38219b19b4760
      https://github.com/01org/tpm2-tools/commit/0a3ac62ac0f2326b63595f3c94=
b38219b19b4760
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    R test/system/test_tpm2_hash_all.sh

  Log Message:
  -----------
  delete test_tpm2_hash_all.sh

This test doesn't really add anything that test_tpm2_hash.sh does.
It tests algorithms that may not be supported by the tpm as well.

Since tpm2_tools is more about plumbing than exhaustivley testing
the tpm, just remove it.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9f486e19d916d3fca0e443d617e1108411a4adab
      https://github.com/01org/tpm2-tools/commit/9f486e19d916d3fca0e443d617=
e1108411a4adab
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-27 (Wed, 27 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_hmac.sh

  Log Message:
  -----------
  test: tpm2_hmac clean up output

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/2a8ccbf0828c...9f486e1=
9d916

--===============5348103983046026205==--

