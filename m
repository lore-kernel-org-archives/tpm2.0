Content-Type: multipart/mixed; boundary="===============3590494113713903611=="
MIME-Version: 1.0
From: arlotito at microsoft.com
Subject: [tpm2] Re: Help - how to store a certificate in the NV under the
 platform hierarchy?
Date: Thu, 17 Feb 2022 10:15:15 +0000
Message-ID: <20220217101515.2855.27262@ml01.vlan13.01.org>
In-Reply-To: AS8P194MB166913FD991A480903656116A6369@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3590494113713903611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I tried:
tpm2_nvdefine 0x01C90000 -C p -s $DER_SIZE -a "ppread|ppwrite|platformcreat=
e"

but i get the same error:
WARNING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:344:Esys_NV_DefineSpac=
e_Finish() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys_NV_DefineSpace(=
) Esys Finish ErrorCode (0x000009a2)
ERROR: Failed to define NV area at index 0x1C90000
ERROR: Esys_NV_DefineSpace(0x9A2) - tpm:session(1):authorization failure wi=
thout DA implications
ERROR: Failed to create NV index 0x1c90000.
ERROR: Unable to run tpm2_nvdefine

Thanks anyway for your help and clarifications!
--===============3590494113713903611==--

