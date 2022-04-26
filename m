Content-Type: multipart/mixed; boundary="===============4400808010597309093=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider...
Date: Tue, 26 Apr 2022 15:09:13 +0200
Message-ID: <20220426150913.699DCD0C@centrum.cz>
In-Reply-To: DS7PR03MB5576C7FFBE1AA4907B99441C9AFB9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4400808010597309093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Could be separate the individual questions/issues, please? I am getting los=
t :)

The "command code not supported" error after Esys_CreateLoaded is a known i=
ssue:
https://github.com/tpm2-software/tpm2-openssl/issues/29

To set the hierarchy you may be able to use the "-pkeyopt parent" parameter.


Petr
______________________________________________________________
> Od: "Sievert, James" <james.sievert(a)bsci.com>
> Komu: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
> Datum: 26.04.2022 14:57
> P=C5=99edm=C4=9Bt: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider.=
..
>
>I was embarking on that and hit another snag:
>
>        $ tpm2_getcap ecc-curves
>      TPM2_ECC_NIST_P256: 0x3
>      TPM2_ECC_BN_P256: 0x10
>
>      $ openssl genpkey -provider tpm2 -algorithm EC -pkeyopt group:P-256 =
-out testkey.priv
>      Warning: generating random key material may take a long time
>      if the system has a poor entropy source
>      WARNING:esys:src/tss2-esys/api/Esys_CreateLoaded.c:368:Esys_CreateLo=
aded_Finish() Received TPM Error
>      ERROR:esys:src/tss2-esys/api/Esys_CreateLoaded.c:129:Esys_CreateLoad=
ed() Esys Finish ErrorCode (0x000b0143)
>      genpkey: Error generating EC key
>      403C86A7007F0000:error:4000000B:tpm2::cannot create key::-1:721219 r=
mt:error(2.0): command code not supported
>
>I=E2=80=99m curious, does one have control over the hierarchy under which =
the key is created?
>
>Also, related to my initial query, the TPM vendor has internal certificate=
s stored at 0x1c0000a and 0x1c00002:
>
>      0x1c00002:
>        name: 000bec00c657a4e2724101954c2c9d51ddd45c825c3997ec0786c3afeb0f=
7fca3ec7
>        hash algorithm:
>          friendly: sha256
>          value: 0xB
>        attributes:
>          friendly: ppwrite|writedefine|ppread|ownerread|authread|no_da|wr=
itten|platformcreate
>          value: 0x1200762
>        size: 1177
>
>      0x1c0000a:
>        name: 000b2571404112c8aae1cde797c438d921093fc89b74d44564c25c296aaa=
26a6f041
>        hash algorithm:
>          friendly: sha256
>          value: 0xB
>        attributes:
>          friendly: ppwrite|writedefine|ppread|ownerread|authread|no_da|wr=
itten|platformcreate
>          value: 0x1200762
>        size: 781
>
>I cannot retrieve them using openssl x509:
>
>      $ openssl x509 -provider tpm2 -provider default -in handle:0x1c0000a
>      WARNING:esys:src/tss2-esys/api/Esys_NV_Read.c:315:Esys_NV_Read_Finis=
h() Received TPM Error
>      ERROR:esys:src/tss2-esys/api/Esys_NV_Read.c:105:Esys_NV_Read() Esys =
Finish ErrorCode (0x00000095)
>      Could not read certificate from handle:0x1c0000a
>      405C04A14E7F0000:error:4000000C:tpm2::cannot load key::-1:149 tpm:ha=
ndle(unk):structure is the wrong size
>      Unable to load certificate
>
>      $ openssl x509 -provider tpm2 -provider default -in handle:0x1c00002
>      WARNING:esys:src/tss2-esys/api/Esys_NV_Read.c:315:Esys_NV_Read_Finis=
h() Received TPM Error
>      ERROR:esys:src/tss2-esys/api/Esys_NV_Read.c:105:Esys_NV_Read() Esys =
Finish ErrorCode (0x00000095)
>      Could not read certificate from handle:0x1c00002
>      40DC7060527F0000:error:4000000C:tpm2::cannot load key::-1:149 tpm:ha=
ndle(unk):structure is the wrong size
>      Unable to load certificate
>
>This does work; however:
>
>      bsci(a)ip-10-132-42-225:~/test$ tpm2_nvread -C p -s 781 0x1c0000a |o=
penssl x509 -in /dev/stdin -inform der -noout -text
>      Certificate:
>          Data:
>              Version: 3 (0x2)
>              Serial Number: 756297432 (0x2d142ed8)
>              Signature Algorithm: ecdsa-with-SHA256
>              Issuer: C =3D DE, O =3D Infineon Technologies AG, OU =3D OPT=
IGA(TM) TPM2.0, CN =3D Infineon OPTIGA(TM) ECC Manufacturing CA 029
>              Validity
>                  Not Before: Sep 29 02:49:58 2021 GMT
>                  Not After : Sep 29 02:49:58 2036 GMT
>        =E2=80=A6
>
>
>-----Original Message-----
>From: Petr Gotthard <petr.gotthard(a)centrum.cz>
>Sent: Tuesday, April 26, 2022 8:20 AM
>To: tpm2(a)lists.01.org
>Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider...
>
>Oh, I never tested the `openssl cms` commands. There may be something miss=
ing from the OpenSSL. What CMS functions you need? Could you please suggest=
 a sequence of openssl (and other commands) to verify all required CMS func=
tions? Something like a new (set of) test(s), similar e.g. to https://githu=
b.com/tpm2-software/tpm2-openssl/blob/master/test/ecdsa_genpkey_auth.sh.
>
>Petr
>______________________________________________________________
>> Od: "Sievert, James" <james.sievert(a)bsci.com<mailto:james.sievert(a)bs=
ci.com>>
>> Komu: "tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>" <tpm2(a)lists.01=
.org<mailto:tpm2(a)lists.01.org>>
>> Datum: 26.04.2022 14:07
>> P=C5=99edm=C4=9Bt: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider=
...
>>
>>Thanks, Petr.  That did the trick (actually, base was sufficient).  In a =
similar vein, the corresponding private key is also held persistently in th=
e TPM, handle 0x81800002.  I'm now attempting the following:
>>
>>        openssl cms -sign -provider tpm2 -provider default -in file.txt
>> -inkey handle:0x81800002 -signer handle:0x01000013
>>
>>I get no output, and a return value of 3.  I get the same result if I ref=
erence the public key certificate as a file:
>>
>>        openssl cms -sign -provider tpm2 -provider default -in file.txt
>> -inkey handle:0x81800002 -signer signer.pem
>>
>>Any insight on that would be appreciated=E2=80=A6
>>
>_______________________________________________
>tpm2 mailing list -- tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
>To unsubscribe send an email to tpm2-leave(a)lists.01.org<mailto:tpm2-leav=
e(a)lists.01.org> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
>
>----------
>
>_______________________________________________
>tpm2 mailing list -- tpm2(a)lists.01.org
>To unsubscribe send an email to tpm2-leave(a)lists.01.org
>%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
--===============4400808010597309093==--

