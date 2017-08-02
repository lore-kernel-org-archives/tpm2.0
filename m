Content-Type: multipart/mixed; boundary="===============4252710946536987599=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Wed, 02 Aug 2017 18:00:50 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAA945D@ORSMSX103.amr.corp.intel.com>
In-Reply-To: 41bfe388-ea85-5880-a78c-8f888ffe328d@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4252710946536987599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> Sent: Monday, July 31, 2017 5:29 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
> =

> Hello Bill,
> =

> Thanks a lot for your feedback.
> =

> On 07/31/2017 10:27 PM, Roberts, William C wrote:
> >
> >
> >> -----Original Message-----
> >> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Javier
> >> Martinez Canillas
> >> Sent: Wednesday, July 26, 2017 12:25 PM
> >> To: tpm2(a)lists.01.org
> >> Subject: [tpm2] feedback on unlocking LUKS volumes using a TPM2
> >>
> >> Hello folks,
> >>
> >> As mentioned before, I'm exploring on using a TPM2 chip to unlock a
> >> root LUKS volume so users don't need to type a passphrase as long as
> >> their systems have not been tampered with.
> >>
> >> Since I'm still new to TPM2, I wanted to share what I did in case
> >> people more familiar with the TCG specification could provide their fe=
edback.
> >>
> >> First some context:
> >>
> >> We have a plugable framework for automated decryption that's called Cl=
evis
> [0].
> >>
> >> Clevis has a number of "pins", where each pin implements an automated
> >> decryption support using a different {en,de}cryption backend. It also
> >> has infrastructure to {en,de}crypt data, unlock LUKS volumes and
> >> create complex security policies.
> >>
> >> Clevis relies on the Jos=C3=A9 project [1], which is an C implementati=
on
> >> of the JOSE (Javascript Object Signing and Encryption) standard [2].
> >> It also uses the LUKSMeta project [3] to bind a pin to a LUKS volume,
> >> by storing the JWE (JSON Web
> >> Encryption) [4] in the LUKS header so the data can later be decrypted
> >> and the volume unlocked.
> >>
> >> So I created a TPM2 pin [5] for clevis to reuse all this existing infr=
astructure.
> >>
> >> But I'm mostly interested for your feedback on the TPM2 bits, what I
> >> basically do is something like this:
> >>
> >> - Create an authorization policy based on a set of PCR ids
> >> - Create a primary key
> >> - Create an object and pass as data to be sealed a JWK (JSON Web Key) =
[6]
> that is
> >>   used to encrypt the LUKS volume master key.
> >> - Create a JWE that contains the encrypted LUKS key and also informati=
on on
> how
> >>   to decrypt it. The information that's needed to unseal the JWK from =
the
> TPM2 is:
> >>
> >>     - hierarchy used for the primary key and object
> >>     - the hash and key algorithms used
> >>     - PCR bank and ids for policy session
> >>     - the public and private key pair for the sealed object
> >>
> >> The user can choose most of the parameters when using the clevis tpm2
> >> pin, but these are the default used:
> >>
> >> - Endorsement hierarchy seed for the primary key and sealed object
> >> - SHA-256 for primary and object name computation
> >> - ECC as algorithm type for generated key
> >> - SHA-1 PCR bank for PCR policy
> >>
> >> Do you think what I described is the correct approach? Specially I
> >> would like to know your opinion about storing not only the pub but
> >> also the priv key in the LUKS volume header (since both are needed
> >> for unsealing)
> >
> > I'm not following what you're saying about storing the keypair here
> > for unsealing, shouldn't those keys be generated in the tpm and bound t=
o a pcr
> policy?
> >
> =

> Yes, maybe I'm failing in the terminology. My understanding is that the T=
PM2 on
> TPM2_Create() creates a key pair, seals the passed data using this key, w=
raps the
> key using the parent key and finally returns that wrapped key pair to cal=
ler.
> =

> Since the key pair is needed to be loaded for unsealing, I need to store =
it in a
> place so they can latter be used for unsealing.

In theory you can store that anywhere, the easier it is to get to the more =
prevalent someone
can hose all of your data. The LUKS partition metadata seems reasonable, if=
 they can delete
that, they could hose your hard drive data anyways. A permeant entity in th=
e TPM is also
an option.

> =

> >  and using the
> >> endorsement hierarchy by default.
> >
> > I don't see the privacy concerns offhand, as no one is receiving a digi=
tal
> signature from the private key generated?
> =

> That's why I'm storing it in an accessible place, since it can't be used =
without the
> TPM2. I just wanted to confirm if my understanding of the specs were corr=
ect.
> =

> > I think the storage hierarchy is more appropriate, but again I may be m=
issing
> something.
> >
> =

> Can you please elaborate on why do you think the storage hierarchy
> (TPM_RH_OWNER) is more appropriate? That's why I asked the question,
> because reading the specs were not clear to me which one is meant to be u=
sed
> for this use case.

I'm basing that on page 107 of, "A Practical guide to TPM 2.0". This seems =
to be non-sensitive
with respect to how they define privacy, so using the storage hierarchy see=
ms reasonable to
me.

This is all caveated with I am pretty new to TPM as well, so someone more k=
nowledgeable may see
things differently.

> =

> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement Red Hat

--===============4252710946536987599==--

