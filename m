Content-Type: multipart/mixed; boundary="===============3457827619564138370=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [Release] tpm2-tools v5.1
Date: Mon, 24 May 2021 18:28:58 +0000
Message-ID: <20210524182858.2973.20762@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3457827619564138370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

Pleased to announce the release of tpm2-tools v5.1
You can find the release here https://github.com/tpm2-software/tpm2-tools/r=
eleases/tag/5.1

Hightlights from the release:

Build

Dependency-update: Minimum tpm2-tss version dependency bumped to 3.1.0
Dependency-update: Minimum tpm2-abrmd version dependency bumped to 2.4.0
tpm2_eventlog: Fix build errors on 64 bit arm systems.
tpm2_checkquote: Fix build on 32b little-endian platforms.
Fixes builds on CentOS 7 which notably has an ancient version of
GCC: 4.8.5 and an older version of OSSL, 1.0.2
Configure handles searching for python executable more gracefully, thus
just having python3, will work.
Moved to GitHub Actions for CI testing.
Added fedora-32 to CI testing configurations and related fixes.
FreeBSD testing is bumped up to version 12.2
Fix compiler and packaging warnings for OpenSuse builds.
configure: make build gnu99.
configure: make -Wbool-compare non fatal.
configure: only use -Werror for non-release builds
tss2:

Support in tools for PolicyRef inclusion in policy search per latest TSS.
Support to use TPM objects protected by a policy with PolicySigned.
Enable backward compatibility to old Fapi callback API.
Fix PCR selection for tss2 quote.
Support policy signed policies by implementing Fapi_SetSignCB.
Command/ response parameter support for auditing and pHash policies:

lib/tpm2_util.c: Add method to determine hashing alg for cp/rphash
Add support to calculate rphash for tpm2_create, tpm2_activatecredential,
tpm2_certify, tpm2_certifycreation, tpm2_changeauth, tpm2_changeeps,
tpm2_changepps, tpm2_nvdefine, tpm2_nvextend, tpm2_unseal
Add support to calculate cphash for tpm2_changeeps, tpm2_changepps.
Session-support:

tpm2_sessionconfig: Add tool to display and configure session attributes.
tpm2_getrandom: Fix=E2=80=94 session input was hardcoded for audit-only
tpm2_startauthsession: Add option to specify the bind object and its
authorization value.
tpm2_startauthsession: support for bounded-only session.
tpm2_startauthsession: support for salted-only session.
tpm2_startauthsession: add option to specify an hmac session type.
Add support for specifying non-authorization sessions for audit and
parameter encryption for tpm2_getrandom, tpm2_create, tpm2_nvextend,
tpm2_nvdefine, tpm2_unseal, tpm2_activatecredential, tpm2_certify,
tpm2_certifycreation, tpm2_changeauth, tpm2_changeeps, tpm2_changepps.
tpm2_eventlog:

Support for event type: EV_IPL extensively used by the Shim and Grub.
Support for event type: EV_EFI_GPT_EVENT to parse.
UEFI_PARTITION_TABLE_HEADER and UEFI_PARTITION_ENTRY.
Support for event type: EFI_SIGNATURE_LIST, which contains one or more
EFI_SIGNATURE_DATA.
Support for event type EV_EFI_VARIABLE_AUTHORITY.
Parse UEFI_PLATFORM_FIRMWARE_BLOB structure that the CRTM MUST put into
the Event Log entry TCG_PCR_EVENT2.event field for event types
EV_POST_CODE, EV_S_CRTM_CONTENTS, and EV_EFI_PLATFORM_FIRMWARE_BLOB.
Parse secureboot variable to indicate enable as 'Yes'.
Parse BootOrder variable to a more readable format.
Parse Boot variables per EFI_LOAD_OPTION described in more details in
UEFI Spec Section 3.1.3
Parse Device-path in a readable format using the efivar library.
Support for logs longer than 64 kilobytes.
Perform verification for event types where digest can be verified from
their event payload.
Better support for multiline strings.
Fix handling of event log EV_POST_CODE data where field is empty and len
is specified.
scripts/utils: Add a utility to read the cert chain of embedded CA.

tpm2_getekcertificate: Fix tool failing to return error/non-zero for HTTP 4=
04.

tpm2_nvdefine: allow setting hash algorithm by command line parameter for NV
indices set in extend mode.

tpm2_duplicate, tpm2_import: support duplicating non-TPM keys to a remote T=
PM
without first requiring them to be loaded to a local TPM.

tpm2_dictionarylockout: Fix issue where setting value for one parameter cau=
sed
to reset the others.

tpm2_getpolicydigest: Add new tool to enable TPM2_CC_PolicyGetDigest.

Fix segfault where optind > argc.

tools/tpm2_checkquote: fix missing initializer

tpm2_convert: fix EVP_EncodeUpdate usage for OSSL < 1.1.0

openssl: fix EVP_ENCODE_CTX_(new|free)

test: Add support for swTPM simulator to the testing framework and make it =
the
default if mssim isn't available.

tpm2_unseal:

Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
tpm2_nvextend:

Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
tpm2_nvdefine:

Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
tpm2_changepps:

Added option --cphash=3DFILE to specify ile path to record the hash
of the command parameters. This is commonly termed as cpHash.
Added option --rphash=3DFILE to specify ile path to record the hash
Added option -S, --session to specify to specify an auxiliary
session for auditing and or encryption/decryption of the parameters.
tpm2_changeeps:

Added option --cphash=3DFILE to specify ile path to record the hash
of the command parameters. This is commonly termed as cpHash.
Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
Added option -S, --session to specify to specify an auxiliary
session for auditing and or encryption/decryption of the parameters.
tpm2_changeauth:

Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
Added option -S, --session to specify to specify an auxiliary
session for auditing and or encryption/decryption of the parameters.
tpm2_certifycreation:

Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
Added option -S, --session to specify to specify an auxiliary
session for auditing and or encryption/decryption of the parameters.
tpm2_certify:

Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
Added option -S, --session to specify to specify an auxiliary
session for auditing and or encryption/decryption of the parameters.
tpm2_activatecredential:

Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
Added option -S, --session to specify to specify an auxiliary
session for auditing and or encryption/decryption of the parameters.
tpm2_create:

Added option --rphash=3DFILE to specify ile path to record the hash
of the response parameters. This is commonly termed as rpHash.
tpm2_unseal:

Added option -S, --session to specify auxiliary sessions for
audit and encryption.
tpm2_nvdefine:

Added option -S, --session to specify auxiliary sessions for
audit and encryption.
tpm2_nvextend:

Added option -S, --session to specify auxilary sessions for
audit and encryption.
--===============3457827619564138370==--

