Content-Type: multipart/mixed; boundary="===============0003325315524950509=="
MIME-Version: 1.0
From: arlotito at microsoft.com
Subject: [tpm2] Re: Help - how to store a certificate in the NV under the
 platform hierarchy?
Date: Thu, 17 Feb 2022 10:03:02 +0000
Message-ID: <20220217100302.2855.10849@ml01.vlan13.01.org>
In-Reply-To: AS8P194MB16695DD6F13FF9E755239817A6369@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0003325315524950509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm using the ibm swtpm... but I get the error anyway and I'm not able to u=
nderstand what's wrong.

This is what I do:
openssl x509 -outform der -in idevid.crt -out idevid.der
DER_SIZE=3D$(wc -c idevid.der | awk '{ print $1 }')
echo $DER_SIZE

tpm2_nvdefine 0x01C90000 -C p -s $DER_SIZE -a "ppread|ppwrite"

...and I get the error I already mentione:
WARNING:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:344:Esys_NV_DefineSpac=
e_Finish() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_NV_DefineSpace.c:122:Esys_NV_DefineSpace(=
) Esys Finish ErrorCode (0x000009a2)
ERROR: Failed to define NV area at index 0x1C90000
ERROR: Esys_NV_DefineSpace(0x9A2) - tpm:session(1):authorization failure wi=
thout DA implications
ERROR: Failed to create NV index 0x1c90000.
ERROR: Unable to run tpm2_nvdefine
--===============0003325315524950509==--

