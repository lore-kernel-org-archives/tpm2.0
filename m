Content-Type: multipart/mixed; boundary="===============3415319722990543207=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_clear
Date: Thu, 07 May 2020 15:51:57 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EDB373@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649EDB339@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3415319722990543207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Roberts, William C [mailto:william.c.roberts(a)intel.com]
> Sent: Thursday, May 7, 2020 10:33 AM
> To: Florian.Schreiner(a)infineon.com; andreas.fuchs(a)sit.fraunhofer.de;
> lester.corderio(a)ufomoviez.com; tpm2(a)lists.01.org
> Subject: [tpm2] Re: tpm2_clear
> =

> Most enterprise situations that I have seen, set the owner password or as
> Andreas mentioned Disable it via clearcontrol. Their also usually exists =
a key,

Let me make this more clear, admin sets/does these things, the regular user=
 just makes
Keys under the SRK.

> known as the SRK, which is at the persistent address of 0x81000001, that =
has no
> auth value. Then folks can create keys under that as they see fit. So the
> disgruntled employee could nuke his keys, but no one else's.
> =

> =

> > -----Original Message-----
> > From: Florian.Schreiner(a)infineon.com
> > [mailto:Florian.Schreiner(a)infineon.com]
> > Sent: Thursday, May 7, 2020 6:01 AM
> > To: andreas.fuchs(a)sit.fraunhofer.de; lester.corderio(a)ufomoviez.com;
> > tpm2(a)lists.01.org
> > Subject: [tpm2] Re: tpm2_clear
> >
> > Hi,
> >
> > maybe it helps to mention that the tpm2_clear command only affects the
> > keys stored in the storage hierarchy, which should by normally anyway
> > in the ownership of the user. Then it according to the design, that a
> > user/employee would only be able to delete his own keys.
> > Keys from another party like the platform owner should for example be
> > stored in the TPM platform hierarchy, which is more protected as there
> > is no clear command (e.g. TPM2_ChangePPS command is not available or
> blocked in BIOS).
> >
> > Best,
> > Florian
> >
> > -----Original Message-----
> > From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
> > Sent: Donnerstag, 7. Mai 2020 12:11
> > To: lester.corderio(a)ufomoviez.com; tpm2(a)lists.01.org
> > Subject: [tpm2] Re: tpm2_clear
> >
> > Caution: This e-mail originated outside Infineon Technologies. Do not
> > click on links or open attachments unless you validate it is safe
> > <http://iweb.infineon.com/en-
> US/Support/security/CDC/pse/Pages/pce.aspx>.
> >
> >
> > The purpose of tpm2_clear is for decommissioning so there is no way to
> recover.
> >
> > You can call tpm2_clearcontrol to disable "owner-authorized" clearing,
> > so that you cannot clear from OS anymore.
> > Then, the only way to clear the TPM is via BIOS which you can secure
> > with a password.
> >
> > That's as secure as it gets.
> > ________________________________________
> > From: lester.corderio(a)ufomoviez.com [lester.corderio(a)ufomoviez.com]
> > Sent: Thursday, May 07, 2020 11:51
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] tpm2_clear
> >
> > hi, i am complete newbie to TPM so please excuse me if my question is
> > silly, i wanted to know if anyone uses tpm2_clear command is all the
> > data and keys lost?? so what if a disgrunted employee takes access and
> > clears the TPM how can we recover from this?
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org To unsubscribe send an email to
> > tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============3415319722990543207==--

