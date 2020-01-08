Content-Type: multipart/mixed; boundary="===============0304172154452712345=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: inconsistent arguments
Date: Wed, 08 Jan 2020 18:13:15 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E6538A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: trinity-164caa33-de12-4433-8a7e-8da05ab856b8-1578504452450@3c-app-1and1-bs01
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0304172154452712345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Alexander Lieb [mailto:alexander.lieb(a)online.de]
> Sent: Wednesday, January 8, 2020 11:28 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Aw: [tpm2] Re: inconsistent arguments
> =

> Thanks for the fast reply.
> =

> So it is not possible at the moment to decrypt a message using an AK?

Correct. You would want to create a different key with attributes suited for
this.

> =

> Gesendet: Mittwoch, 08. Januar 2020 um 18:11 Uhr
> Von: "Roberts, William C" <william.c.roberts(a)intel.com>
> An: "Alexander Lieb" <alexander.lieb(a)online.de>, "tpm2(a)lists.01.org"
> <tpm2(a)lists.01.org>
> Betreff: [tpm2] Re: inconsistent arguments
> =

> =

> > -----Original Message-----
> > From: Alexander Lieb [mailto:alexander.lieb(a)online.de]
> > Sent: Wednesday, January 8, 2020 11:00 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] inconsistent arguments
> >
> > Hi everyone,
> >
> > why does
> >
> > tpm2_createak -C ek.handle -c ak.ctx -u ak.pub -n ak.name -f pem
> >
> > openssl rsautl -encrypt -inkey ak.pub -pubin -in plaintext.txt -out
> > chiffre.enc
> >
> > tpm2_rsadecrypt -c ak.ctx -o plain.txt chiffre.enc
> >
> > result into
> >
> > ERROR:esys:src/tss2-esys/api/Esys_RSA_Encrypt.c:103:Esys_RSA_Encrypt()
> > Esys Finish ErrorCode (0x00000182)
> > ERROR: Esys_RSA_Encrypt(0x182) - tpm:handle(1):inconsistent attributes
> > ERROR: Unable to run tpm2_rsaencrypt
> =

> Looks like decrypt attribute is turned down:
> https://github.com/tpm2-software/tpm2-
> tools/blob/28221e5b0c9fc52029bdd96484fb85772601c4b0/tools/tpm2_createak.c
> #L142
> =

> I think it was chosen because an attestation key is typically used in a s=
ign/verify
> pattern. Sign on TPM verify with public key on Attestation verifier side.
> =

> I'm not sure if there is a template specified for the attestation key in =
the spec, I
> can only find spec defined SRK and EK templates:
> - https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-
> Provisioning-Guidance-Published-v1r1.pdf
> =

> But that specific set of parameters for the AK template predates me, and =
I am
> not sure exactly why it was chosen.
> =

> >
> > ?
> >
> > (the same happens if I use tpm2_rsaencrypt)
> >
> > To give some context: I would like to do something like a challenge-res=
ponse.
> >
> > There are two ways to do this:
> >
> > 1. Sending a nonce and let the tpm sign it using an ak (no idea how to =
do this) 2.
> > Send an ecrypted message and let the tpm decrypt it (this is what
> > shall happen
> > above)
> >
> > Are there any examples out there which I missed? Or can you help me in
> > any different way?
> >
> > Thanks a lot!
> >
> > Best regards
> > Alex
> >
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0304172154452712345==--

