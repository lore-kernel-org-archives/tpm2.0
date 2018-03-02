Content-Type: multipart/mixed; boundary="===============2242064536402470443=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 5baac1: .ci/docker.env: fix
 coveralls
Date: Thu, 01 Mar 2018 16:25:05 -0800
Message-ID: <5a9899e1c9ba5_1fa62ac94da89bfc120e4@hookshot-fe-d2afb11.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2242064536402470443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master-fix-coveralls
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 5baac10e752e11d20b91cc0ef9d3a66cf0816c00
      https://github.com/tpm2-software/tpm2-tools/commit/5baac10e752e11d20b=
91cc0ef9d3a66cf0816c00
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-01 (Thu, 01 Mar 2018)

  Changed paths:
    M .ci/docker.env
    M .ci/docker.run

  Log Message:
  -----------
  .ci/docker.env: fix coveralls

Add COVERALLS_REPO_TOKEN so it's passed through
to docker and the coverage data can be uploaded.

Add the location of where coveralls binary is installed
to PATH so it can be found.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============2242064536402470443==--

