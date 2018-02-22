Content-Type: multipart/mixed; boundary="===============4169059306388379834=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] c0ddb3: lib/tpm2_options: print
 error that TCTI option is ...
Date: Thu, 22 Feb 2018 08:47:04 -0800
Message-ID: <5a8ef408ef32a_5882ae859813c0884373@hookshot-fe-31feec6.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4169059306388379834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: c0ddb30bdaa860eb449f38730bbe243b5c593883
      https://github.com/tpm2-software/tpm2-tools/commit/c0ddb30bdaa860eb44=
9f38730bbe243b5c593883
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2018-02-22 (Thu, 22 Feb 2018)

  Changed paths:
    M lib/tpm2_options.c

  Log Message:
  -----------
  lib/tpm2_options: print error that TCTI option is invalid when NO_SAPI

If the tool doesn't use the SAPI context (TPM2_OPTIONS_NO_SAPI), then the
TCTI option is invalid. Inform users that this is the case by printing an
error message if either -T or --tcti opions are used.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>


  Commit: b8114300960eb503a3dace33677974edaab37c85
      https://github.com/tpm2-software/tpm2-tools/commit/b8114300960eb503a3=
dace33677974edaab37c85
  Author: William Roberts <william.c.roberts(a)intel.com>
  Date:   2018-02-22 (Thu, 22 Feb 2018)

  Changed paths:
    M man/tpm2_rc_decode.1.md

  Log Message:
  -----------
  tpm2_rc_decode: drop tcti options

tpm2_rc_decode no longer uses a TCTI, so drop the
TCTI options from the manpage.

Signed-off-by: William Roberts <william.c.roberts(a)intel.com>


Compare: https://github.com/tpm2-software/tpm2-tools/compare/e6d6aa3376e5..=
.b8114300960e

--===============4169059306388379834==--

