Content-Type: multipart/mixed; boundary="===============3106044160762748547=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 69bd17: test: make sure temp files are
 cleaned up on test_...
Date: Mon, 11 Sep 2017 14:59:06 -0700
Message-ID: <59b7072a74d50_44793fc68d669c3c7840@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3106044160762748547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 69bd17f53b48f3779a0f159fb215513a7b5c31f8
      https://github.com/01org/tpm2-tools/commit/69bd17f53b48f3779a0f159fb2=
15513a7b5c31f8
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-11 (Mon, 11 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test: make sure temp files are cleaned up on test_tpm2_nv.sh exit

If the test is interrupted, then temporary files may not be cleaned up
correctly. Ensure that the files are always removed on the script exit.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 691a7e519dbe907cd97febd47589652810716072
      https://github.com/01org/tpm2-tools/commit/691a7e519dbe907cd97febd475=
89652810716072
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-11 (Mon, 11 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test: simplify commands exit code error checking for test_tpm2_nv.sh

Many tests are now defining a handler for Bash's ERR signal to avoid the
need to check the exit status for each executed command. Do the same for
the test_tpm2_nv.sh script.

While being there, also relase the NV area index in the exit handler.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/0d4aedd09b9e...691a7e5=
19dbe

--===============3106044160762748547==--

