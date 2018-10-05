Content-Type: multipart/mixed; boundary="===============0572264127298670308=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Fri, 05 Oct 2018 15:22:58 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D01473373C1@exch2010c.sit.fraunhofer.de>
In-Reply-To: abda908c04a629bd40e292ff3febfc9cd43e0056.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0572264127298670308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

are you sure this is about the (default) parent, i.e. primary key ?

I assume you're talking about the actual key, which I left out for the spec=
ification.
Can this be ?

Cheers,
Andreas
________________________________________
From: David Woodhouse [dwmw2(a)infradead.org]
Sent: Friday, October 05, 2018 12:27
To: Fuchs, Andreas; James Bottomley; tpm2(a)lists.01.org; Nikos Mavrogianno=
poulos
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

My GnuTLS code mostly follows tpm2-tss-engine here, except for the
different objectAttributes when generating the parent key. That differs
in the NODA, FIXEDTPM and FIXEDPARENT flags, as discussed =E2=80=94 and I
follow James's version here so that I can actually test VPN connections
with a valid key (which I have on disk, and has to be wrapped).

Every other part of the default parent key generation, is the same
between the engines. It's only the objectAttributes I had to change.


I'm not sure you have the 'Parent key is 0x81000001 if it exists' part
right.

The parent key is encoded in the PEM ASN.1.

If it matches 0x81xxxxxx, it's used as a key handle directly.

If not, it identifies the hierarchy under which the EC primary key is
generated. James's version defaults to TPM_RH_OWNER, but I think other
hierarchies can be specified.


--===============0572264127298670308==--

