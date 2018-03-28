Content-Type: multipart/mixed; boundary="===============7772275114231242764=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] How to protect and encrypt communication between host and
 TPM
Date: Wed, 28 Mar 2018 08:20:00 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D010EAFD82B@exch2010c.sit.fraunhofer.de>
In-Reply-To: 5a49d9f7-bfe4-20d0-2f43-c6e4beec6fdd@mikronika.pl
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7772275114231242764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ok, sorry I misread your original email...

Regarding key usage: If you use a session for authorization, then the passw=
ord is never send in the clear. Instead it is used to calculate an HMAC tha=
t is used for authentication. This also applies to parent keys during Esys_=
/TPM2_Create().

Regarding key creation: If you use a session with the attribute TPMA_SESSIO=
N_DECRYPT set (as I showed before), then the first parameter of the command=
 (this is the parameter that contains the password for the newly created ke=
y).

Thus, all passwords will be encrypted.

Further if you use a session with TPMA_SESSION_DECRYPT set for the TPM2_Sig=
n() command, also the digest that you sign is encrypted.

Hope this is clearer now...


________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Tomasz Przybysz [toma=
szp(a)mikronika.pl]
Sent: Wednesday, March 28, 2018 09:34
To: tpm2(a)lists.01.org
Subject: Re: [tpm2] How to protect and encrypt communication between host a=
nd TPM

This is one thing I can't understand.
I want to use RSA key (not persistent). Why should I use NV ?
Is this shared password set for NV index used for generate session key
to read RSA key ?
Could you explain ?



W dniu 2018-03-28 o 09:25, Fuchs, Andreas pisze:
> I'd also recommend using ESAPI for this.
>
> Basically, what you do is:
> - Esys_TR_Deserialize or Esys_Load some well-known key of the target TPM
> - Esys_StartAuthSession() Use the well-known key as tpmkey here. This pro=
tects against Man-in-the-middle attacks on the session itself if you're not=
 using an authValue on the NV.
> - Esys_TRSess_SetAttribute(session, TPMA_SESSION_DECRYPT, TPMA_SESSION_DE=
CRYPT) This makes the session use encryption. (Flag names are from the pers=
pective of the TPM)
> - Esys_NV_Write() using the session will automatically encrypt your first=
 parameter and also authenticate the command.
>
> Respectively you can also do:
> - Esys_TRSess_SetAttribute(session, TPMA_SESSION_ENCRYPT, TPMA_SESSION_EN=
CRYPT)
> - Esys_NV_Read()
>
>
> A simple example on talking to NV-Space can be found in
> https://github.com/tpm2-software/tpm2-tss/blob/master/test/integration/es=
ys-nv-ram-ordinary-index.int.c
>
> An example for encrypted sessions here:
> https://github.com/tpm2-software/tpm2-tss/blob/6209718064c5ad73debf5a6174=
32172944ec4ac8/test/integration/esys-create-session-auth.int.c
>
>
> ________________________________________
> From: Roberts, William C [william.c.roberts(a)intel.com]
> Sent: Wednesday, March 28, 2018 03:56
> To: Tomasz Przybysz; tpm2(a)lists.01.org; Fuchs, Andreas
> Subject: RE: [tpm2] How to protect and encrypt communication between host=
 and TPM
>
>> -----Original Message-----
>> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Tomasz Przy=
bysz
>> Sent: Monday, March 26, 2018 11:55 PM
>> To: tpm2(a)lists.01.org
>> Subject: [tpm2] How to protect and encrypt communication between host and
>> TPM
>>
>> Hi, we are working on TPM2.0 integration with our devices.
>> We use Infineon TPM 2.0 chip and It works as expect.
>>
>> We are using tpm2-tss 1.4.0 library.
>> We want to use transient RSA key generated inside device. Key is of cour=
se
>> protected by its parent password, but we want to protect i2c communicati=
on
>> between host and tpm chip. We want communication be encrypted, we don't
>> want to send parent's password or key's password in clear text.
>>
>> We have found good example tpmclient.int.cpp, but there is an example ho=
w to
>> encrypt access to the NV Index. There is no anything about RSA keys.
>> How to call Tss2_Sys_Create for creating RSA key and then set password t=
o use
>> with session protected by TPM2_SE_HMAC and password.
> If you can work off of master until the next tss release, I think encrypt=
ed sessions is one of the things
> that the ESAPI makes easier, Andreas care to elaborate?
>
>> In the example there is StartAuthSessionWithParams and StartAuthSession.
>> There is KDFa function called but we need something shared password to c=
reate
>> session key.
>> Which shared keys ? Is this parent's key password or keys password ?
>>
>> Thanks in advance,
>> Tom
>>

_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============7772275114231242764==--

