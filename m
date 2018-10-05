Content-Type: multipart/mixed; boundary="===============2316551955322392508=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Fri, 05 Oct 2018 09:44:51 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D014267842C@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 1538669748.4003.6.camel@HansenPartnership.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2316551955322392508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi James, Hi David,

I put together a Wiki-Page with the most relevant information at https://gi=
thub.com/tpm2-software/tpm2-tss-engine/wiki/Key-templates-and-on-disk-format
Also including things like nameAlg for the primary key and such, since mayb=
e that's where we are differing right now.

There are a bunch of ??? about the tss2-engine where I'd need input from yo=
u.

And a bunch of tbds of the tpm2-tss-engine where I'll have to do some codin=
g.

Thanks a lot,
Andreas
________________________________________
From: James Bottomley [James.Bottomley(a)hansenpartnership.com]
Sent: Thursday, October 04, 2018 18:15
To: Fuchs, Andreas; David Woodhouse; tpm2(a)lists.01.org; Nikos Mavrogianno=
poulos
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats

On Thu, 2018-10-04 at 16:04 +0000, Fuchs, Andreas wrote:
> Should we try to setup a wiki or markdown to start converging into a
> single form ?
> I think we can also easily set NODA for the primary, because they
> have to auth value anyways.
>
> @James: how do you handle the key-ids ? Allways assume them to be
> files ?

My engine assumes it's a file unless it's convertible to a hex number
and the first octet is 0x81 (which is the persistent key MSO); so I
don't do the 0x prefix and with this form you specify, say the template
primary as 81000001.  Anything that doesn't look like a persistent key
hex number is treated as a file name.

James


> I have a PR for persistent TPM keys, where all key ids starting with
> 0x are interpreted as TPM keys. For the future I'll also want to
> reference FAPI keys (path-like format).
> Thus, any clues on how to handle things consistently here ?
>
> tpm2-tss-engine will propably not support policies from your format
> then, but wait until FAPI (with integrated policy engine) is
> available.



--===============2316551955322392508==--

