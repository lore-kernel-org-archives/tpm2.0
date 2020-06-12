Content-Type: multipart/mixed; boundary="===============5256477774241914804=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2-tools next release version 5.0
Date: Fri, 12 Jun 2020 16:38:52 +0000
Message-ID: <SN6PR11MB3437E06D57A05141953C4B64B8810@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 9c592589be854e93a09ace9c60c3e02c@infineon.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5256477774241914804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I chose RSA2048 because it was always going to be supported and most comman=
d invocations
And backends I saw were using/wanting RSA, even though it's not the best ch=
oice. I don't want
to change that anytime soon, too many behavioral changes will have the comm=
unity at my door
with pitchforks again, rightfully so.

I don't see us changing the default algorithm and key size anytime soon. Ma=
ybe in the future we
can re-evaluate, and like Florian said, I would also favor just setting it =
to ECC P256.

> -----Original Message-----
> From: Florian.Schreiner(a)infineon.com <Florian.Schreiner(a)infineon.com>
> Sent: Friday, June 12, 2020 6:47 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; lists(a)rowan.mou=
l.ca;
> ted.h.kim(a)oracle.com
> Cc: tpm2(a)lists.01.org
> Subject: RE: [tpm2] Re: tpm2-tools next release version 5.0
> =

> Any keylength above 2048 bits in RSA is not recommended as it will be any=
way a
> lot slower and RSA is an outdated algorithm. Therefore the TPM 2.0 also r=
equires
> since the beginning the mandatory support of ECC (256 bits), which replac=
es RSA
> in the future. This is the same as SHA-1, which is replaced by SHA-256. T=
herefore
> with a TPM 2.0 it is recommended to use ECC algorithm for any further
> developments.
> It would be good if this is reflected also in the tpm2-tools.
> =

> Best,
> Florian
> =

> -----Original Message-----
> From: Roberts, William C <william.c.roberts(a)intel.com>
> Sent: Freitag, 12. Juni 2020 00:52
> To: Rowan Moul <lists(a)rowan.moul.ca>; ted.h.kim(a)oracle.com
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: tpm2-tools next release version 5.0
> =

> Caution: This e-mail originated outside Infineon Technologies. Do not cli=
ck on links
> or open attachments unless you validate it is safe <http://iweb.infineon.=
com/en-
> US/Support/security/CDC/pse/Pages/pce.aspx>.
> =

> =

> Exactly, but we could do a getcap call and figure out the max RSA keysize=
 and
> make that the default in the future.
> But that would be yet another backwards incompatible change, but like hash
> algorithm, if you always just specify What you want, you'll get it.
> =

> =

> > -----Original Message-----
> > From: Rowan Moul <lists(a)rowan.moul.ca>
> > Sent: Thursday, June 11, 2020 4:27 PM
> > To: ted.h.kim(a)oracle.com
> > Cc: Roberts, William C <william.c.roberts(a)intel.com>;
> > tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Re: tpm2-tools next release version 5.0
> >
> > Based on my limited knowledge of the TCG spec, RSA 3072 is not a
> > required algorithm and as such is not necessarily supported on all TPM =
2.0=E2=80=99s.
> > I know that the fTPM in my personal machine does not support that bit
> > strength for RSA keys for example.
> >
> > Rowan
> >
> > > On Jun 11, 2020, at 14:40, ted.h.kim(a)oracle.com wrote:
> > >
> > > =EF=BB=BFWilliam,
> > >
> > > w.r.t. RSA I think the default is 2048 bits
> > >
> > > But I think recent RHEL releases have ssh-keygen defaulting now to 30=
72 bits.
> > > So I am thinking perhaps 2048 is or will soon be too weak.
> > >
> > > Any chance that could be bumped up to 3072 bits?
> > >
> > > Thanks,
> > > -ted
> > >
> > >> On 6/11/20 9:11 AM, Roberts, William C wrote:
> > >> Hello,
> > >>
> > >> As you likely already know, we follow semver.org versioning
> > >> guidelines. For tpm2-tools next release from master, we are
> > >> labelling it 5.0. I want to make sure that everyone understands the
> > >> changes around
> > this. Unlike major version bumps 1, 2,3 and 4 command line options are
> > staying the same in a backwards compatible fashion (hooray). But there
> > are some small changes coming, that I will highlight in the Changelog:
> > >>   -
> > >> https://urldefense.com/v3/__https://github.com/tpm2-software/tpm2-t
> > >> oo
> > >>
> >
> ls/blob/master/doc/CHANGELOG.md__;!!GqivPVa7Brio!MAEkAxKtVEge4_pZuFE
> > F
> > >> 63r7mzwUX-wx7Fc8lDSnfslQFoad-SZnE0cENxUttTs$
> > >>
> > >> The big takeaways are that the default algorithm for hashing is
> > >> SHA256. Before, the man pages claimed SHA1, but this wasn't the
> > >> case. The
> > tools, hopefully are all on SHA256 now as the default. Selecting SHA1
> > for the default wasn't optimal, as TPM2's whole purpose was algorithm
> > agility to move away from SHA1.
> > >> Additionally the documentation did not match the code. SHA256 seems
> > >> like a good choice, as all TPM's support it. The best bet, is to
> > >> **always**
> > specify the hash algorithm, so you will never be surprised. If you do
> > that, you wont have any backwards compat issues between 4.X and 5.X.
> > >>
> > >> The other change is the busybox style commandlet. This will help
> > >> reduce overall size and make some environments more convenient. To
> > >> maintain Backwards compat, make install provides symlinks to the
> > >> new commandlet tpm2 from the old tool names. So something like
> > tpm2_getrandom will be symlinked to tpm2, and the commandlet will use
> > argv[0] to figure it out. Thus, if you make install, or use a distro
> > package, nothing should change. If you run from a local build without
> > installing, you can make install and set DESTDIR and just update your P=
ATH
> entry if you need backwards compat.
> > >>
> > >> I urge folks to start running master occasionally and let me know
> > >> if something breaks between versions that isn't hightlighted in the
> > >> CHANGELOG
> > as this could be a bug. I'd like to stomp these out sooner than later.
> > >>
> > >> Thanks,
> > >> Bill
> > >>
> > >>
> > >>
> > >>
> > >> _______________________________________________
> > >> tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email
> > >> to tpm2-leave(a)lists.01.org
> > >> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > >
> > > --
> > > Ted H. Kim, PhD
> > > ted.h.kim(a)oracle.com
> > > +1 310-258-7515
> > >
> > > _______________________________________________
> > > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email
> > > to tpm2-leave(a)lists.01.org
> > > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============5256477774241914804==--

