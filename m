Content-Type: multipart/mixed; boundary="===============6107356390222245679=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RC] tpm2-pkcs11: 1.1.0-RC0
Date: Mon, 24 Feb 2020 16:09:46 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E95182@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6107356390222245679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to announce tpm2-pkcs11 release candidate 1.1.0-RC0
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.1.0-RC0

BACKUP YOUR DB WHEN UPGRADING. Although the code was designed to upgrade a =
copy
And only swap the DB when the upgrade path succeeds, I always recommend kee=
ping a backup
of your store for those just in case situations.

Changelog:
1.1.0-RC0 - 2020-02-24
  * DB Schema Change from 1 to 3.
    - **Backup your DB before upgrading**
  * Support C_InitToken interface.
  * Add Java PKCS11 Keystore support for RSA/ECB/RSAPKCS1.5
    via public encrypt and private decrypt.
  * Decouple handles from db primary keys. Key handles are
    no longer stable between runs.
  * tpm2_ptool objmod:
    - Support adding an attribute.
    - Fix bug in variable name vtype over type.
  * C_Sign: support mechanism CKM_RSA_X_509.
  * C_GetTokenInfo: add missing mechanism CKM_SHA512_RSA_PKCS.
  * Fix store search logic to fail when TPM2_PKCS11_STORE cannot be accesse=
d.
  * Fix potential double free in token_free() logic.
  * Fix -Werror=3Dformat-truncation with GCC >=3D 7 #415

--===============6107356390222245679==--

