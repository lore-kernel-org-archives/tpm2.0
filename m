Content-Type: multipart/mixed; boundary="===============7935067641998726257=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] feedback on unlocking LUKS volumes using a TPM2
Date: Mon, 07 Aug 2017 20:15:56 +0200
Message-ID: <b3d4d294-0cc3-4ad4-fa1d-98fa84de372c@redhat.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563EAABF06@ORSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7935067641998726257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/07/2017 06:56 PM, Roberts, William C wrote:

[snip]

>>>
>>> I'm basing that on page 107 of, "A Practical guide to TPM 2.0". This
>>> seems to be non-sensitive with respect to how they define privacy, so
>>> using the storage hierarchy seems reasonable to me.
>>>
>>
>> I see. I also read that chapter and thought the opposite, that it's more=
 better to
>> use the endorsement hierarchy, because it addresses privacy (and so if t=
he disk is
>> stolen, it can't be tracked to a specific TPM). But maybe I'll misunders=
tood the
>> information in that chapter so I'll read it again.
> =

> That scenario never really crossed my mind. I guess in theory it would be=
 possible to trace it,
> But if you stole the hard-drive, you likely already know what machine it =
came out of. Unless
> It was just some random out of the machine already.
> =


Indeed. After reading that chapter again and also from your comments, I cha=
nged
it to use the storage hierarchy instead. Thanks a lot for your feedback!

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7935067641998726257==--

