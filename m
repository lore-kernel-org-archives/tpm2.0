Content-Type: multipart/mixed; boundary="===============9153361464910526594=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] SPI TPM and SPI flash can not work at the same time
Date: Tue, 13 Nov 2018 16:43:08 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C9BC94@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 28a77a01b97f4e83bab04f490f9ac24f@zhaoxin.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9153361464910526594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I wish I could help you more, but your TPM isn't returning a valid RC.

Since bit 7 is set in 0x97, this indicates that it is a FMT 1 response code.

Fmt 1 response codes have the handle encoded in bit positions 8-11 inclusiv=
e.
And is 1-based per https://trustedcomputinggroup.org/wp-content/uploads/TPM=
-Rev-2.0-Part-2-Structures-01.38.pdf
Section 6.6.

It seems the error bits 0-5 inclusive are 0x17 which is TPM2_RC_TAG.

Which is "a parameter that should be a structure tag has a value that is no=
t supported by
the TPM"

I'm not sure why this is failing on your TPM, do any other tpm2_getcap comm=
ands work?

Like:
tpm2_getcap -c properties-fixed
tpm2_getcap -c commands

Bill

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Sherry Zhang=
(BJ-
> RD)
> Sent: Monday, November 5, 2018 8:14 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] SPI TPM and SPI flash can not work at the same time
> =

> Hi All,
> =

> Ubuntu16.04 with the kernel 4.16.2:
> =

> I use a spi port2 with a FIFO TPM2.0 and  two flash on the spi port 0/1.
> =

> First, I unload drivers of spi controller and test the TPM2.0 (built-in t=
pm_tis.o)
> =

> #tpm2_abrmd =EF=BF=BDtcti=3D=E2=80=9Ddevice:/dev/tpm0=E2=80=9D =EF=BF=BDa=
llow-root &
> =

> #tpm2_pcrlist
> =

> #tpm2_nvlist
> =

> And I can use tpm2-tools to test and it is normal .
> =

> =

> =

> Then I load spi controller driver, and test /dev/mtd0 at spi port0 that c=
an work
> well.
> =

> But when I run the commad  =E2=80=9Ctpm2_nvlist=E2=80=9D , it shows a err=
or.
> =

> #tpm2_nvlist
> =

> ERROR: Tss2_Sys_GetCapability(0x97) =EF=BF=BDtpm: handle(unk): incorrect =
structure tag
> =

> ERROR: Unable to run tpm2_nvlist
> =

> =

> =

> PS:
> =

> tpm2-tss 2.1.0
> =

> Tpm2-abrmd 2.0.3_rc0
> =

> Tpm2-tools 3.0.2
> =

> =

> =

> Best regards,
> =

> Sherry Zhang
> =

> =

> =

> =

> =

> =E4=BF=9D=E5=AF=86=E5=A3=B0=E6=98=8E=EF=BC=9A
> =E6=9C=AC=E9=82=AE=E4=BB=B6=E5=90=AB=E6=9C=89=E4=BF=9D=E5=AF=86=E6=88=96=
=E4=B8=93=E6=9C=89=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=8C=87=E5=
=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E4=BD=BF=E7=94=A8=E3=80=82=E4=B8=A5=E7=A6=
=81=E5=AF=B9=E6=9C=AC=E9=82=AE=E4=BB=B6=E6=88=96=E5=85=B6
> =E5=86=85=E5=AE=B9=E5=81=9A=E4=BB=BB=E4=BD=95=E6=9C=AA=E7=BB=8F=E6=8E=88=
=E6=9D=83=E7=9A=84=E6=9F=A5=E9=98=85=E3=80=81=E4=BD=BF=E7=94=A8=E3=80=81=E5=
=A4=8D=E5=88=B6=E6=88=96=E8=BD=AC=E5=8F=91=E3=80=82
> CONFIDENTIAL NOTE:
> This email contains confidential or legally privileged information and is=
 for the sole
> use of its intended recipient. Any unauthorized review, use, copying or
> forwarding of this email or the content of this email is strictly prohibi=
ted.

--===============9153361464910526594==--

