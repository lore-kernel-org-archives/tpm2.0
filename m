Content-Type: multipart/mixed; boundary="===============7645555009276038404=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2-tools 3.1.2 release candidate
Date: Mon, 13 Aug 2018 13:20:28 +0200
Message-ID: <773b2ba7-4b6e-b1d7-8d17-ffa955aacaa4@redhat.com>
In-Reply-To: fb797dbc-15cb-34d0-e812-e69440319656@linux.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7645555009276038404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

On 08/01/2018 12:09 PM, Joshua Lock wrote:
> On 16/07/2018 21:22, Joshua Lock wrote:
>> Hello all,
>>
>> I've just tagged and signed rc0 for tpm2-tools 3.1.2:
>> https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.2-rc0
>>
>>
>> Javier noticed that we had a behavioural change in 3.1 (compared to 3.0) =

>> that was inappropriate for a minor version bump, that is we were using =

>> user supplied object attributes exclusively (instead of ORing them with =

>> the defaults). 3.1.2 reverts the change:
>>
>> https://github.com/tpm2-software/tpm2-tools/commit/352908f7470338aba858a=
9ac20c1c5ec608b661c =

> =

> I just tagged 3.1.2-rc1 to include an additional fix from Javier to use =

> better object attribute defaults in tpm2_create:
> =

> https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.2-rc1
>

I think is time to cut a final 3.1.2 release?
 =

> Thanks,
> Joshua

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7645555009276038404==--

