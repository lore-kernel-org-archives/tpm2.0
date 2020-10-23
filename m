Content-Type: multipart/mixed; boundary="===============6974537572525762910=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: [Release Candidate] tpm2-tools 5.0-rc0
Date: Fri, 23 Oct 2020 15:54:34 +0000
Message-ID: <SN6PR11MB343715B9E502B2B2DA155BDEB81A0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20201022235842.2796.10785@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6974537572525762910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is also some slight behavioral changes, but those can be dealt with i=
n backwards compatible way.

For instance, some tools were incorrectly defaulting to SHA1 even though th=
eir manpages said otherwise.
So we changed the default from SHA1 to SHA256. However, if you just *always=
* specify the algorithm,
You'll get what you want. So any scripts relying on defaults, could be brok=
en.

This is all spelled out in the changelog. I just want to highlight this her=
e, this will not be like the big
3.X to 4.X commandline option change that caused a lot of suffering =F0=9F=
=98=9D

Bill

> -----Original Message-----
> From: Imran Desai <imran.desai(a)intel.com>
> Sent: Thursday, October 22, 2020 6:59 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] [Release Candidate] tpm2-tools 5.0-rc0
> =

> I am pleased to announce the pre-release of tpm2-tools version 5.0 availa=
ble
> here: https://github.com/tpm2-software/tpm2-tools/releases/tag/5.0-rc0
> =

> Thank you to all the contributors for participating in this release.
> =

> Your feedback for this major release is much appreciated.
> =

> Some highlights:
> =

> Update tpm2-tss dependency version to 3.0.1 and tpm2-abrmd dependency
> version to 2.3.3
> =

> tpm2_tools and tss2_tools are now a busybox style commandlet. Ie
> tpm2_getrandom becomes tpm2 getrandom. make install will install symlinks=
 to
> the old tool names.
> =

> Important enhancements and bug fixes to the FAPI tools.
> =

> New tools that support TPM2 commands: TPM2_CC_CertifyX509,
> TPM2_CC_GetSessionAuditDigest, TPM2_CC_GetCommandAuditDigest,
> TPM2_CC_SetCommandCodeAuditStatus, TPM2_CC_ECC_Parameters,
> TPM2_CC_EC_Ephemeral, TPM2_CC_Commit, TPM2_CC_ECDH_KeyGen,
> TPM2_CC_ECDH_ZGen, TPM2_CC_ZGen_2Phase.
> =

> Numerous bug fixes and enhancements. Please see the full release note for=
 all
> the details.
> =

> Thanks and Regards,
> =

> Imran Desai
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6974537572525762910==--

