Content-Type: multipart/mixed; boundary="===============7723151611223442044=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: "tpm2_import" Integrity Check issue on a Big Endian 32 Bit
 Platform
Date: Fri, 03 Dec 2021 08:37:17 +0000
Message-ID: <AM8P194MB1675BB303BF9B748486FD5CAA66A9@AM8P194MB1675.EURP194.PROD.OUTLOOK.COM>
In-Reply-To: CADu5HqwHtao46dmH0xuZn_15mtS1LtLa=4HiFcXaVPTQYHo=_g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7723151611223442044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I guess the next step would be to bisect the exact error:

git bisect start
git bisect bad upstream/master
git bisect good 5.2

This should lead you to the concrete commit that made things go bad.
It takes some time of course but would be worth it...

________________________________________
Von: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com>
Gesendet: Freitag, 3. Dezember 2021 06:02
An: Roberts, William C
Cc: tpm2(a)lists.01.org; Desai, Imran
Betreff: [tpm2] Re: "tpm2_import" Integrity Check issue on a Big Endian 32 =
Bit Platform

-   tpm2-tss 3.1.0 and Tpm2-tools 5.2 2021-09-2 8=3D=3D> tpm2_import fails =
with error 0x3DF
-   tpm2-tss 3.0.4 and Tpm2-tools 5.2 2021-09-28 =3D=3D> tpm2_import fails =
with error 0x3DF
-   tpm2-tss 3.0.4 and Tpm2-tools 5.2 =3D=3D> tpm2_import succeeds

Why are you putting dates on some of the tpm2-tools versions but not tpm2-t=
ss?
[Raj] TPM2 Tools Master has this date code "2021-09-28" at "https://github.=
com/tpm2-software/tpm2-tools" for the version, hence I have used it to indi=
cate the source code version of tpm2-tools which I downloaded from https://=
github.com/tpm2-software/tpm2-tools

tpm2-tools 5.2 source was downloaded from link: https://github.com/tpm2-sof=
tware/tpm2-tools/releases/download/5.2/tpm2-tools-5.2.tar.gz
tpm2-tss 3.1.0 was downloaded from https://github.com/tpm2-software/tpm2-tss
tpm2-tss 3.0.4 was downloaded from https://github.com/tpm2-software/tpm2-ts=
s/releases/download/3.0.4/tpm2-tss-3.0.4.tar.gz

Let me know if you would need any further information.

Regards
Raj

On Fri, Dec 3, 2021 at 3:55 AM Roberts, William C <william.c.roberts(a)inte=
l.com<mailto:william.c.roberts(a)intel.com>> wrote:
> From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com<mailto:rajkuma=
r.k.sivasamy(a)gmail.com>>
> Sent: Thursday, December 2, 2021 2:41 PM
> To: Roberts, William C <william.c.roberts(a)intel.com<mailto:william.c.ro=
berts(a)intel.com>>
> Cc: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org> <tpm2(a)lists.01.org<=
mailto:tpm2(a)lists.01.org>>; Desai, Imran <imran.desai(a)intel.com<mailto:=
imran.desai(a)intel.com>>
> Subject: Re: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 3=
2 Bit Platform

> Hello William

> I am using below versions:
> tpm2-tss 3.1.0
> tpm2-tools 5.2 2021-09-28

> To further narrow down, I replaced tpm2-tss 3.1.0 with tpm2-tss 3.0.4 and=
 tpm2_import still failed with 0x3DF.

> Now along with tpm2-tss- 3.0.4 I used tpm2-tools 5.2 and tpm2_import succ=
eeds; seems to be a problem with tpm2-tools t.2 2021-09-28.

I'm confused. I read both these lines as I used tpm2-tss 3.0.4 and tpm2-too=
ls 5.2 and it succeeds and fails. Why are you putting dates on some of
the tpm2-tools versions but not tpm2-tss?


> Regards
> Raj

>  On Thu, Dec 2, 2021 at 8:44 PM Roberts, William C <william.c.roberts(a)i=
ntel.com<mailto:william.c.roberts(a)intel.com>> wrote:
> + Imran

> What version of tools and tss are you running?

> I just noticed that the tools CI doesn't have the multi-arch images enabl=
ed. Let me investigate adding this and see if I can reproduce.

> From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com<mailto:rajkuma=
r.k.sivasamy(a)gmail.com>>
> Sent: Wednesday, December 1, 2021 11:40 PM
> To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org> <tpm2(a)lists.01.org<=
mailto:tpm2(a)lists.01.org>>
> Subject: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 32 Bi=
t Platform

> Hello Team

> I am trying to use tpm2_import on a Big Endian 32 Bit platform and runnin=
g into following error:

> -------------------------------------------------------------------------=
-------------------------------------------------------

> Command:
> openssl genrsa -out private.pem 2048
> tpm2_import -C 0x81000001 -G rsa -i private.pem -u key.pub -r key.priv

> Error:
> ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish =
ErrorCode (0x000003df)
> ERROR: Esys_HMAC(0x3DF) - tpm:parameter(3):integrity check failed
> ERROR: Unable to run tpm2_import
> -------------------------------------------------------------------------=
-------------------------------------------------------

> Need pointers to debug this issue.
> Have any of you come across this error with tpm2_import on Big Endian 32 =
Bit Platform? Do we have a fix Or can you provide inputs on the source wher=
e I can look > at for further debugging?

> Thanks
> Raj
--===============7723151611223442044==--

