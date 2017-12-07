Content-Type: multipart/mixed; boundary="===============0646778120830975207=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] a7ac8a: coverity: fix scan issue
Date: Thu, 07 Dec 2017 11:57:42 -0800
Message-ID: <5a299d36ef8ca_1f212ad162203c0432822@hookshot-fe-32b5f5b.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0646778120830975207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: a7ac8a61d653e2b79afc9a85c6133b299a6dbb3d
      https://github.com/intel/tpm2-tools/commit/a7ac8a61d653e2b79afc9a85c6=
133b299a6dbb3d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M .travis.yml
    M README.md

  Log Message:
  -----------
  coverity: fix scan issue

coverity_scan builds are failing with API access issues:
https://travis-ci.org/intel/tpm2-tools/builds/312695074

Error:
Coverity Scan analysis selected for branch coverity_scan.
Coverity Scan API access denied. Check $PROJECT_NA

The project name in Coverity was accidnetally renamed and the
project public key likely changed with the project rename/move,
so re-encrypt the coverity scan token.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 426e56ce7133a1df0b092abe6f54b97f53fd6253
      https://github.com/intel/tpm2-tools/commit/426e56ce7133a1df0b092abe6f=
54b97f53fd6253
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M tools/tpm2_listpersistent.c

  Log Message:
  -----------
  tpm2_listpersistent: Fix tmp assignment out of scope

Fixes Coverity Scan Bug: #1462506
https://scan7.coverity.com/reports.htm#v31687/p15508/fileInstanceId=3D42447=
779&defectInstanceId=3D9024616&mergedDefectId=3D1462506

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d1ec86db5c35f738d6b5bbfc0f1a20f1142ea015
      https://github.com/intel/tpm2-tools/commit/d1ec86db5c35f738d6b5bbfc0f=
1a20f1142ea015
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  tpm2_options: Fix NULL deref when a tool takes no options

Fixes Coverity Scan Bug: #1462505
https://scan7.coverity.com/reports.htm#v31687/p15508/fileInstanceId=3D42447=
757&defectInstanceId=3D9024615&mergedDefectId=3D1462505

Fixes: #684

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/4ab96a4e76e4...d1ec86d=
b5c35

--===============0646778120830975207==--

