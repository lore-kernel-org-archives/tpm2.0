Content-Type: multipart/mixed; boundary="===============5646084788795715637=="
MIME-Version: 1.0
From: Desai, Imran <imran.desai at intel.com>
Subject: Re: [tpm2] facilitating BIOS update with seamless PCR policy change
Date: Sun, 06 Jan 2019 02:47:25 +0000
Message-ID: <A1F0D45D-C07D-4E4A-B137-BA7C9D0E4289@intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649CD6CEA@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5646084788795715637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Correct. =


=EF=BB=BFOn 1/4/19, 2:50 PM, "Roberts, William C" <william.c.roberts(a)inte=
l.com> wrote:

    You can't change an existing objects policy AFAIK. So if you have objec=
ts sealed to PCR
    state and PCR state changes, you're out of luck. Imran, that statement =
is correct right?
    =

    You need to use policyauthorize when you build a new policy for an obje=
ct, which
    Pretty much means, any policy signed by X is ok. Thus when PCR state ch=
anges, you
    Just sign a new PCR policy.
    =

    See this test for an example of usage:
    https://github.com/tpm2-software/tpm2-tools/blob/master/test/integratio=
n/tests/tcti/abrmd/policyauthorize.sh
    =

    Bill
    =

    > -----Original Message-----
    > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Petko Ma=
nolov
    > Sent: Friday, January 4, 2019 10:21 AM
    > To: tpm2(a)lists.01.org
    > Subject: [tpm2] facilitating BIOS update with seamless PCR policy cha=
nge
    > =

    > 	Hello guys,
    > =

    > I'm trying to devise a way to change the PCR policy used to seal cert=
ain key into
    > TPM2 in case of BIOS change.  So far i've run into this article (alon=
g with the
    > references it suggests):
    > =

    > 	https://github.com/tpm2-software/tpm2-tss/issues/487
    > =

    > However, i did not find a definitive answer there.  Could someone ple=
ase
    > elaborate or point me in the right direction i can read more about ho=
w to
    > authorize the new PCR policy?
    > =

    > =

    > thanks a bunch,
    > Petko
    > _______________________________________________
    > tpm2 mailing list
    > tpm2(a)lists.01.org
    > https://lists.01.org/mailman/listinfo/tpm2
    =



--===============5646084788795715637==--

