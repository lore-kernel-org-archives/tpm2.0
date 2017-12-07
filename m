Content-Type: multipart/mixed; boundary="===============6633364636778563116=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] b241b3: coverity: fix scan issue
Date: Thu, 07 Dec 2017 11:57:23 -0800
Message-ID: <5a299d23d1c48_4b6a2b22f7aefc143156@hookshot-fe-6e9b612.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6633364636778563116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: b241b309f3382f7349749061636be36302193928
      https://github.com/intel/tpm2-tools/commit/b241b309f3382f734974906163=
6be36302193928
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


  Commit: 02442803cbf553404cf3cd4b46ec376de7889ca1
      https://github.com/intel/tpm2-tools/commit/02442803cbf553404cf3cd4b46=
ec376de7889ca1
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


  Commit: 1f14ccc9a11b447faa8af4d2b32174bd0c21fab5
      https://github.com/intel/tpm2-tools/commit/1f14ccc9a11b447faa8af4d2b3=
2174bd0c21fab5
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


Compare: https://github.com/intel/tpm2-tools/compare/6d6656f91e5f...1f14ccc=
9a11b

--===============6633364636778563116==--

