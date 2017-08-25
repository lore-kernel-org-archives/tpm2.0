Content-Type: multipart/mixed; boundary="===============8575574546997208507=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 0a5b89: lib/files: get file size from FILE
 pointer
Date: Fri, 25 Aug 2017 08:41:47 -0700
Message-ID: <59a0453b58f6d_5a803ff23a4adc441259bb@hookshot-fe3-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8575574546997208507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 0a5b891b5d8b4c7a6bcd8390dcbf8e76109943fe
      https://github.com/01org/tpm2-tools/commit/0a5b891b5d8b4c7a6bcd8390dc=
bf8e76109943fe
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h
    M lib/tpm2_policy.c
    M test/unit/test_files.c
    M tools/tpm2_akparse.c
    M tools/tpm2_create.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_encryptdecrypt.c
    M tools/tpm2_hash.c
    M tools/tpm2_hmac.c
    M tools/tpm2_load.c
    M tools/tpm2_loadexternal.c
    M tools/tpm2_makecredential.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvwrite.c
    M tools/tpm2_rsadecrypt.c
    M tools/tpm2_rsaencrypt.c
    M tools/tpm2_sign.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  lib/files: get file size from FILE pointer

Add routines to get a file size from a FILE object rather
than just via path. This exposes old, tested private API
as new internal public API and renames some routines to
make it more clear.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f68b7875e6a141d986d8f71278c0d98973ccc72b
      https://github.com/01org/tpm2-tools/commit/f68b7875e6a141d986d8f71278=
c0d98973ccc72b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M lib/files.c
    M lib/files.h

  Log Message:
  -----------
  lib/files: make error reporting optional

On routines that take FILE *, disabling the error logging is useful
when internal routines don't want error printing. For instance,
getting file size from a fifo (pipe stdin for example), will fail.

The code could use that failure to try a different approach.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a935a009146f571505628c218a7c06efd82e9eed
      https://github.com/01org/tpm2-tools/commit/a935a009146f571505628c218a=
7c06efd82e9eed
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M lib/tpm2_policy.c
    M lib/tpm_hash.c
    M lib/tpm_hash.h
    M tools/tpm2_sign.c
    M tools/tpm2_verifysignature.c

  Log Message:
  -----------
  tpm_hash: add tpm_hash_file()

Add a function that given a FILE object, uses the tpm to compute
a hash.

At the same time, document the tpm_hash routines, and simplify
the code. The hash routine for a flat BYTE array can use fmemopen()
and the FILE hashing method internally.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: b13c925d46e4af675fe869b90f2e4125493fa61c
      https://github.com/01org/tpm2-tools/commit/b13c925d46e4af675fe869b90f=
2e4125493fa61c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M tools/tpm2_hash.c

  Log Message:
  -----------
  tpm2_hash: add support for big files

Modify tpm2_hash to support files larger than 1024 bytes by
using the hash sequence command.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fc7ecb9facea304bf10598023bf17a496907ff23
      https://github.com/01org/tpm2-tools/commit/fc7ecb9facea304bf10598023b=
f17a496907ff23
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M tools/tpm2_hash.c

  Log Message:
  -----------
  tpm2_hash: cleanup output

Clean up the stdout output to support the -Q option and only
print things when a ticket is present.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 6388831d0fa3064bc97ab528a557db7323edd17b
      https://github.com/01org/tpm2-tools/commit/6388831d0fa3064bc97ab528a5=
57db7323edd17b
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M man/tpm2_hash.8.in
    M test/system/test_smoking.sh
    M test/system/test_tpm2_hash.sh
    M test/system/test_tpm2_hash_all.sh
    M test/system/test_tpm2_verifysignature.sh
    M tools/tpm2_hash.c

  Log Message:
  -----------
  tpm2_hash: drop -I option

Use a command argument instead of the -I option for input file.

Update hash tests

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a74e2fae223d6a460c08f2aad60bcb6476f308b8
      https://github.com/01org/tpm2-tools/commit/a74e2fae223d6a460c08f2aad6=
0bcb6476f308b8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M man/tpm2_hash.8.in
    M test/system/test_tpm2_hash.sh
    M tools/tpm2_hash.c

  Log Message:
  -----------
  tpm2_hash: make all options optional

Set up sane defaults for the myriad of options for tpm2_hash:
Inputs:
  hierarchy: NULL
  algorithm: sha/sha1 (same algorithm)

Outputs:
  ticket file: optional
  hash file:   optional

Now hashing can be done pretty simply:
$ echo foo | tpm2_hash
hash(sha):f1d2d2f924e986ac86fdf7b36c94bcdf32beec15

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ee83f004fb7fb87d6ce38a1cd69e428961f7e079
      https://github.com/01org/tpm2-tools/commit/ee83f004fb7fb87d6ce38a1cd6=
9e428961f7e079
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M lib/tpm_hash.c
    M test/system/test_tpm2_hmac.sh
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: add large file support

Support files over the tpm block size by using hmac sequencing.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 662f3dcbe31aee2d407165c184982f1b21329e4d
      https://github.com/01org/tpm2-tools/commit/662f3dcbe31aee2d407165c184=
982f1b21329e4d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M test/system/test_tpm2_hmac.sh

  Log Message:
  -----------
  test_tpm2_hmac: clean up testing file

Set up an on error and on exit handler for cleaning up
test artifacts as well as handling error messages
automatically.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0bad709d665e83f792b2ec92ab2d6eacf9226d41
      https://github.com/01org/tpm2-tools/commit/0bad709d665e83f792b2ec92ab=
2d6eacf9226d41
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M man/tpm2_hmac.8.in
    M test/system/test_tpm2_hmac.sh
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: drop -I option

Rather than specifying input via -I, make tpm2_hmac smart enough
to take either a file path argument or if none is specified,
default to stdin.

Update the tests to test stdin.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 39e59829708bded2a3176bc1fb45fe63e291d5f5
      https://github.com/01org/tpm2-tools/commit/39e59829708bded2a3176bc1fb=
45fe63e291d5f5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M man/tpm2_hmac.8.in
    M test/system/test_tpm2_hmac.sh
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: set default option values:

Set some reasonable default values for options.

Input:
 hash alg: sha1

Output:
 output file: optional

Update tests to test these.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fdd80c3eeeab57c29f350c9373f6490c69f72c7d
      https://github.com/01org/tpm2-tools/commit/fdd80c3eeeab57c29f350c9373=
f6490c69f72c7d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-25 (Fri, 25 Aug 2017)

  Changed paths:
    M test/system/test_tpm2_hmac.sh
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: use TOOL_OUTPUT

Use tool output so -Q works. Also, clean up output format:

$ tpm2_hmac -c ctx -g sha256 secret_data
hmac(sha256):87aa1df8dccbe431afdcc2064791690ea796b76006fe109988d656dad79868=
61

Test that -Q has no output.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/4db8f3f0df62...fdd80c3=
eeeab

--===============8575574546997208507==--

