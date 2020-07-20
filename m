Content-Type: multipart/mixed; boundary="===============5887223944007981819=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Help required in using the FAPI
Date: Mon, 20 Jul 2020 20:25:02 +0000
Message-ID: <SN6PR11MB3437B6864AD0E50580C8F949B87B0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: SN6PR11MB34377CBD34C2165B41507506B87B0@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5887223944007981819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Don't know why this came through from owners list,
Adding back the mailing list. My response inline below.

> -----Original Message-----
> From: Roberts, William C
> Sent: Monday, July 20, 2020 2:11 PM
> To: Phani Srinivas <phani.srinivas(a)in.abb.com>; tpm2-owner(a)lists.01.o=
rg
> Subject: RE: Help required in using the FAPI
> =

> =

> =

> > -----Original Message-----
> > From: Phani Srinivas <phani.srinivas(a)in.abb.com>
> > Sent: Monday, July 20, 2020 12:49 PM
> > To: tpm2-owner(a)lists.01.org
> > Subject: Help required in using the FAPI
> >
> > Hello All,
> >
> >
> >
> > Need support in using the FAPI layer of TSS, have some questions
> > related to it after started using the git hub project
> >
> >
> >
> > *	Does FAPI_createKey support symmetric key creation
> =

> No, as most TPMs don't support symmetric key operations via encrypdecrypt
> interface.
> =

> > *	Is there any Template for the crypto profile used in FAPI
> =

> Yes,  see:
> https://github.com/tpm2-software/tpm2-tss/tree/master/dist/fapi-profiles
> =

> > *	How to specify the Unique value in the profile while creating the SRK
> =

> I don't think there is.... the SRK follows the EK but with a few changes.
> https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-
> Provisioning-Guidance-Published-v1r1.pdf
> https://trustedcomputinggroup.org/wp-
> content/uploads/Credential_Profile_EK_V2.0_R14_published.pdf
> =

> So the unique values come from reading the NV index and it looks like
> ifapi_init_primary_async() handles that case.
> https://github.com/tpm2-software/tpm2-
> tss/blob/72ecf7c1eec2c40f9daf93f9ac3eaedc5afb95e0/src/tss2-fapi/fapi_util=
.c
> =

> > *	Can multiple profiles be used in FAPI and provisioned individually
> =

> Not sure, but you can set the fapi config in use via TSS2_FAPICONF. So yo=
u can
> have N setups, but one is system Wide default.
> =

> >
> >
> >
> > Regards
> >
> > Phani Srinivas S
> >
> > R&D Principal Engineer, ABB
> >
> >

--===============5887223944007981819==--

