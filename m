Content-Type: multipart/mixed; boundary="===============4734017080810643349=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Using ESAPI to verify encrypted session key
Date: Thu, 07 Feb 2019 20:16:31 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D014B511E83@exch2010c.sit.fraunhofer.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649CDF47A@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4734017080810643349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yes, handles don't mean anything security-wise.
It's all about the names.

Wrt StartAuthSession, I imagine the following flow:
- Esys_TR_Deserialize() the EK from a trusted store on disk
- Call StartAuthSession() with the ESYS_TR handle from the deserialize

Then you know that you're e.g. talking to the EK's TPM with that session.

Cheers,
Andreas
________________________________________
From: Roberts, William C [william.c.roberts(a)intel.com]
Sent: Thursday, February 07, 2019 19:02
To: tpm2(a)lists.01.org; Fuchs, Andreas
Subject: Using ESAPI to verify encrypted session key

What is the best and simplest way to ensure that the key I started an encry=
pted session with is the key I expect?

Do I need to issue a challenge and response? How would I know if an attacke=
r swapped out the key between the challenge/response
and the startauthsession?

I currently use a primary object at known handle, but perhaps after convert=
ing to an ESYS_TR I can call Esys_TR_GetName() and verify
the name is what I expect?

Bill

--===============4734017080810643349==--

