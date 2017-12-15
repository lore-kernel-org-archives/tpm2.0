Content-Type: multipart/mixed; boundary="===============1473593433409194598=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 55b0e4: test: test_tpm2_nv.sh
 large_file_name and large_fi...
Date: Fri, 15 Dec 2017 10:52:45 -0800
Message-ID: <5a3419fd2b204_74092ad3a35bbc1480771@hookshot-fe-cace476.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1473593433409194598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 55b0e448fb21813db67d8ae6afe9ac7bb82ad47d
      https://github.com/intel/tpm2-tools/commit/55b0e448fb21813db67d8ae6af=
e9ac7bb82ad47d
  Author: Jerry Snitselaar <jsnitsel(a)redhat.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test: test_tpm2_nv.sh large_file_name and large_file_read_name should be =
different

Currently both are set as nv.test_large_w, so the cmp -s after the redirect=
 tests
will be comparing nv.test_large_w to itself. Change large_file_read_name to
nv.test_large_r.

Signed-off-by: Jerry Snitselaar <jsnitsel(a)redhat.com>
Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b17985683926adeb6beed924b73de3a82f4a4642
      https://github.com/intel/tpm2-tools/commit/b17985683926adeb6beed924b7=
3de3a82f4a4642
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-15 (Fri, 15 Dec 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test_tpm2_nv.sh: whitespace fix

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/a6c4d9f0e098...b179856=
83926

--===============1473593433409194598==--

