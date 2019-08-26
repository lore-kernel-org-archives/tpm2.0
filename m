Content-Type: multipart/mixed; boundary="===============1016708757071155233=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Is the session encryption and bind key in
 tpm2_startauthsession 4.0 used to pass in salt?
Date: Mon, 26 Aug 2019 15:21:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEE9F2@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAOCvsSkT2f-TjZ+Jw1gBbt2TatVkTj8TaGFrVfYbtHPr4iNxMA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1016708757071155233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Steven Clark
> Sent: Friday, August 23, 2019 4:46 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Is the session encryption and bind key in tpm2_startauths=
ession
> 4.0 used to pass in salt?
> =

> The -c,--keycontext parameter in the 4.0 rc version of tpm2_startauthsess=
ion is
> documented as being the "session encryption and bind key".  My applicatio=
n isn't
> using password auths anywhere so I don't expect to get much useful entropy
> from a bound session.  Is this key being used to pass in a random salt wh=
ich would
> give me a usefully secure session key?  I've already got everything worki=
ng with
> an older pull from master before the ESAPI integration but getting free b=
us
> encryption on sensitive items would be a nice bonus for upgrading to rele=
ase.

The initial nonceCaller is set by ESAPI when it's NULL. So the tools just p=
ass NULL
and let ESAPI handle it.

This can be seen in the code here:
https://github.com/tpm2-software/tpm2-tss/blob/master/src/tss2-esys/api/Esy=
s_StartAuthSession.c#L228



--===============1016708757071155233==--

