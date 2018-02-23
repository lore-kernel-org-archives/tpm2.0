Content-Type: multipart/mixed; boundary="===============8321228899129082298=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
Date: Fri, 23 Feb 2018 11:49:34 -0800
Message-ID: <20180223194934.GC6409@intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FEEC8F2@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8321228899129082298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 05:23:04PM +0000, Roberts, William C wrote:
> =

> =

> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Anderson, =
Daniel
> > Sent: Thursday, February 22, 2018 2:14 PM
> > To: Javier Martinez Canillas <javierm(a)redhat.com>; tpm2(a)lists.01.org
> > Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
> > =

> > I finally got tpm2_tools talking to tpm2.
> > =

> > The remaining tpm2-abrmd problems:
> > =

> > 1. To use the simulator, you do *NOT* use: tpm2-abrmd --tcti socket Thi=
s worked
> > for me: tpm2-abrmd --tcti=3Dsocket (it is mentioned in an example in th=
e tpm2-
> > abrmd(8) man page, although not mentioned that it's for the simulator).
> =

> Yeah the socket tcti is a terrible name. It's specific to the simulator.

I made an 'issue' for this 5 months back:

https://github.com/tpm2-software/tpm2-tss/issues/556

It's on the 2.0 task list and will likely be the last part of the TCTI
related PRs I've been pumping out.

Having someone walk through the documentation and organize some data w/r
to what we're missing and what we need to add would be helpful. Seems
like Dan's recent airing of greviences make him imminently qualified
for the job :)

> > 2. Also, I had to su to tss to start it (another non-root user or root =
user does not
> > work).
> =

> This is dbus. There's a few ways to do this, I think the easiest is to la=
unch it on
> a session bus via dbus-launch:
> https://dbus.freedesktop.org/doc/dbus-launch.1.html

There are a few things at play here. On the master branch the daemon
will refuse to run as the root user. This was a feature requested &
implemented by Matthias @ Suse. It can be overriden on the command line
as documented in the appropriate man page:
https://github.com/tpm2-software/tpm2-abrmd/blob/master/man/tpm2-abrmd.8.in=
#L42

> dbus-launch tpm2-abrmd --tcti=3Dlibtcti-socket.so

`dbus-launch` should only be necessary if you're on a system that
doesn't have a session bus setup for your user. This is the case for
remote / ssh logins but every graphical login I've ever seen creates a
session bus for the user @ login. We use `dbus-launch` heavily for
testing on travis so that we can run the daemon as an unprivileged
(and unknown) user running the build in a container and in parallel:

https://github.com/tpm2-software/tpm2-abrmd/blob/master/.travis.yml#L89

But the ability to run the daemon on the session bus was only added for
testing purposes and the common use case should be installing the dbus
config to the distro-appropriate location and having systemd run the
daemon on the system bus.

> The other way is to use the system bus, that config file
> For abrmd on Ubuntu gets installed to:
> /etc/dbus-1/system.d/tpm2-abrmd.conf

This is the "right" (and default) way to run the daemon in the most
common configuration (being started on boot by systemd, or on demand by
dbus). Getting the source build to install the file there takes a bit of
autotools knowledge but it's all documented by the upstream GNU project:
https://www.gnu.org/prep/standards/html_node/Directory-Variables.html

> You can either use the tss user that is defined (you need to create this)
> And then run abrmd as the tss user, or hack that confide and allow
> your current user to do it:
> I added this to bus config:
>   <policy user=3D"wcrobert">
>     <allow own=3D"com.intel.tss2.Tabrmd"/>
>   </policy>

Not the hack I'd suggest but it gets the job done :)

> Abrmd init also has options for bus-type, not sure offhand how to invoke =
it.

The configuration options for the TCTI have bitrotted a bit
unfortunately in the run up to the 2.0 release from the tpm2-tss repo.
I've made a few tickets for this:

https://github.com/tpm2-software/tpm2-abrmd/issues/340
https://github.com/tpm2-software/tpm2-abrmd/issues/341

and would gladly take patches to help bring the docs up to speed. The
existing initialization functions are documented here:
https://github.com/tpm2-software/tpm2-abrmd/blob/master/man/tss2_tcti_tabrm=
d_init.3.in

Also worth noting that I've been pushing a bunch of cleanup /
refactoring patches to the TCTIs this week. Part of this has been
improving the debug output from these libraries so be sure to dial
up the logging to get yourself more data for bug reports / github
issues.

We can add a wiki page with debugging strategies to our documentation
wish list too.

Philip

> > $ tpm2-tools/tools/tpm2_getrandom 8
> > 0x6F 0xA7 0xE0 0x28 0x98 0x33 0x62 0x78
> > =

> > -----Original Message-----
> > From: Anderson, Daniel
> > Sent: Thursday, February 22, 2018 9:18 AM
> > To: 'Javier Martinez Canillas' <javierm(a)redhat.com>; tpm2(a)lists.01.=
org
> > Subject: RE: [tpm2] TCTI initialization fails with error 0xc000b
> > =

