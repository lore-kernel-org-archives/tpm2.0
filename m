Content-Type: multipart/mixed; boundary="===============0256141592926348505=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2.0-tools: Release 2.1.0 is available
Date: Fri, 22 Sep 2017 13:26:06 +0200
Message-ID: <2ce17cef-4c05-427a-81a7-2c5fc80d047f@redhat.com>
In-Reply-To: 1dee5a8a-0ad4-79c2-9af5-8e411dcc884e@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0256141592926348505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Bill and Philip,

On 08/16/2017 11:45 AM, fmartine(a)redhat.com wrote:
> On 08/14/2017 09:38 PM, Roberts, William C wrote:

[snip]

>>>>
>>>> I'm asking because there is a bunch of new stuff and fixes currently
>>>> in master, so it would be nice to start thinking on the next release:
>>>>
>>>> $ git lg 2.1.0..master | wc -l
>>>> 221
>>>>
>>>
>>> Any comments on this?
>>
>> Sorry I missed this, somehow. 3.0 is tentatively scheduled in Sept/Oct, =
but I want to
>> Coordinate this with the next version of tss, so I can pull in any of th=
e API incompatible
>> changes. So I am actually going to block the next major release of tools=
 on tss based on
>> my understanding with Phillip.
>>

Do you have a better idea about when the next tpm2-tss and tpm2-tools relea=
ses
may happen? The reason why of the nagging, is because as mentioned I have a=
 PR
for the Clevis project [0] that is using the latest stuff from tpm2-tools n=
ext.

But the problem is that we can't merge it until there's a release of tpm2-t=
ools
that contains those changes.

[0]: https://github.com/latchset/clevis/pull/17

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============0256141592926348505==--

