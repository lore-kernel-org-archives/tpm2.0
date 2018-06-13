Content-Type: multipart/mixed; boundary="===============4368265032185365677=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] tpm2-tss 2.0.0 release candidate
Date: Wed, 13 Jun 2018 10:57:48 -0700
Message-ID: <20180613175748.GG2727@intel.com>
In-Reply-To: 20180605191742.GA2727@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4368265032185365677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 05, 2018 at 12:17:42PM -0700, Philip Tricca wrote:
> On Mon, May 21, 2018 at 07:12:11PM -0700, Philip Tricca wrote:
> > On Mon, May 21, 2018 at 04:04:13PM -0700, Philip Tricca wrote:
> > > On Fri, May 11, 2018 at 04:18:41PM -0700, Philip Tricca wrote:
> > > > Hello again,
> > > > =

> > > > On Fri, May 04, 2018 at 03:44:15PM -0700, Philip Tricca wrote:
> > > > > The first release candidate for version 2.0.0 was just tagged. Pl=
ease
> > > > > take whatever time you can spare to give it some testing.
> > > > > https://github.com/tpm2-software/tpm2-tss/releases/tag/2.0.0_rc0
> > > > =

> > > > A few minor fixes during the RC0 window: specifically two fixes for=
 issues
> > > > identified by static analysis / coverity. These were merged yesterd=
ay
> > > > and RC1 tagged today.
> > > =

> > > During the RC1 window Tadeusz identified a number of issues one of wh=
ich
> > > affected the public API. As a result RC2 was just tagged and we're
> > > kicking off another review window for the next week.
> > =

> > Forgot the link:
> > https://github.com/tpm2-software/tpm2-tss/releases/tag/2.0.0_rc2
> =

> RC3 was just tagged and signed. This RC got held up while we sorted out
> how to best deal with the active PCR bank issue identified with the
> latest simulator rlease and VMWare. The solution implemented is what we
> think is the best for compatibility and "future-proofing".
> =

> This RC can be found here:
> https://github.com/tpm2-software/tpm2-tss/releases/tag/2.0.0_rc3

Another week, another RC. This time it's RC4. This one was prompted by
another bug-fix in in the ESYS API. The commit hash for the fix is:
19f7007b9ec0d8d44bd755ee4967d6bf54d2af8f. Since this fix warranted
another RC I've gone back through the PR queue merging everything that
was reviewed during the RC3 window.

This latest RC can be found here:
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.0.0_rc4

Regards,
Philip

--===============4368265032185365677==--

