Content-Type: multipart/mixed; boundary="===============7658284331799593475=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Information Needed on FAPI Usage
Date: Tue, 21 Jul 2020 10:18:49 +0000
Message-ID: <SN6PR11MB34372D9CC72CEB006758F3BBB8780@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0171B9176A@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7658284331799593475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> Sent: Tuesday, July 21, 2020 3:05 AM
> To: phani.srinivas(a)in.abb.com; tpm2(a)lists.01.org
> Subject: [tpm2] Re: Information Needed on FAPI Usage
> =

> Hi Phani,
> =

> *       Does FAPI_createKey support symmetric key creation
> No it does not. Reason is that most TPMs do not support it.
> =

> *       Is there any Template for the crypto profile used in FAPI
> I don't know what you mean by this?
> By default, our implementation comes with two example profiles. RSA2kSHA2=
56
> and ECCP256SHA256 to be chosen in fapi-config file.
> =

> *       How to specify the Unique value in the profile while creating the=
 SRK
> This is currently not forseen. Is this really necessary ?
> We're currently using the most-used template.

Andreas is this not true, am I misreading the code?

My response yesterday:
> I don't think there is.... the SRK follows the EK but with a few changes.
> https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-
> Provisioning-Guidance-Published-v1r1.pdf
> https://trustedcomputinggroup.org/wp-
> content/uploads/Credential_Profile_EK_V2.0_R14_published.pdf
> =

> So the unique values come from reading the NV index and it looks like
> ifapi_init_primary_async() handles that case.
> https://github.com/tpm2-software/tpm2-
> tss/blob/72ecf7c1eec2c40f9daf93f9ac3eaedc5afb95e0/src/tss2-fapi/fapi_u
> til.c

> =

> *       Can multiple profiles be used in FAPI and provisioned individually
> Yes, you can provision multiple profiles by changing the profile in the c=
onfig and
> calling provision again.
> Just make sure that the persistent handles for the SRKs do not collide (i=
nside the
> profile).
> Then you can always access all provisioned profiles.
> =

> Hope this helps,
> Andreas
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============7658284331799593475==--

