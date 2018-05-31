Content-Type: multipart/mixed; boundary="===============3421690647066938661=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] meta-measured updates
Date: Thu, 31 May 2018 21:14:49 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649BD577E@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAHUNapSA-Etb1L3hkRwm6UkH4__LuWf9=ejLZ8mXetfirEniLA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3421690647066938661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Trevor Woern=
er
> Sent: Wednesday, May 30, 2018 4:49 PM
> To: tpm2(a)lists.01.org
> Subject: Re: [tpm2] meta-measured updates
> =

> On Wed, May 30, 2018 at 5:13 PM, Trevor Woerner <twoerner(a)gmail.com
> <mailto:twoerner(a)gmail.com> > wrote:
> =

> =

> 	Are you still keen to fold meta-measured into something else? If not I
> could
> 	prepare a set of patches for meta-measured as well.
> =

> 	Looking at the master commit of tpm2-tss, specifically, I've noticed a
> number
> 	of changes and was hoping for your feedback.
> =

> 	With the tss 1.x stuff we had:
> 	        - libtcti-device
> 	        - libtcti-socket
> 	        - libsapi
> =

> 	The new tss 2.x stuff has:
> 	        - libtss2-esys

This is the new enhanced (I think its enhanced) system api =


> 	        - libtss2-mu

This is the new marshaling library

> 	        - libtss2-sys

This is the old libsapi

> 	        - libtss2-tcti-device

This is the old device tcti

> 	        - libtss2-tcti-mssim

This is the old socket tcti

> =

> 	I'm guessing libtss2-tcti-device is the new name for the old libtcti-dev=
ice.
> 	But are there any mappings from the new stuff to the older libtcti-socket
> and
> 	libsapi?

See above inline comments.

> =

> =

> =

> In any case, here's a WIP of my changes:
> https://github.com/twoerner/meta-secure-core/tree/contrib/twoerner/tpm2-
> recipe-updates/meta-tpm2/recipes-tpm
> =

> Specifically, please take a look at the _git recipes, which currently bui=
ld off the
> master branch of all tpm2-software's components.
> What do you think of tpm2-tss/tpm2-tss_git.bb <http://tpm2-tss_git.bb> 's
> PACKAGES?


--===============3421690647066938661==--

