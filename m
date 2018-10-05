Content-Type: multipart/mixed; boundary="===============3558283273705594022=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Fri, 05 Oct 2018 15:34:13 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0147337423@exch2010c.sit.fraunhofer.de>
In-Reply-To: 1538753364.4380.7.camel@HansenPartnership.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3558283273705594022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We can tag -----BEGIN TSS2 PRIVATE KEY----- vs -----BEGIN TSS1 PRIVATE KEY-=
----
then the contents can be completely different...
What do you say ?
________________________________________
From: James Bottomley [James.Bottomley(a)hansenpartnership.com]
Sent: Friday, October 05, 2018 17:29
To: Fuchs, Andreas; David Woodhouse; tpm2(a)lists.01.org; Nikos Mavrogianno=
poulos
Cc: Richard Levitte
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats

On Fri, 2018-10-05 at 15:24 +0000, Fuchs, Andreas wrote:
> Actually, I like the TSS2 PEM Tag.
> We could then also get rid of the OPTIONAL for publicKey, since we
> won't support TPMv1.2 anymore.

Actually, we might.  It seems a lot of embedded is still 1.2 and
they're having huge difficulty with trousers, so the ibmtss is growing
a small 1.2 part that makes a direct tpm connection as well.

There's no harm to 2.0 in keeping it optional and it preserves the 1.2
compatibility just in case.

James


--===============3558283273705594022==--

