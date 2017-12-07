Content-Type: multipart/mixed; boundary="===============6582873194628692260=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] c6e342: coverity: fix scan issue
Date: Thu, 07 Dec 2017 10:30:14 -0800
Message-ID: <5a2988b663fd8_60ce2af75255fc0c2038f@hookshot-fe-88eb02d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6582873194628692260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/intel/tpm2-tools
  Commit: c6e34225cbc388da75ec9ca51dd6bf2bb23fed8c
      https://github.com/intel/tpm2-tools/commit/c6e34225cbc388da75ec9ca51d=
d6bf2bb23fed8c
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

I suspect it has to do with name.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============6582873194628692260==--

