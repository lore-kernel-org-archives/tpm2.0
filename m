Content-Type: multipart/mixed; boundary="===============2062005827325386102=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats
Date: Tue, 02 Oct 2018 17:21:16 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0142675FE1@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 1538498826.14607.10.camel@HansenPartnership.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2062005827325386102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi James,

thanks for joining it.

What do you put into the octet strings for public and private key ?
The marshalled TPM2Bs according to TPM spec or a different encoding ?

What's the template for the primary key ?

What's the content of the CommandPolicy octet string ?

Thanks,
Andreas
________________________________________
From: James Bottomley [James.Bottomley(a)hansenpartnership.com]
Sent: Tuesday, October 02, 2018 18:47
To: David Woodhouse; Fuchs, Andreas; tpm2(a)lists.01.org; Nikos Mavrogianno=
poulos
Subject: Re: [tpm2] Conflicting TPM2 engines and storage formats

On Tue, 2018-10-02 at 17:38 +0100, David Woodhouse wrote:
> On Tue, 2018-10-02 at 16:20 +0000, Fuchs, Andreas wrote:
> > Hi David,
> >
> > unfortuantely, the engines are diferent as much as their license
> > and underlying TSSes.
> > tpm2-tss (which is TCG spec conformant) and IBM's proprietary
> > OpenSource TSS.
> >
> > The tpm2-tss-engine is newer and BSD-license, whilst James's is
> > (L?)GPL.
> > Thus, we could not just take his and add a second underlying TSS
> > but had to
> > implement a completely new one to get rid of the license terms.
> > So we had to come up with our own storage format.
> > I also cannot look at James's codebase to not become tainted with
> > GPL copyleft.
> >
> > That's why we chose a different engine name and made sure to label
> > PEM differently,
> > so we don't get compatibility messes.
> >
> > If you'd like to propose a different storage format for tpm2-tss-
> > engine, please
> > provide me with a format. Maybe we can fit it into the first 0.1
> > release.
> > (but that would have to happen VERY quickly, i.e. the next 2
> > weeks).
>
> Ultimately, our aim should be for people to be able to use the same
> PEM
> file regardless of which software stack they're using. I'll be fixing
> up GnuTLS client code to use the same files, much as I did for TPMv1
> PEM files a while ago.
>
> https://mta.openssl.org/pipermail/openssl-dev/2016-December/008936.ht
> ml
>  covers the format that James implemented.

Actually, there's been an extension for policy since then (and a
removal of one of the superfluous optionals) so this is the current
ASN.1 format:

TPMKey ::=3D SEQUENCE {
        type            OBJECT IDENTIFIER
        emptyAuth       [0] EXPLICIT BOOLEAN OPTIONAL
        parent          [1] EXPLICIT INTEGER OPTIONAL
        pubkey
        [2] EXPLICIT OCTET STRING OPTIONAL
        policy          [3] EXPLICIT SEQUENCE OF TPMPolicy OPTIONAL
        privkey         OCTET STRING
}

TPMPolicy ::=3D SEQUENCE {
        CommandCode             [0] EXPLICIT INTEGER
        CommandPolicy           [1] EXPLICIT OCTET STRING
}

> I think we also need to agree on which key is used as the parent by
> default. I'm guessing that's the reason I couldn't get my manual PEM
> file conversion to work in Github issue #11.

The idea of using an RSA parent at 81000001 is documented in the PC
provisioning guide issued by the TCG.  That's the one I've used in the
past.  However, most modern TPMs aren't provisioned this way yet, so:

> I believe openssl_tpm2_engine generates a P-256 primary key and uses
> that as the parent.

If you don't specify a parent in create_tpm2_key then we assume the
storage primary (which we deposit in the key file as TPM_RH_OWNER
[40000001]) and derive the P-256 EC key from it with TPM2_CreatePrimary
every time its used.

James


--===============2062005827325386102==--

