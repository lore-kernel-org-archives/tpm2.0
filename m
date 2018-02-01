Content-Type: multipart/mixed; boundary="===============2205535067409816630=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 8dea56: tpm2_hierarchy: add lib and
 tests
Date: Thu, 01 Feb 2018 14:47:07 -0800
Message-ID: <5a7398ebcda0d_725d2ae2233adc041262f9@hookshot-fe-88eb02d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2205535067409816630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 8dea5603a0cd218fb83b87ab3b0bb7b4c3b3457e
      https://github.com/tpm2-software/tpm2-tools/commit/8dea5603a0cd218fb8=
3b87ab3b0bb7b4c3b3457e
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-01 (Thu, 01 Feb 2018)

  Changed paths:
    M Makefile.am
    A lib/tpm2_hierarchy.c
    A lib/tpm2_hierarchy.h
    A test/unit/test_tpm2_hierarchy.c

  Log Message:
  -----------
  tpm2_hierarchy: add lib and tests

Add an interface for converting hierarchy identifiers
and hex values to a TPMI_RH_PROVISION value.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: 0eacbacbdb509a89848195eaf1e5b40c830b441d
      https://github.com/tpm2-software/tpm2-tools/commit/0eacbacbdb509a8984=
8195eaf1e5b40c830b441d
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-01 (Thu, 01 Feb 2018)

  Changed paths:
    M lib/tpm2_hierarchy.c
    M lib/tpm2_hierarchy.h
    M man/tpm2_createprimary.1.md
    M man/tpm2_evictcontrol.1.md
    M man/tpm2_nvdefine.1.md
    M man/tpm2_nvread.1.md
    M man/tpm2_nvrelease.1.md
    M man/tpm2_nvwrite.1.md
    M test/system/tests/nv.sh
    M test/unit/test_tpm2_hierarchy.c
    M tools/tpm2_createprimary.c
    M tools/tpm2_evictcontrol.c
    M tools/tpm2_nvdefine.c
    M tools/tpm2_nvread.c
    M tools/tpm2_nvreadlock.c
    M tools/tpm2_nvrelease.c
    M tools/tpm2_nvwrite.c

  Log Message:
  -----------
  tpm2_hierarchy: update tools to use new api

Update all the tools, in one shot (since tests need to be reworked
for nv) to use the new tpm2_hierarchy interface for
authorization/hierarchy handle resolution.

Update the manpages as well.

Fixes: #512

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/5e6637992974..=
.0eacbacbdb50

--===============2205535067409816630==--

