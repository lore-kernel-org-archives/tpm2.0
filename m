Content-Type: multipart/mixed; boundary="===============7795464911064508837=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 6f78d5: coverity: fix scan issue
Date: Thu, 07 Dec 2017 10:40:49 -0800
Message-ID: <5a298b3198975_6cd02b0fb57fdc042972e@hookshot-fe-2cc8887.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7795464911064508837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/intel/tpm2-tools
  Commit: 6f78d52e005f29e30a0296d51a495af4fe9f7402
      https://github.com/intel/tpm2-tools/commit/6f78d52e005f29e30a0296d51a=
495af4fe9f7402
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-12-07 (Thu, 07 Dec 2017)

  Changed paths:
    M .travis.yml

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



--===============7795464911064508837==--

