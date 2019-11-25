Content-Type: multipart/mixed; boundary="===============2484168033904286283=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [RELEASE] tpm2-tools v4.1
Date: Mon, 25 Nov 2019 18:41:12 +0000
Message-ID: <20191125184112.2967.29905@new-ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2484168033904286283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I am happy to announce the release of tpm2-tools v4.1

Some highlights of this release are as follows.

    * New tools added to support commands:
        TPM2_CertifyCreation, TPM2_ChangeEPS, TPM2_ChangePPS, TPM2_ClockRat=
eAdjust,
        TPM2_GetTime, TPM2_NV_Certify, TPM2_NV_Extend, TPM2_NV_Setbits,
        TPM2_NV_UndefineSpaceSpecial, TPM2_NV_Writelock, TPM2_PolicyAuthori=
zeNV,
        TPM2_PolicyAuthValue, TPM2_PolicyCounterTimer, TPM2_PolicyNameHash,
        TPM2_PolicyNV, TPM2_NV_Written, TPM2_PolicySigned, TPM2_PolicyTempl=
ate,
        TPM2_PolicyTicket, TPM2_ReadClock, TPM2_ClockSet, TPM2_SetPrimaryPo=
licy,
        TPM2_Shutdown.
    =

        * Resource manager dependency updated: tpm2-abrmd v2.3.0
    =

        * Bug fixes and additional options to existing tools.
        1. tpm2_checkquote: Fix YAML bug
        2. tpm2_policysecret: Add options to specify expiration, ticket, ti=
meout,
        qualification data.
        3. tpm2_create/ tpm2_createprimary: Add options to specify creation=
-data,
        creation-ticket, creation-hash, outside-info, pcr-list
        4. Skip/notify of action that man pages will not install if pandoc =
is missing.
        5. Support "tpmt" as public key output format that saves the TPMT s=
tructure.
        6. Add support for specifying NV index type when specifying NV attr=
ibutes.
        7. Fixed routine files_load_bytes_from_buffer_or_file_or_stdin wher=
e it can read
        one short of a UINT16 and overflow when buffer isn't a UINT16.
        8. Fix precedence issue with bitwise operator order int tpm2_getcap
        9. tpm2_util.c: Fix an issue int variable size was checked against =
uint
        10. pcr.c: Fix buffer length issue to support all defined hash algo=
rithm

Please see the changelog for additional details of this release.
--===============2484168033904286283==--

