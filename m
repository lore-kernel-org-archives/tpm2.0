Content-Type: multipart/mixed; boundary="===============5001026175001761899=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: Re: [tpm2] clevis with tpm-tools 2.1.0 (tpm2_create proper use for
 tpm2_unseal compatibility)
Date: Fri, 04 May 2018 10:38:27 +0000
Message-ID: <CANtcRX6JDcHsFnGRBnq1OTNL6+T=zvREpZZ9BpytFtJ37j1ZUA@mail.gmail.com>
In-Reply-To: d33df718-a330-7e03-a6c5-8429771e7367@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5001026175001761899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

thanks, that worked out very well!

echo hi | clevis encrypt tpm2 '{}' | clevis decrypt
hi

Also needed to build dracut, clevis from source to resolve some (Ubuntu
specific?) problems,
TAG_TPM2_TSS=3D1.4.0
TAG_TPM2_ABRMD=3D1.3.1
TAG_TPM2_TOOLS=3D3.0.4
TAG_DRACUT=3D047
TAG_CLEVIS=3Dv9

And dracut needed:
/usr/lib/dracut/dracut.conf.d/crc32c.conf: add_drivers=3D" crc32_pclmul "
On Thu, May 3, 2018 at 5:01 PM Javier Martinez Canillas <javierm(a)redhat.c=
om>
wrote:

> [adding back the mailing list since I dropped it by mistake]

> On 05/03/2018 04:50 PM, Peter Magnusson wrote:
> > Thanks!
> >
> > Any particular tag that you would recommend building the tools from, or
is
> > master:head the way to go?
> >

> I would recommend the latest stable versions. So that would be the
following:

> tpm2-tools 3.0.4
> tpm2-tss 1.4.0
> tpm2-abrmd 1.3.1

> The problem with master is that it's still a moving target. As mentioned
in the
> clevis issue, I'll propose a patch to make the tpm2 pin to support
tpm2-tools 4
> as soon as this is released.

> > //P
> > On Thu, May 3, 2018 at 2:56 PM Javier Martinez Canillas <
javierm(a)redhat.com>
> > wrote:
> >
> >> Hi Peter,
> >
> >> On 05/03/2018 12:44 PM, Peter Magnusson wrote:
> >>> Hi,
> >>>
> >>> I'm trying to get clevis 9 working with Ubuntu18 tpm-tools 2.1.0, but
> >>> clevis decrypt (tpm2_unseal) fail. l suspect the obj_attr values feed
> >
> >> I don't think that's going to work. The reason why I started
contributing
> >> to this project was because the 2.X unseal support wasn't really
working.
> >
> >> The problem is that some TPM2.0 commands require an authorization
session
> >> (if the tag is TPM_ST_SESSIONS), and this is the case for the
TPM2_Unseal
> >> command but support for this isn't supported in the 2.X release.
> >
> >> So you need at the very least the following commits that landed in 3.X:
> >
> >> 287eeb92555a tpm2_unseal: use build_policy() from tpm2 policy instead
> > open coding it
> >> 5435e1d79662 tpm2_unseal: add support to unseal an object using a PCR
> > policy for auth
> >> 141974c84508 tools: don't use relative path for tpm2_util.h header
include
> >> b8a442325361 tpm2_unseal: Adding support for session handle input for
> > policy based authorization
> >> 1b3efb759117 tpm2_unseal: don't copy optarg variable for context item
file
> >> 8aa7f644386d tpm2_unseal: allow to write unsealed data to the standard
> > output
> >> 2cd3feaff067 tpm2_unseal: don't copy the optarg variable for the output
> > file option
> >> df751ae5bea0 tpm2_unseal: fix unsealed data object serialization
> >
> >> More information is on the issue I opened at the time and the
follow-up:
> >
> >> https://github.com/tpm2-software/tpm2-tools/issues/313
> >> https://github.com/tpm2-software/tpm2-tools/issues/510
> >
> >>>
> >>> tpm2_unseal -T device -d /dev/tpmrm0 -c ...load.context -o -
> >>> ERROR: Sys_Unseal failed. Error Code: 0x12f
> >>> Unsealing jwk from TPM failed!
> >
> >> $ tpm2_rc_decode 0x12f
> >> tpm:error(2.0): authValue or authPolicy is not available for selected
> > entity
> >
> >> You can see that's the issue I mentioned above about the missing
> >> authorization session.
> >

> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement
> Red Hat

--===============5001026175001761899==--

