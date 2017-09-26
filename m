Content-Type: multipart/mixed; boundary="===============7617804363571052244=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2.0-tools: Release 2.1.0 is available
Date: Tue, 26 Sep 2017 22:09:24 +0200
Message-ID: <52362bc3-3835-5b55-5ce5-d9f221ebc008@redhat.com>
In-Reply-To: 1506378521.8771.53.camel@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7617804363571052244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/26/2017 12:28 AM, Philip Tricca wrote:
> On Fri, 2017-09-22 at 13:26 +0200, Javier Martinez Canillas wrote:
>> On 08/16/2017 11:45 AM, fmartine(a)redhat.com wrote:
>>> On 08/14/2017 09:38 PM, Roberts, William C wrote:

[snip]

>> Do you have a better idea about when the next tpm2-tss and tpm2-tools =

>> releases
>> may happen? The reason why of the nagging, is because as mentioned I
>> have a PR
>> for the Clevis project [0] that is using the latest stuff from tpm2-
>> tools next.
> =

> I had a chance to talk to some of the RedHat folks about Clevis @ the
> plumbers conference earlier this month. Interesting & exciting stuff.
>

Cool, someone also mentioned talking with you about TPM stuff (Peter or
Nathaniel I believe).
 =

> The next release of the tools doesn't depend on a new release of the
> TSS libraries so that should be off the critical path. The tools

I don't think that's true. At least when I try to build tpm2-tools master
with tpm2-tss 1.2.0, I get the following build errors:

https://pastebin.com/raw/6V4HBQPh

But it does build with tpm2-tss master of course. I haven't dig deeper to
see if the changes that break the build could be cherry-picked to the 1.X
branch though.

> release is however blocked on a bug in the tabrmd. This is my next work
> item.
>

Yes, I've been following the discussion but had remained silent lately
because I need to re-read/study the context management part of the specs
to better understand what the problem is and the suggested solutions.

>> But the problem is that we can't merge it until there's a release of
>> tpm2-tools
>> that contains those changes.
> =

> With the tools blocked on the tabrmd we'll be doing a release of the
> two in tandem. I'm expecing that the work I've signed up for there to
> be on the order of "a few weeks". So while I'm always hesitant to state
> release goals publicly I think this can be ready for a release toward
> the end of October. Can't make any guarantees but that's our goal.
>

Another problem is what would happen when the kernel resource manager is us=
ed,
since AFAIK there's no agreement yet on what the tools should do in that ca=
se.

> Best,
> Philip
> =

 =

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7617804363571052244==--