> > Javier,
> > Thanks for your reply--it is really useful as there are multiple undocu=
mented
> > options I need to use.  I am using MS Outlook which is lame for inline =
replies,  so
> > I'll manually mark it with "dan> "
> > =

> > Dan
> > =

> > -----Original Message-----
> > From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> > Sent: Thursday, February 22, 2018 8:52 AM
> > To: Anderson, Daniel <daniel.anderson(a)intel.com>; tpm2(a)lists.01.org
> > Subject: Re: [tpm2] TCTI initialization fails with error 0xc000b
> > =

> > Hello Dan,
> > =

> > On 02/22/2018 05:01 PM, Anderson, Daniel wrote:
> > > Javier,
> > > Thanks!
> > >
> > > The version is the latest source as of the message--I pulled the late=
st source
> > and rebuilt several times.
> > =

> > Ok, I'm also building today's master branch for all projects.
> > =

> > > I will try again today and see if there has been a fix in the past we=
ek.
> > > There is no /dev/tpm--I am using the simulator and specify that in th=
e options.
> > =

> > I didn't see the option specified in the command you shared in this thr=
ead.
> > You have to run with tpm2-abrmd --tcti socket.
> > =

> > dan> OK. That may be the missing option.  The "tpm2-abrmd --tcti socket=
" option
> > is not mentioned anywhere in dan> the INSTALL.md or README.md files.
> > dan> I found a tpm2-abrmd man page with several examples, but it doesn't
> > mention which one to use for the dan> simulator.
> > =

> > dan> Also, since tpm2-abrmd is started automatically by systemd, appare=
ntly,
> > how does one add this option dan> (whatever the correct syntax) to the =
system
> > configuration?
> > =

> > =

> > > There may be another option or setting that I am missing though.
> > > Here is what I build with:
> > >
> > > For tpm2-tss:
> > > configure --enable-unit
> > >         --with-simulatorbin=3D$TPM_SERVER
> > =

> > Only these are valid options for tpm2-tss, from here are tpm2-abrmd opt=
ions:
> > =

> > >         --with-dbuspolicydir=3D/etc/dbus-1/system.d
> > >         --with-systemdsystemunitdir=3D/lib/systemd/system
> > >         --with-systemdpresetdir=3D/lib/systemd/system-preset
> > >         --with-udevrulesdir=3D/etc/udev/rules.d
> > >         --with-sysdefaultdir=3D/etc/default
> > >         --with-dbusdatadir=3D/usr/share/dbus-1/system-services
> > >
> > > For tpm2-abrmd:
> > > configure --enable-unit
> > > --with-simulatorbin=3D$HOME/tpm/simulator/src/tpm_server
> > >
> > =

> > As mentioned, you either got the configure options mixed up or are usin=
g it
> > wrong.
> > =

> > There are my configure options for tpm2-tss, tpm2-abrmd and tpm2-tools:
> > =

> > tpm2-tss:
> > =

> > $ ./configure --prefix=3D/usr
> > =

> > tpm2-abrmd:
> > =

> > $ ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d --with-
> > udevrulesdir=3D/usr/lib/udev/rules.d --with-
> > systemdsystemunitdir=3D/usr/lib/systemd/system --libdir=3D/usr/lib64
> > =

> > dan> This is useful. The systemdsystemunitdir (not mentioned in the REA=
DME or
> > INSTALL) should help.
> > =

> > tpm2-tools
> > =

> > $ ./configure --prefix=3D/usr
> > =

> > > I cannot believe that anyone has tpm2-abrmd working without special h=
and-
> > copied fixes. The com.intel.tss2.tabrmd.service for example is not inst=
alled in
> > /usr/share/dbus-1/system-services/ but in /usr/local/share/dbus-1/syste=
m-
> > services/.
> > >
> > =

> > I think this is because you didn't specify a correct --with-dbuspolicyd=
ir as
> > mentioned before. Another thing that you have to keep in mind, is that =
the
> > default D-Bus config only allows the tss and root user to acquire the
> > com.intel.tss2.Tabrmd D-Bus well-known name.
> > =

> > So after installing latest master with these configure options, I just =
do:
> > =

> > $ ./tpm_server
> > =

> > $ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti socket
> > =

> > dan> so you do not use system to start tpm2-abrmd.
> > =

> > $ tpm2_pcrlist -L sha1:0 -T abrmd
> > sha1:
> >   0 : 0x0000000000000000000000000000000000000003
> > =

> > And using the device TCTI also works for me:
> > =

> > $ sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti device
> > =

> > dan> neither tpm2-abrmd --tcti socket or tpm2-abrmd --tcti device is me=
ntioned
> > in the README.md, INSTALL.md, or tpm2-abrmd(8) man page, so I'll add th=
ose.
> > =

> > $ tpm2_pcrlist -L sha1:0 -T abrmd
> > sha1:
> >   0 : 0xC72EC9E6CBC2B6A95F334DDDD6513981DA00F0C2
> > =

> > Best regards,
> > --
> > Javier Martinez Canillas
> > Software Engineer - Desktop Hardware Enablement Red Hat
> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============8321228899129082298==--

