Content-Type: multipart/mixed; boundary="===============7037565091598345330=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: raspi tpm in lockdown
Date: Wed, 20 Nov 2019 15:40:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E45AD2@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAKrSGQQR=4K-QvPExTdoAFmX_M9qkMKO3fGjsDjA0htrZLPDxw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7037565091598345330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Luke Hinds [mailto:lhinds(a)redhat.com]
> Sent: Wednesday, November 20, 2019 1:38 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: Dennis Knorr <dennis.knorr(a)gmx.net>; tpm2(a)lists.01.org; Desai, Im=
ran
> <imran.desai(a)intel.com>
> Subject: Re: [tpm2] Re: raspi tpm in lockdown
> =

> =

> =

> On Tue, Nov 19, 2019 at 2:40 PM Roberts, William C <william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	I always recommend that you use tpm2-tools >=3D 4.0, versions < 4.0 are
> legacy at this point.
> =

> =

> =

> Sorry to hjiack this thread, is there someone where we list when versions=
 will
> become legacy / EOL etc?
> =

> I had a search in the repo, but did not manage to dig anything up.

For tpm2-tools project, not yet. It's something I need to write up. I have =
been
still accepting patches on 3.X from community members if they need a release
while everyone transitions to 4.X, but I have not been actively maintaining=
 3.X.

I summarized this in a new wiki entry:
https://github.com/tpm2-software/tpm2-tools/wiki/Release-Lifecycle


> =

> =

> =

> =

> 	Eventually, depending on configuration, the lockout mode should expire.
> You should
> 	Be able to run tpm2_getcap -c properties-variable | grep LOCKOUT
> 	TPM2_PT_LOCKOUT_COUNTER: 0x0
> 	TPM2_PT_LOCKOUT_INTERVAL: 0x3E8
> 	TPM2_PT_LOCKOUT_RECOVERY: 0x3E8
> =

> 	Should tell you how long you need to wait.
> =

> 	I remember their being all sorts of issues with tpm2_takeownership,
> depending
> 	On version where it was running all the changeauth commands even
> when the other
> 	hierarchies were not specified.
> =

> 	On PC's the bios usually has a reset option for the tpm. On raspberry pi=
, I
> am not sure
> 	how you would reset it. @idsea any idea?
> =

> 	Bill
> =

> 	> -----Original Message-----
> 	> From: Dennis Knorr [mailto:dennis.knorr(a)gmx.net
> <mailto:dennis.knorr(a)gmx.net> ]
> 	> Sent: Saturday, November 16, 2019 2:09 PM
> 	> To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> Subject: [tpm2] raspi tpm in lockdown
> 	>
> 	> Hi,
> 	> i tried to play with an tpm from letstrust.de <http://letstrust.de> . i
> played around a bit, but now it
> 	> seems to be in lockdown:
> 	> https://pastebin.com/S59y4tQk
> 	>
> 	> but i am SURE that i have the correct password. Any Idea what i did
> wrong?
> 	> anything i can do? i could remove the tpm chip from the raspberry?
> would that
> 	> help
> 	>
> 	> i hope you can help me.
> 	>
> 	> Dennis
> 	> _______________________________________________
> 	> tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>
> 	> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 	_______________________________________________
> 	tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>
> 	%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> =

> =

> =

> =

> --
> =

> Luke Hinds  | CTO Office | Red Hat
> e: lhinds(a)redhat.com <mailto:lhinds(a)redhat.com>  | irc: lhinds @freen=
ode | t:
> +44 12 52 36 2483


--===============7037565091598345330==--

