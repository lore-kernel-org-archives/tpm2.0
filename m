Content-Type: multipart/mixed; boundary="===============1592428874497348870=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [Release] tpm2-tools v5.1-rc0
Date: Tue, 20 Apr 2021 23:50:30 +0000
Message-ID: <20210420235030.2848.89740@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1592428874497348870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

I am pleased to announce the release of tpm2-tools v5.1-rc0.
You can find the release here: https://github.com/tpm2-software/tpm2-tools/=
releases/tag/5.1-rc0

This is a release candidate. Your feedback is much appreciated.

Some highlights for this release:

  * Build
      - Dependency-update: Minimum tpm2-tss version dependency bumped to 3.=
0.3
      - Dependency-update: Minimum tpm2-abrmd version dependency bumped to =
2.4.0
      - tpm2_eventlog: Fix build errors on 64 bit arm systems.
      - tpm2_checkquote: Fix build on 32b little-endian platforms.
      - Fixes builds on CentOS 7 which notably has an ancient version of
        GCC: 4.8.5 and an older version of OSSL, 1.0.2
      - Configure handles searching for python executable more gracefully, =
thus
        just having python3, will work.
      - Moved to GitHub Actions for CI testing.
      - Added fedora-32 to CI testing configurations and related fixes.
      - FreeBSD testing is bumped up to version 12.2
      - Fix compiler and packaging warnings for OpenSuse builds.
      - configure: make build gnu99.
      - configure: make -Wbool-compare non fatal.

  * tss2:
      - Support in tools for PolicyRef inclusion in policy search per lates=
t TSS.
      - Support to use TPM objects protected by a policy with PolicySigned.
      - Enable backward compatibility to old Fapi callback API.
      - Fix PCR selection for tss2 quote.
      - Support policy signed policies by implementing Fapi_SetSignCB.

  * Command/ response parameter support for auditing and pHash policies:
      - lib/tpm2_util.c: Add method to determine hashing alg for cp/rphash
      - Add support to calculate rphash for tpm2_create, tpm2_activatecrede=
ntial,
        tpm2_certify, tpm2_certifycreation, tpm2_changeauth, tpm2_changeeps,
        tpm2_changepps, tpm2_nvdefine, tpm2_nvextend, tpm2_unseal
      - Add support to calculate cphash for tpm2_changeeps, tpm2_changepps.

  * Session-support:
      - tpm2_sessionconfig: Add tool to display and configure session attri=
butes.
      - tpm2_getrandom: Fix=E2=80=94 session input was hardcoded for audit-=
only
      - tpm2_startauthsession: Add option to specify the bind object  and i=
ts
        authorization value.
      - tpm2_startauthsession: support for bounded-only session.
      - tpm2_startauthsession: support for salted-only session.
      - tpm2_startauthsession: add option to specify an hmac session type.
      - Add support for specifying non-authorization sessions for audit and
        parameter encryption for tpm2_getrandom, tpm2_create, tpm2_nvextend,
        tpm2_nvdefine, tpm2_unseal, tpm2_activatecredential, tpm2_certify,
        tpm2_certifycreation, tpm2_changeauth, tpm2_changeeps, tpm2_changep=
ps.

  * tpm2_eventlog:
      - Support for event type: EV_IPL extensively used by the Shim and Gru=
b.
      - Support for event type: EV_EFI_GPT_EVENT to parse.
        UEFI_PARTITION_TABLE_HEADER and UEFI_PARTITION_ENTRY.
      - Support for event type: EFI_SIGNATURE_LIST, which contains one or m=
ore
        EFI_SIGNATURE_DATA.
      - Support for event type EV_EFI_VARIABLE_AUTHORITY.
      - Parse UEFI_PLATFORM_FIRMWARE_BLOB structure that the CRTM MUST put =
into
        the Event Log entry TCG_PCR_EVENT2.event field for event types
        EV_POST_CODE, EV_S_CRTM_CONTENTS, and EV_EFI_PLATFORM_FIRMWARE_BLOB.
      - Parse secureboot variable to indicate enable as 'Yes'.
      - Parse BootOrder variable to a more readable format.
      - Parse Boot variables per EFI_LOAD_OPTION described in more details =
in
        UEFI Spec Section 3.1.3
      - Parse Device-path in a readable format using the efivar library.
      - Support for logs longer than 64 kilobytes.
      - Perform verification for event types where digest can be verified f=
rom
        their event payload.
      - Better support for multiline strings.
      - Fix handling of event log EV_POST_CODE data where field is empty an=
d len
        is specified.

  * tpm2_getekcertificate: Fix tool failing to return error/non-zero for HT=
TP 404.

  * tpm2_nvdefine: allow setting hash algorithm by command line parameter f=
or NV
    indices set in extend mode.

  * tpm2_duplicate, tpm2_import: support duplicating non-TPM keys to a remo=
te TPM
    without first requiring them to be loaded to a local TPM.

  * tpm2_dictionarylockout: Fix issue where setting value for one parameter=
 caused
    to reset the others.

  * tpm2_getpolicydigest: Add new tool to enable TPM2_CC_PolicyGetDigest.

  * Fix segfault where optind > argc.

  * tools/tpm2_checkquote: fix missing initializer

  * tpm2_convert: fix EVP_EncodeUpdate usage for OSSL < 1.1.0

  * openssl: fix EVP_ENCODE_CTX_(new|free)

  * test: Add support for swTPM simulator to the testing framework and make=
 it the
  default if mssim isn't available.

Thank you to all the contributors. =


Thanks and regards,

Imran Desai
--===============1592428874497348870==--

