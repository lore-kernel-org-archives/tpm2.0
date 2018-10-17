Content-Type: multipart/mixed; boundary="===============5226118082877160980=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-tss-engine key compatibility with tpm2-pkcs11
Date: Wed, 17 Oct 2018 16:09:38 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C5F42B@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 5dac02535e60aa5842d020f308707674e5e8024c.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5226118082877160980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2(a)infradead.org]
> Sent: Wednesday, October 17, 2018 8:56 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg; Fuchs,
> Andreas <andreas.fuchs(a)sit.fraunhofer.de>; Chetty, Jay
> <jay.chetty(a)intel.com>
> Subject: Re: [tpm2] tpm2-tss-engine key compatibility with tpm2-pkcs11
> =

> On Wed, 2018-10-17 at 15:51 +0000, Roberts, William C wrote:
> > Oh duh, I forgot about that engine.
> >
> > + Jay who was working on stuff.
> >
> > FYI for others.
> > The engine is in P11 now:
> > https://github.com/OpenSC/libp11
> >
> > The engine is in this Ubuntu package:
> > apt-file search libpkcs11.so
> > libengine-pkcs11-openssl: /usr/lib/ssl/engines/libpkcs11.so
> =

> I'd strongly recommend doing this stuff on Fedora. Packaging guidelines
> there say that packages which use key from a file SHOULD also JustWork=E2=
=84=A2
> when given a PKCS#11 URI (be it by invoking the engine, or the native
> GnuTLS support for PKCS#11, etc.).

I wish I could fully appreciate what you're saying here. I don't know squat=
 about
PKCS#11 URIs or where how you specify them.

> =

> That way you can mostly focus on your own code, not other things that
> just aren't set up right.


--===============5226118082877160980==--

