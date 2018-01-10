Content-Type: multipart/mixed; boundary="===============6492528343236504169=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] dbaf76: lib: fix tpm2_print_usage() when
 tools have no opt...
Date: Wed, 10 Jan 2018 12:33:44 -0800
Message-ID: <5a5678a87e0e0_33672aecc6ed1c041092d8@hookshot-fe-6e9b612.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6492528343236504169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: dbaf76f07e8921ce0fffdc35bc3108a64fb222e3
      https://github.com/intel/tpm2-tools/commit/dbaf76f07e8921ce0fffdc35bc=
3108a64fb222e3
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2018-01-10 (Wed, 10 Jan 2018)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  lib: fix tpm2_print_usage() when tools have no options/args

For tools that takes no options and arguments, its struct tpm2_options is
NULL so trying to access it will lead to a NULL pointer dereference error.

This is checked in the main() function before calling tpm2_print_usage(),
but it was checked when tpm2_print_usage() was added as a fallback to the
--help option when executing the man pager fails.

Instead of relying of the caller to do the check, make tpm2_print_usage()
robust enough to cope with being called with a NULL struct tpm2_options.

After all, it makes no sense to print a usage text for a tool that takes
neither options nor arguments.

Fixes: #760

Reported-by: Emmanuel Deloget <logout(a)free.fr>
Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============6492528343236504169==--

