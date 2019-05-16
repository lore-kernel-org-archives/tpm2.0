Content-Type: multipart/mixed; boundary="===============7195988154730130217=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] tpm2-tss 2.2.3_rc2 and 2.1.4_rc2
Date: Thu, 16 May 2019 14:56:39 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162F3CBEC@exch2010c.sit.fraunhofer.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649D7D386@ORSMSX106.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7195988154730130217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Good question. I'd be aiming for EoJune following the 3-per-year idea.
(see & comment here: https://github.com/tpm2-software/tpm2-tss/pull/1389/fi=
les)

or is that a problem for the tools release schedule ?

________________________________________
From: Roberts, William C [william.c.roberts(a)intel.com]
Sent: Thursday, May 16, 2019 16:16
To: Fuchs, Andreas; tpm2(a)lists.01.org
Subject: RE: tpm2-tss 2.2.3_rc2 and 2.1.4_rc2

When is 2.3 coming out with the enc/dec automagic session attribute handlin=
g?

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Fuchs, Andre=
as
> Sent: Thursday, May 16, 2019 4:24 AM
> To: tpm2(a)lists.01.org
> Subject: Re: [tpm2] tpm2-tss 2.2.3_rc2 and 2.1.4_rc2
>
> Hi all,
>
> I published the new rcs for both stable releases 2.2.x and 2.1.x.
> The can bout found here:
>
> https://github.com/tpm2-software/tpm2-tss/releases/tag/2.1.4_rc2
> https://github.com/tpm2-software/tpm2-tss/releases/tag/2.2.3_rc2
>
> Both include a fix for the handling of Esys_PolicyPassword.
> (P.S. This should not be used, because it transports passwords in plain; =
use
> Esys_PolicyAuthValue instead)
>
> I'll be releasing the final bugfix releases beginning of next week.
>
> Best regards,
> Andreas
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============7195988154730130217==--

