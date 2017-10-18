Content-Type: multipart/mixed; boundary="===============6562984242834182775=="
MIME-Version: 1.0
From: flihp <flihp at twobit.us>
Subject: Re: [tpm2] tpm2-abrmd / glib question
Date: Wed, 18 Oct 2017 10:49:24 -0700
Message-ID: <b3cb6c3d-f321-d071-9dd5-12b3ae01e366@twobit.us>
In-Reply-To: 20171018164644.66qhoow65gq4auxs@rhwork
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6562984242834182775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jerry,

On 10/18/2017 09:46 AM, Jerry Snitselaar wrote:
> Looking at some items that coverity scan came up with for 1.1.0. It is
> complaining about a null pointer passed as nonnull parameter with the
> pthread_mutex_lock call in access_broker_lock.

Are you running these scans yourself or are you looking at the output
from the scan.coverity.com service that we automate through travis-ci? I
haven't merged into the coverity_scan branch in a while (since the last
release) so this may be a new thing but last I checked coverity gave us
a clean bill of health.

> Is it possible for
> access_broker_new to fail (g_object_new doesn't allocate an object?)?

According to the GObject docs GOjbect construction cannot fail.
https://developer.gnome.org/gobject/stable/howto-gobject-construction.html

> Should there be some check after access_broker_new is called? Looking> at=
 the glib code, it seemed like there was at least a way through the
> code to end up at g_malloc which can return null. I haven't finished
> digging through the slab allocator code to see what can happen there.
> I've read a comment though by Allison Lortie that said g_object_new
> will alway return a non-null value, so I'm wondering what is returned
> on failure, or if the claim is it will never fail.

This object needs some love. I've been going back and correcting common
GObject mistakes that I've made but there's still a ways to go. I did
object finalization last week: https://github.com/01org/tpm2-abrmd/pull/211

But the way I've coded the function isn't right since the SAPI context
creation in this _new function may fail (a situation currently ignored
by the code). GObject has a mechanism for doing initialization that
could fail after object creation, I just didn't know about it at the
time :( Thankfully Allison Lortie has a great blog post describing the
feature:
https://blogs.gnome.org/desrt/2012/02/26/a-gentle-introduction-to-gobject-c=
onstruction/

Quick summary of the issue in this object:
1) g_object_new cannot fail, if a memory allocation fails I think GLib
will abort the program. So I think the situation you're looking into
isn't an issue.
2) The AccessBroker _new function needs to be cleaned up a bit to use
the interface described by Allison in the link above (GInitable).

I'll queue up #2 from this list as an issue in the tabrmd github so I
don't forget.

Philip

--===============6562984242834182775==--

