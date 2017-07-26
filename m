Content-Type: multipart/mixed; boundary="===============5036666204938536950=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Wed, 26 Jul 2017 21:24:58 +0200
Message-ID: <ba3df81a-28ef-f823-e2c3-bfab9ca1a9aa@redhat.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5036666204938536950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello folks,

As mentioned before, I'm exploring on using a TPM2 chip to unlock a root LU=
KS
volume so users don't need to type a passphrase as long as their systems ha=
ve
not been tampered with.

Since I'm still new to TPM2, I wanted to share what I did in case people mo=
re
familiar with the TCG specification could provide their feedback.

First some context:

We have a plugable framework for automated decryption that's called Clevis =
[0].

Clevis has a number of "pins", where each pin implements an automated decry=
ption
support using a different {en,de}cryption backend. It also has infrastructu=
re to
{en,de}crypt data, unlock LUKS volumes and create complex security policies.

Clevis relies on the Jos=C3=A9 project [1], which is an C implementation of=
 the JOSE
(Javascript Object Signing and Encryption) standard [2]. It also uses the L=
UKSMeta
project [3] to bind a pin to a LUKS volume, by storing the JWE (JSON Web En=
cryption)
[4] in the LUKS header so the data can later be decrypted and the volume un=
locked.

So I created a TPM2 pin [5] for clevis to reuse all this existing infrastru=
cture.

But I'm mostly interested for your feedback on the TPM2 bits, what I basica=
lly do
is something like this:

- Create an authorization policy based on a set of PCR ids
- Create a primary key
- Create an object and pass as data to be sealed a JWK (JSON Web Key) [6] t=
hat is
  used to encrypt the LUKS volume master key.
- Create a JWE that contains the encrypted LUKS key and also information on=
 how
  to decrypt it. The information that's needed to unseal the JWK from the T=
PM2 is:

    - hierarchy used for the primary key and object
    - the hash and key algorithms used
    - PCR bank and ids for policy session
    - the public and private key pair for the sealed object

The user can choose most of the parameters when using the clevis tpm2 pin, =
but
these are the default used:

- Endorsement hierarchy seed for the primary key and sealed object
- SHA-256 for primary and object name computation
- ECC as algorithm type for generated key
- SHA-1 PCR bank for PCR policy

Do you think what I described is the correct approach? Specially I would li=
ke
to know your opinion about storing not only the pub but also the priv key in
the LUKS volume header (since both are needed for unsealing) and using the
endorsement hierarchy by default.

Thanks a lot!

[0]: https://github.com/latchset/clevis
[1]: https://github.com/latchset/jose
[2]: https://www.ietf.org/wg/concluded/jose
[3]: https://github.com/latchset/luksmeta
[4]: https://tools.ietf.org/html/rfc7516
[5]: https://github.com/latchset/clevis/pull/17
[6]: https://tools.ietf.org/html/rfc7517

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============5036666204938536950==--

