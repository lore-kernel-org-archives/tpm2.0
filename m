Content-Type: multipart/mixed; boundary="===============4357216260138889393=="
MIME-Version: 1.0
From: Sievert, James <james.sievert at bsci.com>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Thu, 28 Apr 2022 16:33:51 +0000
Message-ID: <
 <DS7PR03MB55760F082D49B3F8EDA1D4279AFD9@DS7PR03MB5576.namprd03.prod.outlook.com>>
In-Reply-To: 20220428182655.4EF6083D@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4357216260138889393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Could you please build tpm2-openssl with "./configure --enable-debug"?

Here ya go:

$ openssl cms -encrypt -provider tpm2 -provider default -in file.txt -recip=
 signer.pem -aes128
PROVIDER INIT
RAND NEW
RAND NEW
RAND GET_CTX_PARAMS [ max_request ]
RAND GENERATE
EC NEW
EC IMPORT [ point-format encoding group pub priv point-format group-check u=
se-cofactor-flag ]
KEYEXCH NEW
KEYEXCH INIT
RAND NEW
RAND GET_CTX_PARAMS [ max_request ]
RAND GENERATE
RAND GET_CTX_PARAMS [ max_request ]
RAND GENERATE
400CF680FA7F0000:error:17000074:CMS routines:cms_EnvelopedData_Encryption_i=
nit_bio:error setting recipientinfo:../crypto/cms/cms_env.c:1142:
400CF680FA7F0000:error:17000068:CMS routines:CMS_final:cms lib:../crypto/cm=
s/cms_smime.c:881:
KEYEXCH FREE
EC FREE
RAND FREE
RAND FREE
RAND FREE
PROVIDER TEARDOWN

--===============4357216260138889393==--

