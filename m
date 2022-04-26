Content-Type: multipart/mixed; boundary="===============0639776177121415961=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider...
Date: Tue, 26 Apr 2022 14:20:24 +0200
Message-ID: <20220426142024.E81B1820@centrum.cz>
In-Reply-To: DS7PR03MB55763190258B91401A7D93EA9AFB9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0639776177121415961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Oh, I never tested the `openssl cms` commands. There may be something missi=
ng from the OpenSSL. What CMS functions you need? Could you please suggest =
a sequence of openssl (and other commands) to verify all required CMS funct=
ions? Something like a new (set of) test(s), similar e.g. to https://github=
.com/tpm2-software/tpm2-openssl/blob/master/test/ecdsa_genpkey_auth.sh.

Petr
______________________________________________________________
> Od: "Sievert, James" <james.sievert(a)bsci.com>
> Komu: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
> Datum: 26.04.2022 14:07
> P=C5=99edm=C4=9Bt: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider.=
..
>
>Thanks, Petr.  That did the trick (actually, base was sufficient).  In a s=
imilar vein, the corresponding private key is also held persistently in the=
 TPM, handle 0x81800002.  I'm now attempting the following:
>
>        openssl cms -sign -provider tpm2 -provider default -in file.txt -i=
nkey handle:0x81800002 -signer handle:0x01000013
>
>I get no output, and a return value of 3.  I get the same result if I refe=
rence the public key certificate as a file:
>
>        openssl cms -sign -provider tpm2 -provider default -in file.txt -i=
nkey handle:0x81800002 -signer signer.pem
>
>Any insight on that would be appreciated=E2=80=A6
>
--===============0639776177121415961==--

