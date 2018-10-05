Content-Type: multipart/mixed; boundary="===============5304531592268326794=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Fri, 05 Oct 2018 15:24:06 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D01473373D4@exch2010c.sit.fraunhofer.de>
In-Reply-To: 9b90a8506d0a562d0bee11310b55798d361f04a7.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5304531592268326794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Actually, I like the TSS2 PEM Tag.
We could then also get rid of the OPTIONAL for publicKey, since we won't su=
pport TPMv1.2 anymore.
________________________________________
From: David Woodhouse [dwmw2(a)infradead.org]
Sent: Friday, October 05, 2018 13:59
To: Fuchs, Andreas; James Bottomley; tpm2(a)lists.01.org; Nikos Mavrogianno=
poulos
Cc: Richard Levitte
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats

On Fri, 2018-10-05 at 09:44 +0000, Fuchs, Andreas wrote:
> Hi James, Hi David,
>
> I put together a Wiki-Page with the most relevant information at
> https://github.com/tpm2-software/tpm2-tss-engine/wiki/Key-templates-and-o=
n-disk-format
> Also including things like nameAlg for the primary key and such,
> since maybe that's where we are differing right now.
>
> There are a bunch of ??? about the tss2-engine where I'd need input from =
you.
>
> And a bunch of tbds of the tpm2-tss-engine where I'll have to do some cod=
ing.
>
> Thanks a lot,

Can we change the PEM tag too, to -----BEGIN TSS2 PRIVATE KEY----- ?

Ending with "PRIVATE KEY" is needed for OpenSSL 1.1.1 to be able to
automatically load it without having to hack *every* application to
recognise the strings and try the appropriate engine.

See https://github.com/openssl/openssl/issues/7354

--===============5304531592268326794==--

