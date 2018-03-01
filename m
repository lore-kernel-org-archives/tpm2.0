Content-Type: multipart/mixed; boundary="===============0611057266153877867=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 0f7b2f: update to YES/NO removal
Date: Thu, 01 Mar 2018 13:37:22 -0800
Message-ID: <5a987292c8227_11142aea21e25c0898696@hookshot-fe-88eb02d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0611057266153877867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 0f7b2f68afb4dfdf2d31a6eb2de7b45e5eadfaf9
      https://github.com/tpm2-software/tpm2-tools/commit/0f7b2f68afb4dfdf2d=
31a6eb2de7b45e5eadfaf9
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M tools/tpm2_clearlock.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_flushcontext.c
    M tools/tpm2_getcap.c

  Log Message:
  -----------
  update to YES/NO removal

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9725b2b5f62495cf1fee8a2adcd8d74a0b87e2bb
      https://github.com/tpm2-software/tpm2-tools/commit/9725b2b5f62495cf1f=
ee8a2adcd8d74a0b87e2bb
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    A .ci/docker.env
    A .ci/docker.run
    A .ci/download-deps.sh
    R .ci/travis-build-and-run-tests.sh
    R .ci/travis-tss-install.sh
    M .travis.yml

  Log Message:
  -----------
  travis: use a custom docker container

Travis uses ancient docker and VM images. Switch to a custom
docker image that has all dependencies for the TSS stack pre-installed.

This has a few benefits:
1. Local testing by just running the docker command in the travis.yml file
2. Less dependency setup code in the travis.yml
3. ESAPI builds work on Travis now (the tools can start switching over)

This has a major draw backs:
1. Back on travis VM based builds, which can have long wait queues.
  A. A workaround to this, is you can run your full CI buildup locally
     so you can just merge outside of travis if need-be.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/7a09eaf32c13..=
.9725b2b5f624

--===============0611057266153877867==--

