Content-Type: multipart/mixed; boundary="===============2759097418435383426=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 0811d6: build: Don't generate man pages
 from markdown if m...
Date: Fri, 01 Sep 2017 07:58:04 -0700
Message-ID: <59a9757c18c35_229843fe89d35dc3c8738c@hookshot-fe-6dbb0c4.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2759097418435383426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 0811d6dac0be1a459e59bb6e528409e0c9cd6619
      https://github.com/01org/tpm2-tools/commit/0811d6dac0be1a459e59bb6e52=
8409e0c9cd6619
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-09-01 (Fri, 01 Sep 2017)

  Changed paths:
    M Makefile.am
    M configure.ac

  Log Message:
  -----------
  build: Don't generate man pages from markdown if md2man-roff isn't found

The md2man-roff tool is required to generate roff man pages from markdown
for some tools, but this may not be available on some systems. Instead of
making the build to fail, just don't attempt to generate these man pages.

Fixes: #447

Reported-by: Philip Tricca <philip.b.tricca(a)intel.com>
Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============2759097418435383426==--

