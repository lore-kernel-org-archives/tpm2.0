Content-Type: multipart/mixed; boundary="===============5306910165299121739=="
MIME-Version: 1.0
From: Juergen Repp <Juergen.Repp at sit.fraunhofer.de>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Mon, 20 Dec 2021 23:06:15 +0100
Message-ID: <d9e4b269-39ec-b350-a6cc-ffed39b90ba7@sit.fraunhofer.de>
In-Reply-To: BN8PR15MB275326320CD1F689C1EDC804F27B9@BN8PR15MB2753.namprd15.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5306910165299121739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When /dev/tpmrm0 was used with kernel 5.10.
After sending the command read public:
0x80 0x01 0x00 0x00 0x00 0x0e 0x00 0x00 0x01 0x73 0x80 0x00 0x00 0x00
the write worked but the poll call in  tcti_device_receive did stuck.
With kernel 4.19 write for this command did return -1



Am 20.12.21 um 21:04 schrieb Kenneth Goldman:
> They way I use it:
> =

> =C2=A0
> =

> /dev/tpm0 is locking, one user at a time.=C2=A0 I use it for debug only.=
=C2=A0 IMHO, production applications should not use it.
> =

> =C2=A0
> =

> /dev/tpmrm0 is the multi-user interface.=C2=A0 Use it for production appl=
ications, where the TPM is shared.
> =

> =C2=A0
> =

> I suspect (not sure) that /dev/tpm0 will have unexpected effects when the=
 kernel is also trying to use the TPM.
> =

> =C2=A0
> =

> =C2=A0
> =

> And as a newbie, I felt that the fact TPM exposes two devices (/dev/tpm0 =
and /dev/tpmrm0) under Linux is confusing and is making things=C2=A0more=C2=
=A0complicated.=C2=A0 The architecture diagram (https://github.com/tpm2-sof=
tware/tpm2-tss <https://github.com/tpm2-software/tpm2-tss>) shows all calls=
 go through the Resource Manager but that is not the case in reality.=C2=A0=
 I was wondering what is the benefit to have 2 devices instead of just one =
device in linux?=C2=A0
> =

> =C2=A0
> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>=20

--===============5306910165299121739==--

