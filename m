Content-Type: multipart/mixed; boundary="===============6357684843910816661=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] e467da: configure: fix check for bash shell
Date: Mon, 06 Nov 2017 09:51:35 -0800
Message-ID: <5a00a1278fea1_11983fbbe0987c3c809c1@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6357684843910816661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/01org/tpm2-tools
  Commit: e467da975d819cacebd24060923b45d809f363ee
      https://github.com/01org/tpm2-tools/commit/e467da975d819cacebd2406092=
3b45d809f363ee
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-06 (Mon, 06 Nov 2017)

  Changed paths:
    M configure.ac

  Log Message:
  -----------
  configure: fix check for bash shell

The bash shell sets the BASH variable with the full path name used to
execute the current instance of bash. But the configure script uses it
to attempt to check if the bash binary is present on a given system.

The configure script uses the #!/bin/sh shebang, so on a system where
/bin/sh is the bash shell, the configure script will fail to find the
bash binary due BASH being set to /bin/sh:

checking for bash... /bin/sh
configure: WARNING: Required executable bash not found, system tests requir=
e a bash shell!

Use instead a variable name that isn't an internal one used by bash.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============6357684843910816661==--

