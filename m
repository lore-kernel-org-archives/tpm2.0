Content-Type: multipart/mixed; boundary="===============5543715816279562244=="
MIME-Version: 1.0
From: Imran Desai <imran.desai at intel.com>
Subject: [tpm2] [Release Candidate] tpm2-tools 5.0-rc0
Date: Thu, 22 Oct 2020 23:58:42 +0000
Message-ID: <20201022235842.2796.10785@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5543715816279562244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I am pleased to announce the pre-release of tpm2-tools version 5.0 available
here: https://github.com/tpm2-software/tpm2-tools/releases/tag/5.0-rc0

Thank you to all the contributors for participating in this release.

Your feedback for this major release is much appreciated.

Some highlights: =


Update tpm2-tss dependency version to 3.0.1 and tpm2-abrmd dependency versi=
on to 2.3.3

tpm2_tools and tss2_tools are now a busybox style commandlet. Ie tpm2_getra=
ndom
becomes tpm2 getrandom. make install will install symlinks to the old tool =
names.

Important enhancements and bug fixes to the FAPI tools.

New tools that support TPM2 commands: TPM2_CC_CertifyX509,
TPM2_CC_GetSessionAuditDigest, TPM2_CC_GetCommandAuditDigest,
TPM2_CC_SetCommandCodeAuditStatus, TPM2_CC_ECC_Parameters, TPM2_CC_EC_Ephem=
eral,
TPM2_CC_Commit, TPM2_CC_ECDH_KeyGen, TPM2_CC_ECDH_ZGen, TPM2_CC_ZGen_2Phase.

Numerous bug fixes and enhancements. Please see the full release note for a=
ll the details.

Thanks and Regards,

Imran Desai
--===============5543715816279562244==--

