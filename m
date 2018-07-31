Content-Type: multipart/mixed; boundary="===============3343888439532249674=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: Re: [tpm2] tpm2_getpubek EvictControl fails with 0x1c4 (TPM_RC_VALUE)
Date: Tue, 31 Jul 2018 09:29:41 +0200
Message-ID: <CANtcRX5Xt2gw6ppdVA6=2joDXY+gV6OV7TQqxPNd2da4HS2ebg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649C0972B@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3343888439532249674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you very much, that resolved the problem and provided very
useful insights!

//P
On Mon, Jul 30, 2018 at 10:45 PM Roberts, William C
<william.c.roberts(a)intel.com> wrote:
>
> Using tpm2_rc_decode from master yields:
> tpm:parameter(1):value is out of range or is not correct for the context
>
> Which is a little easier to understand. Parameter 1 is invalid.
>
> If you look at https://trustedcomputinggroup.org/wp-content/uploads/TPM-R=
ev-2.0-Part-3-Commands-01.38.pdf
>
> Section 28.5.2, and understand the table decoration syntax, persistentHan=
dle is the first argument.
>
> Looking at the code, that lines up with the ctx.persistent_handle variabl=
e:
> https://github.com/tpm2-software/tpm2-tools/blob/3.X/tools/tpm2_getpubek.=
c#L208
>
> Which is set from the result of the -H argument:
> 0x80000000
>
> If you look the test code here:
> https://github.com/tpm2-software/tpm2-tools/blob/3.X/test/system/test_tpm=
2_getpubek.sh#L51
>
> It selects a handle of:
> 0x81010005
>
> The starting value of 0x80 vs 0x81 is important and aligns with some code:
> https://github.com/tpm2-software/tpm2-tss/blob/d5a36f6bbddab25b408037cf64=
adb6ce2e411cc1/include/tss2/tss2_tpm2_types.h#L605
> https://github.com/tpm2-software/tpm2-tools/blob/master/tools/tpm2_evictc=
ontrol.c#L140
>
> Spec:
> Table 27 https://trustedcomputinggroup.org/wp-content/uploads/TPM-Rev-2.0=
-Part-2-Structures-01.38.pdf
>
> Long story short, you need to change your handle to use a prefix of 0x81,=
 as your asking the TPM to make that object persistent
> At an invalid index.
>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Peter Magn=
usson
> > Sent: Monday, July 30, 2018 6:28 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] tpm2_getpubek EvictControl fails with 0x1c4 (TPM_RC_VAL=
UE)
> >
> > Hi,
> >
> > I've run into tpm2_getpubek (3.0.4;
> > https://github.com/tpm2-software/tpm2-
> > tools/blob/3.0.4/tools/tpm2_getpubek.c)
> > failing unexpectedly with Tss2_Sys_EvictControl emitting TPM_RC_VALUE.
> > Target system is an Intel NUC with a discrete infineon TPM.
> >
> > Does the error make sense to anyone?
> >
> >
> >
> > sudo -u tss TSS2_LOG=3Dall+TRACE tpm2_getpubek -V --tcti
> > device:/dev/tpmrm0 -H 0x80000000 -g 0x0023  -f ek_ecc.pub
> >
> > INFO on line: "217" in file: "tools/tpm2_getpubek.c": EK create success=
. Got
> > handle: 0x80ffffff
> >
> > ERROR on line: "225" in file: "tools/tpm2_getpubek.c": EvictControl fai=
led. Could
> > not make EK persistent.TPM Error:0x1c4
> >
> > Makefile:8: recipe for target 'ek_ecc.bin' failed
> >
> >
> >
> >
> > tpm2_rc_decode 0x1c4
> >
> > error layer
> >
> >   hex: 0x0
> >
> >   identifier: TSS2_TPM_ERROR_LEVEL
> >
> >   description: Error produced by the TPM
> >
> > format 1 error code
> >
> >   hex: 0x04
> >
> >   identifier: TPM_RC_VALUE
> >
> >   description: value is out of range or is not correct for the context
> >
> > parameter
> >
> >   hex: 0x100
> >
> >   identifier:  TPM_RC_1
> >
> >   description:  (null)
> > _______________________________________________
> > tpm2 mailing list
> > tpm2(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/tpm2

--===============3343888439532249674==--

