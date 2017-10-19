Content-Type: multipart/mixed; boundary="===============8531300725514255860=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [01org/tpm2-tools] 9e27f7: tpm2_import: remove unneeded
 ifdefery to call the ...
Date: Wed, 18 Oct 2017 19:37:49 -0700
Message-ID: <59e80ffd1b5b3_48ea3ff88e60bc301747e@hookshot-fe2-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8531300725514255860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/01org/tpm2-tools
  Commit: 9e27f70a7e48d1a66733ff818dad6fad55d1bb83
      https://github.com/01org/tpm2-tools/commit/9e27f70a7e48d1a66733ff818d=
ad6fad55d1bb83
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-10-18 (Wed, 18 Oct 2017)

  Changed paths:
    M tools/tpm2_import.c

  Log Message:
  -----------
  tpm2_import: remove unneeded ifdefery to call the RSA_set0_key function

The ssl_RSA_set0_key() function already has an error path, but the error
was not propagated to the caller. Since the function has basically the
same signature than the OpenSSL 1.1.0 RSA_set0_key() function, define it
for OpenSSL < 1.1.0 so there is no need for the ifdefery in the caller.

Suggested-by: Matthias Gerstner <matthias.gerstner(a)suse.de>
Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============8531300725514255860==--

