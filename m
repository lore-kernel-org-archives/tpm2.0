Content-Type: multipart/mixed; boundary="===============4996268887408648916=="
MIME-Version: 1.0
From: David Challener <david.c.challener at gmail.com>
Subject: [tpm2] Re: tpm2_createprimary to a transient handle...
Date: Sun, 06 Mar 2022 16:47:21 -0500
Message-ID: <e4326598-7026-17d2-0cea-bf475de1826f@gmail.com>
In-Reply-To: DS7PR03MB55765F865300FB946F47FCAD9A079@DS7PR03MB5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4996268887408648916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The problem we were trying to solve was a privacy one.


The solution for you can be done many ways.

1) create a signing key and sign it yourself

2) create a signing key and have a CA (usually a privacy CA) sign it as =

a TPM key as follows:

A) Create an AIK signing key. Send its public portion of it o the =

Privacy CA along with the EK certificate

B) Create a regular signing key and use TPM2_Certify to sign this key =

with the AIK. send this to the PrivacyCA.

C) the privacy CA creates certificates for the signing keys and an AES =

key. It encrypts the {AES key along with the public portion of the AIK =

key} with the public portion of the EK.=C2=A0 It sends the result to the =

owner of the TPM.

D) the owner of the TPM uses the EK to decrypt the blob. (This will only =

work if both the AIK and the EK are loaded)=C2=A0 This results it the AES k=
ey.

Because of the EK cert, you know the EK is only on one TPM. Because the =

TPM was able to decrypt the AES key you know

 =C2=A0=C2=A0=C2=A0 i) that the EK is bound to that TPM

 =C2=A0=C2=A0 ii) that the AIK is bound to the same TPM as the EK and is a =
real =

AIK (it won't decrypt it otherwise)

Because the AIK certified the the signing key, you know it is also on =

the same TPM (and if the public portion of it signed by the AIK says it =

is fixedTPM, you know that about the signing key as well.)

If you remote CA wants to, it CAN put in the certs it makes what EK they =

are bound to. (e.g. for an enterprise for its own PCs). If it is a =

PrivacyCA, it promises not to.




--===============4996268887408648916==--

