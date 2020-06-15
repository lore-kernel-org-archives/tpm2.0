Content-Type: multipart/mixed; boundary="===============2771906961925387232=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: tpm2-tools next release version 5.0
Date: Mon, 15 Jun 2020 13:21:27 -0700
Message-ID: <CAOCvsS=vjAKvoqr-+QgXRfr5EzWLo6m5mc6NpTwux6-NrqKZTg@mail.gmail.com>
In-Reply-To: SN6PR11MB34377F07CC8E7478D0959C54B8800@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2771906961925387232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I got it building today.  I don't know if it's an artifact of my build
system but the symlinks are all absolute paths and incorporate a
build-time path (possibly the sysroot?) so they won't function on the
target machine.

On Thu, Jun 11, 2020 at 9:11 AM Roberts, William C
<william.c.roberts(a)intel.com> wrote:
>
> Hello,
>
> As you likely already know, we follow semver.org versioning guidelines. F=
or tpm2-tools next release from master, we are labelling it 5.0. I want to =
make
> sure that everyone understands the changes around this. Unlike major vers=
ion bumps 1, 2,3 and 4 command line options are staying the same in a
> backwards compatible fashion (hooray). But there are some small changes c=
oming, that I will highlight in the Changelog:
>   - https://github.com/tpm2-software/tpm2-tools/blob/master/doc/CHANGELOG=
.md
>
> The big takeaways are that the default algorithm for hashing is SHA256. B=
efore, the man pages claimed SHA1, but this wasn't the case. The tools, hop=
efully
> are all on SHA256 now as the default. Selecting SHA1 for the default wasn=
't optimal, as TPM2's whole purpose was algorithm agility to move away from=
 SHA1.
> Additionally the documentation did not match the code. SHA256 seems like =
a good choice, as all TPM's support it. The best bet, is to **always** spec=
ify the
> hash algorithm, so you will never be surprised. If you do that, you wont =
have any backwards compat issues between 4.X and 5.X.
>
> The other change is the busybox style commandlet. This will help reduce o=
verall size and make some environments more convenient. To maintain
> Backwards compat, make install provides symlinks to the new commandlet tp=
m2 from the old tool names. So something like tpm2_getrandom will be
> symlinked to tpm2, and the commandlet will use argv[0] to figure it out. =
Thus, if you make install, or use a distro package, nothing should change. =
If you
> run from a local build without installing, you can make install and set D=
ESTDIR and just update your PATH entry if you need backwards compat.
>
> I urge folks to start running master occasionally and let me know if some=
thing breaks between versions that isn't hightlighted in the CHANGELOG as
> this could be a bug. I'd like to stomp these out sooner than later.
>
> Thanks,
> Bill
>
>
>
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============2771906961925387232==--

