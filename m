Content-Type: multipart/mixed; boundary="===============2713126147119016441=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Thu, 04 Oct 2018 16:04:26 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0142677E1C@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: e4e318159e88931c3333322d75458d8df24e12fb.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2713126147119016441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Should we try to setup a wiki or markdown to start converging into a single=
 form ?
I think we can also easily set NODA for the primary, because they have to a=
uth value anyways.

@James: how do you handle the key-ids ? Allways assume them to be files ?
I have a PR for persistent TPM keys, where all key ids starting with 0x are=
 interpreted as TPM keys.
For the future I'll also want to reference FAPI keys (path-like format).
Thus, any clues on how to handle things consistently here ?

tpm2-tss-engine will propably not support policies from your format then, b=
ut wait until FAPI (with integrated policy engine) is available.
________________________________________
From: David Woodhouse [dwmw2(a)infradead.org]
Sent: Wednesday, October 03, 2018 22:47
To: James Bottomley; Fuchs, Andreas; tpm2(a)lists.01.org; Nikos Mavrogianno=
poulos
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats

On Wed, 2018-10-03 at 11:35 +0100, David Woodhouse wrote:
>
>
> Full patch below, for reference. Don't heckle too hard; it exists
> mostly to document the current incompatibilities. I'll let the two of
> you come to an agreement on the correct way to resolve them, while I
> throw together some GnuTLS code to use the same PEM files.

OK... OpenConnect now supports both OpenSSL engines, and I've thrown
together some GnuTLS code cribbing from tpm2-tss-engine, implementing a
gnutls_privkey_t with some caveats (RSA only, PKCS#1 padding only,
no auth, no policy, only the default parent, ...).

http://git.infradead.org/users/dwmw2/openconnect.git/blob/tpm2:/gnutls_tpm2=
_esys.c
http://git.infradead.org/users/dwmw2/openconnect.git/blob/tpm2:/gnutls_tpm2=
.c

I'd love *not* to have to fix all those caveats, and for this to live
in a library somewhere instead. :)

--===============2713126147119016441==--

