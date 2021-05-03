Content-Type: multipart/mixed; boundary="===============7499334628776928490=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-tss v3.0.4-rc1
Date: Mon, 03 May 2021 16:30:08 +0000
Message-ID: <SN6PR11MB3437E9F165081CD95B8DA4F0B85B9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: SN6PR11MB3437306626405716ECBBD4D0B85B9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7499334628776928490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
I would like to announce that tpm2-tss 3.0.4-rc1 has been released:
https://github.com/tpm2-software/tpm2-tss/releases/tag/3.0.4-rc1

Which contains the following changes over rc0:
- Fixed fix doxygen header of function iesys_update_session_flags
- Fixed issue where nonceTPM was included twice in HMAC.
- Fixed issue of unused variable when enabling lower default log levels.
- Fixed tcti-device: 'partial' may be used uninitialized.
- Fixed double define in tss2_mu.h.

---
Bill
--===============7499334628776928490==--

