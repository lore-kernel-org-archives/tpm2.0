Content-Type: multipart/mixed; boundary="===============5832807444146635288=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Fri, 12 Oct 2018 15:54:09 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D01473452F7@exch2010c.sit.fraunhofer.de>
In-Reply-To: 07aadec685df625ab3e3cb7a4fd32a5a0e0a50d4.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5832807444146635288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tpm2-tss-engine only supports P256 and P384. no other curves yet.
However, it should of course not SEGV; i.e. loadkey returns NULL back to Op=
enSSL
but that's the expected return for an error.
Could you trace the code line that SEGVs ? Whether it's the engine or OpenS=
SL ?
(I like to use valgrind for this)

cool; would it also make sense to export some symbols for GnuTLS and OpenCo=
nnect
to bind against; i.e. an engine that supports OpenSSL and GnuTLS at the sam=
e time ?
or 2 front ends and two back ends ?
________________________________________
From: David Woodhouse [dwmw2(a)infradead.org]
Sent: Friday, October 12, 2018 17:19
To: Fuchs, Andreas; tpm2(a)lists.01.org; James Bottomley; Nikos Mavrogianno=
poulos
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats

On Fri, 2018-10-12 at 09:16 +0000, Fuchs, Andreas wrote:
> Thanks a lot for the effort and PR. I've reviewed it already with a
> slight change request.
>
> 0x1df means "Integrity Check failed". This could have to do with the
> manipulation of the public area, see my comment on the PR...

Doh. Sorry, yes that was it; can I blame the jet lag? I had originally
just hacked that with the  =E2=80=A6exponent?:0x10001 GCC'ism, and was tryi=
ng
to clean it up a little. A better variant in the PR now.

This works for my RSA key and for the ECC key from the OpenConnect test
suite =E2=80=94 I can import them with either engine's tool, then use them =
from
all three.

With your engine I still see a SEGV when using a bnp256 key from
James's engine, but nistp256 is OK. I choose to declare that that one
Not My Fault=E2=84=A2, but I'll try to reproduce with tpm2tss-genkey and fi=
le a
bug.

> Other than that: I'd be more than willing to join both engines under
> one project as long as it's BSD-3 and not (L)GPL.
> (the only reason we have a second engine to begin with)

I do like that idea, so the ENGINE interface is unified and only the
TPM back end varies. Otherwise we'll both be chasing STORE interface
stuff and "how do I tell OpenSSL not to negotiate SHA512" and other
crap, and dealing with the UI callbacks for various passwords in
different ways.


--===============5832807444146635288==--

