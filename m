Content-Type: multipart/mixed; boundary="===============3695484848459120595=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 47fd59: coveralls: fix uploads
Date: Mon, 21 Aug 2017 12:55:57 -0700
Message-ID: <599b3acdd2d30_2d243f830065fc30659bb@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3695484848459120595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 47fd59d7fb1f811b564a9022a8695457ae3c0fec
      https://github.com/01org/tpm2-tools/commit/47fd59d7fb1f811b564a9022a8=
695457ae3c0fec
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-21 (Mon, 21 Aug 2017)

  Changed paths:
    M .ci/coveralls-upload.sh
    M .ci/travis-build-and-run-tests.sh
    M .travis.yml

  Log Message:
  -----------
  coveralls: fix uploads

Coveralls was not being updated as ENABLE_COVERAGE was exported in
a seperate environment and not preserved when invoking the coveralls
upload script. Move the coveralls upload invocation within that
environment.

Also, the COVERALLS_REPO_TOKEN is not set by travis when building
PRs, so make it a non fatal error if it's not set

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============3695484848459120595==--

