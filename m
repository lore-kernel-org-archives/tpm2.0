Content-Type: multipart/mixed; boundary="===============2927181003166027866=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: Re: [tpm2] PCR missing SHA-512 support
Date: Thu, 24 May 2018 21:02:24 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3D41BD4@ORSMSX108.amr.corp.intel.com>
In-Reply-To: 379172588.411141.1527188651057.JavaMail.zimbra@lsd.ufcg.edu.br
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2927181003166027866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ricardo,

No I have not seen that before.

This is just a hunch.  But I suspect that the code needs to be recompiled w=
ith your simulator (or real TPM).

Some more information would be useful--does your TPM (real or virtual or si=
mulated) have a SHA-512 PCR bank?

Did you compile it on the same machine?  Or did you compile elsewhere or us=
e a precompiled package or something like that?

Dan

From: Ricardo Ara=C3=BAjo [mailto:ricardo(a)lsd.ufcg.edu.br] =

> Not sure it is the same simulator, but I'm using
> https://github.com/stefanberger/libtpms/tree/tpm2-preview.rev146.v2 and a=
fter SHA-512 was enabled (yesterday) tpm2_pcrlist is crashing with this err=
or:
> WARNING:marshal:src/tss2-mu/tpml-types.c:197:Tss2_MU_TPML_PCR_SELECTION_U=
nmarshal() count too big
> ERROR: Tss2_Sys_GetCapability(0x80011) - sys:Response is malformed


--===============2927181003166027866==--

