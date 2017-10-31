Content-Type: multipart/mixed; boundary="===============2554562162847469076=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 5c736f: test: nv check that passwords work
Date: Tue, 31 Oct 2017 08:14:51 -0700
Message-ID: <59f8936b79fd7_25363fe125f0bc34712b1@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2554562162847469076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 5c736fdf5a238a82fc47143034fccc030966cd15
      https://github.com/01org/tpm2-tools/commit/5c736fdf5a238a82fc47143034=
fccc030966cd15
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M test/system/test_tpm2_nv.sh

  Log Message:
  -----------
  test: nv check that passwords work

Not only does this serve as a good example of how to use index and owner
authorizations, this also tests that passwords enforcement works as
expected.

Fixes: #580

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: ed41c04dc1065474360215a5b9c4e12e59dffe42
      https://github.com/01org/tpm2-tools/commit/ed41c04dc1065474360215a5b9=
c4e12e59dffe42
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M man/tpm2_nvwrite.1.md
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: add starting offset

Add the -o option to allow specifying a starting offset
for the write.

Add a check to ensure that the write will fit before starting
to write. This will help prevent data integrity issue when a
write only partially completes.

Add tests to ensure:
  - offset writes are functional.
  - offset data sizes past the defined nv space fail and do not
    modify the contents.

Fixes: #505

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: a851da7fb969a286a66e9e1c0a6dd5af7cb7e9f8
      https://github.com/01org/tpm2-tools/commit/a851da7fb969a286a66e9e1c0a=
6dd5af7cb7e9f8
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: fix space size

Size is a UINT16 but the argument paramater was a UINT32. Make
it match as a UINT16 to avoid truncation errors.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e84490479b5db19125e729b0a06ee7118820063c
      https://github.com/01org/tpm2-tools/commit/e84490479b5db19125e729b0a0=
6ee7118820063c
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M man/tpm2_nvwrite.1.md
    M test/system/test_tpm2_nv.sh
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: make -f an argument

File is now an argument versus an option and support for
reading from stdin now exists.

Fixes: #506

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: dc1242a8b0149675d4c3921a43747c4e56b7ecab
      https://github.com/01org/tpm2-tools/commit/dc1242a8b0149675d4c3921a43=
747c4e56b7ecab
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: add warning on size 0 writes

Writing size 0 bytes to an nv index is not an error as far
as the TPM is concerned. However, most users would expect that
they are writing data.

Add a warning to let the user know that they are writing 0 bytes
to the nv index, but proceed with writing.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 2f8a120f0140cba57ff306957ddf47671b522a82
      https://github.com/01org/tpm2-tools/commit/2f8a120f0140cba57ff306957d=
df47671b522a82
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: issue a warning on size 0 defines

Defining an nv index with a size of 0 is valid, however,
the index is essentially unusable for storing data.

Issue a warning on size 0 index sizes.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 19e16358316e0344f3f9002e186ae2a3b94df96d
      https://github.com/01org/tpm2-tools/commit/19e16358316e0344f3f9002e18=
6ae2a3b94df96d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-10-31 (Tue, 31 Oct 2017)

  Changed paths:
    M man/tpm2_nvdefine.1.md
    M tools/tpm2_nvdefine.c

  Log Message:
  -----------
  tpm2_nvdefine: default size to MAX_NV_INDEX_SIZE

The current default size of 0 causes a warning, set the
size to MAX_NV_INDEX_SIZE so users get something, even
if sub-optimal and wasteful.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/539ea8898df7...19e1635=
8316e

--===============2554562162847469076==--

