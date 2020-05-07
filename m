Content-Type: multipart/mixed; boundary="===============1726854007302963054=="
MIME-Version: 1.0
From: Lester Cordeiro <lester.corderio at ufomoviez.com>
Subject: [tpm2] Re: tpm2_clear
Date: Thu, 07 May 2020 23:38:57 +0530
Message-ID: <f1508ca2-f8ed-22c8-ee6f-adcec09df1f6@ufomoviez.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EDB339@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1726854007302963054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 07/05/20 9:02 pm, Roberts, William C wrote:
> Most enterprise situations that I have seen, set the owner password or as=
 Andreas mentioned
> Disable it via clearcontrol. Their also usually exists a key, known as th=
e SRK, which is at the
> persistent address of 0x81000001, that has no auth value. Then folks can =
create keys under
> that as they see fit. So the disgruntled employee could nuke his keys, bu=
t no one else's.

hi,

 =C2=A0=C2=A0=C2=A0 is it possible to provide an example on how to create R=
SA key under =

SRK? Like what tpm2 tools should i use and what arguments?

Regards,

Lester

--===============1726854007302963054==--

