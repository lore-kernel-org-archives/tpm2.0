Content-Type: multipart/mixed; boundary="===============5924518844965602857=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Mon, 07 Aug 2017 16:56:45 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAABF06@ORSMSX103.amr.corp.intel.com>
In-Reply-To: 7c5a9e12-2d69-ee6a-b142-74b58dd8ede8@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5924518844965602857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> Sent: Thursday, August 3, 2017 5:25 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
> =

> Hello Bill,
> =

> On 08/02/2017 08:00 PM, Roberts, William C wrote:
> =

> [snip]
> =

> >>>
> >>
> >> Yes, maybe I'm failing in the terminology. My understanding is that
> >> the TPM2 on
> >> TPM2_Create() creates a key pair, seals the passed data using this
> >> key, wraps the key using the parent key and finally returns that wrapp=
ed key
> pair to caller.
> >>
> >> Since the key pair is needed to be loaded for unsealing, I need to
> >> store it in a place so they can latter be used for unsealing.
> >
> > In theory you can store that anywhere, the easier it is to get to the
> > more prevalent someone can hose all of your data. The LUKS partition
> > metadata seems reasonable, if they can delete that, they could hose
> > your hard drive data anyways. A permeant entity in the TPM is also an o=
ption.
> >
> =

> Exactly, that's what my reasoning as well. Good that you confirm my
> understanding and we are in the same page then.
> =

> >>
> >>>  and using the
> >>>> endorsement hierarchy by default.
> >>>
> >>> I don't see the privacy concerns offhand, as no one is receiving a
> >>> digital
> >> signature from the private key generated?
> >>
> >> That's why I'm storing it in an accessible place, since it can't be
> >> used without the TPM2. I just wanted to confirm if my understanding of=
 the
> specs were correct.
> >>
> >>> I think the storage hierarchy is more appropriate, but again I may
> >>> be missing
> >> something.
> >>>
> >>
> >> Can you please elaborate on why do you think the storage hierarchy
> >> (TPM_RH_OWNER) is more appropriate? That's why I asked the question,
> >> because reading the specs were not clear to me which one is meant to
> >> be used for this use case.
> >
> > I'm basing that on page 107 of, "A Practical guide to TPM 2.0". This
> > seems to be non-sensitive with respect to how they define privacy, so
> > using the storage hierarchy seems reasonable to me.
> >
> =

> I see. I also read that chapter and thought the opposite, that it's more =
better to
> use the endorsement hierarchy, because it addresses privacy (and so if th=
e disk is
> stolen, it can't be tracked to a specific TPM). But maybe I'll misunderst=
ood the
> information in that chapter so I'll read it again.

That scenario never really crossed my mind. I guess in theory it would be p=
ossible to trace it,
But if you stole the hard-drive, you likely already know what machine it ca=
me out of. Unless
It was just some random out of the machine already.

> =

> > This is all caveated with I am pretty new to TPM as well, so someone
> > more knowledgeable may see things differently.
> >
> =

> No worries, certainly have more experience than me so I really appreciate=
 your
> feedback!
> =

> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement Red Hat

--===============5924518844965602857==--

