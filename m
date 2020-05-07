Content-Type: multipart/mixed; boundary="===============0521651716132743072=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_clear
Date: Thu, 07 May 2020 15:32:46 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDB339@ORSMSX101.amr.corp.intel.com>
In-Reply-To: ec941ce4fe344c6795dd95ebdccd094b@infineon.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0521651716132743072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Most enterprise situations that I have seen, set the owner password or as A=
ndreas mentioned
Disable it via clearcontrol. Their also usually exists a key, known as the =
SRK, which is at the
persistent address of 0x81000001, that has no auth value. Then folks can cr=
eate keys under
that as they see fit. So the disgruntled employee could nuke his keys, but =
no one else's.


> -----Original Message-----
> From: Florian.Schreiner(a)infineon.com [mailto:Florian.Schreiner(a)infine=
on.com]
> Sent: Thursday, May 7, 2020 6:01 AM
> To: andreas.fuchs(a)sit.fraunhofer.de; lester.corderio(a)ufomoviez.com;
> tpm2(a)lists.01.org
> Subject: [tpm2] Re: tpm2_clear
> =

> Hi,
> =

> maybe it helps to mention that the tpm2_clear command only affects the ke=
ys
> stored in the storage hierarchy, which should by normally anyway in the
> ownership of the user. Then it according to the design, that a user/emplo=
yee
> would only be able to delete his own keys.
> Keys from another party like the platform owner should for example be sto=
red in
> the TPM platform hierarchy, which is more protected as there is no clear
> command (e.g. TPM2_ChangePPS command is not available or blocked in BIOS).
> =

> Best,
> Florian
> =

> -----Original Message-----
> From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> Sent: Donnerstag, 7. Mai 2020 12:11
> To: lester.corderio(a)ufomoviez.com; tpm2(a)lists.01.org
> Subject: [tpm2] Re: tpm2_clear
> =

> Caution: This e-mail originated outside Infineon Technologies. Do not cli=
ck on links
> or open attachments unless you validate it is safe <http://iweb.infineon.=
com/en-
> US/Support/security/CDC/pse/Pages/pce.aspx>.
> =

> =

> The purpose of tpm2_clear is for decommissioning so there is no way to re=
cover.
> =

> You can call tpm2_clearcontrol to disable "owner-authorized" clearing, so=
 that
> you cannot clear from OS anymore.
> Then, the only way to clear the TPM is via BIOS which you can secure with=
 a
> password.
> =

> That's as secure as it gets.
> ________________________________________
> From: lester.corderio(a)ufomoviez.com [lester.corderio(a)ufomoviez.com]
> Sent: Thursday, May 07, 2020 11:51
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2_clear
> =

> hi, i am complete newbie to TPM so please excuse me if my question is sil=
ly, i
> wanted to know if anyone uses tpm2_clear command is all the data and keys
> lost?? so what if a disgrunted employee takes access and clears the TPM h=
ow can
> we recover from this?
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============0521651716132743072==--

