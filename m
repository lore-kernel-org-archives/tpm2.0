Content-Type: multipart/mixed; boundary="===============8881569433302752922=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Help - how to store a certificate in the NV under the
 platform hierarchy?
Date: Thu, 17 Feb 2022 10:11:16 +0000
Message-ID: <AS8P194MB166913FD991A480903656116A6369@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: 20220217100302.2855.10849@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8881569433302752922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I guess you need to add the platformcreate attribute to -a

That would be my last idea I'm afraid...
Next advice would be to gdb into swtpm; set some breakpoints and have a loo=
k inside... ;-)

________________________________________
Von: arlotito(a)microsoft.com <arlotito(a)microsoft.com>
Gesendet: Donnerstag, 17. Februar 2022 11:03
An: tpm2(a)lists.01.org
Betreff: [tpm2] Re: Help - how to store a certificate in the NV under the p=
latform hierarchy?

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
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8881569433302752922==--

