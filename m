Content-Type: multipart/mixed; boundary="===============7356832690571995175=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2-tools next release version 5.0
Date: Tue, 16 Jun 2020 12:45:51 +0000
Message-ID: <SN6PR11MB3437BC62052160ECD9DCA6A3B89D0@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAOCvsS=vjAKvoqr-+QgXRfr5EzWLo6m5mc6NpTwux6-NrqKZTg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7356832690571995175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Steven Clark <davolfman(a)gmail.com>
> Sent: Monday, June 15, 2020 3:21 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] tpm2-tools next release version 5.0
> =

> I got it building today.  I don't know if it's an artifact of my build sy=
stem but the
> symlinks are all absolute paths and incorporate a build-time path (possib=
ly the
> sysroot?) so they won't function on the target machine.

I created this bug:
https://github.com/tpm2-software/tpm2-tools/issues/2102

If you figure out the root cause, please report back there. I have it track=
ed for the
5.0 milestone.

> =

> On Thu, Jun 11, 2020 at 9:11 AM Roberts, William C <william.c.roberts(a)i=
ntel.com>
> wrote:
> >
> > Hello,
> >
> > As you likely already know, we follow semver.org versioning
> > guidelines. For tpm2-tools next release from master, we are labelling
> > it 5.0. I want to make sure that everyone understands the changes aroun=
d this.
> Unlike major version bumps 1, 2,3 and 4 command line options are staying =
the
> same in a backwards compatible fashion (hooray). But there are some small
> changes coming, that I will highlight in the Changelog:
> >   -
> > https://github.com/tpm2-software/tpm2-
> tools/blob/master/doc/CHANGELOG.
> > md
> >
> > The big takeaways are that the default algorithm for hashing is
> > SHA256. Before, the man pages claimed SHA1, but this wasn't the case. T=
he
> tools, hopefully are all on SHA256 now as the default. Selecting SHA1 for=
 the
> default wasn't optimal, as TPM2's whole purpose was algorithm agility to =
move
> away from SHA1.
> > Additionally the documentation did not match the code. SHA256 seems
> > like a good choice, as all TPM's support it. The best bet, is to **alwa=
ys** specify
> the hash algorithm, so you will never be surprised. If you do that, you w=
ont have
> any backwards compat issues between 4.X and 5.X.
> >
> > The other change is the busybox style commandlet. This will help
> > reduce overall size and make some environments more convenient. To
> > maintain Backwards compat, make install provides symlinks to the new
> > commandlet tpm2 from the old tool names. So something like
> tpm2_getrandom will be symlinked to tpm2, and the commandlet will use arg=
v[0]
> to figure it out. Thus, if you make install, or use a distro package, not=
hing should
> change. If you run from a local build without installing, you can make in=
stall and
> set DESTDIR and just update your PATH entry if you need backwards compat.
> >
> > I urge folks to start running master occasionally and let me know if
> > something breaks between versions that isn't hightlighted in the CHANGE=
LOG
> as this could be a bug. I'd like to stomp these out sooner than later.
> >
> > Thanks,
> > Bill
> >
> >
> >
> >
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============7356832690571995175==--

