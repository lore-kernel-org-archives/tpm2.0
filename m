Content-Type: multipart/mixed; boundary="===============8981572726673938087=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: NV index counter rollback
Date: Fri, 10 Jul 2020 16:12:54 +0000
Message-ID: <SN6PR11MB34378579C14C72303159D284B8650@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: VI1PR01MB5167F3B93DE8C0D22FE3E85C88650@VI1PR01MB5167.eurprd01.prod.exchangelabs.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8981572726673938087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sounds like there is indeed a defect, I was unaware of it. But it sounds li=
ke updates have been issued but the specific
TPM's you tested against have not been updated to the version with the fix?=
 Or did I misunderstand and an updated
Firmware has never been issued?

I would imagine you just want to update the TPM FW ASAP.

Bill

> -----Original Message-----
> From: Diego Santa Cruz <Diego.SantaCruz(a)spinetix.com>
> Sent: Friday, July 10, 2020 8:45 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] NV index counter rollback
> =

> Hello,
> =

> =

> =

> During some testing with an NV index of counter type on a TPM 2.0 I got a
> counter to rollback on two hardware TPMs (both 2.0 rev 1.16, same
> manufacturer, different model).
> =

> =

> =

> From what I understand of the TPM2 Library Specification an NV index of c=
ounter
> type should never roll back.
> =

> =

> =

> Reading through the reference code in the TPM 2.0 Library Specification r=
ev 1.16
> it appears to be a defect that is apparently no longer present in the ref=
erence
> code of the spec rev 1.38 and rev 1.59.
> =

> =

> =

> I contacted the manufacturer of my hardware TPMs a few days ago to see if=
 it
> was a known problem and if there was any fix or workaround but they have
> remained silent so far (I do not have a specific contact, I just reported=
 the
> problem via their support site).
> =

> =

> =

> Is this a known problem? I did not find any mention of it googling around=
. Or did I
> misunderstand how an NV index of counter type works?
> =

> =

> =

> I have an easy reproducer using tpm2-tools.
> =

> =

> =

> Best,
> =

> =

> =

> Diego
> =

> --
> Diego Santa Cruz, PhD
> Technology Architect
> spinetix.com
> =

>=20

--===============8981572726673938087==--

