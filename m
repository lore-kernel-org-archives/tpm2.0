Content-Type: multipart/mixed; boundary="===============7582402882115004068=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-pkcs11 1.5.0-rc0
Date: Thu, 05 Nov 2020 01:13:28 +0000
Message-ID: <SN6PR11MB3437455F268D31292A1B937DB8EE0@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7582402882115004068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello, I would like to announce the release candidate for tpm2-pkcs11 versi=
on 1.5.0-rc0 with the following changelog:

### 1.5.0-rc0 - 2020-11-04
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

This RC will be slower than previous RC cycles. Baring any changes that nee=
d to be made, the release is tentatively
scheduled for Nov 16 2020.

Thanks,
Bill
--===============7582402882115004068==--

