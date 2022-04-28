Content-Type: multipart/mixed; boundary="===============3301336202161688050=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Thu, 28 Apr 2022 19:39:02 +0200
Message-ID: <20220428193902.A341A42E@centrum.cz>
In-Reply-To: DS7PR03MB55760F082D49B3F8EDA1D4279AFD9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3301336202161688050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks. The issue is related to the KDF parameters. The CMS wants to get/se=
t a number of KDF related parameters, which are not (yet) supported by the =
tpm2-provider. I will try to fix this in the coming days.

Petr

______________________________________________________________
> Od: "Sievert, James" <james.sievert(a)bsci.com>
> Komu: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
> Datum: 28.04.2022 18:34
> P=C5=99edm=C4=9Bt: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider.=
.. / openssl cms
>
>> Could you please build tpm2-openssl with "./configure --enable-debug"?
>
>Here ya go:
>
>$ openssl cms -encrypt -provider tpm2 -provider default -in file.txt -reci=
p signer.pem -aes128
>PROVIDER INIT
>RAND NEW
>RAND NEW
>RAND GET_CTX_PARAMS [ max_request ]
>RAND GENERATE
>EC NEW
>EC IMPORT [ point-format encoding group pub priv point-format group-check =
use-cofactor-flag ]
>KEYEXCH NEW
>KEYEXCH INIT
>RAND NEW
>RAND GET_CTX_PARAMS [ max_request ]
>RAND GENERATE
>RAND GET_CTX_PARAMS [ max_request ]
>RAND GENERATE
>400CF680FA7F0000:error:17000074:CMS routines:cms_EnvelopedData_Encryption_=
init_bio:error setting recipientinfo:../crypto/cms/cms_env.c:1142:
>400CF680FA7F0000:error:17000068:CMS routines:CMS_final:cms lib:../crypto/c=
ms/cms_smime.c:881:
>KEYEXCH FREE
>EC FREE
>RAND FREE
>RAND FREE
>RAND FREE
>PROVIDER TEARDOWN
--===============3301336202161688050==--

