Content-Type: multipart/mixed; boundary="===============1865012640812333598=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpn2-pkcs11 1.6.0-rc0
Date: Mon, 26 Apr 2021 19:22:51 +0000
Message-ID: <SN6PR11MB34371EC9E7220424F4CDECCDB8429@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1865012640812333598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

tpm2-pkcs11 version 1.6.0-rc0:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.6.0-rc0

With the following CHANGELOG:

### 1.6.0-rc0 - 2021-04-26
  * Spelling and grammar fixes throughout the project.
  * tpm2_ptool: fix bug in verify commandlet where `--sopin` leads to local=
 variable referenced before assignment. See #624.
  * Docs: add a document describing SSH Hostkey configuration using tpm2-pk=
cs11.
  * Support changes in tpm2-tss-engine using TPM2_RH_OWNER instead of 0.
    * Since upstream commit tpm2-software/tpm2-tss-engine(a)06f57a3.
  * Fix endian issue in test_db.
  * Fix tpm2_ptool error messages when exceptions are raised during executi=
on of tpm2-tools commands.
  * Support CKA_DERIVE=3Dtrue which will support the newest pkcs11-tool EC =
template.
  * Fix requirement of having ESYS >=3D 2.4, see #632 for details.
  * Fix docs/INITIALIZING.md reference to `--pobj-pin`, should be `--hierar=
chy-auth`.
  * Fix missing libyaml dependency in documentation.
  * Fix bug in DB update logic where errors in handlers were ignored.
  * Fix NPD bug when ESAPI and FAPI return 0 tokens.
  * Add support for over TPM sized AES buffers.
  * Add support for mechanism CKM_AES_CBC_PAD.
  * Add support for mechanism CKM_AES_CTR.
  * Add support for RSA 3072 (3k) keys.
  * Remove usage of function Esys_TR_GetTpmHandle. FAPI Backend will no lon=
ger depend on ESAPI 2.4 or
    greater.
  * Add **Experimental** RSA 4096 support. **Use at your own risk**.

Thanks,
Bill

--===============1865012640812333598==--

