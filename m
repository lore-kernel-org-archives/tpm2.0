Content-Type: multipart/mixed; boundary="===============1880213128309670609=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: inconsistent arguments
Date: Wed, 08 Jan 2020 17:11:45 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E63DA1@ORSMSX101.amr.corp.intel.com>
In-Reply-To: trinity-c0f83bf4-22c2-4d2c-b217-1e9bcf82d06a-1578502791588@3c-app-1and1-bs05
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1880213128309670609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Alexander Lieb [mailto:alexander.lieb(a)online.de]
> Sent: Wednesday, January 8, 2020 11:00 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] inconsistent arguments
> =

> Hi everyone,
> =

> why does
> =

>     tpm2_createak -C ek.handle -c ak.ctx -u ak.pub -n ak.name -f pem
> =

>     openssl rsautl -encrypt -inkey ak.pub -pubin -in plaintext.txt -out c=
hiffre.enc
> =

>     tpm2_rsadecrypt -c ak.ctx -o plain.txt chiffre.enc
> =

> result into
> =

> ERROR:esys:src/tss2-esys/api/Esys_RSA_Encrypt.c:103:Esys_RSA_Encrypt() Es=
ys
> Finish ErrorCode (0x00000182)
> ERROR: Esys_RSA_Encrypt(0x182) - tpm:handle(1):inconsistent attributes
> ERROR: Unable to run tpm2_rsaencrypt

Looks like decrypt attribute is turned down:
https://github.com/tpm2-software/tpm2-tools/blob/28221e5b0c9fc52029bdd96484=
fb85772601c4b0/tools/tpm2_createak.c#L142

I think it was chosen because an attestation key is typically used in a sig=
n/verify pattern. Sign on TPM verify with public key on
Attestation verifier side.

I'm not sure if there is a template specified for the attestation key in th=
e spec, I can only find spec defined
SRK and EK templates:
  - https://trustedcomputinggroup.org/wp-content/uploads/TCG-TPM-v2.0-Provi=
sioning-Guidance-Published-v1r1.pdf

But that specific set of parameters for the AK template predates me, and I =
am not sure exactly why it was chosen.

> =

> ?
> =

> (the same happens if I use tpm2_rsaencrypt)
> =

> To give some context: I would like to do something like a challenge-respo=
nse.
> =

> There are two ways to do this:
> =

> 1. Sending a nonce and let the tpm sign it using an ak (no idea how to do=
 this) 2.
> Send an ecrypted message and let the tpm decrypt it (this is what shall h=
appen
> above)
> =

> Are there any examples out there which I missed? Or can you help me in any
> different way?
> =

> Thanks a lot!
> =

> Best regards
> Alex
>=20

--===============1880213128309670609==--

