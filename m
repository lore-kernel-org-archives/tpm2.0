Content-Type: multipart/mixed; boundary="===============1486711356126503931=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Thu, 03 Aug 2017 14:25:06 +0200
Message-ID: <7c5a9e12-2d69-ee6a-b142-74b58dd8ede8@redhat.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563EAA945D@ORSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1486711356126503931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Bill,

On 08/02/2017 08:00 PM, Roberts, William C wrote:

[snip]

>>>
>>
>> Yes, maybe I'm failing in the terminology. My understanding is that the =
TPM2 on
>> TPM2_Create() creates a key pair, seals the passed data using this key, =
wraps the
>> key using the parent key and finally returns that wrapped key pair to ca=
ller.
>>
>> Since the key pair is needed to be loaded for unsealing, I need to store=
 it in a
>> place so they can latter be used for unsealing.
> =

> In theory you can store that anywhere, the easier it is to get to the mor=
e prevalent someone
> can hose all of your data. The LUKS partition metadata seems reasonable, =
if they can delete
> that, they could hose your hard drive data anyways. A permeant entity in =
the TPM is also
> an option.
>

Exactly, that's what my reasoning as well. Good that you confirm my underst=
anding
and we are in the same page then.
 =

>>
>>>  and using the
>>>> endorsement hierarchy by default.
>>>
>>> I don't see the privacy concerns offhand, as no one is receiving a digi=
tal
>> signature from the private key generated?
>>
>> That's why I'm storing it in an accessible place, since it can't be used=
 without the
>> TPM2. I just wanted to confirm if my understanding of the specs were cor=
rect.
>>
>>> I think the storage hierarchy is more appropriate, but again I may be m=
issing
>> something.
>>>
>>
>> Can you please elaborate on why do you think the storage hierarchy
>> (TPM_RH_OWNER) is more appropriate? That's why I asked the question,
>> because reading the specs were not clear to me which one is meant to be =
used
>> for this use case.
> =

> I'm basing that on page 107 of, "A Practical guide to TPM 2.0". This seem=
s to be non-sensitive
> with respect to how they define privacy, so using the storage hierarchy s=
eems reasonable to
> me.
>

I see. I also read that chapter and thought the opposite, that it's more be=
tter to use
the endorsement hierarchy, because it addresses privacy (and so if the disk=
 is stolen,
it can't be tracked to a specific TPM). But maybe I'll misunderstood the in=
formation in
that chapter so I'll read it again.

> This is all caveated with I am pretty new to TPM as well, so someone more=
 knowledgeable may see
> things differently.
> =


No worries, certainly have more experience than me so I really appreciate y=
our feedback!

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============1486711356126503931==--

