Content-Type: multipart/mixed; boundary="===============0650682691781484204=="
MIME-Version: 1.0
From: Diego Santa Cruz <Diego.SantaCruz at spinetix.com>
Subject: [tpm2] Re: NV index counter rollback
Date: Mon, 13 Jul 2020 13:38:35 +0000
Message-ID: <
 <VI1PR01MB5167963B74B5B12E57E5B39688600@VI1PR01MB5167.eurprd01.prod.exchangelabs.com>>
In-Reply-To: 7d646dc199cc40718b737868f7e5b527@infineon.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0650682691781484204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Florian,

Many thanks for your response. Bill Roberts kindly put me in contact, off l=
ist, with Peter Huewe from Infineon, who is following the issue.

For information, I did file the issue with Infineon support via the online =
form, but I did not get any response aside from the automatic acknowledgmen=
t. Maybe that channel is too generic and did not land with the correct pers=
ons.

I suspected that TPM updates were tied to BIOS updates, but I was not sure.=
 Thanks for clarifying that. I'll take it up with the various manufacturers=
 when I have more precise info on the matter.

Best regards,

-- =

Diego Santa Cruz, PhD
Technology Architect
spinetix.com

> -----Original Message-----
> From: Florian.Schreiner(a)infineon.com <Florian.Schreiner(a)infineon.com>
> Sent: 13 July 2020 15:24
> To: Diego Santa Cruz <Diego.SantaCruz(a)spinetix.com>;
> william.c.roberts(a)intel.com; tpm2(a)lists.01.org
> Subject: RE: NV index counter rollback
> =

> Hi Diego,
> =

> maybe I can try to help here. Certainly you can also contact the Infineon
> support, who would also provide you helpful responses.
> =

> The TPM firmware updates are needed to be synched with the platform, so t=
hat
> a TPM update is typically executed and managed by the BIOS (e.g. update
> authorization, error handling). How the TPM firmware update is deployed is
> therefore decided by the platform manufacturer. Often the updates are
> combined/included with the BIOS update, but there are also other platform=
s,
> which for example publish the TPM update via Windows-Update involving UEFI
> APIs.
> Therefore if one platform is an Intel NUC, you might need to check with t=
he
> manufacturer Intel for any available TPM or BIOS updates.
> =

> If you develop your own platform, you can get the direct access to the TPM
> Firmware updates via the Infineon support. This requires the alignment on=
 some
> basic legal topics first, because the TPM is a security device and this i=
s required
> by the security certification.
> =

> Best,
> Florian
> =

> =

> Infineon Technologies AG
> Security Architect
> IFAG DSS ESS TCE
> Office: +49 89 234 21833
> Mobile: +49 (160) 90105611
> Fax: +49 (89) 234 152183300
> Florian.Schreiner(a)infineon.com
> =

> 81726 Munich
> Germany
> =

> www.infineon.com=C2=A0 Discoveries =C2=A0Facebook=C2=A0 Twitter=C2=A0 Lin=
kedIn
> =

> Part of your life. Part of tomorrow.
> =

> Infineon Technologies AG
> Chairman of the Supervisory Board: Dr. Wolfgang Eder
> Management Board: Dr. Reinhard Ploss (CEO), Dr. Helmut Gassel, Jochen
> Hanebeck, Dr. Sven Schneider
> Registered Office: Neubiberg
> Commercial Register: M=C3=BCnchen HRB 126492
> =

> This e-mail and any attachments are confidential. They are intended solel=
y for
> the attention and use of the named addressee(s). If you are not the named
> addressee(s) you must not use, disclose, retain or reproduce all or any p=
art of
> the information contained in this e-mail or any attachments. Any unauthor=
ized
> use or disclosure may be unlawful. If you have received this e-mail by mi=
stake,
> please inform the sender immediately and delete it and all copies from yo=
ur
> system and destroy any hard copies of it.
> =

> =

> -----Original Message-----
> From: Diego Santa Cruz <Diego.SantaCruz(a)spinetix.com>
> Sent: Freitag, 10. Juli 2020 18:48
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: [tpm2] Re: NV index counter rollback
> =

> Caution: This e-mail originated outside Infineon Technologies. Do not cli=
ck on
> links or open attachments unless you validate it is safe
> <http://iweb.infineon.com/en-US/Support/security/CDC/pse/Pages/pce.aspx>.
> =

> =

> Hi William,
> =

> Thanks for your response.
> =

> I would love to be able to deploy TPM firmware updates, but the affected =
TPMs
> are from Infineon and I could not find any public resource with firmware =
updates
> for their TPMs. One of the systems with the affected TPM is an Intel NUC,=
 with
> the latest BIOS.
> =

> Does anyone here have a technical contact at Infineon? Or is anyone from
> Infineon on this list?
> =

> The root of the problem is that we wanted to use a counter NV index to li=
nk
> revocable assets, but knowing of TPMs on which one can rollback the count=
er
> defeats the revocation mechanism.
> =

> Best,
> =

> Diego
> =

> --
> Diego Santa Cruz, PhD
> Technology Architect
> spinetix.com
> =

> > -----Original Message-----
> > From: Roberts, William C <william.c.roberts(a)intel.com>
> > Sent: 10 July 2020 18:13
> > To: Diego Santa Cruz <Diego.SantaCruz(a)spinetix.com>; tpm2(a)lists.01.=
org
> > Subject: RE: NV index counter rollback
> >
> > Sounds like there is indeed a defect, I was unaware of it. But it
> > sounds like updates have been issued but the specific TPM's you tested
> > against have not been updated to the version with the fix?
> > Or did I misunderstand and an updated
> > Firmware has never been issued?
> >
> > I would imagine you just want to update the TPM FW ASAP.
> >
> > Bill
> >
> > > -----Original Message-----
> > > From: Diego Santa Cruz <Diego.SantaCruz(a)spinetix.com>
> > > Sent: Friday, July 10, 2020 8:45 AM
> > > To: tpm2(a)lists.01.org
> > > Subject: [tpm2] NV index counter rollback
> > >
> > > Hello,
> > >
> > >
> > >
> > > During some testing with an NV index of counter type on a TPM 2.0 I
> > > got a counter to rollback on two hardware TPMs (both 2.0 rev 1.16,
> > > same manufacturer, different model).
> > >
> > >
> > >
> > > From what I understand of the TPM2 Library Specification an NV index
> > > of
> > counter
> > > type should never roll back.
> > >
> > >
> > >
> > > Reading through the reference code in the TPM 2.0 Library
> > > Specification rev
> > 1.16
> > > it appears to be a defect that is apparently no longer present in
> > > the
> > reference
> > > code of the spec rev 1.38 and rev 1.59.
> > >
> > >
> > >
> > > I contacted the manufacturer of my hardware TPMs a few days ago to
> > > see
> > if it
> > > was a known problem and if there was any fix or workaround but they
> > have
> > > remained silent so far (I do not have a specific contact, I just
> > > reported the problem via their support site).
> > >
> > >
> > >
> > > Is this a known problem? I did not find any mention of it googling ar=
ound.
> > Or did I
> > > misunderstand how an NV index of counter type works?
> > >
> > >
> > >
> > > I have an easy reproducer using tpm2-tools.
> > >
> > >
> > >
> > > Best,
> > >
> > >
> > >
> > > Diego
> > >
> > > --
> > > Diego Santa Cruz, PhD
> > > Technology Architect
> > > spinetix.com
> > >
> > >
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0650682691781484204==--

