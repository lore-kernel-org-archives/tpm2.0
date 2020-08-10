Content-Type: multipart/mixed; boundary="===============6780610949795755239=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-pkcs11: 1.3.2
Date: Mon, 10 Aug 2020 14:41:33 +0000
Message-ID: <DM6PR11MB34341AE731BA9A28DF775568B8440@DM6PR11MB3434.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6780610949795755239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce the release of tpm2-pkcs11 version 1.3.2 with the =
following changelog:

### 1.3.2 - 2020-08-10
  * Fix C\_InitToken, ensure no embedded nul byte.
  * Fix free of mutex being held in C\_InitToken failures: #573
  * Fix C\_Login CKU\_USER login attempt before pin is setup: #563
  * Fix C\_InitToken double init issues #577

The release can be found here:
https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.3.2

Thanks,
Bill
--===============6780610949795755239==--

