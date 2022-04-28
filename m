Content-Type: multipart/mixed; boundary="===============7802211856304436962=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and TPM 2 vendor certs in NVRAM...
Date: Thu, 28 Apr 2022 15:34:19 +0200
Message-ID: <20220428153419.3D09DDB0@centrum.cz>
In-Reply-To: DS7PR03MB55767734A941458248B11ACA9AFA9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7802211856304436962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

James,
there were some bugs in the NV processing and certificate parsing. Thank yo=
u for reporting them.

Everything should be fixed in the latest master branch. Please check if the=
re are any issues.


Petr
______________________________________________________________
> Od: "Sievert, James" <james.sievert(a)bsci.com>
> Komu: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
> Datum: 27.04.2022 19:33
> P=C5=99edm=C4=9Bt: [tpm2] Re: {External} Re: OpenSSL 3 and TPM 2 vendor c=
erts in NVRAM...
>
>They are DER format. =

>
>-----Original Message-----
>From: Petr Gotthard <petr.gotthard(a)centrum.cz> =

>Sent: Wednesday, April 27, 2022 1:31 PM
>To: tpm2(a)lists.01.org
>Subject: {External} [tpm2] Re: OpenSSL 3 and TPM 2 vendor certs in NVRAM...
>
>Hi James,
>
>Loading certs from NV was also not tested and apparently doesn't work eith=
er.
>https://github.com/tpm2-software/tpm2-openssl/issues/35
>
>Please-- could you retrieve your cert from the NV and let me know whether =
it is DER (binary) or PEM (textual with -----BEGIN CERTIFICATE----- lines)?
>
>
>Petr
>______________________________________________________________
>> Od: "Sievert, James" <james.sievert(a)bsci.com>
>> Komu: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
>> Datum: 26.04.2022 15:18
>> P=C5=99edm=C4=9Bt: [tpm2] OpenSSL 3 and TPM 2 vendor certs in NVRAM...
>>
>>Hi,
>>
>>
>>The TPM vendor has internal certificates stored at 0x1c0000a and 0x1c0000=
2:
>>
>>
>>0x1c00002:
>>
>>  name: =

>> 000bec00c657a4e2724101954c2c9d51ddd45c825c3997ec0786c3afeb0f7fca3ec7
>>  hash algorithm:
>>    friendly: sha256
>>    value: 0xB
>>  attributes:
>>    friendly: ppwrite|writedefine|ppread|ownerread|authread|no_da|written=
|platformcreate
>>    value: 0x1200762
>>  size: 1177
>>
>>0x1c0000a:
>>  name: =

>>000b2571404112c8aae1cde797c438d921093fc89b74d44564c25c296aaa26a6f041
>>  hash algorithm:
>>    friendly: sha256
>>    value: 0xB
>>  attributes:
>>    friendly: ppwrite|writedefine|ppread|ownerread|authread|no_da|written=
|platformcreate
>>    value: 0x1200762
>>  size: 781
>>
>>I cannot retrieve them using openssl x509:
>>
>>$ openssl x509 -provider tpm2 -provider default -in handle:0x1c0000a
>>WARNING:esys:src/tss2-esys/api/Esys_NV_Read.c:315:Esys_NV_Read_Finish() =

>>Received TPM Error
>>ERROR:esys:src/tss2-esys/api/Esys_NV_Read.c:105:Esys_NV_Read() Esys =

>>Finish ErrorCode (0x00000095) Could not read certificate from =

>>handle:0x1c0000a 405C04A14E7F0000:error:4000000C:tpm2::cannot load =

>>key::-1:149 tpm:handle(unk):structure is the wrong size Unable to load =

>>certificate
>>
>>$ openssl x509 -provider tpm2 -provider default -in handle:0x1c00002
>>WARNING:esys:src/tss2-esys/api/Esys_NV_Read.c:315:Esys_NV_Read_Finish() =

>>Received TPM Error
>>ERROR:esys:src/tss2-esys/api/Esys_NV_Read.c:105:Esys_NV_Read() Esys =

>>Finish ErrorCode (0x00000095) Could not read certificate from =

>>handle:0x1c00002 40DC7060527F0000:error:4000000C:tpm2::cannot load =

>>key::-1:149 tpm:handle(unk):structure is the wrong size Unable to load =

>>certificate
>>
>>This does work; however:
>>
>>bsci(a)ip-10-132-42-225:~/test$ tpm2_nvread -C p -s 781 0x1c0000a =

>>|openssl x509 -in /dev/stdin -inform der -noout -text
>>Certificate:
>>    Data:
>>        Version: 3 (0x2)
>>        Serial Number: 756297432 (0x2d142ed8)
>>        Signature Algorithm: ecdsa-with-SHA256
>>        Issuer: C =3D DE, O =3D Infineon Technologies AG, OU =3D OPTIGA(T=
M) TPM2.0, CN =3D Infineon OPTIGA(TM) ECC Manufacturing CA 029
>>        Validity
>>            Not Before: Sep 29 02:49:58 2021 GMT
>>            Not After : Sep 29 02:49:58 2036 GMT
>>       ...
>>
>>
>>Thanks.
--===============7802211856304436962==--

