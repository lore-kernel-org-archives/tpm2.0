Content-Type: multipart/mixed; boundary="===============2604874571317460571=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-pkcs11: 1.2.0-RC0
Date: Tue, 24 Mar 2020 18:38:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB1F85@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2604874571317460571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
I would like to announce tpm2-pkcs11 1.2.0-RC0:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.2.0-RC0

With the following changelog:
1.2.0-RC0 - 2020-02-24
Fix PSS signatures. Non-FIPS mode TPMs produce PSS signatures with a
max salt len that poses interoperability issues with verifying clients,
notably TLS in OpenSSL.
Handle Esys_LoadExternal() API change where the hierarchy handle switches t=
o an
ESYS_TR rather than a TPM2_RH_.
--===============2604874571317460571==--

