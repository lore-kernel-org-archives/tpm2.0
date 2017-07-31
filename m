Content-Type: multipart/mixed; boundary="===============6940937962811609678=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Mon, 31 Jul 2017 20:27:22 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAA8D2E@ORSMSX103.amr.corp.intel.com>
In-Reply-To: ba3df81a-28ef-f823-e2c3-bfab9ca1a9aa@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6940937962811609678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Javier Marti=
nez
> Canillas
> Sent: Wednesday, July 26, 2017 12:25 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] feedback on unlocking LUKS volumes using a TPM2
> =

> Hello folks,
> =

> As mentioned before, I'm exploring on using a TPM2 chip to unlock a root =
LUKS
> volume so users don't need to type a passphrase as long as their systems =
have
> not been tampered with.
> =

> Since I'm still new to TPM2, I wanted to share what I did in case people =
more
> familiar with the TCG specification could provide their feedback.
> =

> First some context:
> =

> We have a plugable framework for automated decryption that's called Clevi=
s [0].
> =

> Clevis has a number of "pins", where each pin implements an automated
> decryption support using a different {en,de}cryption backend. It also has
> infrastructure to {en,de}crypt data, unlock LUKS volumes and create compl=
ex
> security policies.
> =

> Clevis relies on the Jos=C3=A9 project [1], which is an C implementation =
of the JOSE
> (Javascript Object Signing and Encryption) standard [2]. It also uses the=
 LUKSMeta
> project [3] to bind a pin to a LUKS volume, by storing the JWE (JSON Web
> Encryption) [4] in the LUKS header so the data can later be decrypted and=
 the
> volume unlocked.
> =

> So I created a TPM2 pin [5] for clevis to reuse all this existing infrast=
ructure.
> =

> But I'm mostly interested for your feedback on the TPM2 bits, what I basi=
cally do
> is something like this:
> =

> - Create an authorization policy based on a set of PCR ids
> - Create a primary key
> - Create an object and pass as data to be sealed a JWK (JSON Web Key) [6]=
 that is
>   used to encrypt the LUKS volume master key.
> - Create a JWE that contains the encrypted LUKS key and also information =
on how
>   to decrypt it. The information that's needed to unseal the JWK from the=
 TPM2 is:
> =

>     - hierarchy used for the primary key and object
>     - the hash and key algorithms used
>     - PCR bank and ids for policy session
>     - the public and private key pair for the sealed object
> =

> The user can choose most of the parameters when using the clevis tpm2 pin=
, but
> these are the default used:
> =

> - Endorsement hierarchy seed for the primary key and sealed object
> - SHA-256 for primary and object name computation
> - ECC as algorithm type for generated key
> - SHA-1 PCR bank for PCR policy
> =

> Do you think what I described is the correct approach? Specially I would =
like to
> know your opinion about storing not only the pub but also the priv key in=
 the
> LUKS volume header (since both are needed for unsealing)

I'm not following what you're saying about storing the keypair here for uns=
ealing, shouldn't those keys
be generated in the tpm and bound to a pcr policy?

 and using the
> endorsement hierarchy by default.

I don't see the privacy concerns offhand, as no one is receiving a digital =
signature from the private key generated?
I think the storage hierarchy is more appropriate, but again I may be missi=
ng something.

> =

> Thanks a lot!
> =

> [0]: https://github.com/latchset/clevis
> [1]: https://github.com/latchset/jose
> [2]: https://www.ietf.org/wg/concluded/jose
> [3]: https://github.com/latchset/luksmeta
> [4]: https://tools.ietf.org/html/rfc7516
> [5]: https://github.com/latchset/clevis/pull/17
> [6]: https://tools.ietf.org/html/rfc7517
> =

> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement Red Hat
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============6940937962811609678==--

