Content-Type: multipart/mixed; boundary="===============2171066485859513579=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c7c1bc: test: remove duplicate execution of
 test_tpm2_evic...
Date: Fri, 01 Sep 2017 07:44:52 -0700
Message-ID: <59a972646f880_311d3f9a5546bc3c92769@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2171066485859513579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: c7c1bc4c70e327e048a4424b9dfb5fba50524d04
      https://github.com/01org/tpm2-tools/commit/c7c1bc4c70e327e048a4424b9d=
fb5fba50524d04
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-01 (Fri, 01 Sep 2017)

  Changed paths:
    M test/system/test_all.sh

  Log Message:
  -----------
  test: remove duplicate execution of test_tpm2_evictcontrol.sh

The test was executed twice in test_all.sh, remove one of them.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 5b244047e445741549ab624eb199d120bc411994
      https://github.com/01org/tpm2-tools/commit/5b244047e445741549ab624eb1=
99d120bc411994
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-01 (Fri, 01 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_pcrevent.sh

  Log Message:
  -----------
  test: Use relative path for yaml_get.py in test_tpm2_pcrevent.sh

The test_all.sh script adds the tests directory in the $PATH variable but
that's not the case when the tests are executed standalone. In this case,
the test_tpm2_pcrevent.sh doesn't find the yaml_get.py and fails with:

$ ./test_tpm2_pcrevent.sh
./test_tpm2_pcrevent.sh: line 74: yaml_get.py: command not found
old_pcr_value=3D`yaml_get.py sha1 9 $yaml_out_file` on line 74 failed: 127

Tests are expected to be executed inside the test/system sub-directory,
so just use a relative path for the yaml_get.py script.

While being there, add a printout to notify that the test was executed
successfully to be consistent with the other tests that do the same.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/57feb39b3357...5b24404=
7e445

--===============2171066485859513579==--

