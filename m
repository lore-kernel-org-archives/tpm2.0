Content-Type: multipart/mixed; boundary="===============8975658553217628890=="
MIME-Version: 1.0
From: Zhu, Bing <bing.zhu at intel.com>
Subject: [tpm2] Re: Protecting TPM objects
Date: Wed, 23 Oct 2019 06:16:02 +0000
Message-ID: <A3DEEEBB19900C48B49572CB9C2891C9879CDA6C@SHSMSX108.ccr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E29EFA@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8975658553217628890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There is a very good site for understanding/testing that key generation:
https://google.github.io/tpm-js/#pg_keys =


if you change the primary seed, then you will get different one. TPM uses d=
eterministic key derivation function to derive the primary keys.

Bing

> -----Original Message-----
> From: Roberts, William C <william.c.roberts(a)intel.com>
> Sent: Tuesday, October 22, 2019 22:22 PM
> To: Max Halld=C3=A9n <max.hallden(a)wisi.se>; Zhu, Bing <bing.zhu(a)intel=
.com>;
> tpm2(a)lists.01.org
> Subject: RE: Protecting TPM objects
> =

> =

> =

> > -----Original Message-----
> > From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se]
> > Sent: Monday, October 21, 2019 3:50 AM
> > To: Zhu, Bing <bing.zhu(a)intel.com>; tpm2(a)lists.01.org
> > Subject: [tpm2] Re: Protecting TPM objects
> >
> > Thank you for the answer! It sounds like it behaves how I expect, but
> > I have one follow-up question:
> >
> > When you say you can delete and re-create it, if this is a primary key
> > will this result in the same key as before?
> =

> Yes. Unless the root seed for the hierarchy changes, if you feed
> tpm2_createprimary The same inputs, you get the same key back everytime.
> =

> >
> > Regards,
> > Max
> >
> > On 2019-10-21 04:43, Zhu, Bing wrote:
> > > Each authorization Hierarchy has its own authvalue, by default, the
> > > authvalue is
> > empty. But you can change this authvalue to a high entropy secret.
> > >
> > > For platform authorization, its authvalue will be reset to empty
> > > after each
> > power cycle. typically BIOS/FW should change it to a high entropy
> > secret after using at boot time, then discard this secret or disable
> > platform authorization before handoff to bootloader/OS. So that nobody
> > else in OS can use platform authorization.
> > >
> > > Take TPM NV storage as example, you can configure different policy
> > > to gate
> > access control to the secret stored in NV storage. e.g. you can
> > configure a password-only access so that even if you have owner
> > hierarchy authvalue, you cannot even access it. (but you can delete it
> > and re-create it with your owner hierarchy authvalue).
> > >
> > > Bing
> > >
> > >> -----Original Message-----
> > >> From: Max Halld=C3=A9n <max.hallden(a)wisi.se>
> > >> Sent: Friday, October 18, 2019 18:28 PM
> > >> To: tpm2(a)lists.01.org
> > >> Subject: [tpm2] Protecting TPM objects
> > >>
> > >> Hi all,
> > >>
> > >> I'm a bit confused about the different authorizations and if anyone
> > >> could help me clear some things up that would be a great help.
> > >>
> > >> The platform authorization seems to be reset on each reboot which
> > >> makes sense in a way that it is up for grabs by whatever boots first.
> > >>
> > >> But if I create an object under the owner or endorsement
> > >> hierarchies, does this mean it can never be accessed without the
> > >> password for those hierarchies? Even by someone with platform
> authorization?
> > >>
> > >> If I also create it with a password or any other kind of
> > >> authorization, can it also not be accessed by someone with
> > >> authorization for that hierarchy? For example, is a primary key
> > >> created with password protection unique to that password or can it
> > >> be
> > recreated by someone with access to that hierarchy?
> > >>
> > >> To be a bit more specific, I'm trying to figure out in what cases a
> > >> password protected decryption key can't be accessed by anyone
> > >> without access to the password (but could otherwise have full
> > >> access to the TPM
> > hardware).
> > >>
> > >> Regards,
> > >> Max
> > >>
> > >> _______________________________________________
> > >> tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email
> > >> to tpm2- leave(a)lists.01.org
> > >> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >
> >
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8975658553217628890==--

