Content-Type: multipart/mixed; boundary="===============5714296155372760767=="
MIME-Version: 1.0
From: Steffen Schwebel <s.schwebel at uvensys.de>
Subject: [tpm2] Re: Need some suggestions about tpm2-tss in Windows
Date: Fri, 14 Aug 2020 09:02:24 +0200
Message-ID: <2e786a10-2e78-519a-c339-06b1777734a4@uvensys.de>
In-Reply-To: BN7PR17MB2356B2FBC28A38DDA8419A58C9430@BN7PR17MB2356.namprd17.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5714296155372760767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

thats is not gonna work, I think.


With a standalone Windows you can use the certreq tool to generate a TPM
backed CSR.

Here is a short guide, using a virtual Smartcard. You should be able to
use TPM directly as well, but I havent used that yet.



1) Generate virtual Smartcard

tpmvscmgr.exe create /name TestVSC /pin default /adminkey random /generat

2) Create templare for certreq, save as cert-template.inf

[NewRequest]
Subject =3D "CN=3D[hostname],O=3D[Organisation],L=3D[Location],ST=3D[State]=
,C=3D[Country]"
Keylength =3D 2048
Exportable =3D FALSE
UserProtected =3D TRUE
MachineKeySet =3D FALSE
ProviderName =3D "Microsoft Base Smart Card Crypto Provider"
ProviderType =3D 1
RequestType =3D PKCS10
KeyUsage =3D 0x80

3) Create a CSR using the above template

certreq.exe -new -f .\tpm_cert.inf cert.csr

Hope that helps..


Regards,
Steffen


On 8/13/20 9:57 PM, Duc Duong wrote:
> Hi,
>
> I just start doing research in tpm-software, I had a running instance
> in Ubuntu, build and install four projects: tpm2-tss, tpm2-tss-engine,
> tpm2-tools and tpm2-abrmd
>
> For professional purposes, I'd like to use this TPM TSS to generate
> key and CSR with OpenSSL and I've already proof the concept in Ubuntu,
> but actually trying to do the same thing in Windows is the final goal.
>
> The first challenge I met is how to build tpm2-tss in Windows, other
> projects are even not VS project.
>
> I'm trying to build tpm2-tss with the environment they have tested,
> like VS 2017 + v141 clang/c2 + UCRT 10.0.16299.0.
>
> But after that, how can I install it and test it? Cause without
> tpm2-tss-engine I can not test it through command right?
>
> If it's not too tedious, please give me some suggestion, the more the
> better.
>
> Like, it there a better way to build tpm2-tss and other project in
> Windows.
>
> Thanks!
>
> Paul
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Steffen Schwebel
Mail: s.schwebel(a)uvensys.de
uvensys GmbH

Firmensitz und Sitz der Gesellschaft:
uvensys GmbH
Schorbachstra=C3=9Fe 11
35510 Butzbach

HRB: AG Friedberg, 7780
USt-Id: DE282879294

Gesch=C3=A4ftsf=C3=BChrer:
Dr. Thomas Licht, t.licht(a)uvensys.de
Volker Lieder, v.lieder(a)uvensys.de

Mail: info(a)uvensys.de
Internet: www.uvensys.de

Durchwahl: 06033 - 18 19 225
Hotline: 06033 - 18 19 288
Zentrale: 06033 - 18 19 20
Fax: 06033 - 18 19 299
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

Jegliche Stellungnahmen und Meinungen dieser E-Mail sind
alleine die des Autors und nicht notwendigerweise die der
Firma. Falls erforderlich, k=C3=B6nnen Sie eine gesonderte
schriftliche Best=C3=A4tigung anfordern.

Any views or opinions presented in this email are solely
those of the author and do not necessarily represent those
of the company. If verification is required please request
a hard-copy version.



--===============5714296155372760767==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
Q0FBR0JRSmZOamNBQUFvSkVCTDQ0MTF0UWp6MW1SQVAvM0dJL3NjQkZjTllhdFQwcVg3OG1ES1gK
NTI5SjN5Q2tTVTMrK3BYcjNmRlE4SWk1VytIVURsOWZ2QzhPL0MzcEJZV0F4WDZhQytvS0dxNW8r
d0F6QkJYSwovTXVWVHQ4a1ZHaVgzYW1MRG1QMUkzL2xYWXJqUGhPVGgrbHRoOGZSSlVWdnRNQ3Ar
bHRkZlV5YWRIY2VTSlFrCkNPdGw1eWt5NEExSlluY3NuMS9mb3RadlI4aHVlQ25zZ2FTRlkrbUNL
R21DTHNyZFUzUEZ6SG5pUlBQN08rNFIKanY4RU5lbi9RQmYzOExpNTNmeG9PSGh1SHFUTzV5OXds
MjMyMDdpdGZ3Z3RrcUMxSDBhWEZ1RnNrVEhiQy9LSgpwVW1YUWtyVWNvTG9OaWFRQWZXR2lmN1Bu
WjdnMXBkVjdyb2JKeW82YnJGRTVJbnpCQ0pDSHhSYkRxT3NPa1h0CndNRGM1ZFVCSHA1bnlvaEVq
azIzVE9qS2R4Yjhydm9Sb1Jkb2JhQW4reUFrVnVkRkRWemNpVWZOQWlMdTRvRDYKZzlERHVwNkJh
ZWloMXdWMEVMOHBCbnBPbkpVNFU1QWV2RDliK3JKcXNiakZocnJyRXpQY1VWQ2hUV2xHOVNCRQp6
Z3U2d2x6L2JPV2dKZUVRdHVwb0Q5V3Z3Uk1XREJWTGxVaWdiOXMvQjRXdVR5VG1IQjRYcHBsUmFs
MzhzWXpUCno0ZUtodUtEZmx0aDJpSW5PNko0L0Fxc0lDQWhSeFEyejJZVml5VFRmeEIxeWxPeVJF
NWVXcDBpN3RuSEZiSmQKeHdiTVdiaU84WC9JQnozNnA4bFhKS3p6ZUdFYUpub0l5cmZWUVZMTkVv
emZiRGhQa2E0UHNPY2pYV2pNVUIxVgpKZzN4VkxUU25uQnh4bU9UWlFyaAo9a09SdQotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============5714296155372760767==--

