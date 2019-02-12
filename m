Content-Type: multipart/mixed; boundary="===============6567458222488243303=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Using ESAPI to verify encrypted session key
Date: Tue, 12 Feb 2019 16:40:42 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D014B512A4D@exch2010c.sit.fraunhofer.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649CF015C@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6567458222488243303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That depends on the usage of the key that you Esys_TR_Deserialize.

If you use it in StartAuthSession() then the deserialized public key is use=
d to encrypt the salt for the session key, thus the response HMAC will vali=
date.

If you use it in an actual command, the deserialized name is used in the re=
sponse HMAC.

Hope that helps.

________________________________________
From: Roberts, William C [william.c.roberts(a)intel.com]
Sent: Tuesday, February 12, 2019 01:44
To: Fuchs, Andreas; tpm2(a)lists.01.org
Subject: RE: Using ESAPI to verify encrypted session key

So there is no name checking on the Esys_TR_Deserialize(), is the name chec=
ks
Performed in subsequent ESYS calls?

Bill

> -----Original Message-----
> From: Fuchs, Andreas [mailto:andreas.fuchs(a)sit.fraunhofer.de]
> Sent: Thursday, February 7, 2019 12:17 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: RE: Using ESAPI to verify encrypted session key
>
> Yes, handles don't mean anything security-wise.
> It's all about the names.
>
> Wrt StartAuthSession, I imagine the following flow:
> - Esys_TR_Deserialize() the EK from a trusted store on disk
> - Call StartAuthSession() with the ESYS_TR handle from the deserialize
>
> Then you know that you're e.g. talking to the EK's TPM with that session.
>
> Cheers,
> Andreas
> ________________________________________
> From: Roberts, William C [william.c.roberts(a)intel.com]
> Sent: Thursday, February 07, 2019 19:02
> To: tpm2(a)lists.01.org; Fuchs, Andreas
> Subject: Using ESAPI to verify encrypted session key
>
> What is the best and simplest way to ensure that the key I started an enc=
rypted
> session with is the key I expect?
>
> Do I need to issue a challenge and response? How would I know if an attac=
ker
> swapped out the key between the challenge/response and the
> startauthsession?
>
> I currently use a primary object at known handle, but perhaps after conve=
rting to
> an ESYS_TR I can call Esys_TR_GetName() and verify the name is what I exp=
ect?
>
> Bill

--===============6567458222488243303==--

