Content-Type: multipart/mixed; boundary="===============2038281899906396444=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Thu, 28 Apr 2022 17:10:57 +0200
Message-ID: <20220428171057.180185B4@centrum.cz>
In-Reply-To: DS7PR03MB55766301B4D6369D582181AD9AFD9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2038281899906396444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>I also tried this:  =

>
>openssl cms -encrypt -provider tpm2 -provider base -propquery ?provider=3D=
tpm2,tpm2.cipher!=3Dyes -in file.txt -recip handle:0x01000013 -aes128
>
>Same result...

That should work as well. Have you tried "-provider default" instead of "-p=
rovider base"?

Openssl should be able to combine algorithms from different providers and t=
he tpm2-openssl provider announces to openssl only those algorithms that ar=
e supported by the tpm2 chip itself. The only tricky bit is when the same a=
lgorithm is implemented twice, which is not your case... yet ;-).


Petr
--===============2038281899906396444==--

