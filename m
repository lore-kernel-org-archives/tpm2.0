Content-Type: multipart/mixed; boundary="===============9084735446618160070=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] [tpm2-tools] tools error while compiling
Date: Mon, 26 Aug 2019 20:51:39 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEED12@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAPSVqM1c2k5tgCQvK+vTU=QNk-uhT934FEMsADJ-3Mk=6yURgg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9084735446618160070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You must not be on TSS 2.3 or greater.

That commit came in 45c9c79 which is on tag 2.3.0:
$ git tag --contains 45c9c790273f1ea6d5e51bac86fbcf2983f035f2
2.3.0

On the tools is ca me in as 0d88935be88e9:

$ git tag --contains 0d88935be88e9
4.0-rc0
4.0-rc1
As well as being on master...

The configure script should be verifying that
ESYS is version 2.3.0 or higher:
PKG_CHECK_MODULES([TSS2_ESYS], [tss2-esys >=3D 2.3.0])

Is the version your building against the one you built. Did you install
The newer TSS before configuring?

Seems like it's getting passed configure but building against old headers.


> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Iratxe Gonz=
=C3=A1lez
> Garrido
> Sent: Monday, August 26, 2019 12:39 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] [tpm2-tools] tools error while compiling
> =

> Hello:
> =

> I am trying to update my tpm2-tools to version 4 but I get this error mes=
sage:
> =

> pi(a)iotacar:~/tpm2-tools $ make -j5
>   CC       lib/lib_libcommon_a-files.o
>   CC       lib/lib_libcommon_a-log.o
>   CC       lib/lib_libcommon_a-object.o
>   CC       lib/lib_libcommon_a-pcr.o
>   CC       lib/lib_libcommon_a-tpm2.o
>   CC       lib/lib_libcommon_a-tpm2_alg_util.o
>   CC       lib/lib_libcommon_a-tpm2_attr_util.o
> lib/tpm2_alg_util.c: In function =E2=80=98tpm2_alg_util_for_each_alg=E2=
=80=99:
> lib/tpm2_alg_util.c:66:33: error: =E2=80=98TPM2_ALG_CMAC=E2=80=99 undecla=
red (first use in this
> function)
>          { .name =3D "cmac", .id =3D TPM2_ALG_CMAC, .flags =3D tpm2_alg_u=
til_flags_sig },
>                                  ^~~~~~~~~~~~~
> lib/tpm2_alg_util.c:66:33: note: each undeclared identifier is reported o=
nly once
> for each function it appears in
> Makefile:2618: recipe for target 'lib/lib_libcommon_a-tpm2_alg_util.o' fa=
iled
> make: *** [lib/lib_libcommon_a-tpm2_alg_util.o] Error 1
> make: *** Waiting for unfinished jobs....
> =

> =

> I've tried uninstalling and reinstalling everything but I get the same er=
ror. I
> installed it yesterday in another raspberry pi from scratch and it works =
without
> problems, therefore I think I have some legacy files from the previous
> installation, but I don't know what to delete. I have not encountered any
> problems while installing tpms2-tss, tom2-abrmd or the TPM simulator, jus=
t with
> tpm2-tools
> =

> Can anyone help me?
> =

> Thanks in advance


--===============9084735446618160070==--

