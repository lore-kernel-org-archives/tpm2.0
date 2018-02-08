Content-Type: multipart/mixed; boundary="===============3849579686607794819=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 94622f: gitignore: ignore dist
 tarball
Date: Wed, 07 Feb 2018 18:26:38 -0800
Message-ID: <5a7bb55e99a01_6c182ae627743c1c6016a@hookshot-fe-88eb02d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3849579686607794819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 94622fdc692e25c7fb0c83e5960998074fe44724
      https://github.com/tpm2-software/tpm2-tools/commit/94622fdc692e25c7fb=
0c83e5960998074fe44724
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M .gitignore

  Log Message:
  -----------
  gitignore: ignore dist tarball

Add an ignore rule to ignore the generated dist tarball.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3a218c1f145bba0d440d59b87cf0f090d594ed57
      https://github.com/tpm2-software/tpm2-tools/commit/3a218c1f145bba0d44=
0d59b87cf0f090d594ed57
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M Makefile.am
    A lib/future/test/error.c
    A lib/tpm2_error.c
    A lib/tpm2_error.h
    A test/unit/test_tpm2_error.c

  Log Message:
  -----------
  liberror: introduce a new error decoding library

Introduce an error decoding interface similair to C's
strerror(3).

Add unit tests.

The tools will be consuming this for the 4.0 release under
ticket #769:
  - https://github.com/tpm2-software/tpm2-tools/issues/769

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 7d85b4d6a6998da3a46d1c29e6ca3e1e754b58f0
      https://github.com/tpm2-software/tpm2-tools/commit/7d85b4d6a6998da3a4=
6d1c29e6ca3e1e754b58f0
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M lib/log.h
    M lib/tpm2_error.c
    M lib/tpm2_util.h

  Log Message:
  -----------
  log: add LOG_PERR macro

Add a macro that prints an error message from Tss2_Sys calls.
The PERR name is a nod to C's perror routine, although
this macro takes the function that caused the error and the
return value.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 91e5b2ce99bea9ed53e58329489eee9a0798dcd6
      https://github.com/tpm2-software/tpm2-tools/commit/91e5b2ce99bea9ed53=
e58329489eee9a0798dcd6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M lib/tpm2_error.c
    M lib/tpm2_error.h
    M lib/tpm2_util.h
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  lib: drop error macros

Use the tpm2_error interface instead, since it
already has the same features.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3a028977adc9fe0a20f0e1ae8516fa721c5fb462
      https://github.com/tpm2-software/tpm2-tools/commit/3a028977adc9fe0a20=
f0e1ae8516fa721c5fb462
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_activatecredential.c

  Log Message:
  -----------
  tpm2_activatecredential: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 40faf549ff93ffe7f71a62841991aa2b56e1e3a3
      https://github.com/tpm2-software/tpm2-tools/commit/40faf549ff93ffe7f7=
1a62841991aa2b56e1e3a3
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_certify.c

  Log Message:
  -----------
  tpm2_certify: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 19ab8ec3ea992219e30e0a51e3d99dac31a2638c
      https://github.com/tpm2-software/tpm2-tools/commit/19ab8ec3ea992219e3=
0e0a51e3d99dac31a2638c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_changeauth.c

  Log Message:
  -----------
  tpm2_changeauth: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 00dbf8a79d7fae36c1066d679ac1c397835e699e
      https://github.com/tpm2-software/tpm2-tools/commit/00dbf8a79d7fae36c1=
066d679ac1c397835e699e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_clear.c

  Log Message:
  -----------
  tpm2_clear: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0ea4dcfaa1c295715a492cfa997adec5709bd9cc
      https://github.com/tpm2-software/tpm2-tools/commit/0ea4dcfaa1c295715a=
492cfa997adec5709bd9cc
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M test/system/tests/clearlock.sh
    M tools/tpm2_clearlock.c

  Log Message:
  -----------
  tpm2_clearlock: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c70f9dded2c173756f35b9cdf4fcd55bc3861e84
      https://github.com/tpm2-software/tpm2-tools/commit/c70f9dded2c173756f=
