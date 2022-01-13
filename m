Content-Type: multipart/mixed; boundary="===============8443127510379160833=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] [RELEASE CANDIDATES] tpm2-tss 3.2.0-rc0 3.1.1-rc0 3.0.5-rc0
Date: Thu, 13 Jan 2022 14:37:28 +0000
Message-ID: <AM8P194MB1676536461F9E4D685DB3E43A6539@AM8P194MB1676.EURP194.PROD.OUTLOOK.COM>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8443127510379160833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I wanted to announce that I've just tagged versions 3.2.0-rc0 3.1.1-rc0 and=
 3.0.5-rc0 of the tpm2-tss project.

You can find the tags in git and here: https://github.com/tpm2-software/tpm=
2-tss/releases

For your convenience, here are the changelog-changes for the 3.2.0 minor re=
lease:
## [3.2.0-rc0] - 2022-01-13
### Fixed
- Fixed file descriptor leak when tcti initialization failed.
- 32 Bit builds of the integration tests.
- Primary key creation, in some cases the unique field was not cleared befo=
re calling create primary.
- Primary keys was used for signing the object were cleared after loading. =
So access e.g. to the certificate did not work.
- Primary keys created with Fapi_Create with an auth value, the auth_value =
was not used in inSensitive to recreate the primary key. Now the auth value=
 callback is used to initialize inSensitive.
- The not possible usage of policies for primary keys generated with Fapi_C=
reatePrimary has been fixed.
- An infinite loop when parsing erroneous JSON was fixed in FAPI.
- A buffer overflow in ESAPI xor parameter obfuscation was fixed.
- Certificates could be read only once in one application The setting the i=
nit state of the state automaton for getting certificates was fixed.
- A double free when executing policy action was fixed.
- A leak in Fapi_Quote was fixed.
- The  wrong file locking in FAPI IO was fixed.
- Enable creation of tss group and user on systems with busybox for fapi.
- One fapi integration test did change the auth value of the storage hierar=
chy.
- A leak in fapi crypto with ossl3 was fixed.
- Add initial camelia support to FAPI
- Fix tests of fapi PCR
- Fix tests of ACT functionality if not supported by pTPM
- Fix compiler (unused) warning when building without debug logging
- Fix leaks in error cases of integration tests
- Fix memory leak after ifapi_init_primary_finish failed
- Fix double-close of stream in FAPI
- Fix segfault when ESYS_TR_NONE is passed to Esys_TR_GetName
- Fix the authorization of hierarchy objects used in policy secret.
- Fix check of qualifying data in Fapi_VerifyQuote.
- Fix some  leaks in FAPI error cases.
- Make scripts compatible with non-posix shells where `test` does not know =
`-a` and `-o`.
- Fix usage of variable not initialized when fapi keystore is empty.

### Added
- Added support for SM2, SM3 and SM4.
- Added support for OpenSSL 3.0.0.
- Added authPolicy field to the TPMU_CAPABILITIES union.
- Added actData field to the TPMU_CAPABILITIES union.
- Added TPM2_CAP_AUTH_POLICIES
- Added TPM2_CAP_ACT constants.
- Added updates to the marshalling and unmarshalling of the TPMU_CAPABILITI=
ES union.
- Added updated to the FAPI serializations and deserializations of the TPMU=
_CAPABILITIES union and associated types.
- Add CODE_OF_CONDUCT
- tcti-mssim and tcti-swtpm gained support for UDX communication
- Missing constant for TPM2_RH_PW

### Removed
- Removed support for OpenSSL < 1.1.0.
- Marked TPMS_ALGORITHM_DESCRIPTION and corresponding MU routines as deprec=
ated.
  Those were errorous typedefs that are not use and not useful. So we will =
remove this with 3.3
- Marked TPM2_RS_PW as deprecated. Use TPM2_RH_PW instead.

Best regards,
Andreas
--===============8443127510379160833==--

