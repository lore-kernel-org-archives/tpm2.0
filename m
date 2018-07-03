Content-Type: multipart/mixed; boundary="===============3945292839161005278=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] tpm2-tools man pages not installing?
Date: Tue, 03 Jul 2018 10:49:55 -0700
Message-ID: <20180703174955.GA15269@intel.com>
In-Reply-To: 20180703145323.GA16483@f195.suse.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3945292839161005278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2018 at 04:53:23PM +0200, Matthias Gerstner wrote:
> Hello,
> =

> On Tue, Jul 03, 2018 at 01:46:14PM +0000, Scheie, Peter M wrote:
> > When I build & install tpm2-tools, the man pages don't seem to get
> > installed.  I'm just using the default './configure; make; sudo make
> > install' routine, so everything is going into /usr/local/; therefore,
> > I'd expect the man pages to end up in /usr/local/share/man, but they
> > don't.  Do I need add an argument to configure to make that happen?
> =

> that is actually a bug and I addressed it via commit
> 72a28f36151db9bfa59a460ae0114dcece218862, however that commit didn't
> make it into the current release.
> =

> So you either have to install them manually or, as a workaround, if you
> have pandoc installed on the system, then the build system tries to
> generate the man pages and alongside that also installs them.

Sounds like a bug to me. Should have been backported to 3.x release.
Just made an issue to track this:
https://github.com/tpm2-software/tpm2-tools/issues/1091

Regards,
Philip

--===============3945292839161005278==--

