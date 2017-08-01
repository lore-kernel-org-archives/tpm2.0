Content-Type: multipart/mixed; boundary="===============2076359031939191904=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Tue, 01 Aug 2017 02:29:27 +0200
Message-ID: <41bfe388-ea85-5880-a78c-8f888ffe328d@redhat.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563EAA8D2E@ORSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2076359031939191904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Bill,

Thanks a lot for your feedback.

On 07/31/2017 10:27 PM, Roberts, William C wrote:
> =

> =

>> -----Original Message-----
>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Javier Mart=
inez
>> Canillas
>> Sent: Wednesday, July 26, 2017 12:25 PM
>> To: tpm2(a)lists.01.org
>> Subject: [tpm2] feedback on unlocking LUKS volumes using a TPM2
>>
>> Hello folks,
>>
>> As mentioned before, I'm exploring on using a TPM2 chip to unlock a root=
 LUKS
>> volume so users don't need to type a passphrase as long as their systems=
 have
>> not been tampered with.
>>
>> Since I'm still new to TPM2, I wanted to share what I did in case people=
 more
>> familiar with the TCG specification could provide their feedback.
>>
>> First some context:
>>
>> We have a plugable framework for automated decryption that's called Clev=
is [0].
>>
>> Clevis has a number of "pins", where each pin implements an automated
>> decryption support using a different {en,de}cryption backend. It also has
>> infrastructure to {en,de}crypt data, unlock LUKS volumes and create comp=
lex
>> security policies.
>>
>> Clevis relies on the Jos=C3=A9 project [1], which is an C implementation=
 of the JOSE
>> (Javascript Object Signing and Encryption) standard [2]. It also uses th=
e LUKSMeta
>> project [3] to bind a pin to a LUKS volume, by storing the JWE (JSON Web
>> Encryption) [4] in the LUKS header so the data can later be decrypted an=
d the
>> volume unlocked.
>>
>> So I created a TPM2 pin [5] for clevis to reuse all this existing infras=
tructure.
>>
>> But I'm mostly interested for your feedback on the TPM2 bits, what I bas=
ically do
>> is something like this:
>>
>> - Create an authorization policy based on a set of PCR ids
>> - Create a primary key
>> - Create an object and pass as data to be sealed a JWK (JSON Web Key) [6=
] that is
>>   used to encrypt the LUKS volume master key.
>> - Create a JWE that contains the encrypted LUKS key and also information=
 on how
>>   to decrypt it. The information that's needed to unseal the JWK from th=
e TPM2 is:
>>
>>     - hierarchy used for the primary key and object
>>     - the hash and key algorithms used
>>     - PCR bank and ids for policy session
>>     - the public and private key pair for the sealed object
>>
>> The user can choose most of the parameters when using the clevis tpm2 pi=
n, but
>> these are the default used:
>>
>> - Endorsement hierarchy seed for the primary key and sealed object
>> - SHA-256 for primary and object name computation
>> - ECC as algorithm type for generated key
>> - SHA-1 PCR bank for PCR policy
>>
>> Do you think what I described is the correct approach? Specially I would=
 like to
>> know your opinion about storing not only the pub but also the priv key i=
n the
>> LUKS volume header (since both are needed for unsealing)
> =

> I'm not following what you're saying about storing the keypair here for u=
nsealing, shouldn't those keys
> be generated in the tpm and bound to a pcr policy?
>

Yes, maybe I'm failing in the terminology. My understanding is that the TPM=
2 on
TPM2_Create() creates a key pair, seals the passed data using this key, wra=
ps
the key using the parent key and finally returns that wrapped key pair to c=
aller.

Since the key pair is needed to be loaded for unsealing, I need to store it=
 in a
place so they can latter be used for unsealing.
 =

>  and using the
>> endorsement hierarchy by default.
> =

> I don't see the privacy concerns offhand, as no one is receiving a digita=
l signature from the private key generated?

That's why I'm storing it in an accessible place, since it can't be used wi=
thout
the TPM2. I just wanted to confirm if my understanding of the specs were co=
rrect.

> I think the storage hierarchy is more appropriate, but again I may be mis=
sing something.
> =


Can you please elaborate on why do you think the storage hierarchy (TPM_RH_=
OWNER)
is more appropriate? That's why I asked the question, because reading the s=
pecs
were not clear to me which one is meant to be used for this use case.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============2076359031939191904==--

