Content-Type: multipart/mixed; boundary="===============2624596312483644538=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] tpm2-tools man pages not installing?
Date: Fri, 06 Jul 2018 17:30:27 +0000
Message-ID: <7c2c4cf04dcc40f78856f2b7c3eee57e@AZDC-MMB02.GD-MS.US>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649BEECF3@ORSMSX106.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2624596312483644538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Matthias sent me the message below; it was the git fork step I was missing =
(I was just cloning & branching).  Okay, now we're in business...well, almo=
st.   It appears the company firewall is blocking me from pushing my change=
s up to my fork, which other devs have confirmed.  (Bringing info from the =
outside in is okay, but going the other way is often blocked.  Yum gets bro=
ken regularly, too.)  I've put in a request to get access to push to github=
.  That will probably take a few days, so I'll probably just push the chang=
es from home tonight.  =


Matthias, thanks for the steps in your other message; they were very helpfu=
l.

(I hope top-posting is okay.)

Peter

--
Hi Peter,

what you need to do is:

1) have a personal accounton Github
2) fork the tpm2 repository via the Github web interface (it's a button fou=
nd on the repository page once you're logged in)
3) now you can clone your personal fork of the tpm2 repository that lives u=
nder your personal Github namespace
4) once you're done with your work you can push to your personal, forked re=
pository and it becomes visible to the public on Github
5) now you can create a pull-request from your fork to the origin repositor=
y via the Github web interface.

Hope that helps :-)

Cheers

Matthias

--
Matthias Gerstner <matthias.gerstner(a)suse.de> Dipl.-Wirtsch.-Inf. (FH), S=
ecurity Engineer https://www.suse.com/security
Telefon: +49 911 740 53 290
GPG Key ID: 0x14C405C971923553

SUSE Linux GmbH
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton HRB 21284 (AG Nuer=
nberg)

-----Original Message-----
From: Roberts, William C [mailto:william.c.roberts(a)intel.com] =

Sent: Friday, July 06, 2018 12:13 PM
To: Scheie, Peter M; Joshua Lock
Cc: tpm2(a)lists.01.org
Subject: RE: [tpm2] tpm2-tools man pages not installing?

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

--===============2624596312483644538==--

