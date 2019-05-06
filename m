Content-Type: multipart/mixed; boundary="===============6564676744929822825=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Verifying that session encryption key is the one you
 expected
Date: Mon, 06 May 2019 17:01:46 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D30AD8@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0162F2C4E9@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6564676744929822825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
> Sent: Monday, May 6, 2019 9:54 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: RE: Verifying that session encryption key is the one you expected
> =

> Raw handles are bad, I agree.
> =

> Easy option:
> Serialize and deserialize the meta data of the persistent handle.
> Rational:
> The attack model for crafting a malicious ESYS_TR metadata on disk is equ=
al to
> that of crafting a malicious TPM2B_PUBLIC and TPM2B_PRIVATE (for loading)=
 on
> disk, right ?

Yep, that seems like a fair and easy approach. I'll have tpm2_evictcontrol =
dump an
ESYS_TR.

> =

> Other options:
> - StartAuthSession with tpmKey parameter (e.g. use the EK; after checking=
 the EK
> certificate) and then ReadPublic. That's what FAPI is going to do.

I'd like to leave this choice to the user.

> - StartAuthSession with bindObject parameter (uses the auth value to seed=
 the
> session key) and then ReadPublic. You could use the ownerAuth or an NV-In=
dex's
> auth for this.
> - Unrelyable ReadPublic of the persistent key, but then StartAuthSession =
with
> bindObject to persistent key and readPublic itself.
> =

> I hope this is enough choices. I can probably come up with more... ;-)
> =

> Cheers,
> Andreas
> =

> ________________________________________
> From: Roberts, William C [william.c.roberts(a)intel.com]
> Sent: Monday, May 06, 2019 18:30
> To: tpm2(a)lists.01.org; Fuchs, Andreas
> Subject: Verifying that session encryption key is the one you expected
> =

> I'm wondering if ESAPI does or provides a mechanism to ensure that the ke=
y I am
> using to start an encrypted session with is the one I expected.
> =

> I could obviously check by reading the public structure and verifying aga=
inst a
> known good, but I was wondering what ESAPI does for me in this area.
> =

> Loaded objects can come from 2 sources:
> 1. persistent handle
> 2. ContextLoad from TPM
> =

> ContextLoad would be fine, as you will get the object as expected from the
> context blob. The persistent handle we would need to check. Should I perh=
aps
> serialize the ESYS_TR Handle from evictcontrol and only allow that as inp=
ut vs raw
> Persistent handles? It look like anyone can craft a malicious ESYS_TR ser=
ialized to
> disk.

--===============6564676744929822825==--

