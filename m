Content-Type: multipart/mixed; boundary="===============0933517752108226537=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] ed68e7: .travis.yml: cat cmocka results to
 stdout
Date: Wed, 02 Aug 2017 14:02:42 -0700
Message-ID: <59823df24ee4b_2fbf3f82cd0f1c2c275b0@hookshot-fe1-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0933517752108226537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: ed68e71074ff4d7d09b79b727c846ea0245f3046
      https://github.com/01org/tpm2-tools/commit/ed68e71074ff4d7d09b79b727c=
846ea0245f3046
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  .travis.yml: cat cmocka results to stdout

When the unit tests fail, its a black hole becuase all of the
data goes to a file called test-suite.log. Cat that file
to stdout so the failure details end up on the server output.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: f5a3566fd8161e9529681a2dce2bfe5d8c9c2fa6
      https://github.com/01org/tpm2-tools/commit/f5a3566fd8161e9529681a2dce=
2bfe5d8c9c2fa6
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M lib/tpm2_alg_util.c
    M lib/tpm2_alg_util.h
    M test/unit/test_tpm2_alg_util.c

  Log Message:
  -----------
  tpm2_alg_util: add routines and tests for parsing digest spec

Introduce a digest specification language that can be used
by forthcoming tools like tpm2_pcr_extend.

The digest specification is as follows:
  - A pcr identifier as understood by strtoul with 0 as the base.
  - A colon followed by the algorithm hash specification.
  - The algorithm hash specification is as follows:
      - The algorithm friendly name or raw numerical as understood by
  strtoul with a base of 0.
      - An equals sign
      - The hex hash value.

  This all distills to a string that looks like this:
  <pcr index>:<hash alg id>=3D<hash value>

  Example:
    "4:sha=3Df1d2d2f924e986ac86fdf7b36c94bcdf32beec15"

  Note:
    Multiple specifications of PCR and hash are OK. Multiple hashes
    cause the pcr to be extended with both hashes. Multiple same PCR
    values cause the PCR to be extended multiple times. Extension
    is done in order from left to right as specified.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0b1215d3c3a4badb9ea802135de40307e61fdfa1
      https://github.com/01org/tpm2-tools/commit/0b1215d3c3a4badb9ea802135d=
e40307e61fdfa1
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M Makefile.am
    M lib/tpm2_alg_util.c
    M lib/tpm2_alg_util.h
    A man/tpm2_pcrextend.8.in
    M test/system/test_all.sh
    A test/system/test_tpm2_pcrextend.sh
    A tools/tpm2_pcrextend.c

  Log Message:
  -----------
  tpm2_pcrextend: initial commit

Add a tool that extends the PCR values.

Example:
$ tpm2_pcr_extend 9:sha256=3Dc324d5e9514f00b1a42052666721fb0911090ca197bf83=
1f6568e735bc8522c3

Add system tests as well.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: e8c49105e244f3bb6d731ce646ed5688fa3b1774
      https://github.com/01org/tpm2-tools/commit/e8c49105e244f3bb6d731ce646=
ed5688fa3b1774
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-08-02 (Wed, 02 Aug 2017)

  Changed paths:
    M Makefile.am
    R man/tpm2_listpcrs.8.in
    A man/tpm2_pcrlist.8.in
    M test/system/test_all.sh
    M test/system/test_smoking.sh
    R test/system/test_tpm2_listpcrs.sh
    M test/system/test_tpm2_pcrextend.sh
    A test/system/test_tpm2_pcrlist.sh
    M test/system/test_tpm2_unseal.sh
    R tools/tpm2_listpcrs.c
    A tools/tpm2_pcrlist.c

  Log Message:
  -----------
  tpm2_pcrlist: rename from tpm2_listpcrs

Rename tpm2_listpcrs to tpm2_pcrlist to be compliant with the
rest of the naming convention set by the nv family of tools.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/01org/tpm2-tools/compare/a16446d7ee58...e8c4910=
5e244

--===============0933517752108226537==--

