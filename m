Content-Type: multipart/mixed; boundary="===============7200291927632244480=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] tpm2-tss v3.0.0
Date: Tue, 04 Aug 2020 16:54:42 -0700
Message-ID: <6c2cc486-d124-f75d-67a5-5cada6b25506@intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7200291927632244480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
I'm happy to announce the tpm2-tss v3.0.0 release
It can be found here:
https://github.com/tpm2-software/tpm2-tss/releases/tag/3.0.0

There are two backwards compatibility breaking changes between 3.0.0 and
2.4.x.

The changes are:

### Fixed
- Added setgid perms and ACL for FAPI keystore to allow r/w access for
tss group
- Fixed double json_object_put call in event log processing.
- Added TSS root dir to include path in CFLAGS
- Switch default FAPI profile to ECC.
- Enabled all PCR registers for SHA256 bank in the distribution profiles.
- Added fix computation of PCR logs and PCR digest of PCR logs.
- Added fix size check for Fapi_Encrypt.
- Improved log messages in FAPI
- Introduced new FAPI return codes FAPI_RC_ALREADY_PROVISIONED,
  TSS2_BASE_RC_NOT_PROVISIONED, and TSS2_FAPI_RC_NOT_PROVISIONED.
- Added missing retry in Fapi_Initialize_Finish.
- Added man pages for FAPI config files
- Deleted invalid keys from the null hierarchy.
- Fixed check of auth state for lockout set.
- Fixed check of directory access rights in Fapi_Initialize.
- Enabled usage of NULL hierarchy in FAPI.
- Added address sanitizer to CI for gcc.
- Added asserts to callback functions in integration tests
- Added check event log file before Fapi_PcrExtend.
- Fixed hierarchy usage and authentication in Fapi_Provision,
  Fapi_GetCertificate, and Fapi_Delete.
- Added description for primary keys to profile.
- Fixed non async call of Esys_ContextSave in Fapi_GetEsysBlobs.
- Added check for hierarchy needed for EvictControl for deleting objects.
- Fixed copying the primary during key loading.
- Added a check that prevents deleting of default directories.
- Added verification to provisioning.
- Fixed usage of persistent handles.
- Added missing selectors for some TPMU types in marshal
- Added handling for invalid selector when (um)marshal TPMU types
- Improved presentation of Fapi_GetInfo.
- Fixed computation of the size of a PCR selection.
- Added a check for valid pathnames in keystore module.
- Added a check for deleting of the SRK.
- Fixed computation of random value for objects used for sealing.
- Fixed return code for event parsing errors.
- Added content of the config file to FAPI Info.
- Fixed NV index and path handling in NV creation.
- Fixed path checking for keys.
- Fixed version retrieval method in Fapi_GetInfo.
- Fixed path usage in Fapi_Import.
- Fixed settings of default flags for keys creation.
- Fixed handle usage in Fapi_ChangeAuth
- Fixed systemd-sysusers/-tmpfiles invocation
- Changed FAPI callback API.
- Fixed initialization of app data in Esys_Initialize
- Fixed certificate handling for TPMs without stored certificate.
- Replaced strtok with strtok_r
- Changed return codes from tcti macros according to the spec
- Added check that prevents overwriting objects in key store.
- Added session usage to FAPI provisioning.
- Enabled CI for FreeBSD
- Changed hierarchy param type of Esys_Hash(), Esys_HierarchyControl(),
  Esys_LoadExternal(), and Esys_SequenceComplete() calls along with
  their Async versions according to the spec.
  The can accept both types TPM2_RH and ESYS_TRs as then don't collide.
- Changed Tss2_Sys_ReadClock to allow audit session to be consistent
  with the rev 1.38 version of the TPM2.0 architecture spec.
  Note: This change brakes ABI backwards compatibility.
- Silenced expected errors from Esys_TestParams.
- Many improvements for CI builds on Travis and Cirrus, unit tests
  and integration test code

### Added
- Added SWTPM-TCTI
- Added mbedTLS ESYS crypto backend
- Added the Command TCTI
- Added new API function Fapi_GetEsysBlobs.
- Added new feature for importing keys with Fapi_Import.

### Removed
- Removed libgcrypt ESYS crypto backend
- Removed dev-tcti partial read mode configuration flag
- Removed dev-tcti async mode configuration flag
- Removed obsolete LIBDL_LDFLAGS and replaced broken @LIBDL_LDFLAGS@
with @LIBADD_DL@
- Removed deprecated OpenSSL functions from FAPI and ESYS

Thanks,
-- =

Tadeusz


--===============7200291927632244480==--

