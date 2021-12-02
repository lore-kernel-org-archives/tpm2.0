Content-Type: multipart/mixed; boundary="===============2891314995755650006=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: "tpm2_import" Integrity Check issue on a Big Endian 32 Bit
 Platform
Date: Thu, 02 Dec 2021 22:25:14 +0000
Message-ID: <DM6PR11MB3434FA09CDE4375E3E56A9DAB8699@DM6PR11MB3434.namprd11.prod.outlook.com>
In-Reply-To: CADu5HqxAtjB6z-_0JX+GAauNL7v7jb1w_ogNecf=zy6VPhK36A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2891314995755650006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com>
> Sent: Thursday, December 2, 2021 2:41 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>; Desai, Imran <imran.desai(=
a)intel.com>
> Subject: Re: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 3=
2 Bit Platform =

=C2=A0
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
ntel.com> wrote:
> + Imran

> What version of tools and tss are you running?

> I just noticed that the tools CI doesn't have the multi-arch images enabl=
ed. Let me investigate adding this and see if I can reproduce.

> From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com>
> Sent: Wednesday, December 1, 2021 11:40 PM
> To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> Subject: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 32 Bi=
t Platform =

 =C2=A0
> Hello Team

> I am trying to use tpm2_import on a Big Endian 32 Bit platform and runnin=
g into following error:

> -------------------------------------------------------------------------=
-------------------------------------------------------

> Command: =

> openssl genrsa -out private.pem 2048
> tpm2_import -C 0x81000001 -G rsa -i private.pem -u key.pub -r key.priv

> Error:
> ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish =
ErrorCode (0x000003df)
> ERROR: Esys_HMAC(0x3DF) - tpm:parameter(3):integrity check failed
> ERROR: Unable to run tpm2_import
> -------------------------------------------------------------------------=
------------------------------------------------------- =


> Need pointers to debug this issue.
> Have any of you come across this error with tpm2_import on Big Endian 32 =
Bit Platform? Do we have a fix Or can you provide inputs on the source wher=
e I can look > at for further debugging?

> Thanks
> Raj
--===============2891314995755650006==--

