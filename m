Content-Type: multipart/mixed; boundary="===============8257635816474388584=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-tools man pages not installing?
Date: Fri, 06 Jul 2018 17:12:46 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649BEECF3@ORSMSX106.amr.corp.intel.com>
In-Reply-To: 9f29431b89314dbf8995da498c272846@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8257635816474388584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So you don't push to the origin remote. You need to fork, push to your fork=
 and then
Create a Pull Request (PR) back to the project. This should answer your que=
stions here:
https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/

Let me know if you run into issues, just PM me.

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Scheie, Pete=
r M
> Sent: Friday, July 6, 2018 8:19 AM
> To: Joshua Lock <joshua.g.lock(a)linux.intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] tpm2-tools man pages not installing?
> =

> I don't think I have permission to push my branch to github, do I?  When =
I do a 'git
> push origin update-tpm2-unseal-man-page' I get a 'remote: Permission to t=
pm2-
> software/tpm2-tools.git denied to pscheie" error, which isn't surprising =
as you
> wouldn't want every Tom, Dick, and Harry pushing branches up.  But I thin=
k I have
> to have my branch pushed before I can create a pull request, right?  (Oth=
erwise,
> people can't see the changes I made.)
> =

> Peter
> =

> -----Original Message-----
> From: Scheie, Peter M
> Sent: Friday, July 06, 2018 9:10 AM
> To: 'Joshua Lock'
> Cc: tpm2(a)lists.01.org
> Subject: RE: [tpm2] tpm2-tools man pages not installing?
> =

> Heh, when your message arrived, I was just reading through your pull requ=
est for
> "object auth short form unification" and discovered why I'm having so much
> trouble with tpm2_create (the argument letters changed last week). :-)
> =

> Anyway, I'm glad to help out if I can, so I'll do the pull request  I'm n=
ot very good
> with git, so I may have questions.
> =

> Peter
> =

> -----Original Message-----
> From: Joshua Lock [mailto:joshua.g.lock(a)linux.intel.com]
> Sent: Friday, July 06, 2018 8:49 AM
> To: Scheie, Peter M
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] tpm2-tools man pages not installing?
> =

> No need to apologise, we do have plans to review and try to improve the q=
uality
> of all of the manual pages. In the interim a Github pull request would be=
 most
> welcome.
> =

> Joshua
> =

> On 05/07/2018 21:44, Scheie, Peter M wrote:
> > BTW, there's a grammatical error in the man page for tpm2_unseal.  What=
's the
> best way to get that fixed?  (Sorry, my mother was an English major).
> >
> > Peter
> >
> > -----Original Message-----
> > From: Joshua Lock [mailto:joshua.g.lock(a)linux.intel.com]
> > Sent: Wednesday, July 04, 2018 5:10 AM
> > To: Matthias Gerstner; Scheie, Peter M
> > Cc: tpm2(a)lists.01.org
> > Subject: Re: [tpm2] tpm2-tools man pages not installing?
> >
> >
> >
> > On 03/07/2018 15:53, Matthias Gerstner wrote:
> >> Hello,
> >>
> >> On Tue, Jul 03, 2018 at 01:46:14PM +0000, Scheie, Peter M wrote:
> >>> When I build & install tpm2-tools, the man pages don't seem to get
> >>> installed.  I'm just using the default './configure; make; sudo make
> >>> install' routine, so everything is going into /usr/local/;
> >>> therefore, I'd expect the man pages to end up in
> >>> /usr/local/share/man, but they don't.  Do I need add an argument to
> configure to make that happen?
> >>
> >> that is actually a bug and I addressed it via commit
> >> 72a28f36151db9bfa59a460ae0114dcece218862, however that commit didn't
> >> make it into the current release.
> >>
> >> So you either have to install them manually or, as a workaround, if
> >> you have pandoc installed on the system, then the build system tries
> >> to generate the man pages and alongside that also installs them.
> >
> > Thanks for the report Peter and for pointing to the fix Matthias. I've
> > backported the change to the 3.X branch and tagged a release candidate
> > for 3.1.1 which includes the fix:
> >
> > https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.1-rc0
> >
> > Regards,
> > Joshua
> >
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============8257635816474388584==--