35b9cdf4fcd55bc3861e84
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ab711635349d77039f4186d547049e324ad599e8
      https://github.com/tpm2-software/tpm2-tools/commit/ab711635349d77039f=
4186d547049e324ad599e8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_createprimary.c

  Log Message:
  -----------
  tpm2_createprimary: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d3b048c27fa5e15aface432731416398d1e1641a
      https://github.com/tpm2-software/tpm2-tools/commit/d3b048c27fa5e15afa=
ce432731416398d1e1641a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_dictionarylockout.c

  Log Message:
  -----------
  tpm2_dictionarylockout: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: efeddfe99e906086f8886f0fb0c1c27024e78240
      https://github.com/tpm2-software/tpm2-tools/commit/efeddfe99e906086f8=
886f0fb0c1c27024e78240
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  tpm2_encryptdecrypt: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f0a1755862e485ba113b945121f9ec431fae8511
      https://github.com/tpm2-software/tpm2-tools/commit/f0a1755862e485ba11=
3b945121f9ec431fae8511
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_evictcontrol.c

  Log Message:
  -----------
  tpm2_evictcontrol: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f9b6c86db58cb037fc4781ed2558f31158a99d66
      https://github.com/tpm2-software/tpm2-tools/commit/f9b6c86db58cb037fc=
4781ed2558f31158a99d66
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_flushcontext.c

  Log Message:
  -----------
  tpm2_flushcontext: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: abdd26dad741af6b73076189db1606c0fef8f9b2
      https://github.com/tpm2-software/tpm2-tools/commit/abdd26dad741af6b73=
076189db1606c0fef8f9b2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_getcap.c

  Log Message:
  -----------
  tpm2_getcap: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 771c1a543e1a9f626207932df075d65b9c547418
      https://github.com/tpm2-software/tpm2-tools/commit/771c1a543e1a9f6262=
07932df075d65b9c547418
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_getmanufec.c

  Log Message:
  -----------
  tpm2_getmanufec: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 9538e518e8b656f7c94bd34a25e5829e3f18e490
      https://github.com/tpm2-software/tpm2-tools/commit/9538e518e8b656f7c9=
4bd34a25e5829e3f18e490
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: eb3e71a844899b31c7b4485affce585bed0ac1a2
      https://github.com/tpm2-software/tpm2-tools/commit/eb3e71a844899b31c7=
b4485affce585bed0ac1a2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_getpubek.c

  Log Message:
  -----------
  tpm2_getpubek: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 1d571f43494392d3153ea4b4b475718dcf23311a
      https://github.com/tpm2-software/tpm2-tools/commit/1d571f43494392d315=
3ea4b4b475718dcf23311a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_getrandom.c

  Log Message:
  -----------
  tpm2_getrandom: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 33ef154f7adbc33b11eec16c1e189cce73c2d75a
      https://github.com/tpm2-software/tpm2-tools/commit/33ef154f7adbc33b11=
eec16c1e189cce73c2d75a
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M tools/tpm2_hmac.c

  Log Message:
  -----------
  tpm2_hmac: update error output

Update the tool to use the tpm2_error interfaces to
print nice, human readable errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 3b3e42cac99212d0df00b2f59327a80632e770b5
      https://github.com/tpm2-software/tpm2-tools/commit/3b3e42cac99212d0df=
00b2f59327a80632e770b5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-07 (Wed, 07 Feb 2018)

  Changed paths:
    M test/system/tests/tcti/abrmd/extended-sessions.sh

  Log Message:
  -----------
  [REVERTME] tests: disable extended-sessions

An issue in abrmd appears to have broken extended sessions.
We still wish to run the tests, but report them as passing
until the bug can be root-caused and corrected.

See:
https://github.com/tpm2-software/tpm2-abrmd/issues/317

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/9a1d94882f4c..=
.3b3e42cac992

--===============3849579686607794819==--

