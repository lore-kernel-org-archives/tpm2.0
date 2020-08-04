Content-Type: multipart/mixed; boundary="===============6182224728728785794=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] tpm2-tss v2.4.2
Date: Tue, 04 Aug 2020 16:53:58 -0700
Message-ID: <2d2ba134-677d-ae27-ea99-f1eaef0a75ad@intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6182224728728785794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
I'm happy to announce the tpm2-tss v2.4.2 release.
It can be found here:
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.4.2

The changes are:

### Fixed
- Fixed double json_object_put call in event log processing.
- Fixed memory leaks on error paths in FAPI
- Fixed setting of FAPI app data.
- Fixed size check for Fapi_Encrypt.
- Fixed computation of PCR logs and PCR digest of PCR logs.
- Improved comments for FAPI authentication.
- Fixed segfault and leaks in FAPI
- Fixed Fapi_GetCertificate for objects which are not of type key
- Fixed hierarchy usage in Fapi_Provision
- Fixed ESYS Shared secret calculation
- Fixed doxygen warnings for FAPI docs
- Fixed copying of primary template during key loading.
- Fixed some wrong format directives in debug statements.
- Fixed usage of hierarchy and authentication in Fapi_GetCertificate and
Fapi_Delete
- Fixed unallocated return buffers which may have lead to segfaults in
tooling
- Fixed usage of persistent handles.
- Fixed computation of the size of a PCR selection (Fixes #1737).
- Fixed missing hierarchy authentication for Fapi_Delete.
- Fixed uninitialized context of FAPI command Fapi_ChangeAuth.
- Fixed computation of random value for objects used for sealing.
- Fixed return code for event parsing errors.
- Fixed NV index and path handling in NV creation.
- Fixed path checking for keys.
- Fixed Fapi_GetInfo function.
- Fixed path usage in Fapi_Import.
- Fixed invalid settings of default flags for keys creation.
- Fixed handle usage in Fapi_ChangeAuth

### CHANGED
- Enabled all PCR registers for SHA256 bank in the distribution profiles.
- Added some checks to Fapi_Provisioning to avoid nasty failure states
- Added a check to prevent overwrite or delete FAPI storage objects and
directories
- Remove obsolete test fapi-key-create-policy-password-sign.int.c
- Checked hierarchy needed for EvictControl for deleting objects in FAPI.
- Checked event log file before calling the TPM in Fapi_PcrExtend.
- Adapted integration tests to SRK delete checking.
- Improved presentation of Fapi_GetInfo.
- Silenced expected errors from Esys_TestParams

### Added
- Added man pages for FAPI json config files
- Added a check that prevents deleting default directories
- Added a check if primary keys already exist for Fapi_Provision
- Added tests for derived persistent keys.
- Added test policy PCR with PCR register 8.
- Added check for deleting of the SRK.
- Added test for sealing a random value.
- Added content of the config file to FAPI Info.
- Added a check for valid pathnames in keystore module.

### Removed
- Removed unecassary code from Fapi_ExportKey
- Removed obsolete LIBDL_LDFLAGS and replace it with LIBADD_DL
- Removed superfluous policies/pol_password.json file

Thanks,
-- =

Tadeusz


--===============6182224728728785794==--

