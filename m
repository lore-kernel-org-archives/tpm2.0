Content-Type: multipart/mixed; boundary="===============7881275005628754721=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 8a382a: tpm2_unseal: make -F optional to
 allow using curre...
Date: Thu, 02 Nov 2017 15:56:14 -0700
Message-ID: <59fba28eeb25f_7af13fc0da4f9c341201d0@hookshot-fe-92cdb05.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7881275005628754721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 8a382a692d355e70f5b6d5910ea78390feb22cc8
      https://github.com/01org/tpm2-tools/commit/8a382a692d355e70f5b6d5910e=
a78390feb22cc8
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-02 (Thu, 02 Nov 2017)

  Changed paths:
    M tools/tpm2_unseal.c

  Log Message:
  -----------
  tpm2_unseal: make -F optional to allow using current PCR values for auth

The tool currently checks if both the -L and -F options were defined and
only builds a PCR policy session for authentication if that's the case.

But the tpm2_unseal man page says that the -F option is not required, if
this isn't defined then the current PCR values are used to build the PCR
policy used for authorization to unseal the data.

So honor the man page says and don't make the -F option to be required,
instead just always pass raw_pcrs_file to tpm2_policy_build(). If it's
NULL, then this function reads the current PCR values instead of trying
to use the values that are defined in a file.

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============7881275005628754721==--

