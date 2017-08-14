Content-Type: multipart/mixed; boundary="===============6396704926416143932=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2.0-tools: Release 2.1.0 is available
Date: Mon, 14 Aug 2017 19:38:21 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAC5173@ORSMSX103.amr.corp.intel.com>
In-Reply-To: c5c239ba-13c3-5c24-9d53-6e38efcc61bc@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6396704926416143932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> Sent: Thursday, August 10, 2017 7:43 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; 'tpm2(a)lists.01.=
org'
> <tpm2(a)lists.01.org>
> Cc: Desai, Imran <imran.desai(a)intel.com>; Tricca, Philip B
> <philip.b.tricca(a)intel.com>
> Subject: Re: tpm2.0-tools: Release 2.1.0 is available
> =

> On 08/02/2017 12:04 PM, Javier Martinez Canillas wrote:
> > Hello folks,
> >
> > On 07/24/2017 07:54 PM, Roberts, William C wrote:
> >> Release 2.1.0 is available at:
> >> https://github.com/01org/tpm2.0-tools/releases/tag/2.1.0
> >>
> >> v2.1.0 - 2017-7-24
> >
> > I've some questions about the release process that were not answered
> > by reading the RELEASE document in the repository (it would be nice to
> > add the answers for these in the doc as well).
> >
> > 1- What's the expected time after a release for the next branch to be c=
reated?

I want to use milestones to track releases, next 3.0 will be on:
https://github.com/01org/tpm2-tools/milestone/4

It's currently called next, but considering its not "api compatible" with 2=
.X, it
will get another major bump, per semantic versioning guidelines.

When we get ready for release, the project will branch off of master and
I'll cut an rc, if an rc sits with no changes, complaints or moans for a we=
ek,
then it will be cut as a release.

I'll send an email to the mailing list highlighting this activity so folks =
can prod and poke
RCs and provide feedback.

> > 2- What's the expected time after a branch is created for a -rc to be r=
eleased?

1 week, ill start with rc0 as soon as the branch is created.

> >
> > I'm asking because there is a bunch of new stuff and fixes currently
> > in master, so it would be nice to start thinking on the next release:
> >
> > $ git lg 2.1.0..master | wc -l
> > 221
> >
> =

> Any comments on this?

Sorry I missed this, somehow. 3.0 is tentatively scheduled in Sept/Oct, but=
 I want to
Coordinate this with the next version of tss, so I can pull in any of the A=
PI incompatible
changes. So I am actually going to block the next major release of tools on=
 tss based on
my understanding with Phillip.

> =

> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement Red Hat

--===============6396704926416143932==--

