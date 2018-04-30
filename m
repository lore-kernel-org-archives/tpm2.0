Content-Type: multipart/mixed; boundary="===============0369859101790596223=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: [tpm2] [RELEASE] tpm2-tools 3.0.4 available
Date: Mon, 30 Apr 2018 12:10:13 +0200
Message-ID: <9a30b0f2-b9d0-4e55-a957-b0838ae640c0@redhat.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0369859101790596223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Release 3.0.4 of tpm2-tools is now available at:
https://github.com/tpm2-software/tpm2-tools/releases/tag/3.0.4

Changelog:

3.0.4 - 2018-04-30
  * Fix save and load for TPM2B_PRIVATE object.
  * Use a default buffer size for tpm2_nv{read,write} if the TPM reports a =
0 size.
  * Fix --verbose and --version options crossover.
  * Generate man pages from markdown and include them in the distribution t=
arball.
  * Print usage summary if tools are executed with no options or man page c=
an't be displayed.

--===============0369859101790596223==--

