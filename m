Content-Type: multipart/mixed; boundary="===============5610705497055594347=="
MIME-Version: 1.0
From: =?utf-8?q?Ricardo_Ara=C3=BAjo_=3Cricardo_at_lsd=2Eufcg=2Eedu=2Ebr=3E?=
Subject: [tpm2] RES:  PCR missing SHA-512 support
Date: Fri, 25 May 2018 11:04:29 -0300
Message-ID: <1224568147.415356.1527257069951.JavaMail.zimbra@lsd.ufcg.edu.br>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5610705497055594347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

I've been using [1] with [2] as simulator for playing around with TPM 2.0 f=
eatures, because I can wire it to QEMU and launch a VM with EDK2 UEFI. No p=
recompiled packages for any of these.

So I was testing master version from both tpm2-tools and abrmd with the rel=
ease candidates for tss and I noticed this error on tpm2_pcrlist after this=
 commit [3] enabling SHA512 and I related to this thread...

I'm not sure yet if this is a simulator problem or something on tools/abrmd=
/tss side... for now I'll test with another version and hopefully come back=
 with more info. From a noob perspective, the error seems to be the same at=
 [4], maybe I should try the same trick and see what happens.

Ricardo

[1] - https://github.com/stefanberger/swtpm/tree/tpm2-preview.v2
[2] - https://github.com/stefanberger/libtpms/tree/tpm2-preview.rev146.v2
[3] - https://github.com/stefanberger/libtpms/commit/37f24d5c7b3513045abcc4=
a0d283b9f25b75d039
[4] - https://github.com/tpm2-software/tpm2-tools/issues/1021


-----Mensagem original-----
De: Anderson, Daniel [mailto:daniel.anderson(a)intel.com]
Enviada em: quinta-feira, 24 de maio de 2018 18:02
Para: Ricardo Ara=C3=BAjo <ricardo(a)lsd.ufcg.edu.br>
Cc: tpm2(a)lists.01.org
Assunto: RE: [tpm2] PCR missing SHA-512 support

Ricardo,

No I have not seen that before.

This is just a hunch. =C2=A0But I suspect that the code needs to be recompi=
led =

with your simulator (or real TPM).

Some more information would be useful--does your TPM (real or virtual or =

simulated) have a SHA-512 PCR bank?

Did you compile it on the same machine? =C2=A0Or did you compile elsewhere =
or use =

a precompiled package or something like that?

Dan

From: Ricardo Ara=C3=BAjo [mailto:ricardo(a)lsd.ufcg.edu.br]
> Not sure it is the same simulator, but I'm using
> https://github.com/stefanberger/libtpms/tree/tpm2-preview.rev146.v2 and =

> after SHA-512 was enabled (yesterday) tpm2_pcrlist is crashing with this =

> error:
> WARNING:marshal:src/tss2-mu/tpml-types.c:197:Tss2_MU_TPML_PCR_SELECTION_U=
nmarshal() =

> count too big
> ERROR: Tss2_Sys_GetCapability(0x80011) - sys:Response is malformed

--===============5610705497055594347==--

