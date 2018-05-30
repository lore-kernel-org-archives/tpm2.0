Content-Type: multipart/mixed; boundary="===============6091971323385343589=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: [tpm2] meta-measured updates
Date: Wed, 30 May 2018 17:13:04 -0400
Message-ID: <20180530211304.GA11797@linux-uys3>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6091971323385343589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,

My hope is that one day the OE community will have one security layer to
choose, rather than the three that we have currently.

I've looked at the three different layers and feel that meta-secure-core mi=
ght
be a better one to target. With respect to its TPM2 recipes, however,
meta-secure-core (and the other, meta-security) lag behind meta-measured. As
such I've been working on some updates for meta-secure-core.

Are you still keen to fold meta-measured into something else? If not I could
prepare a set of patches for meta-measured as well.

Looking at the master commit of tpm2-tss, specifically, I've noticed a numb=
er
of changes and was hoping for your feedback.

With the tss 1.x stuff we had:
	- libtcti-device
	- libtcti-socket
	- libsapi

The new tss 2.x stuff has:
	- libtss2-esys
	- libtss2-mu
	- libtss2-sys
	- libtss2-tcti-device
	- libtss2-tcti-mssim

I'm guessing libtss2-tcti-device is the new name for the old libtcti-device.
But are there any mappings from the new stuff to the older libtcti-socket a=
nd
libsapi?

It looks like things are going to get messy. It looks like, going forward,
we're going to need to keep tpm2-tss_1.x.bb around as well as create
tpm2-tss_2.x.bb recipes with differently named PACKAGES so existing recipes
that use tss (and expect the old 1.x behaviour/API) can continue to work wh=
ile
allowing new code (or updates to the old) to use the new API (?).

Best regards,
	Trevor

--===============6091971323385343589==--

