Content-Type: multipart/mixed; boundary="===============4580889489406157092=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2.0-tools] bb856d: tpm2_getmanufec: handle output
 more gracefully
Date: Sat, 29 Jul 2017 16:51:54 -0700
Message-ID: <597d1f9aa3368_4c7f3fe13265dc241086c7@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4580889489406157092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2.0-tools
  Commit: bb856ded2c85093891c7f1f4608cd5f448f0b3d9
      https://github.com/01org/tpm2.0-tools/commit/bb856ded2c85093891c7f1f4=
608cd5f448f0b3d9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-07-29 (Sat, 29 Jul 2017)

  Changed paths:
    M man/tpm2_getmanufec.8.in
    M test/system/test_tpm2_getmanufec.sh
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: handle output more gracefully

Currently, the -E option will fail when -E is not specified:
$ tpm2_getmanufec -g 0x01 -O -N -U -f test_ek.pub -S https://ekop.intel.com=
/ekcertservice/
...
ERROR: Could not open file for writing: "(null)"

Make -E option, optional by making the default stdout. This requires
modifying the tool to stop outputing other information to sdout,
which is currently unused output in the test suite.

Make the information only output when verbose is enabled, this
includes curl verbose information.

Update errors and warnings to go to stderr.

Fixes: 361

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============4580889489406157092==--

