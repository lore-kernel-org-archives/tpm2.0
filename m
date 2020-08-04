Content-Type: multipart/mixed; boundary="===============0650630972123154710=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-pkcs11 1.3.2-RC0
Date: Tue, 04 Aug 2020 16:32:22 +0000
Message-ID: <SN6PR11MB3437B1372DCA6C6EEE5990A1B84A0@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0650630972123154710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to announce tpm2-pkcs11 release candidate 1.3.2-RC0 with the f=
ollowing changelog:
### 1.3.2-RC0 - 2020-08-04
  * Fix C_InitToken, ensure no embedded nul byte.
  * Fix free of mutex being held in C_InitToken failures: #573
  * Fix C_Login CKU_USER login attempt before pin is setup: #563
  * Fix C_InitToken double init issues #577

https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.3.2-RC0

Thanks,
Bill
--===============0650630972123154710==--

