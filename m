Content-Type: multipart/mixed; boundary="===============7162033341689853154=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2_quote and "safe"
Date: Thu, 15 Mar 2018 21:18:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FEF43EA@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAAxBZJs7hVnc2u83gJCc=G7u5ML_xQpchg1m215VThMmdO=VXA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7162033341689853154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ian,

I wish I could help you more, but this sounds like an issue with the TPM. I=
t might be something in the spec I am not aware of. Is this reproducible ac=
ross different manufacturers of tpms? What about using the ibm tpm simulato=
r?

Bill

From: Ian Oliver [mailto:ian.justin.oliver(a)gmail.com] =

Sent: Thursday, March 15, 2018 1:27 PM
To: Roberts, William C <william.c.roberts(a)intel.com>
Cc: tpm2(a)lists.01.org
Subject: Re: [tpm2] tpm2_quote and "safe"

Thanks William,
We can only find a reference to the clock too which is what has us a little=
 confused.
Basically we can takes quotes, within that structure is the TPMS_CLOCK_INFO=
 struct which contains field safe: TPMI_YES_NO .=C2=A0 We can take a series=
 of quotes, say, a few minutes apart and see that particular value change t=
o 1 and then back to 0.
The TPM is not being shutdown during this time, ie: the whole machine is po=
wered on and running normally and thus no reason to suspect that the clock =
is in some inconsistent state as according to the spec.=C2=A0 =

Is it possible that the TPM is being powered off by the CPU in some power s=
aving mode and therefore causing the current clock value not to be saved an=
d reread correctly when the TPM is restarted?=C2=A0 We've a script that par=
ses the quote and maps this the JSON - we've checked that and it is functio=
ning fine (across half a dozen machines and literally 1000s of quotes now),=
 the quote value obtained from the TPM isn't being changed in anyway (we ch=
eck the signature against the AK), therefore our hunch is that something ve=
ry low down in the system is causing this.
I can send details of the machines and processors off-list if you want.

t.
Ian

On 15 March 2018 at 19:57, Roberts, William C <william.c.roberts(a)intel.co=
m> wrote:
I don=E2=80=99t see that safe value coming out of quote. The only reference=
 I can find is in the spec is in regards to clock.
=C2=A0
Can you be more specific?
=C2=A0
=C2=A0
From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Ian Oliver
Sent: Tuesday, March 13, 2018 6:11 AM
To: tpm2(a)lists.01.org
Subject: [tpm2] tpm2_quote and "safe"
=C2=A0
Hi,
other than various clock errors what causes the safe flag to be set to 1 as=
 written into the output of tpm2_quote ?
We're seeing some odd behaviour from some machines where safe is always set=
 to 1 (Lenovo laptop) and on other servers occasionally safe is set to 1 an=
d then returning to 0 on subsequent quotes.
For example, we might take a number of quotes over time, eg: 5 minutes apar=
t. One of those quotes will have safe set to 1, the others are all 0.=C2=A0=
 During this time the machine will *not* have experienced a reboot/reset no=
r - as far as we can tell - any form of powersave or shutdown. We've also n=
oticed that safe gets set to 1 only on some quotes, eg: when quoting sha256=
:16,17,18 for the DRTM measurements.
=C2=A0
The machines are all Xeon-E5 based servers, TPM2.0,=C2=A0 tpm2_tools 1.3-rc=
2 installed, Ubuntu 17.04 with 4.13 kernel
Any information appreciated here,
thanks
Ian


-- =

Dr. Ian Oliver
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:=C2=A0 via Amazon
Twitter: @i_j_oliver



-- =

Dr. Ian Oliver
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:=C2=A0 via Amazon
Twitter: @i_j_oliver

--===============7162033341689853154==--

