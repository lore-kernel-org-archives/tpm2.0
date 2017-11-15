Content-Type: multipart/mixed; boundary="===============8375250036908217805=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] c31bf3: tpm2_pcrlist: document in the man
 page the --outpu...
Date: Wed, 15 Nov 2017 09:19:30 -0800
Message-ID: <5a0c77223d1ab_cd973f9ec2d7dc2841583@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8375250036908217805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: c31bf3c852cea9dbe6797cb8dc92a0f6887339c0
      https://github.com/intel/tpm2-tools/commit/c31bf3c852cea9dbe6797cb8dc=
92a0f6887339c0
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M man/tpm2_pcrlist.1.md

  Log Message:
  -----------
  tpm2_pcrlist: document in the man page the --output option

The -o option is not documented in the tool man page, add it.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 52c812e7fb9e49bfb066e80cc470c7ad54cd85bd
      https://github.com/intel/tpm2-tools/commit/52c812e7fb9e49bfb066e80cc4=
70c7ad54cd85bd
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M test/system/test_tpm2_pcrextend.sh

  Log Message:
  -----------
  test: tpm2_pcrextend: remove undefined supported_algs array

The test tries to check if a given PCR hash algorithm is supported by using
an supported_algs array but this is never defined and also the tpm2_pcrlist
already only reports the PCR banks for the supported hash algoritms.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: da23bd8083bf512f4a537e82dfbdca4b4a6f3802
      https://github.com/intel/tpm2-tools/commit/da23bd8083bf512f4a537e82df=
bdca4b4a6f3802
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_nvwrite: flush session handle and end authentication session

When using PCR policy sessions for authentication, the session handle
should be flushed from the TPM2 and the authentication ended. But the
tpm2_nvwrite tool was not doing this cleanup.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: 1a27c864a01b83e62095100c7701bad41d68af1b
      https://github.com/intel/tpm2-tools/commit/1a27c864a01b83e62095100c77=
01bad41d68af1b
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-15 (Wed, 15 Nov 2017)

  Changed paths:
    M tools/tpm2_create.c

  Log Message:
  -----------
  tpm2_create: fix typo for algorithm

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


Compare: https://github.com/intel/tpm2-tools/compare/db89a48e0098...1a27c86=
4a01b

--===============8375250036908217805==--

