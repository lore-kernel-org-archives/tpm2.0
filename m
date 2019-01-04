Content-Type: multipart/mixed; boundary="===============6096353158090571593=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] facilitating BIOS update with seamless PCR policy change
Date: Fri, 04 Jan 2019 21:50:13 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CD6CEA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20190104182036.GA8278@carbon
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6096353158090571593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You can't change an existing objects policy AFAIK. So if you have objects s=
ealed to PCR
state and PCR state changes, you're out of luck. Imran, that statement is c=
orrect right?

You need to use policyauthorize when you build a new policy for an object, =
which
Pretty much means, any policy signed by X is ok. Thus when PCR state change=
s, you
Just sign a new PCR policy.

See this test for an example of usage:
https://github.com/tpm2-software/tpm2-tools/blob/master/test/integration/te=
sts/tcti/abrmd/policyauthorize.sh

Bill

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Petko Manolov
> Sent: Friday, January 4, 2019 10:21 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] facilitating BIOS update with seamless PCR policy change
> =

> 	Hello guys,
> =

> I'm trying to devise a way to change the PCR policy used to seal certain =
key into
> TPM2 in case of BIOS change.  So far i've run into this article (along wi=
th the
> references it suggests):
> =

> 	https://github.com/tpm2-software/tpm2-tss/issues/487
> =

> However, i did not find a definitive answer there.  Could someone please
> elaborate or point me in the right direction i can read more about how to
> authorize the new PCR policy?
> =

> =

> thanks a bunch,
> Petko
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============6096353158090571593==--

