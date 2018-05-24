Content-Type: multipart/mixed; boundary="===============1856258471602550592=="
MIME-Version: 1.0
From: =?utf-8?q?Ricardo_Ara=C3=BAjo_=3Cricardo_at_lsd=2Eufcg=2Eedu=2Ebr=3E?=
Subject: Re: [tpm2] PCR missing SHA-512 support
Date: Thu, 24 May 2018 16:04:11 -0300
Message-ID: <379172588.411141.1527188651057.JavaMail.zimbra@lsd.ufcg.edu.br>
In-Reply-To: 207C810BE4BA2440832668E0F208BFD3BCABF5@ORSMSX108.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1856258471602550592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey, =


Not sure it is the same simulator, but I'm using https://github.com/stefanb=
erger/libtpms/tree/tpm2-preview.rev146.v2 and after SHA-512 was enabled (ye=
sterday) tpm2_pcrlist is crashing with this error:

WARNING:marshal:src/tss2-mu/tpml-types.c:197:Tss2_MU_TPML_PCR_SELECTION_Unm=
arshal() count too big
ERROR: Tss2_Sys_GetCapability(0x80011) - sys:Response is malformed
ERROR: Unable to run tpm2_pcrlist

Anyone has seen this happening too?

Ricardo

Ricardo Ara=C3=BAjo Santos - =

www.lsd.ufcg.edu.br/~ricardo =


M.Sc in Computer Science at UFCG - www.ufcg.edu.br =

Researcher and Developer at Distributed Systems Laboratory - www.lsd.ufcg.e=
du.br =

Para=C3=ADba - Brasil

----- Mensagem original -----
De: "Anderson, Daniel" <daniel.anderson(a)intel.com>
Para: tpm2(a)lists.01.org
Enviadas: Quinta-feira, 10 de maio de 2018 17:34:16
Assunto: Re: [tpm2] PCR missing SHA-512 support

OK Thanks!--not a big deal if it's just a simulator issue.

I could see the simulator not supporting SHA-3, since it is relatively new =
and perhaps unknown, but it's funny that SHA-384 is supported but not SHA-5=
12, since they are very similar.

Dan

...
_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://lists.01.org/mailman/listinfo/tpm2

--===============1856258471602550592==--

