Content-Type: multipart/mixed; boundary="===============4413110455872685550=="
MIME-Version: 1.0
From: Petko Manolov <sti at nucleusys.com>
Subject: Re: [tpm2] facilitating BIOS update with seamless PCR policy change
Date: Sat, 05 Jan 2019 20:42:56 +0200
Message-ID: <20190105184256.GA1974@carbon>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649CD6CEA@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4413110455872685550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19-01-04 21:50:13, Roberts, William C wrote:
> You can't change an existing objects policy AFAIK. So if you have objects =

> sealed to PCR state and PCR state changes, you're out of luck. Imran, tha=
t =

> statement is correct right?

This is not how i read "Non-Brittle PCRs (New in 2.0)" paragraph in "A Prac=
tical =

Guide to TPM2" book, page 34.

> You need to use policyauthorize when you build a new policy for an object=
, =

> which Pretty much means, any policy signed by X is ok. Thus when PCR stat=
e =

> changes, you Just sign a new PCR policy.

I really hope it is "policy signed by X _and_ these new PCR values" else it =

makes no sense to use PCR values as policy, isn't it?

> See this test for an example of usage:
> https://github.com/tpm2-software/tpm2-tools/blob/master/test/integration/=
tests/tcti/abrmd/policyauthorize.sh

Thanks for the reference.  I guess i'll be back with more questions after i =

digest the above example.


cheers,
Petko


> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Petko Mano=
lov
> > Sent: Friday, January 4, 2019 10:21 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] facilitating BIOS update with seamless PCR policy change
> > =

> > 	Hello guys,
> > =

> > I'm trying to devise a way to change the PCR policy used to seal certai=
n key into
> > TPM2 in case of BIOS change.  So far i've run into this article (along =
with the
> > references it suggests):
> > =

> > 	https://github.com/tpm2-software/tpm2-tss/issues/487
> > =

> > However, i did not find a definitive answer there.  Could someone please
> > elaborate or point me in the right direction i can read more about how =
to
> > authorize the new PCR policy?
> > =

> > =

> > thanks a bunch,
> > Petko
> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2
>=20

--===============4413110455872685550==--

