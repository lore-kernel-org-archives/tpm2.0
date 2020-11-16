Content-Type: multipart/mixed; boundary="===============4216157631257565620=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-pkcs11 1.5.0
Date: Mon, 16 Nov 2020 18:21:18 +0000
Message-ID: <SN6PR11MB3437A38B615EA1B4365F8D6CB8E30@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4216157631257565620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce the release of tpm2-pkcs11 version 1.5.0 with the =
following changelog:

### 1.5.0 - 2020-11-16
  * C_Decrypt: Fix CKM_RSA_PKCS11 scheme not removing PKCS v1.5 block paddi=
ng from returned plaintext.
  * C_Digest/C_DigestFinal: Fix Section 5.2 style returns.
  * C_OpenSession: fix valid session handles starting at 0, 0 is invalid pe=
r the spec.
  * C_OpenSession: fix handle issuance bug where handles could be exhausted=
 at out of bounds.
  * Support swtpm in testing infrastructure.
  * Fix C_Encrypt/C_Decrypt interface not setting size when output buffer i=
n NULL.
  * Fix warning ../configure: line 14383: ]: command not found
  * Fix CKM_RSA_PKCS_PSS mechanism.
  * C_GetMechanismList: Fix index 0 of the returned list being invalid.
  * C_GetMechanismInfo: Fix errors like ERROR: Unknown mechanism, got: 0xd.
  * Docs: use full paths from project root to help fix 404 errors.
  * tpm2_ptool init to attempt to persistent created primary object at 0x81=
000001 and fallback to
    first available address on failure.

The release can be found here:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.5.0

Thanks,
Bill
--===============4216157631257565620==--

