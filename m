Content-Type: multipart/mixed; boundary="===============4516893405397770050=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2.0-tools: Release 2.1.0 is available
Date: Wed, 16 Aug 2017 11:45:10 +0200
Message-ID: <1dee5a8a-0ad4-79c2-9af5-8e411dcc884e@redhat.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563EAC5173@ORSMSX103.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4516893405397770050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Bill,

On 08/14/2017 09:38 PM, Roberts, William C wrote:
> =

> =

>> -----Original Message-----
>> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
>> Sent: Thursday, August 10, 2017 7:43 AM
>> To: Roberts, William C <william.c.roberts(a)intel.com>; 'tpm2(a)lists.01=
.org'
>> <tpm2(a)lists.01.org>
>> Cc: Desai, Imran <imran.desai(a)intel.com>; Tricca, Philip B
>> <philip.b.tricca(a)intel.com>
>> Subject: Re: tpm2.0-tools: Release 2.1.0 is available
>>
>> On 08/02/2017 12:04 PM, Javier Martinez Canillas wrote:
>>> Hello folks,
>>>
>>> On 07/24/2017 07:54 PM, Roberts, William C wrote:
>>>> Release 2.1.0 is available at:
>>>> https://github.com/01org/tpm2.0-tools/releases/tag/2.1.0
>>>>
>>>> v2.1.0 - 2017-7-24
>>>
>>> I've some questions about the release process that were not answered
>>> by reading the RELEASE document in the repository (it would be nice to
>>> add the answers for these in the doc as well).
>>>
>>> 1- What's the expected time after a release for the next branch to be c=
reated?
> =

> I want to use milestones to track releases, next 3.0 will be on:
> https://github.com/01org/tpm2-tools/milestone/4
> =

> It's currently called next, but considering its not "api compatible" with=
 2.X, it
> will get another major bump, per semantic versioning guidelines.
> =

> When we get ready for release, the project will branch off of master and
> I'll cut an rc, if an rc sits with no changes, complaints or moans for a =
week,
> then it will be cut as a release.
> =

> I'll send an email to the mailing list highlighting this activity so folk=
s can prod and poke
> RCs and provide feedback.
> =

>>> 2- What's the expected time after a branch is created for a -rc to be r=
eleased?
> =

> 1 week, ill start with rc0 as soon as the branch is created.
> =

>>>
>>> I'm asking because there is a bunch of new stuff and fixes currently
>>> in master, so it would be nice to start thinking on the next release:
>>>
>>> $ git lg 2.1.0..master | wc -l
>>> 221
>>>
>>
>> Any comments on this?
> =

> Sorry I missed this, somehow. 3.0 is tentatively scheduled in Sept/Oct, b=
ut I want to
> Coordinate this with the next version of tss, so I can pull in any of the=
 API incompatible
> changes. So I am actually going to block the next major release of tools =
on tss based on
> my understanding with Phillip.
>

Ok, thanks a lot for the answers.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============4516893405397770050==--

