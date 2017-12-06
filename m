Content-Type: multipart/mixed; boundary="===============6929150112856721123=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 7c6e30: options: remove unused ':' case
 option and error m...
Date: Wed, 06 Dec 2017 08:47:47 -0800
Message-ID: <5a281f336c9b7_363f2ad843d41c144659e@hookshot-fe-cace476.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6929150112856721123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: 7c6e3027b58977b23ffe7cc6e91b6601da0f45bd
      https://github.com/intel/tpm2-tools/commit/7c6e3027b58977b23ffe7cc6e9=
1b6601da0f45bd
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-06 (Wed, 06 Dec 2017)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  options: remove unused ':' case option and error messages

By default the getopt_long() function prints an error message and returns
a '?' character to indicate an error. And it only returns a ':' on error
if the optstring starts with a colon.

So the ':' switch case wasn't used and also the printed error is unneeded
since getopt_long() already prints this.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: f383b3d38afb903242017c70022c486e8086b99f
      https://github.com/intel/tpm2-tools/commit/f383b3d38afb903242017c7002=
2c486e8086b99f
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-12-06 (Wed, 06 Dec 2017)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  options: print a message to use --help on wrong options

If a user provided wrong options to a tool, print a message indicating
that the --help option can be used to know how to use the tool.

While being there, remove assignments to the result variable that were
not used.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/intel/tpm2-tools/compare/20df3a07b597...f383b3d=
38afb

--===============6929150112856721123==--

