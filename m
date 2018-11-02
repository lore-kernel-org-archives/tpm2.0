Content-Type: multipart/mixed; boundary="===============4155156017634378186=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-pkcs11: m4 changes
Date: Fri, 02 Nov 2018 13:35:07 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C78D27@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4155156017634378186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If you're trying to build tpm2-pkcs11 project, note a recent PR will cause =
build breakages:
https://github.com/tpm2-software/tpm2-pkcs11/pull/65

You'll need to satisfy m4 dependencies on:
autoconf-archive
gnulib

The simplest way I found to satisfy them is to copy the requisite files sim=
ilar to what the PR's CI changes
are doing. There may be better ways, and If you know of other/better ways, =
 please share them.

Thanks,
Bill


--===============4155156017634378186==--

