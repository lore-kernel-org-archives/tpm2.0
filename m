Content-Type: multipart/mixed; boundary="===============7900376307418635197=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 1f218d: tcti: handle option string
 better
Date: Tue, 20 Feb 2018 15:52:36 -0800
Message-ID: <5a8cb4c4bb036_26032ac681955c141120e1@hookshot-fe-b0febf1.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7900376307418635197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 1f218d99dec6c1ca11fee5d668970fdabb05ae56
      https://github.com/tpm2-software/tpm2-tools/commit/1f218d99dec6c1ca11=
fee5d668970fdabb05ae56
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-20 (Tue, 20 Feb 2018)

  Changed paths:
    M lib/tpm2_options.c
    M lib/tpm2_tcti_ldr.c
    M lib/tpm2_tcti_ldr.h
    M man/common/tcti.md

  Log Message:
  -----------
  tcti: handle option string better

Currently, the tcti option supported 3
formats:

--tcti=3D<name>
--tcti=3D<name>:
--tcti=3D<name>:<option(s)>

Add support for:
--tcti=3D:<option(s)>

This recitifes the tpm2-abrmd dynamic tcti handling with the
tools.

Fixes: #902

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>



--===============7900376307418635197==--

