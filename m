Content-Type: multipart/mixed; boundary="===============3804096175106650788=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-pytss version 1.2.0
Date: Tue, 14 Jun 2022 14:40:34 +0000
Message-ID: <DM6PR11MB3434325A4CC820A31075FD1EB8AA9@DM6PR11MB3434.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3804096175106650788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I am pleased to announce the release of version 1.2.0 of tpm2-pytss with th=
e following CHANGELOG:

## 1.2.0 - 2022-06-14
### Added
- utils function to parse tpm2-tools PCR values as function: unmarshal_tool=
s_pcr_values.
- official python 3.10 support.
- sm2 and sm4 tools like parsing support for TPMT_PUBLIC and TPM2B_PUBLIC s=
tructures.
- tpm2-tools compatible YAML encoding and decoding of TPM structures
### Removed
- pkgconfig as runtime dependency
- Official Python 3.6 support.
- internal distutils usage.
- sm3 and sm4 support IF the backing cryptography package supports it.
### Fixed:
- trsess_set_attributes attributes parameter should be a TPMA_SESSION or in=
t, not just int.
- setup.cfg install_requires requirement that cryptography be version 3.0 o=
r greater.
- Note in documentation incorrectly called None.
- ability to build a wheel and run tests from directory root. Note code for=
 package is now under src folder.

The release can be found on pypi here:
  - https://pypi.org/project/tpm2-pytss/1.2.0/
--===============3804096175106650788==--

