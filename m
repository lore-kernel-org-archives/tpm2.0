Content-Type: multipart/mixed; boundary="===============7447737927426804905=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Fri, 12 Oct 2018 09:16:00 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0147344E25@exch2010c.sit.fraunhofer.de>
In-Reply-To: b4446220e34f3a3f867cdc5d5b01bd833c6cfd47.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7447737927426804905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks a lot for the effort and PR. I've reviewed it already with a slight =
change request.

0x1df means "Integrity Check failed". This could have to do with the manipu=
lation of the public area, see my comment on the PR...

Other than that: I'd be more than willing to join both engines under one pr=
oject as long as it's BSD-3 and not (L)GPL.
(the only reason we have a second engine to begin with)

Cheers,
Andreas
________________________________________
From: David Woodhouse [dwmw2(a)infradead.org]
Sent: Friday, October 12, 2018 07:55
To: Fuchs, Andreas; tpm2(a)lists.01.org; James Bottomley; Nikos Mavrogianno=
poulos
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats

I've now sent patches to James, submitted a PR to tpm2-tss-engine, and
modified my own OpenConnect code to support the same format:

TPMKey ::=3D SEQUENCE {
        type            OBJECT IDENTIFIER,
        emptyAuth       [0] EXPLICIT BOOLEAN OPTIONAL,
        parent          INTEGER,
        pubkey          OCTET STRING,
        privkey         OCTET STRING
 }

Both tpm2 and tpm2tss engines can read key files created with the
latter. However, I have not got it working the other way round. My
GnuTLS code can read files created by James's tpm2 engine but the
tpm2tss engine doesn't work...

Creating primary key under owner.
Loading key blob.
WARNING:esys:src/tss2-esys/api/Esys_Load.c:324:Esys_Load_Finish() Received =
TPM Error
ERROR:esys:src/tss2-esys/api/Esys_Load.c:117:Esys_Load() Esys Finish ErrorC=
ode (0x000001df)
WARNING:esys:src/tss2-esys/esys_context.c:117:Esys_Finalize() Finalizing NU=
LL context.
140278476894656:error:8007106D:tpm2-tss-engine:init_tpm_key:Unknown TPM err=
or occured. Please check tpm2tss logs:src/tpm2-tss-engine-common.c:292:
140278476894656:error:8008C06D:tpm2-tss-engine:rsa_priv_enc:Unknown TPM err=
or occured. Please check tpm2tss logs:src/tpm2-tss-engine-rsa.c:161:
140278476894656:error:0D0DC006:asn1 encoding routines:ASN1_item_sign_ctx:EV=
P lib:../crypto/asn1/a_sign.c:208:



--===============7447737927426804905==--

