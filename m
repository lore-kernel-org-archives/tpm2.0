Content-Type: multipart/mixed; boundary="===============1846143195151201396=="
MIME-Version: 1.0
From: Florian.Schreiner at infineon.com
Subject: [tpm2] Re: Defining TPM non volatile index
Date: Wed, 13 May 2020 12:22:08 +0000
Message-ID: <b689b18d963542d6810a9172a210a6a1@infineon.com>
In-Reply-To: a5aef3c5-fd28-4c22-8bbd-86753284f91c@ufomoviez.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1846143195151201396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

you can find here an application note, which describes in section 7.2.4 the=
 process to create an NV-index in the owner hierarchy:
https://www.infineon.com/dgdl/Infineon-TPM20_Embedded_RPi_TSS_SLx_9670_AppN=
ote-ApplicationNotes-v01_01-EN.zip?fileId=3D5546d4626eab8fbf016f13f1c3ff4c5=
0 =

Maybe this helps to find the problem for your use case. =


Best,
Florian


-----Original Message-----
From: Lester Cordeiro <lester.corderio(a)ufomoviez.com> =

Sent: Mittwoch, 13. Mai 2020 12:44
To: tpm2(a)lists.01.org
Subject: [tpm2] Defining TPM non volatile index

Caution: This e-mail originated outside Infineon Technologies. Do not click=
 on links or open attachments unless you validate it is safe <http://iweb.i=
nfineon.com/en-US/Support/security/CDC/pse/Pages/pce.aspx>.


hi all,

 =C2=A0=C2=A0=C2=A0 i'm trying to define TPM non volatile index under the p=
latform hierachy with this command

tpm2_nvdefine -Q 1 -C p -s 128 -P 123456 -a "ppread|ppwrite"

but it's gives the following errors...

WARNING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:337:Esys_NV_DefineSpac=
e_Finish()
Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys_NV_DefineSpace()
Esys Finish ErrorCode (0x00000182)
ERROR: Failed to define NV area at index 0x1000001
ERROR: Esys_NV_DefineSpace(0x182) - tpm:handle(1):inconsistent attributes
ERROR: Unable to run tpm2_nvdefine

And idea what attributes are inconsistent and what values to provide?


regards,

lester cordeiro
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org %(web_page_url)sl=
istinfo%(cgiext)s/%(_internal_name)s

--===============1846143195151201396==--

