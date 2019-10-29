Content-Type: multipart/mixed; boundary="===============4421386398547589267=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: unique identifier
Date: Tue, 29 Oct 2019 18:36:59 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E2D330@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E2D31D@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4421386398547589267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Forgot "to be changed" in my sentence... one of those days.

> -----Original Message-----
> From: Roberts, William C [mailto:william.c.roberts(a)intel.com]
> Sent: Tuesday, October 29, 2019 1:36 PM
> To: Ian Oliver <ian.justin.oliver(a)gmail.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: unique identifier
> =

The TPM allows the seed to be changed on the 3 non-volatile hierarchy seeds:
> =

> TPM2_ChangeEPS - endorsement seed
> TPM2_ChangePPS - platform seed
> TPM2_Clear - Storage "Owner" seed
> =

> Null changes on every tpm boot.
> =

> > -----Original Message-----
> > From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com]
> > Sent: Tuesday, October 29, 2019 11:59 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: Max Halld=C3=A9n <max.hallden(a)wisi.se>; tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Re: unique identifier
> >
> > IIRC the EK is generated from a seed unique to each TPM and typically
> > implemented as a set of fuses blown at manufacturing time. So the EK
> > can be generated in a predictable manner and therefore the EK_public
> > can act as an identifier for that TPM.
> >
> >
> > The privacy aspect applies to the AK as far as I recall reading, but
> > the notion of privacy here is rather tenuous anyway.
> >
> > At least in our work, the EK and AK have proven robust enough to be
> > used as permanent identifiers
> >
> >
> > Ian
> >
> >
> > On Tue, 29 Oct 2019 at 18:40, Roberts, William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> >=
 wrote:
> >
> >
> > 	I think that's intentional by design due to privacy concerns.
> >
> > 	> -----Original Message-----
> > 	> From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se
> > <mailto:max.hallden(a)wisi.se> ]
> > 	> Sent: Tuesday, October 29, 2019 9:58 AM
> > 	> To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > 	> Subject: [tpm2] unique identifier
> > 	>
> > 	> Hi all,
> > 	>
> > 	> I'm looking for some kind of unique identifier for the tpm that
> > can't be cleared.
> > 	> AFAICT the TPM2 standard doesn't contain anything like this? The
> > closest thing is
> > 	> the EK I guess, but even that can be cleared.
> > 	>
> > 	> Regards,
> > 	> Max
> > 	>
> > 	> _______________________________________________
> > 	> tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > 	> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > <mailto:tpm2- leave(a)lists.01.org>
> > 	> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > 	_______________________________________________
> > 	tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> > 	To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:tpm2-
> > leave(a)lists.01.org>
> > 	%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >
> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============4421386398547589267==--

