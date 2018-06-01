Content-Type: multipart/mixed; boundary="===============7542112429079254676=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] meta-measured updates
Date: Fri, 01 Jun 2018 16:01:24 -0700
Message-ID: <20180601230124.GA732@intel.com>
In-Reply-To: 20180530211304.GA11797@linux-uys3
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7542112429079254676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2018 at 05:13:04PM -0400, Trevor Woerner wrote:
> Hi Philip,
> =

> My hope is that one day the OE community will have one security layer to
> choose, rather than the three that we have currently.

In my experience things that live in a separate "security" area rarely
get tested well. Ideally they would live as close to the upstream "core"
as possible.

> I've looked at the three different layers and feel that meta-secure-core =
might
> be a better one to target. With respect to its TPM2 recipes, however,
> meta-secure-core (and the other, meta-security) lag behind meta-measured.=
 As
> such I've been working on some updates for meta-secure-core.
> =

> Are you still keen to fold meta-measured into something else? If not I co=
uld
> prepare a set of patches for meta-measured as well.

Given the above my first priority is figuring out how far upstream the
various pieces can go. I've been chatting with a few folks and have been
working up patches to yocto-kernel-cache and openembedded-core to
cleanup the kernel config fragments and integrate the resulting
kernel-module packages into packagegroup-base. With the swtpm stuff
being integrated into qemu it's now possible to test at least the
tpm-tis driver by:
1) creating a qemu machine with 'tpm-tis' added to the MACHINE_FEATURES
2) setup the swtpm daemon
3) runqemu booting core-image-base to verity the /dev/tpm* is created

After this gets reviewed and if usptream is willing I'm then hoping to
propose moving the recipes for user space bits as close to
openembedded-core as possible. I think the ideal end state would be
enabling something via COMBINED_FEATURES so that we can have
MACHINE_FEATURES and DISTRO_FEATURES working together to seamlessly pull
in the right kernel driver and TSS(2)? recipes.

Something you're willing to help test and maybe contribute a 'tested-by'
tag on patches when they get sent upstream?

> Looking at the master commit of tpm2-tss, specifically, I've noticed a nu=
mber
> of changes and was hoping for your feedback.
> =

> With the tss 1.x stuff we had:
> 	- libtcti-device
> 	- libtcti-socket
> 	- libsapi
> =

> The new tss 2.x stuff has:
> 	- libtss2-esys
> 	- libtss2-mu
> 	- libtss2-sys
> 	- libtss2-tcti-device
> 	- libtss2-tcti-mssim
> =

> I'm guessing libtss2-tcti-device is the new name for the old libtcti-devi=
ce.
> But are there any mappings from the new stuff to the older libtcti-socket=
 and
> libsapi?
> =

> It looks like things are going to get messy. It looks like, going forward,
> we're going to need to keep tpm2-tss_1.x.bb around as well as create
> tpm2-tss_2.x.bb recipes with differently named PACKAGES so existing recip=
es
> that use tss (and expect the old 1.x behaviour/API) can continue to work =
while
> allowing new code (or updates to the old) to use the new API (?).

I think Bill got all of this covered in his reply.

Philip

> =

> Best regards,
> 	Trevor
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============7542112429079254676==--

