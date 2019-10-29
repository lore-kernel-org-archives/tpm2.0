Content-Type: multipart/mixed; boundary="===============5583560715538032216=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: unique identifier
Date: Tue, 29 Oct 2019 21:46:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2DDFD@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAAxBZJu5R5e+oR6iNqFKuSAqwULV26cMfqv9FHkUWjECxe-KpQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5583560715538032216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Section 14.3.2 of the architecture doc is relevant:
https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0-Part-1-Arc=
hitecture-01.38.pdf

While it's safe to say that most of the time the manufacturers key could be=
 the identifier, it's not guaranteed
to always be there if someone rolls the epSeed. If someone does that, they'=
d be throwing away the
manufacturers claims of its authenticity and ensuring they remain anonymous.

So be careful with that command! I wonder if TPM manufacturers are allowed =
to, or do block that command.

> -----Original Message-----
> From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com]
> Sent: Tuesday, October 29, 2019 2:50 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: unique identifier
> =

> Thanks - will take a look with the particular TPMs we're using
> =

> t.
> =

> Ian
> =

> =

> On Tue, 29 Oct 2019 at 20:37, Roberts, William C <william.c.roberts(a)int=
el.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	Forgot "to be changed" in my sentence... one of those days.
> =

> 	> -----Original Message-----
> 	> From: Roberts, William C [mailto:william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> ]
> 	> Sent: Tuesday, October 29, 2019 1:36 PM
> 	> To: Ian Oliver <ian.justin.oliver(a)gmail.com
> <mailto:ian.justin.oliver(a)gmail.com> >
> 	> Cc: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> Subject: [tpm2] Re: unique identifier
> 	>
> 	The TPM allows the seed to be changed on the 3 non-volatile hierarchy
> seeds:
> 	>
> 	> TPM2_ChangeEPS - endorsement seed
> 	> TPM2_ChangePPS - platform seed
> 	> TPM2_Clear - Storage "Owner" seed
> 	>
> 	> Null changes on every tpm boot.
> 	>
> 	> > -----Original Message-----
> 	> > From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com
> <mailto:ian.justin.oliver(a)gmail.com> ]
> 	> > Sent: Tuesday, October 29, 2019 11:59 AM
> 	> > To: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >
> 	> > Cc: Max Halld=C3=A9n <max.hallden(a)wisi.se
> <mailto:max.hallden(a)wisi.se> >; tpm2(a)lists.01.org <mailto:tpm2(a)list=
s.01.org>
> 	> > Subject: Re: [tpm2] Re: unique identifier
> 	> >
> 	> > IIRC the EK is generated from a seed unique to each TPM and typically
> 	> > implemented as a set of fuses blown at manufacturing time. So the EK
> 	> > can be generated in a predictable manner and therefore the
> EK_public
> 	> > can act as an identifier for that TPM.
> 	> >
> 	> >
> 	> > The privacy aspect applies to the AK as far as I recall reading, but
> 	> > the notion of privacy here is rather tenuous anyway.
> 	> >
> 	> > At least in our work, the EK and AK have proven robust enough to be
> 	> > used as permanent identifiers
> 	> >
> 	> >
> 	> > Ian
> 	> >
> 	> >
> 	> > On Tue, 29 Oct 2019 at 18:40, Roberts, William C
> 	> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.c=
om> > >
> wrote:
> 	> >
> 	> >
> 	> >     I think that's intentional by design due to privacy concerns.
> 	> >
> 	> >     > -----Original Message-----
> 	> >     > From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se
> <mailto:max.hallden(a)wisi.se>
> 	> > <mailto:max.hallden(a)wisi.se <mailto:max.hallden(a)wisi.se> > ]
> 	> >     > Sent: Tuesday, October 29, 2019 9:58 AM
> 	> >     > To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> >     > Subject: [tpm2] unique identifier
> 	> >     >
> 	> >     > Hi all,
> 	> >     >
> 	> >     > I'm looking for some kind of unique identifier for the tpm that
> 	> > can't be cleared.
> 	> >     > AFAICT the TPM2 standard doesn't contain anything like this? T=
he
> 	> > closest thing is
> 	> >     > the EK I guess, but even that can be cleared.
> 	> >     >
> 	> >     > Regards,
> 	> >     > Max
> 	> >     >
> 	> >     > _______________________________________________
> 	> >     > tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.=
01.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> >     > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> <mailto:tpm2-leave(a)lists.01.org>
> 	> > <mailto:tpm2- <mailto:tpm2->  leave(a)lists.01.org
> <mailto:leave(a)lists.01.org> >
> 	> >     > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 	> >     _______________________________________________
> 	> >     tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01=
.org>
> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	> >     To unsubscribe send an email to tpm2-leave(a)lists.01.org
> <mailto:tpm2-leave(a)lists.01.org>  <mailto:tpm2- <mailto:tpm2->
> 	> > leave(a)lists.01.org <mailto:leave(a)lists.01.org> >
> 	> >     %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 	> >
> 	>
> 	> _______________________________________________
> 	> tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>
> 	> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =



--===============5583560715538032216==--

