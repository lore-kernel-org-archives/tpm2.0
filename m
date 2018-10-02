Content-Type: multipart/mixed; boundary="===============5109917812438282828=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Tue, 02 Oct 2018 17:18:08 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0142675FCB@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: fe6f8a061afb6508d309d08b86ae0cc87fc90b25.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5109917812438282828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Ultimately, our aim should be for people to be able to use the same PEM
> file regardless of which software stack they're using. I'll be fixing
> up GnuTLS client code to use the same files, much as I did for TPMv1
> PEM files a while ago.

Agreed

> https://mta.openssl.org/pipermail/openssl-dev/2016-December/008936.html
>  covers the format that James implemented.
> =

> I think we also need to agree on which key is used as the parent by
> default. I'm guessing that's the reason I couldn't get my manual PEM
> file conversion to work in Github issue #11.

From what I see it looks ok. tpm2-tss-engine does not support the optional
parent though, but that's about all functional difference

I'm still a bit confused about the TPM2LoadableKey vs TPM2ImportableKey.
I don't know what the use for the latter would be, since I'd assume we just
import such a key into the TPM and then use the Loadable derivate from it.

Also what's the OID that ended up in the actual fomat ?

> I believe openssl_tpm2_engine generates a P-256 primary key and uses
> that as the parent.

That's interesting. tpm2-tss-engine also uses a P256 primary key:
https://github.com/tpm2-software/tpm2-tss-engine/blob/master/src/tpm2-tss-e=
ngine-common.h#L51
https://github.com/tpm2-software/tpm2-tss-engine/blob/master/src/tpm2-tss-e=
ngine-common.c#L172
Could you point out the differences for the primary key template ?

Also I wonder about the encoding of the TPMKey->publicKey and TPMKey->priva=
teKey.
tpm2-tss-engine uses TPM2B_PUBLIC and TPM2B_PRIVATE marshalled according to
the TPM library spec.

Cheers,
Andreas

--===============5109917812438282828==--

