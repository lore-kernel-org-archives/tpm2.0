Content-Type: multipart/mixed; boundary="===============3616433671668474868=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-tss v3.0.4-rc1
Date: Mon, 03 May 2021 17:00:07 +0000
Message-ID: <SN6PR11MB3437C7F9EFA27B1E949E40AFB85B9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: SN6PR11MB3437E9F165081CD95B8DA4F0B85B9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3616433671668474868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hello,
I would like to announce that tpm2-tss 3.1.0-rc1 has been released:
https://github.com/tpm2-software/tpm2-tss/releases/tag/3.1.0-rc1

Which contains the following changes over rc0:
- Fixed bug in FAPI NV creation with custom index values.
- Fixed leftover sessions in error cases in FAPI.
- Fixed execution of FAPI policies in some cases.
- Fixed  handling 0x hex prefixes for TPMU_HA in JSON encoding.
- Fixed fix doxygen header of function iesys_update_session_flags.
- Fixed issue where nonceTPM was included twice in HMAC.
- Fixed issue of unused variable when enabling lower default log levels.
- Fixed 'partial' may be used uninitialized in tcti-device.

---
Bill
--===============3616433671668474868==--

