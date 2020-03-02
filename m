Content-Type: multipart/mixed; boundary="===============0152314642312723747=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-pkcs11: Release 1.1.0-RC1
Date: Mon, 02 Mar 2020 16:30:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E97311@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0152314642312723747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to announce the tpm2-pkcs11 1.1.0-RC1 release:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.1.0-RC1

With the following changelog:
### 1.1.0-RC1 - 2020-03-02
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
  * Fix unitialized variable warnings #416
  * test: use release tarball vs source code.
  * build: clean leftover file in make clean.
  * release: add missing tests to tarball no matter configure options.
  * test: fix invalid flags on CKM_SHA512_RSA_PKCS causing test failures.
  * Switch OASIS pkcs11 headers to FSF Unlimited License Headers.

With these changes over RC0:
+  * Fix unitialized variable warnings #416
+  * test: use release tarball vs source code.
+  * build: clean leftover file in make clean.
+  * release: add missing tests to tarball no matter configure options.
+  * test: fix invalid flags on CKM_SHA512_RSA_PKCS causing test failures.
+  * Switch OASIS pkcs11 headers to FSF Unlimited License Headers.

Thanks,
Bill

--===============0152314642312723747==--

