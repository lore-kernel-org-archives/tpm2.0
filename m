Content-Type: multipart/mixed; boundary="===============3135020028295142598=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] How to protect and encrypt communication between host and
 TPM
Date: Wed, 28 Mar 2018 01:56:48 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FF09E01@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 57a1de55-a2a2-249d-b70a-a6fbfbf9e7a2@mikronika.pl
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3135020028295142598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Tomasz Przyb=
ysz
> Sent: Monday, March 26, 2018 11:55 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] How to protect and encrypt communication between host and
> TPM
> =

> Hi, we are working on TPM2.0 integration with our devices.
> We use Infineon TPM 2.0 chip and It works as expect.
> =

> We are using tpm2-tss 1.4.0 library.
> We want to use transient RSA key generated inside device. Key is of course
> protected by its parent password, but we want to protect i2c communication
> between host and tpm chip. We want communication be encrypted, we don't
> want to send parent's password or key's password in clear text.
> =

> We have found good example tpmclient.int.cpp, but there is an example how=
 to
> encrypt access to the NV Index. There is no anything about RSA keys.
> How to call Tss2_Sys_Create for creating RSA key and then set password to=
 use
> with session protected by TPM2_SE_HMAC and password.

If you can work off of master until the next tss release, I think encrypted=
 sessions is one of the things
that the ESAPI makes easier, Andreas care to elaborate?

> =

> In the example there is StartAuthSessionWithParams and StartAuthSession.
> There is KDFa function called but we need something shared password to cr=
eate
> session key.
> Which shared keys ? Is this parent's key password or keys password ?
> =

> Thanks in advance,
> Tom
> =



--===============3135020028295142598==--

