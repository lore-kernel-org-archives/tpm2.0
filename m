Content-Type: multipart/mixed; boundary="===============0417481205574945038=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] List supported EC curves
Date: Thu, 28 Sep 2017 10:49:40 +0200
Message-ID: <855d2ae9-816a-78f9-db91-cc1d2a3472c3@redhat.com>
In-Reply-To: a22561d5-aee3-7599-0252-8fe6ab44fa6c@advancedtelematic.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0417481205574945038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Anton,

On 09/27/2017 07:12 PM, Anton Gerasimov wrote:
> On 09/27/2017 05:38 PM, Anton Gerasimov wrote:
>>
>> Greetings,
>>
>> is there a way to display list of supported elliptic curves in a TPM
>> device? There should a TPM_CAP_ECC_CURVES field for it, but I couldn't
>> find how to extract it (or just raw dump of capabilities) with tpm2-tool=
s.
>>
>> Thanks,
>> Anton Gerasimov
>>
> Sorry, I've got the principle. I've made a patch in my working
> directory, if someone thinks it can be useful I can compose a proper PR.
>

I think others may find useful to have that information shown by
tpm2_dump_capability tool. So please feel free to propose a PR.
 =

> Thanks,
> Anton Gerasimov
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============0417481205574945038==--

