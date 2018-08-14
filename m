Content-Type: multipart/mixed; boundary="===============0276707755199898170=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: Re: [tpm2] tpm2-tools 3.1.2 release candidate
Date: Tue, 14 Aug 2018 23:19:13 +0100
Message-ID: <2338d010c774aedbf9de6fab5222a3f3a43965ba.camel@linux.intel.com>
In-Reply-To: 773b2ba7-4b6e-b1d7-8d17-ffa955aacaa4@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0276707755199898170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-08-13 at 13:20 +0200, Javier Martinez Canillas wrote:
> Hi Joshua,
> =

> On 08/01/2018 12:09 PM, Joshua Lock wrote:
> > On 16/07/2018 21:22, Joshua Lock wrote:
> > > Hello all,
> > > =

> > > I've just tagged and signed rc0 for tpm2-tools 3.1.2:
> > > =

https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.2-rc0
> > > =

> > > =

> > > Javier noticed that we had a behavioural change in 3.1 (compared
> > > to 3.0) =

> > > that was inappropriate for a minor version bump, that is we were
> > > using =

> > > user supplied object attributes exclusively (instead of ORing
> > > them with =

> > > the defaults). 3.1.2 reverts the change:
> > > =

> > > =

https://github.com/tpm2-software/tpm2-tools/commit/352908f7470338aba858a9ac=
20c1c5ec608b661c
> > >  =

> > =

> > I just tagged 3.1.2-rc1 to include an additional fix from Javier to
> > use =

> > better object attribute defaults in tpm2_create:
> > =

> > https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.2-rc1
> > =

> =

> I think is time to cut a final 3.1.2 release?

Absolutely, I'm working on it now. Apologies for the delay, I was away
on leave.

Joshua


--===============0276707755199898170==--

