Content-Type: multipart/mixed; boundary="===============3257921011742539215=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 97658a: configure: fix check for bash shell
Date: Mon, 06 Nov 2017 09:00:25 -0800
Message-ID: <5a0095294ffa2_7893fc3e5b4fc38449b8@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3257921011742539215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 97658a53ef54b9619a49e20bf9bf7d288f0ca8bf
      https://github.com/01org/tpm2-tools/commit/97658a53ef54b9619a49e20bf9=
bf7d288f0ca8bf
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



--===============3257921011742539215==--

