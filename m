Content-Type: multipart/mixed; boundary="===============0378244156034464719=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] ba5184: travis: update tcti options
 for abrmd
Date: Thu, 08 Feb 2018 15:58:22 -0800
Message-ID: <5a7ce41e52d47_94f2b1da4ffbc1076650@hookshot-fe-d252ca1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0378244156034464719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: ba518453e280e85b32ffcbb12dd0bf032c49f25a
      https://github.com/tpm2-software/tpm2-tools/commit/ba518453e280e85b32=
ffcbb12dd0bf032c49f25a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-08 (Thu, 08 Feb 2018)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  travis: update tcti options for abrmd

abrmd has a new dynamic tcti option, update travis to use
it.

Note: --disable-dlclose works around these bugs:
  - https://github.com/tpm2-software/tpm2-abrmd/issues/323
  - https://github.com/tpm2-software/tpm2-tools/commit/130582559d7c51d18e3c=
e82803c30bc161d9c34d#diff-9a57bc4e2757e72fe020a15ac7775dfa

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============0378244156034464719==--

