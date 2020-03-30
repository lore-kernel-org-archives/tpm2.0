Content-Type: multipart/mixed; boundary="===============1563981740665783187=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-pkcs11 1.2.0
Date: Mon, 30 Mar 2020 14:52:46 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB634C@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1563981740665783187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'm announcing a release of tpm2-pkcs11 version 1.2.0, available here:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.2.0


Which has the following changelog:

* Fix PSS signatures. Non-FIPS mode TPMs produce PSS signatures with a
    max salt len that poses interoperability issues with verifying clients,
    notably TLS in OpenSSL.
* Handle Esys\_LoadExternal() API change where the hierarchy handle switche=
s to an
    ESYS\_TR rather than a TPM2\_RH\_.

Thanks,
Bill
--===============1563981740665783187==--

