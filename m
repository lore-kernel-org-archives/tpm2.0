Content-Type: multipart/mixed; boundary="===============6325247822541204148=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 147e50: tcti: fix tcti init issue
Date: Wed, 14 Feb 2018 12:24:42 -0800
Message-ID: <5a849b0a251ae_59512b1cd7b3dc141264f5@hookshot-fe-2cc8887.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6325247822541204148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 147e5081f843e4cb13672a8ce524ef81d882ad05
      https://github.com/tpm2-software/tpm2-tools/commit/147e5081f843e4cb13=
672a8ce524ef81d882ad05
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-14 (Wed, 14 Feb 2018)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  tcti: fix tcti init issue

The tcti initiialization was not using the tcti_name, but rather optarg,
which isn't correct for the contetx outside of the getopt loop.

This results in a bug where the initialization split of tcti-name from
tcti-option string fails.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


  Commit: d3d4838bfe2d6400093051932007eb2bcbab22a5
      https://github.com/tpm2-software/tpm2-tools/commit/d3d4838bfe2d640009=
3051932007eb2bcbab22a5
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-14 (Wed, 14 Feb 2018)

  Changed paths:
    M lib/tpm2_tcti_ldr.c

  Log Message:
  -----------
  tcti: better error output

Output both the tcti name and option string on initialization
failure.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/bcefc4619080..=
.d3d4838bfe2d

--===============6325247822541204148==--

