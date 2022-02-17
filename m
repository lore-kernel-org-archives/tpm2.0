Content-Type: multipart/mixed; boundary="===============4871325946752919949=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Help - how to store a certificate in the NV under the
 platform hierarchy?
Date: Thu, 17 Feb 2022 09:23:23 +0000
Message-ID: <AS8P194MB166964A48C7CBA153A1F8095A6369@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 20220217091941.2855.69362@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4871325946752919949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The TPM resets the PH password to the empty password on every boot, correct.
But the BIOS is supposed to set the PH password to a random value directly =
after boot.
Reason being that the OS/UserSpace shall not be able to interfere with it.
So you need to do this operation within the BIOS context.






---

Andreas Fuchs
Head of Department Cyberphysical System Security
Head of Group Trustworthy Platforms
Fraunhofer Institute for Secure Information Technology SIT
National Research Center for Applied Cybersecurity ATHENE
Rheinstr. 75 | 64295 Darmstadt | Germany
T +49 6151 869 228 | F +49 6151 869 224
https://www.sit.fraunhofer.de | https://www.athene-center.de


________________________________________
Von: arlotito(a)microsoft.com <arlotito(a)microsoft.com>
Gesendet: Donnerstag, 17. Februar 2022 10:19
An: tpm2(a)lists.01.org
Betreff: [tpm2] Help - how to store a certificate in the NV under the platf=
orm hierarchy?

Hi,
the use case is related to idevid onboarding identity, an immutable identit=
y created by the platform manufacturer and stored as follows:
-key under the Endorsement Hierarchy
-certificate under the Platform Hierarchy

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
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============4871325946752919949==--

