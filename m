Content-Type: multipart/mixed; boundary="===============7119294966332123871=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] af570e: .ci/docker.env: fix
 coveralls
Date: Fri, 02 Mar 2018 08:47:35 -0800
Message-ID: <5a998027130a9_60502aeeae387c106428a@hookshot-fe-7191cb1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7119294966332123871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: af570e388f1d0b4df74d0984ca70874d2438221a
      https://github.com/tpm2-software/tpm2-tools/commit/af570e388f1d0b4df7=
4d0984ca70874d2438221a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-03-02 (Fri, 02 Mar 2018)

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



--===============7119294966332123871==--

