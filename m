Content-Type: multipart/mixed; boundary="===============2965957959939049420=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RC] tpm2-pytss 1.0.0-rc1
Date: Mon, 10 Jan 2022 19:38:24 +0000
Message-ID: <SN6PR11MB34375C150A028EE55500526EB8509@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2965957959939049420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I am pleased to announce the release of the tpm2-pytss (python bindings and=
 utilities) version 1.0.0 RC 1 with the following CHANGELOG over RC0:

## [1.0.0-rc1] - 2022-01-10
### Fixed:
=C2=A0- Misspellings in Code on things like RuntimeError.
=C2=A0- Fix documentation of ESAPI methods and exceptions.
=C2=A0- Double ESAPI.Close call resulting in "Esys_Finalize() Finalizing NU=
LL context."
=C2=A0- type hint for verify_signature was an int, should be a str.
=C2=A0- Parent cdata memory being freed when no parent reference. This caus=
es sub-field references to parent cdata to
=C2=A0 =C2=A0be invalid.
=C2=A0- in util method unwrap, fix variable `encdupsens` does not exist, it=
 is `decsens` instead.

### Changed:
=C2=A0- Renamed ESAPI.set_auth to ESAPI.tr_set_auth for consistenency.
=C2=A0- Use None over 0 for default auth_handle.

### Added:
=C2=A0- Check for bad type enum type in ESAPI.load_blob.
=C2=A0- Support for deprecation of `TPM2_RH_PW` in tpm2-tss with proper TPM=
2_RS_PW attribute.

The release can be found here:
=C2=A0 - https://pypi.org/project/tpm2-pytss/1.0.0rc1/

Sorry for the long delay on this RC period, we wanted to make sure we got a=
s much bugs and broken things before the
1.0 release to help minimize breaking changes in the future.

Thanks,
Bill
--===============2965957959939049420==--

