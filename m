Content-Type: multipart/mixed; boundary="===============5571481866016207409=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Lifecycle of handles and contexts
Date: Mon, 18 Jul 2022 21:35:06 +0000
Message-ID: <2164e6a1f1a71ba937d139fe36f035653964108b.camel@intel.com>
In-Reply-To: BN8PR15MB27532F981A3B5DD0CA13351EF28C9@BN8PR15MB2753.namprd15.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5571481866016207409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-07-18 at 17:36 +0000, Kenneth Goldman wrote:
> It depends.  =

> =

> Windows seems to have a large keystore, so you probably don't have to
> ever
> flush.
> =

> Linux in kernel RM manages keys across processes but not within
> processes,
> so you still have to flush.

This is also how TBS works on Windows.

> =

> Why not seal (create) against the primary storage key.
> =

> > -----Original Message-----
> > From: Tim K <tpm2(a)bitzap.e4ward.com>
> > Sent: Monday, July 18, 2022 1:03 PM
> > To: tpm2(a)lists.01.org
> > Subject: [EXTERNAL] [tpm2] Re: Lifecycle of handles and contexts
> > =

> > > flushcontext
> > =

> > But when using a resource manager the context gets fushed
> > automatically.
> Or I
> > can flush it manually. But still, after a flushcontext, I can just
> tpm2_unseal
> > without loading the key again -- why does that work?

It would help to have specific examples and your environment, very
rarely do you ever need to be concerned with flushcontext calls. The
details below will be very specific to Linux using a resource manager
and the tpm2-tools. If your using the tpm2-tools you use a context
file, so even if the object is flushed, when you call tpm2_unseal -c
<context file> the context is loaded and object is created again. The
context files are only good for that "tpm boot". The same is if your
not using a resource manager, since the tpm2-tools act as a resource
manager. This is so you can use transient objects between commands and
have a resource manager automatically flush the transient resources.
The end goal is that the behavior should appear the same with and
without Resource Managers running in your scripts.

--===============5571481866016207409==--

