Content-Type: multipart/mixed; boundary="===============0365037606694277269=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] facilitating BIOS update with seamless PCR policy change
Date: Tue, 15 Jan 2019 19:58:03 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CD993A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20190105184256.GA1974@carbon
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0365037606694277269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Petko Manolov [mailto:sti(a)nucleusys.com]
> Sent: Saturday, January 5, 2019 10:43 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org; Desai, Imran <imran.desai(a)intel.com>
> Subject: Re: [tpm2] facilitating BIOS update with seamless PCR policy cha=
nge
> =

> On 19-01-04 21:50:13, Roberts, William C wrote:
> > You can't change an existing objects policy AFAIK. So if you have
> > objects sealed to PCR state and PCR state changes, you're out of luck.
> > Imran, that statement is correct right?
> =

> This is not how i read "Non-Brittle PCRs (New in 2.0)" paragraph in "A Pr=
actical
> Guide to TPM2" book, page 34.

I quote, "In the TPM 2.0 specification, you can seal things to a PCR value =
approved by a
particular signer instead of to a particular PCR value"

That's what can be done with the policyauthorize command. In general that c=
ommand says
Any policy signed with key X is a valid policy. So you can mutate the polic=
y as needed and
Resign it. Whatever events are required to satisfy the policy, are policy s=
pecific. You're
Policy could be PCR specific, in which case you could:
1. make a PCR policy to specific PCR values and update policy with system c=
hanges
2. make a PCR policy specific to a set of PCR values via policy OR statemen=
ts
    Option 2 could allow rollback attacks


> =

> > You need to use policyauthorize when you build a new policy for an
> > object, which Pretty much means, any policy signed by X is ok. Thus
> > when PCR state changes, you Just sign a new PCR policy.
> =

> I really hope it is "policy signed by X _and_ these new PCR values" else =
it makes
> no sense to use PCR values as policy, isn't it?

It's literally policy signed by X, the contents of the policy are mutable a=
t that point.

> =

> > See this test for an example of usage:
> > https://github.com/tpm2-software/tpm2-tools/blob/master/test/integrati
> > on/tests/tcti/abrmd/policyauthorize.sh
> =

> Thanks for the reference.  I guess i'll be back with more questions after=
 i digest
> the above example.
> =

> =

> cheers,
> Petko
> =

> =

> > > -----Original Message-----
> > > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Petko Ma=
nolov
> > > Sent: Friday, January 4, 2019 10:21 AM
> > > To: tpm2(a)lists.01.org
> > > Subject: [tpm2] facilitating BIOS update with seamless PCR policy cha=
nge
> > >
> > > 	Hello guys,
> > >
> > > I'm trying to devise a way to change the PCR policy used to seal cert=
ain key
> into
> > > TPM2 in case of BIOS change.  So far i've run into this article (alon=
g with the
> > > references it suggests):
> > >
> > > 	https://github.com/tpm2-software/tpm2-tss/issues/487
> > >
> > > However, i did not find a definitive answer there.  Could someone ple=
ase
> > > elaborate or point me in the right direction i can read more about ho=
w to
> > > authorize the new PCR policy?
> > >
> > >
> > > thanks a bunch,
> > > Petko
> > > _______________________________________________
> > > tpm2 mailing list
> > > tpm2(a)lists.01.org
> > > https://lists.01.org/mailman/listinfo/tpm2
> >

--===============0365037606694277269==--

