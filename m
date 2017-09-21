Content-Type: multipart/mixed; boundary="===============6216580718986644824=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] c50369: tpm2_getmanufec: add -N and -U
 options to man page
Date: Thu, 21 Sep 2017 11:26:13 -0700
Message-ID: <59c40445d4b7d_6c953fd3f7229c2c42097@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6216580718986644824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: c503693830d378d42dfb3e397ccb1b55b947f53a
      https://github.com/01org/tpm2-tools/commit/c503693830d378d42dfb3e397c=
cb1b55b947f53a
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M man/tpm2_getmanufec.1.md

  Log Message:
  -----------
  tpm2_getmanufec: add -N and -U options to man page

When the tool man page was converted to markdown format, some options were
not copied from the original roff document.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 77e2d0e2c8c92e03842263fd68164c7cf54b8775
      https://github.com/01org/tpm2-tools/commit/77e2d0e2c8c92e03842263fd68=
164c7cf54b8775
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: simplify error code propagation

Some functions return a gazillion different error codes but the caller
doesn't use this values and just checks if the return value is not 0.

So just return 1 in the case of error and 0 when succeeding.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: e90e625c20258a95dce8f8239c5db7e0fe60d719
      https://github.com/01org/tpm2-tools/commit/e90e625c20258a95dce8f8239c=
5db7e0fe60d719
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: fix options character string

Some of the tools option don't require an argument, but the optstring is
wrongly assuming that all the options need one. This leads to following:

$ tpm2_getmanufec -O
tpm2_getmanufec: option requires an argument -- 'O'
ERROR: Unknown Argument: O

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: a0e9215a05bbc922f29f6724506113573cc8f7c2
      https://github.com/01org/tpm2-tools/commit/a0e9215a05bbc922f29f672450=
6113573cc8f7c2
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: fix NULL pointer dereference due missing password options

The tool has options to specify passwords for the endorsement hierarchy,
endorsement primary key and the owner hierarchy. The first two are used
if the EK has to be created (when is not offline retrieved) and the last
one is used if the EK has to be made persistent in the TPM2.

All these passwords options are optional, but the tool assumes that are
always set and so attempts to access the NULL pointers:

$ tpm2_getmanufec
Segmentation fault (core dumped)

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 4e4b37249fc2137a92eb16524b31267d05e9d1ed
      https://github.com/01org/tpm2-tools/commit/4e4b37249fc2137a92eb16524b=
31267d05e9d1ed
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: remove new line characters in log message strings

Many log messages in the tool start with a new line character, but this
is not needed since the LOG_* macros ensures that a new line will always
be printed at the end of a log message.

In fact, it's wrong to do it since the macro prefix the log level to the
message, so starting with a '\n' will print messages like the following:

$ tpm2_getmanufec
ERROR:
EvictControl:Make EK persistent Error. TPM Error:0x1c4

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: a3d6df60d919f410bc7ce32cc01cea768aba96c6
      https://github.com/01org/tpm2-tools/commit/a3d6df60d919f410bc7ce32cc0=
1cea768aba96c6
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: only attempt to persist the EK if a handle was provided

The tool has a -H option to provide a persistent handle to store a EK, but
currently is trying to do it even if no handle was provided.

Make it fail early if that's the case since there's no point in attempting
an operation that will fail.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: b97b182402624b79979012cc84cd76c9634ceead
      https://github.com/01org/tpm2-tools/commit/b97b182402624b79979012cc84=
cd76c9634ceead
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: fix endorsement hierarchy authentication

Endorsement hierarchy authentication is broken since the HMAC size was not
correctly set. This leads to the following error:

$ tpm2_takeownership -e epass -o opass
$ $ tpm2_getmanufec -S https://ekop.intel.com/ekcertservice/ -H 0x81000000 \
  -E ECcert2.bin -f ek.bin -o opass -e epass
ERROR: EvictControl:Make EK persistent Error. TPM Error:0x9a2

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: e4d61b69fa39b4d0ee03f27809da84389d42e3ca
      https://github.com/01org/tpm2-tools/commit/e4d61b69fa39b4d0ee03f27809=
da84389d42e3ca
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getmanufec.sh

  Log Message:
  -----------
  tpm2_getmanufec: make sure temp files are cleaned up on test exit

If the test is interrupted, then temporary files may not be cleaned up
correctly. Ensure that the files are always removed on the script exit.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 06d3ec7bf7eb1b6d6a99c5a9e1a092b798b1bf08
      https://github.com/01org/tpm2-tools/commit/06d3ec7bf7eb1b6d6a99c5a9e1=
a092b798b1bf08
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getmanufec.sh

  Log Message:
  -----------
  tpm2_getmanufec: simplify commands exit code error checking for test

Many tests are now defining a handler for Bash's ERR signal to avoid the
need to check the exit status for each executed command. Do the same for
the test_tpm2_getmanufec.sh script.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 5b19cd88634a545a22dc97111faddbdd2a31fdf3
      https://github.com/01org/tpm2-tools/commit/5b19cd88634a545a22dc97111f=
addbdd2a31fdf3
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M test/system/test_tpm2_getmanufec.sh

  Log Message:
  -----------
  tpm2_getmanufec: add test case to exercise passwords options

There isn't a test to check if the options to provide the endorsement and
owner passwords are working correctly.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 1115326f81c4d44338305da10b907086c198c1f1
      https://github.com/01org/tpm2-tools/commit/1115326f81c4d44338305da10b=
907086c198c1f1
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-21 (Thu, 21 Sep 2017)

  Changed paths:
    M man/tpm2_getmanufec.1.md
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: switch to use tpm2_password_util_from_optarg

Most tools have been ported to use this helper function instead of open
coding it. Drop also the -X option since isn't needed anymore.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/01org/tpm2-tools/compare/d4b658ed6be7...1115326=
f81c4

--===============6216580718986644824==--

