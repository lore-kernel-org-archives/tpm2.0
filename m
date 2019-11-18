Content-Type: multipart/mixed; boundary="===============2349893188231718297=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [RELEASE] tpm2-tools v4.1-rc1
Date: Mon, 18 Nov 2019 15:18:17 +0000
Message-ID: <20191118151817.2673.77793@new-ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2349893188231718297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

tpm2-tools release candidate version 4.1-rc1 is published. https://github.c=
om/tpm2-software/tpm2-tools/releases/tag/4.1-rc1
Please provide your feedback for the release candidate.

Some highlights for the release

New tools added to support commands:

TPM2_CertifyCreation, TPM2_ChangeEPS, TPM2_ChangePPS, TPM2_ClockRateAdjust,
TPM2_GetTime, TPM2_NV_Certify, TPM2_NV_Extend, TPM2_NV_Setbits,
TPM2_NV_UndefineSpaceSpecial, TPM2_NV_Writelock, TPM2_PolicyAuthorizeNV,
TPM2_PolicyAuthValue, TPM2_PolicyCounterTimer, TPM2_PolicyNameHash,
TPM2_PolicyNV, TPM2_NV_Written, TPM2_PolicySigned, TPM2_PolicyTemplate,
TPM2_PolicyTicket, TPM2_ReadClock, TPM2_ClockSet, TPM2_SetPrimaryPolicy,
TPM2_Shutdown.

Bug fixes and additional options to existing tools.

tpm2_checkquote: Fix YAML bug
tpm2_policysecret: Add options to specify expiration, ticket, timeout,
qualification data.
tpm2_create/ tpm2_createprimary: Add options to specify creation-data,
creation-ticket, creation-hash, outside-info, pcr-list
Skip/notify of action that man pages will not install if pandoc is missing.
Support "tpmt" as public key output format that saves the TPMT structure.
Add support for specifying NV index type when specifying NV attributes.
Fixed routine files_load_bytes_from_buffer_or_file_or_stdin where it can re=
ad
one short of a UINT16 and overflow when buffer isn't a UINT16.
Fix precedence issue with bitwise operator order int tpm2_getcap
tpm2_util.c: Fix an issue int variable size was checked against uint
pcr.c: Fix buffer length issue to support all defined hash algorithm
travis: bump abrmd version 2.3.0
--===============2349893188231718297==--

