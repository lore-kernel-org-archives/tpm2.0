Content-Type: multipart/mixed; boundary="===============6452637996332501178=="
MIME-Version: 1.0
From: Jerry Snitselaar <jsnitsel at redhat.com>
Subject: [tpm2] tpm2-abrmd / glib question
Date: Wed, 18 Oct 2017 09:46:44 -0700
Message-ID: <20171018164644.66qhoow65gq4auxs@rhwork>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6452637996332501178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Looking at some items that coverity scan came up with for 1.1.0. It is
complaining about a null pointer passed as nonnull parameter with the
pthread_mutex_lock call in access_broker_lock. Is it possible for
access_broker_new to fail (g_object_new doesn't allocate an object?)?
Should there be some check after access_broker_new is called?  Looking
at the glib code, it seemed like there was at least a way through the
code to end up at g_malloc which can return null. I haven't finished
digging through the slab allocator code to see what can happen there.
I've read a comment though by Allison Lortie that said g_object_new
will alway return a non-null value, so I'm wondering what is returned
on failure, or if the claim is it will never fail.

--===============6452637996332501178==--

