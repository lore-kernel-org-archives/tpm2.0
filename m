Content-Type: multipart/mixed; boundary="===============7190621379048510515=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] seal and unseal data based on a PCR value
Date: Wed, 20 Jun 2018 23:11:05 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649BD9E1E@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20180620204223.GA2642@carbon
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7190621379048510515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I just uploaded a wiki that has the bits on seal/unseal
https://github.com/tpm2-software/tpm2-tools/wiki/Creating-Objects

You need PCR policy support on top of what that wiki discusses, which we ha=
ve a script test for here:
test/integration/tests/unseal.sh

If you need to implement natively, the tools will serve as reference code o=
n how to piece it all together.

Bill

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Petko Manolov
> Sent: Wednesday, June 20, 2018 1:42 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] seal and unseal data based on a PCR value
> =

> 	Hello guys,
> =

> I know this one has been asked many times, but i could not find a definit=
ive
> howto, exact steps, etc.
> =

> This project requires that a piece of data is being sealed to a TPM2 base=
d on a
> PCR value and then unsealed from TBoot.  I've harvested some bits an piec=
es
> from various discussions and still can't build a coherent picture in my m=
ind.
> =

> What would be the best place to start reading up on this?
> =

> =

> cheers,
> Petko
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============7190621379048510515==--

