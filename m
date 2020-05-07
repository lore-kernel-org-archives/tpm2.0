Content-Type: multipart/mixed; boundary="===============1066314702943634993=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Hello from a small community of TPM enthusiasts
Date: Thu, 07 May 2020 10:53:56 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171B497F1@exch2010c.sit.fraunhofer.de>
In-Reply-To: VI1PR08MB265305D83D4C377D2243CF54B5A50@VI1PR08MB2653.eurprd08.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1066314702943634993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Spot on. I have one such example from yesterday, where we were
> wondering why generating a symmetric key with tpm2-tools now
> produces private and public part. Eventually, a clean slide would be the
> only viable option left. I personally am a fan of the minimalistic approa=
ch.

That's where I can help:
The public parts don't just include public keys but all kinds of public att=
ributes,
such as usage attributes and authorization policy.
The private parts include a cryptographic link to the public parts as well =
as the
private information, such as private/secret key and authorization value and=
 are
encrypted.

For the tools, we stayed close to the TPM-spec, which is why they are store=
d in
those separate files; but also because you sometimes want to send out the p=
ublic
part to others and use only that (e.g. encryption or key property certifica=
tion).

Hope that clears things up. :-D

Cheers,
Andreas
--===============1066314702943634993==--

