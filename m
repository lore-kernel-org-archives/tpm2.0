Content-Type: multipart/mixed; boundary="===============9159727066196140804=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: compile error on tpm2-tools (4.2.X branch)
Date: Wed, 13 May 2020 19:22:00 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDDAD8@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0171B4DE56@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9159727066196140804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ill backport that fix and add it to 4.2.1-RC1 next Monday. Thank you for th=
e bug report
And thanks Andreas for the triage!

> -----Original Message-----
> From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
> Sent: Wednesday, May 13, 2020 11:52 AM
> To: ted.h.kim(a)oracle.com; tpm2(a)lists.01.org
> Subject: [tpm2] Re: compile error on tpm2-tools (4.2.X branch)
> =

> No, you need 2.4.x.
> I opened and issue here: https://github.com/tpm2-software/tpm2-
> tools/issues/2022
> =

> =

> ________________________________________
> From: ted.h.kim(a)oracle.com [ted.h.kim(a)oracle.com]
> Sent: Wednesday, May 13, 2020 18:22
> To: Fuchs, Andreas; tpm2(a)lists.01.org
> Subject: Re: [tpm2] compile error on tpm2-tools (4.2.X branch)
> =

> Is the stuff in tpm2-tss 2.3.X - not good enough?
> =

> -ted
> =

> On 5/13/20 9:18 AM, Fuchs, Andreas wrote:
> > I guess your tpm2-tss and thus your tss2_esys.h / libtss2-esys.so are t=
oo old.
> >
> > Cheers,
> > Andreas
> > ________________________________________
> > From: ted.h.kim(a)oracle.com [ted.h.kim(a)oracle.com]
> > Sent: Wednesday, May 13, 2020 18:14
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] compile error on tpm2-tools (4.2.X branch)
> >
> > Folks,
> >
> > I got an "error" compiling tpm2-tools (4.2.X branch).
> > Yes, I realize this is because warnings being converted to errors.
> > Don't think I changed the CC flags, but maybe this is just my environme=
nt?
> >
> > Haven't checked the new 4.2.1 release update - does that take care of t=
his?
> >
> > Thanks,
> > -ted
> >
> > ++++
> >
> > from the make output:
> >
> > lib/tpm2.c: In function 'tpm2_getsapicontext':
> > lib/tpm2.c:4070:20: error: implicit declaration of function
> > 'Esys_GetSysContext'
> > ; did you mean 'Esys_FlushContext'? [-Werror=3Dimplicit-function-declar=
ation]
> >        TSS2_RC rval =3D Esys_GetSysContext(esys_context, sys_context);
> >                       ^~~~~~~~~~~~~~~~~~
> >                       Esys_FlushContext
> > cc1: all warnings being treated as errors
> > make: *** [Makefile:4857: lib/libcommon_a-tpm2.o] Error 1
> >
> > --
> > Ted H. Kim, PhD
> > ted.h.kim(a)oracle.com
> > +1 310-258-7515
> >
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> --
> Ted H. Kim, PhD
> ted.h.kim(a)oracle.com
> +1 310-258-7515
> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============9159727066196140804==--

