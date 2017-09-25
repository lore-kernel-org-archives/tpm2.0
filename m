Content-Type: multipart/mixed; boundary="===============4465930554607370360=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.us>
Subject: Re: [tpm2] tpm2.0-tools: Release 2.1.0 is available
Date: Mon, 25 Sep 2017 15:28:41 -0700
Message-ID: <1506378521.8771.53.camel@twobit.us>
In-Reply-To: 2ce17cef-4c05-427a-81a7-2c5fc80d047f@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4465930554607370360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-22 at 13:26 +0200, Javier Martinez Canillas wrote:
> Hello Bill and Philip,
> =

> On 08/16/2017 11:45 AM, fmartine(a)redhat.com wrote:
> > On 08/14/2017 09:38 PM, Roberts, William C wrote:
> =

> [snip]
> =

> > > > > =

> > > > > I'm asking because there is a bunch of new stuff and fixes
> > > > > currently
> > > > > in master, so it would be nice to start thinking on the next
> > > > > release:
> > > > > =

> > > > > $ git lg 2.1.0..master | wc -l
> > > > > 221
> > > > > =

> > > > =

> > > > Any comments on this?
> > > =

> > > Sorry I missed this, somehow. 3.0 is tentatively scheduled in
> > > Sept/Oct, but I want to
> > > Coordinate this with the next version of tss, so I can pull in
> > > any of the API incompatible
> > > changes. So I am actually going to block the next major release
> > > of tools on tss based on
> > > my understanding with Phillip.
> > > =

> =

> Do you have a better idea about when the next tpm2-tss and tpm2-tools =

> releases
> may happen? The reason why of the nagging, is because as mentioned I
> have a PR
> for the Clevis project [0] that is using the latest stuff from tpm2-
> tools next.

I had a chance to talk to some of the RedHat folks about Clevis @ the
plumbers conference earlier this month. Interesting & exciting stuff.

The next release of the tools doesn't depend on a new release of the
TSS libraries so that should be off the critical path. The tools
release is however blocked on a bug in the tabrmd. This is my next work
item.

> But the problem is that we can't merge it until there's a release of
> tpm2-tools
> that contains those changes.

With the tools blocked on the tabrmd we'll be doing a release of the
two in tandem. I'm expecing that the work I've signed up for there to
be on the order of "a few weeks". So while I'm always hesitant to state
release goals publicly I think this can be ready for a release toward
the end of October. Can't make any guarantees but that's our goal.

Best,
Philip

> =

> [0]: https://github.com/latchset/clevis/pull/17
> =

> Best regards,


--===============4465930554607370360==--

