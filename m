Content-Type: multipart/mixed; boundary="===============5269523368292333402=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] tpm2-tss v2.4.0
Date: Wed, 11 Mar 2020 16:05:20 -0700
Message-ID: <23629d8b-280a-e282-2de9-00f119dc0258@intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5269523368292333402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
After rather long rc cycle I'm happy to anounce that the final release
of tpm2-tss v2.4.0 is out. It can be found here:
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.4.0

The main change is the addition of the FAPI implementation.
The release also comes with number of fixes and changes:

Added
- Added a new Feature API (FAPI) implementation
- Added Esys_TRSess_GetAuthRequired() ESAPI function
- Added Esys_TR_GetTpmHandle() SAPI function
- Added Esys_GetSysContext() SAPI function
- Added the with-sanitizer configure option
- Added CI for FreeBSD

Changed
- Changed MSSIM TCTI to be async capable
- Removed TCTI loaders from ESYS dependencies in pkg-config
- Changed getPollHandles to allow num_handles query
- Improved CI builds
- Converted builds to docker builds
- Number of fixes and improvements in the test code
- Changed tcti-device in non-async mode to allways block

Fixed
- Fixed hmac calculation for tpm2_clear command in ESAPI
- Fixed mixing salted and unsalted sessions in the same ESAPI context
- Removed use of VLAs from TPML marshal code
- Fixed setting C++ compiler for non-fuzzing builds at configure
- Fixed setting the name of session objects
- Fixed page alignment errors in Sys_Get/SetAuths functions
- Fixed potential buffer overflow in tcti_mssim_receive
- Fixed invalid memory alloc failure in Tss2_TctiLdr_Initialize
- Fixed list of exported symbols map for libtss2-mu
- Fixed resource name calculation in Esys_CreateLoaded
- Fixed keysize of ECC curve TPM2_ECC_NISTP224
- Fixed segmentation fault in tctildr if name_conf was too big
- Fixed memory leak in tctildr-tcti tests
- Fixed HMAC generation for policy sessions
- Added check for object node before calling compute_session_value function
- Fixed auth calculation in Esys_StartAuthSession called with optional
parameters
- Fixed compute_encrypted_salt error handling in Esys_StartAuthSession
- Fixed exported symbols map for libtss2-mu


Thanks,
--
Tadeusz
--===============5269523368292333402==--

