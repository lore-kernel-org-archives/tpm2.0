Content-Type: multipart/mixed; boundary="===============8824705875191274747=="
MIME-Version: 1.0
From: Petko Manolov <sti at nucleusys.com>
Subject: Re: [tpm2] seal and unseal data based on a PCR value
Date: Thu, 21 Jun 2018 10:38:41 -0700
Message-ID: <20180621173840.GA5970@carbon>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649BD9E1E@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8824705875191274747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18-06-20 23:11:05, Roberts, William C wrote:
> I just uploaded a wiki that has the bits on seal/unseal =

> https://github.com/tpm2-software/tpm2-tools/wiki/Creating-Objects

Thanks for this pointer.  It's very usefull.

> You need PCR policy support on top of what that wiki discusses, which we =
have =

> a script test for here: test/integration/tests/unseal.sh

Yeah, i finally managed to get it to work with the latest stable tpm2-tools.

> If you need to implement natively, the tools will serve as reference code=
 on =

> how to piece it all together.

So far i only need to use the tools.  Using the API is not on the roadmap y=
et.


cheers,
Petko


> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Petko Mano=
lov
> > Sent: Wednesday, June 20, 2018 1:42 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] seal and unseal data based on a PCR value
> > =

> > 	Hello guys,
> > =

> > I know this one has been asked many times, but i could not find a defin=
itive
> > howto, exact steps, etc.
> > =

> > This project requires that a piece of data is being sealed to a TPM2 ba=
sed on a
> > PCR value and then unsealed from TBoot.  I've harvested some bits an pi=
eces
> > from various discussions and still can't build a coherent picture in my=
 mind.
> > =

> > What would be the best place to start reading up on this?
> > =

> > =

> > cheers,
> > Petko
> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2
>=20

--===============8824705875191274747==--

