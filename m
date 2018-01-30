Content-Type: multipart/mixed; boundary="===============6329291222563733916=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [tpm2-software/tpm2-tools] 0899f5: Fix build with LibreSSL
Date: Tue, 30 Jan 2018 10:06:09 -0800
Message-ID: <5a70b411ae878_15652b0acbcf9c10106579@hookshot-fe-265448d.cp1-iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6329291222563733916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/tpm2-software/tpm2-tools
  Commit: 0899f5b7acfb0ef1b71518f7b94cf84776018edd
      https://github.com/tpm2-software/tpm2-tools/commit/0899f5b7acfb0ef1b7=
1518f7b94cf84776018edd
  Author: Carlos Santos <casantos(a)datacom.ind.br>
  Date:   2018-01-30 (Tue, 30 Jan 2018)

  Changed paths:
    M lib/conversion.c
    M lib/tpm2_openssl.c
    M tools/tpm2_import.c

  Log Message:
  -----------
  Fix build with LibreSSL

OPENSSL_VERSION_NUMBER is used to test the version of OpenSSL but this
test alone breaks the build with LibreSSL due to implicit declarations
of functions 'RSA_set0_key' and 'HMAC_CTX_free'.

Test if OpenSSL < 1.1.0 or LIBRESSL_VERSION_NUMBER is defined, instead.

Signed-off-by: Carlos Santos <casantos(a)datacom.ind.br>



--===============6329291222563733916==--

