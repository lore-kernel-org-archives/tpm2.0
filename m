Content-Type: multipart/mixed; boundary="===============1307666483314533656=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] ce0927: Revert "[REVERTME]
 test_tpm2_activecredential is f...
Date: Fri, 10 Nov 2017 08:38:28 -0800
Message-ID: <5a05d6047a654_46443fa41e13fc342962a@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1307666483314533656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: ce0927296c57afa56f7cd2bfe893cdd28e16c1b2
      https://github.com/intel/tpm2-tools/commit/ce0927296c57afa56f7cd2bfe8=
93cdd28e16c1b2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-10 (Fri, 10 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_activecredential.sh

  Log Message:
  -----------
  Revert "[REVERTME] test_tpm2_activecredential is failing"

This reverts commit 3505187191b1bb540ccd62af019b51678064ba76.


  Commit: 9e8f9cbb835441c1f1be2b9a24271d74277d9171
      https://github.com/intel/tpm2-tools/commit/9e8f9cbb835441c1f1be2b9a24=
271d74277d9171
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-10 (Fri, 10 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_activecredential.sh
    M tools/tpm2_makecredential.c

  Log Message:
  -----------
  test: fix test regression

Bad commit:
commit 71586ebba51a2776fd6d4c93340a3279f16727e3
Author: William Roberts <william.c.roberts(a)intel.com>
Date:   Wed Nov 8 16:08:59 2017 -0800

    lib: add an xxd compatible hexdump routine

    Signed-off-by: William Roberts <william.c.roberts(a)intel.com>

The test script uses tpm2_getpubak which was modified by bad commit
and the loaded key handle parsed from stdout was incorrect. This is
because the output format changed.

Modify the test to use the name file directly.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d7235a84ff90dc38aca622f2113fd31b2b587783
      https://github.com/intel/tpm2-tools/commit/d7235a84ff90dc38aca622f211=
3fd31b2b587783
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-10 (Fri, 10 Nov 2017)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  options: output error msg on args provided no args expected

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 073477864f5e304741d5881d562d5c53dac33b16
      https://github.com/intel/tpm2-tools/commit/073477864f5e304741d5881d56=
2d5c53dac33b16
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-10 (Fri, 10 Nov 2017)

  Changed paths:
    M man/tpm2_getpubak.1.md
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: make -n optional

Make -n an optional argument.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 52a529275c1e012f63cd57f3507a5d00a4a1b6ec
      https://github.com/intel/tpm2-tools/commit/52a529275c1e012f63cd57f350=
7a5d00a4a1b6ec
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-10 (Fri, 10 Nov 2017)

  Changed paths:
    M lib/tpm2_util.c
    M lib/tpm2_util.h
    M tools/tpm2_nvread.c

  Log Message:
  -----------
  hexdump: support both plain and xxd formats

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: c9505af931c7e124ba0c8121abe281b110821fc7
      https://github.com/intel/tpm2-tools/commit/c9505af931c7e124ba0c8121ab=
e281b110821fc7
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-10 (Fri, 10 Nov 2017)

  Changed paths:
    M man/tpm2_getpubak.1.md
    M test/system/test_tpm2_activecredential.sh
    M test/system/test_tpm2_makecredential.sh
    M tools/tpm2_getpubak.c

  Log Message:
  -----------
  tpm2_getpubak: output in yaml format

Output to stdout in a yaml format that can easily be parsed.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: df367e401b708ea893e5ab6cb229ae66b2c95945
      https://github.com/intel/tpm2-tools/commit/df367e401b708ea893e5ab6cb2=
29ae66b2c95945
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-10 (Fri, 10 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_pcrevent.sh
    R test/system/yaml_get.py

  Log Message:
  -----------
  test: remove yaml.get

Use a bash "HERE" document to embed the python script inside
the bash script.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: fee79348d09ab58b2f61f4cc0fed97fd53c1ebb2
      https://github.com/intel/tpm2-tools/commit/fee79348d09ab58b2f61f4cc0f=
ed97fd53c1ebb2
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2017-11-10 (Fri, 10 Nov 2017)

  Changed paths:
    M man/tpm2_pcrlist.1.md
    M test/system/test_tpm2_pcrevent.sh
    M tools/tpm2_pcrlist.c

  Log Message:
  -----------
  tpm2_pcrlist: drop format option and make YAML default

Rather than adding more complexity, just use YAML for output
to stdout.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/intel/tpm2-tools/compare/3505187191b1...fee7934=
8d09a

--===============1307666483314533656==--

