Content-Type: multipart/mixed; boundary="===============1286705202900212911=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-pkcs11: 1.3.0-RC0
Date: Mon, 29 Jun 2020 16:23:33 +0000
Message-ID: <SN6PR11MB3437C8F7705CE46A51EC5B08B86E0@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1286705202900212911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce tpm2-pkcs11 v1.3.0-RC0, with the following chamnge=
log:

1.3.0 - 2020-06-29

* C\_CreateObject: Support for CKO\_DATA objects only with CKA\_PRIVATE set=
 to CK\_TRUE.
  Token defaults to CK\_TRUE.
* Fix Tests against simulator that support RSA 3072 keys

The release can be found here:
  - https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.3.0-RC0

Thanks,
Bill
--===============1286705202900212911==--

