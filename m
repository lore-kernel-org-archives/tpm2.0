Content-Type: multipart/mixed; boundary="===============2211709640744073838=="
MIME-Version: 1.0
From: Lester Cordeiro <lester.corderio at ufomoviez.com>
Subject: [tpm2] Defining TPM non volatile index
Date: Wed, 13 May 2020 16:13:42 +0530
Message-ID: <a5aef3c5-fd28-4c22-8bbd-86753284f91c@ufomoviez.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2211709640744073838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi all,

 =C2=A0=C2=A0=C2=A0 i'm trying to define TPM non volatile index under the p=
latform =

hierachy with this command

tpm2_nvdefine -Q 1 -C p -s 128 -P 123456 -a "ppread|ppwrite"

but it's gives the following errors...

WARNING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:337:Esys_NV_DefineSpac=
e_Finish() =

Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys_NV_DefineSpace(=
) =

Esys Finish ErrorCode (0x00000182)
ERROR: Failed to define NV area at index 0x1000001
ERROR: Esys_NV_DefineSpace(0x182) - tpm:handle(1):inconsistent attributes
ERROR: Unable to run tpm2_nvdefine

And idea what attributes are inconsistent and what values to provide?


regards,

lester cordeiro

--===============2211709640744073838==--

