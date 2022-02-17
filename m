Content-Type: multipart/mixed; boundary="===============7686761956636955287=="
MIME-Version: 1.0
From: arlotito at microsoft.com
Subject: [tpm2] Help - how to store a certificate in the NV under the platform
 hierarchy?
Date: Thu, 17 Feb 2022 09:19:41 +0000
Message-ID: <20220217091941.2855.69362@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7686761956636955287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
the use case is related to idevid onboarding identity, an immutable identit=
y created by the platform manufacturer and stored as follows:
-key under the Endorsement Hierarchy =

-certificate under the Platform Hierarchy =


I managed to create the key under the EK hierarchy and store it in the NV, =
but how to store the certificate under the PH?
I have a idevid.der with a size=3D898.

If I do:
tpm2_nvdefine 0x01C90000 -C p -s 898 -a "ownerread|ownerwrite"

this is what i get:
WARNING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:344:Esys_NV_DefineSpac=
e_Finish() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys_NV_DefineSpace(=
) Esys Finish ErrorCode (0x000009a2)
ERROR: Failed to define NV area at index 0x1C90000
ERROR: Esys_NV_DefineSpace(0x9A2) - tpm:session(1):authorization failure wi=
thout DA implications
ERROR: Failed to create NV index 0x1c90000.
ERROR: Unable to run tpm2_nvdefine

I understood that the PH comes with an empty password and a policy that can=
not be satisfied.
I read somewhere that I should:
-obtain a random number via tpm2_getrandom
-install the random number as platformAuth via tpm2_hierarchychangeauth aut=
horized using "empty buffer" as platformAuth

...but how to do that and how to eventually store the cert in the NV?

I'm using tpm2 tss / tools on a linux box with a simulated TPM.

I know that all what I stated above could be wrong or inaccurate... but i'm=
 moving my first steps with TPM and I hope you can help.

Thanks!
Arturo.
--===============7686761956636955287==--

