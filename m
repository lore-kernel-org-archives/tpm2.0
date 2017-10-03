Content-Type: multipart/mixed; boundary="===============1997531076823432985=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 6093d2: tpm2_createpolicy: add new line to
 extend policy s...
Date: Tue, 03 Oct 2017 14:11:41 -0700
Message-ID: <59d3fd0dc0d3_70383fc385e75c3898565@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1997531076823432985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 6093d237b566d221fe55fc7db94e8598f8d79648
      https://github.com/01org/tpm2-tools/commit/6093d237b566d221fe55fc7db9=
4e8598f8d79648
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-03 (Tue, 03 Oct 2017)

  Changed paths:
    M tools/tpm2_createpolicy.c

  Log Message:
  -----------
  tpm2_createpolicy: add new line to extend policy session handle output

The tpm2_tool_output() doesn't add a new line character like the LOG_*()
macros, add one so the session handle information is printed correctly.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============1997531076823432985==--

