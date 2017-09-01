Content-Type: multipart/mixed; boundary="===============4478615373225953089=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 813bae: configure: Check for md2man-roff.
Date: Thu, 31 Aug 2017 17:30:35 -0700
Message-ID: <59a8aa2b50ad7_193e3fbb9a07bc386361a@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4478615373225953089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/configure-check-md2man-roff
  Home:   https://github.com/01org/tpm2-tools
  Commit: 813baec38fe8e829cb58cc075a71f52f71ace95b
      https://github.com/01org/tpm2-tools/commit/813baec38fe8e829cb58cc075a=
71f52f71ace95b
  Author: Philip Tricca <philip.b.tricca(a)intel.com>
  Date:   2017-08-31 (Thu, 31 Aug 2017)

  Changed paths:
    M configure.ac

  Log Message:
  -----------
  configure: Check for md2man-roff.

md2man-roff is required for the build to succeed. If it's missing
this commit will cause the configure script to fail with a helpful
error message.

Signed-off-by: Philip Tricca <philip.b.tricca(a)intel.com>



--===============4478615373225953089==--

