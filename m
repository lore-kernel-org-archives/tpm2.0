Content-Type: multipart/mixed; boundary="===============5223083121645238484=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 7b8ad1: tpm2_startup: port to new option
 handler
Date: Tue, 05 Sep 2017 14:52:50 -0700
Message-ID: <59af1cb25c457_34913fd5939d9c2c195487@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5223083121645238484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/tpm2-option-revamp
  Home:   https://github.com/01org/tpm2-tools
  Commit: 7b8ad164fb308d8b9a6044bf58e68305334d8bae
      https://github.com/01org/tpm2-tools/commit/7b8ad164fb308d8b9a6044bf58=
e68305334d8bae
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M man/tpm2_startup.8.in
    M test/system/test_tpm2_startup.sh
    M tools/tpm2_startup.c

  Log Message:
  -----------
  tpm2_startup: port to new option handler

1. fix manpage
2. drop default option --state

$ ./test_tpm2_startup.sh && echo startup
tpm2_startup success
startup

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 258b46a26c5bf62c64ac342f1d46330d6d9516c3
      https://github.com/01org/tpm2-tools/commit/258b46a26c5bf62c64ac342f1d=
46330d6d9516c3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_sign.c

  Log Message:
  -----------
  tpm2_sign: port to new opts

untested, depends on load

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a1b451db20876dbb17364f81c63407dfd7a2cced
      https://github.com/01org/tpm2-tools/commit/a1b451db20876dbb17364f81c6=
3407dfd7a2cced
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-09-05 (Tue, 05 Sep 2017)

  Changed paths:
    M Makefile.am
    M tools/tpm2_send_command.c

  Log Message:
  -----------
  tpm2_send_command: update to new opts

Tested:
$ ./test_tpm2_send_command.sh
tpm2_send_command success
$ echo $?
0

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/768537328778...a1b451d=
b2087

--===============5223083121645238484==--

