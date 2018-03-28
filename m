Content-Type: multipart/mixed; boundary="===============3866661488074584887=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] How to protect and encrypt communication between host and
 TPM
Date: Wed, 28 Mar 2018 07:25:23 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D010EAFD7E3@exch2010c.sit.fraunhofer.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FF09E01@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3866661488074584887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'd also recommend using ESAPI for this.

Basically, what you do is:
- Esys_TR_Deserialize or Esys_Load some well-known key of the target TPM
- Esys_StartAuthSession() Use the well-known key as tpmkey here. This prote=
cts against Man-in-the-middle attacks on the session itself if you're not u=
sing an authValue on the NV.
- Esys_TRSess_SetAttribute(session, TPMA_SESSION_DECRYPT, TPMA_SESSION_DECR=
YPT) This makes the session use encryption. (Flag names are from the perspe=
ctive of the TPM)
- Esys_NV_Write() using the session will automatically encrypt your first p=
arameter and also authenticate the command.

Respectively you can also do:
- Esys_TRSess_SetAttribute(session, TPMA_SESSION_ENCRYPT, TPMA_SESSION_ENCR=
YPT)
- Esys_NV_Read()


A simple example on talking to NV-Space can be found in
https://github.com/tpm2-software/tpm2-tss/blob/master/test/integration/esys=
-nv-ram-ordinary-index.int.c

An example for encrypted sessions here:
https://github.com/tpm2-software/tpm2-tss/blob/6209718064c5ad73debf5a617432=
172944ec4ac8/test/integration/esys-create-session-auth.int.c


________________________________________
From: Roberts, William C [william.c.roberts(a)intel.com]
Sent: Wednesday, March 28, 2018 03:56
To: Tomasz Przybysz; tpm2(a)lists.01.org; Fuchs, Andreas
Subject: RE: [tpm2] How to protect and encrypt communication between host a=
nd TPM

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Tomasz Przyb=
ysz
> Sent: Monday, March 26, 2018 11:55 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] How to protect and encrypt communication between host and
> TPM
>
> Hi, we are working on TPM2.0 integration with our devices.
> We use Infineon TPM 2.0 chip and It works as expect.
>
> We are using tpm2-tss 1.4.0 library.
> We want to use transient RSA key generated inside device. Key is of course
> protected by its parent password, but we want to protect i2c communication
> between host and tpm chip. We want communication be encrypted, we don't
> want to send parent's password or key's password in clear text.
>
> We have found good example tpmclient.int.cpp, but there is an example how=
 to
> encrypt access to the NV Index. There is no anything about RSA keys.
> How to call Tss2_Sys_Create for creating RSA key and then set password to=
 use
> with session protected by TPM2_SE_HMAC and password.

If you can work off of master until the next tss release, I think encrypted=
 sessions is one of the things
that the ESAPI makes easier, Andreas care to elaborate?

>
> In the example there is StartAuthSessionWithParams and StartAuthSession.
> There is KDFa function called but we need something shared password to cr=
eate
> session key.
> Which shared keys ? Is this parent's key password or keys password ?
>
> Thanks in advance,
> Tom
>


--===============3866661488074584887==--

