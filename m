Content-Type: multipart/mixed; boundary="===============1853536299378823495=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] 2.1.0 tag for tpm2.0-tools?
Date: Tue, 05 Sep 2017 17:34:28 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAE6584@ORSMSX103.amr.corp.intel.com>
In-Reply-To: 20170831184431.vgkshwn5hdc6fpic@rhwork
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1853536299378823495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Roberts, William C
> Sent: Tuesday, September 5, 2017 10:32 AM
> To: 'Jerry Snitselaar' <jsnitsel(a)redhat.com>; Javier Martinez Canillas
> <fmartine(a)redhat.com>
> Cc: tpm2(a)lists.01.org
> Subject: RE: [tpm2] 2.1.0 tag for tpm2.0-tools?
> =

> =

> =

> > -----Original Message-----
> > From: Jerry Snitselaar [mailto:jsnitsel(a)redhat.com]
> > Sent: Thursday, August 31, 2017 11:45 AM
> > To: Javier Martinez Canillas <fmartine(a)redhat.com>; Roberts, William C
> > <william.c.roberts(a)intel.com>
> > Cc: tpm2(a)lists.01.org
> > Subject: Re: [tpm2] 2.1.0 tag for tpm2.0-tools?
> >
> > On Thu Aug 31 17, Jerry Snitselaar wrote:
> > >On Thu Aug 31 17, Javier Martinez Canillas wrote:
> > >>Hello Jerry,
> > >>
> > >>On 08/29/2017 06:32 PM, Jerry Snitselaar wrote:
> > >>>Should there be a 2.1.0 tag? The last I see is the -rc1.
> > >>>
> > >>
> > >>I do see a 2.1.0 tag in the repo:
> > >>
> > >>$ git tag | grep 2.1.0
> > >>2.1.0
> > >>2.1.0-rc0
> > >>2.1.0-rc1
> > >>
> > >>Best regards,
> > >>--
> > >>Javier Martinez Canillas
> > >>Software Engineer - Desktop Hardware Enablement Red Hat
> > >
> > >Thanks Javier. Yeah, I needed to fetch --tags. Robert, should
> > >
> >
> > :( I meant to say William there. More caffine needed.
> >
> > >27d34a6 | 2017-07-24 | CHANGELOG: update for 2.1.0 release (William
> > >Roberts)
> > >
> > >be on the 2.X branch? Currently it is off by itself.
> =

> Weird, how did I screw that up... I wen't through all my commits with git=
 fsck But I
> can't find that, can you send me a patch file or PR and ill apply it and =
update the
> tag. There was no code changes from rc1 to the actual release.

Ohh I see what I did, that was the tag head for 2.1.0, I just pushed that t=
o 2.X,
Should be good now, thanks.

--===============1853536299378823495==--

