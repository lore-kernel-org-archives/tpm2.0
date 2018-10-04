Content-Type: multipart/mixed; boundary="===============5874261156445596462=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Thu, 04 Oct 2018 10:58:17 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C4A673@ORSMSX106.amr.corp.intel.com>
In-Reply-To: 3bf2ba5655ca867b333e4da210c588be98691c7f.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5874261156445596462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of David Woodho=
use
> Sent: Wednesday, October 3, 2018 7:06 AM
> To: James Bottomley <James.Bottomley(a)Hansenpartnership.com>; Fuchs,
> Andreas <andreas.fuchs(a)sit.fraunhofer.de>; tpm2(a)lists.01.org; Nikos
> Mavrogiannopoulos <n.mavrogiannopoulos(a)gmail.com>
> Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
> =

> On Wed, 2018-10-03 at 13:00 +0200, James Bottomley wrote:
> > On October 3, 2018 12:47:15 PM CEST, David Woodhouse
> <dwmw2(a)infradead.org> wrote:
> > > On Wed, 2018-10-03 at 12:40 +0200, James Bottomley wrote:
> > > > > --- a/src/tpm2-tss-engine-common.h
> > > > > +++ b/src/tpm2-tss-engine-common.h
> > > > > @@ -55,8 +55,7 @@ TSS2_RC init_tpm_key(ESYS_CONTEXT **ctx,
> > > > > ESYS_TR *keyHandle,
> > > > >          .objectAttributes =3D (TPMA_OBJECT_USERWITHAUTH | \
> > > > >                               TPMA_OBJECT_RESTRICTED | \
> > > > >                               TPMA_OBJECT_DECRYPT | \
> > > > > -                             TPMA_OBJECT_FIXEDTPM | \
> > > > > -                             TPMA_OBJECT_FIXEDPARENT | \
> > > > > +                             TPMA_OBJECT_NODA | \
> > > >
> > > > This is the only troubling change, the rest looks fine to me.  The
> > > > template for a TPM created key *must* contain those two flags.
> > > > NODA
> > >
> > > is
> > > > one of those things which should be specified on the command line
> > > > rather than hard coded as well.  So to be exact, you need an extra
> > > > command line flag for whether or not you want TPMA_OBJECT_NODA
> > > > (some keys would like DA protection, especially private VPN ones,
> > > > but the creator of the key should ultimately decide) and if you
> > > > have a TPM create key you need TPMA_OBJECT_FIXEDTPM and
> > > > TPMA_OBJECT_FIXEDPARENT but if you're wrapping an existing key they
> have to be clear.

You could rip off the attribute parsing code from tpm2-tools if you wanted,=
 lets you do things like:
--<option-name> 'restricted|decrypt|ficedtpm|noda'

Granted, it's not the most user-friendly if all you care about is toggling =
noda, but it is
flexible.

> > >
> > > This is for generating the primary key. It looks like your code
> > > always sets NODA, but *not* FIXEDTPM and FIXEDPARENT.
> > >
> > > The tpm2-tss engine does set FIXEDTPM and FIXEDPARENT, but not NODA.
> > >
> > > As noted, the above patch comes from blindly making tpm2-tss-engine
> > > look like your code, without even looking at what the flags mean :)
> > >
> > > I don't see why you set NODA on the primary key which has no auth
> > > anyway, and you seem to be saying that the lack of FIXED{TPM,PARENT}
> > > on your side is also problematic?
> >
> > For createprimary, noda is correct because it has no password.  Let me
> > check the fixeds. The primary should have them.  I'm boarding in Paris
> > at the moment but will check in-flight.
> >
> > > Does that mean we should be changing your code to match what's in
> > > tpm2-tss-engine?
> >
> > I think for the fixeds yes but likely it doesn't matter for the
> > primary because it will be assumed.
> =

> Whether it's assumed or not, changing it does appear to change the result=
ing
> primary so that it can no longer unwrap the previously- wrapped keys.


--===============5874261156445596462==--

