Content-Type: multipart/mixed; boundary="===============7126657130703525564=="
MIME-Version: 1.0
From: flihp <flihp at twobit.us>
Subject: Re: [tpm2] tpm2-abrmd / glib question
Date: Wed, 18 Oct 2017 11:59:43 -0700
Message-ID: <cd3f81fb-1d42-01cd-7b65-48572a26fc2f@twobit.us>
In-Reply-To: 20171018183352.w6fg67vvmwypca2w@rhwork
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7126657130703525564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/18/2017 11:33 AM, Jerry Snitselaar wrote:
> On Wed Oct 18 17, flihp wrote:
>> Hi Jerry,
>>
>> On 10/18/2017 09:46 AM, Jerry Snitselaar wrote:
>>> Looking at some items that coverity scan came up with for 1.1.0. It is
>>> complaining about a null pointer passed as nonnull parameter with the
>>> pthread_mutex_lock call in access_broker_lock.
>>
>> Are you running these scans yourself or are you looking at the output
>> from the scan.coverity.com service that we automate through travis-ci? I
>> haven't merged into the coverity_scan branch in a while (since the last
>> release) so this may be a new thing but last I checked coverity gave us
>> a clean bill of health.
>>
> =

> This is a scan that gets run against our packages here as part of the
> release process. As part of getting tpm2-abrmd into RHEL I have to go
> through the covscan output it generates, and determine if they are
> actual bugs or not. The two I've seen so far that were bugs, you've
> already dealt with upstream. The rest have been false positives.
> =

> This was the last one I was dealing with, and while I could tell
> the program would never get to that point without the broker allocated,
> blowing up long before it got there, I wasn't sure about whether or
> not it should be checked after allocation.
> =

>>> Is it possible for
>>> access_broker_new to fail (g_object_new doesn't allocate an object?)?
>>
>> According to the GObject docs GOjbect construction cannot fail.
>> https://developer.gnome.org/gobject/stable/howto-gobject-construction.ht=
ml
>>
>>
> =

> Thanks for the link. I've never dealt with glib, and was digging through
> stuff, but hadn't got to this page.
> =

>>> Should there be some check after access_broker_new is called?
>>> Looking> at the glib code, it seemed like there was at least a way
>>> through the
>>> code to end up at g_malloc which can return null. I haven't finished
>>> digging through the slab allocator code to see what can happen there.
>>> I've read a comment though by Allison Lortie that said g_object_new
>>> will alway return a non-null value, so I'm wondering what is returned
>>> on failure, or if the claim is it will never fail.
>>
>> This object needs some love. I've been going back and correcting common
>> GObject mistakes that I've made but there's still a ways to go. I did
>> object finalization last week:
>> https://github.com/01org/tpm2-abrmd/pull/211
>>
>> But the way I've coded the function isn't right since the SAPI context
>> creation in this _new function may fail (a situation currently ignored
>> by the code). GObject has a mechanism for doing initialization that
>> could fail after object creation, I just didn't know about it at the
>> time :( Thankfully Allison Lortie has a great blog post describing the
>> feature:
>> https://blogs.gnome.org/desrt/2012/02/26/a-gentle-introduction-to-gobjec=
t-construction/
>>
>>
> =

> I think it was a comment here where she mentioned that g_object_new
> would always
> return a non-null value.

I think this is the one you're referring to:
https://blogs.gnome.org/desrt/2012/02/26/a-gentle-introduction-to-gobject-c=
onstruction/#comment-1233

> =

>> Quick summary of the issue in this object:
>> 1) g_object_new cannot fail, if a memory allocation fails I think GLib
>> will abort the program. So I think the situation you're looking into
>> isn't an issue.
>> 2) The AccessBroker _new function needs to be cleaned up a bit to use
>> the interface described by Allison in the link above (GInitable).
>>
>> I'll queue up #2 from this list as an issue in the tabrmd github so I
>> don't forget.
>>
>> Philip
> =

> Yeah, I will go ahead and mark this one as not a bug, and finish up
> this process. :)

Excellent.

Philip

--===============7126657130703525564==--

