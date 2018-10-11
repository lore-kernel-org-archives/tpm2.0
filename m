Content-Type: multipart/mixed; boundary="===============4348628997140803826=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Thu, 11 Oct 2018 15:41:08 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D014734482C@exch2010c.sit.fraunhofer.de>
In-Reply-To: 7c3d5a4ac2f51f301164ba2ddefff643d5a8ce1b.camel@infradead.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4348628997140803826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

thanks for the summary. I agree with all of them. Some more things to agree=
 on:

Primarykeys.publicArea:
-  .type =3D TPM2_ALG_ECC, .nameAlg =3D TPM2_ALG_SHA256
- .objectAttributes =3D (TPMA_OBJECT_USERWITHAUTH | TPMA_OBJECT_RESTRICTED =
| TPMA_OBJECT_DECRYPT | TPMA_OBJECT_FIXEDTPM | TPMA_OBJECT_FIXEDPARENT | TP=
MA_OBJECT_SENSITIVEDATAORIGIN)

For the On-Disk-Format:
We need to keep a placeholder for the (optional) policy I think.
If we want to allow different formats in the future, we need to add some
idetifier for the format type in there as well.

Would you both agree ?

Regarding the engine naming:
Won't we run into a naming problem with the engine names if we name them si=
milarly ?

P.S. The reason I did not call the engine "openssl-something-engine" is tha=
t this
is prohibited by the OpenSSL code license, unless openssl-core@ agrees, but
they never answered... ;-)

Cheers,
Andreas

________________________________________
From: David Woodhouse [dwmw2(a)infradead.org]
Sent: Monday, October 08, 2018 12:15
To: James Bottomley; Fuchs, Andreas; tpm2(a)lists.01.org; Nikos Mavrogianno=
poulos
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats


It would be good to reach a conclusion on what the PEM format should
be, so that I can push this to the OpenConnect master branch in
preparation for a release.

Let me attempt to summarise some of the discussions and create a
definition / TODO list.

 =E2=80=A2 We all change to use all three of NODA/FIXEDTPM/FIXEDPARENT
   objectAttributes for creating the primary key.

 =E2=80=A2 PEM file tag changes to 'BEGIN TSS2 PRIVATE KEY'. James can cont=
inue
   to use the old objectAttributes when loading files with the old PEM
   tag for compatibility reasons, if he wants to.

 =E2=80=A2 Drop the TPMv1.2 compatibility via '12Key' and the 'importableKe=
y'
   object types, which in fact means we can drop the 'type' field from
   the ASN.1 definition altogether.

 =E2=80=A2 Make the pubkey field non-optional.

 =E2=80=A2 Ignore policy for now; we can define that later. We won't use the
   [3] EXPLICIT tag for anything incompatible with James's existing
   definition, and if we settle on something else we'll use a different
   explicit tag.

 =E2=80=A2 We produce a draft specifying the ASN.1 format and tpmkey: URI
   scheme.


That's probably enough for me to do a release of the GnuTLS code. On
the OpenSSL side I also recommend that:

 =E2=80=A2 Both engines should use the same engine name so that applications
   which match the PEM tag and load an engine don't have to try both.

 =E2=80=A2 Both engines should register the ASN.1 parser so that keys can be
   used transparently by applications without having to explicitly
   reference the engine at all (see
   https://github.com/openssl/openssl/issues/7354 )



--===============4348628997140803826==--

