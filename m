Content-Type: multipart/mixed; boundary="===============5181503928579777975=="
MIME-Version: 1.0
From: Florian.Schreiner at infineon.com
Subject: [tpm2] Re: tpm2_clear
Date: Thu, 07 May 2020 11:01:12 +0000
Message-ID: <ec941ce4fe344c6795dd95ebdccd094b@infineon.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0171B48679@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5181503928579777975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, =


maybe it helps to mention that the tpm2_clear command only affects the keys=
 stored in the storage hierarchy, which should by normally anyway in the ow=
nership of the user. Then it according to the design, that a user/employee =
would only be able to delete his own keys. =

Keys from another party like the platform owner should for example be store=
d in the TPM platform hierarchy, which is more protected as there is no cle=
ar command (e.g. TPM2_ChangePPS command is not available or blocked in BIOS=
). =


Best,
Florian =


-----Original Message-----
From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de> =

Sent: Donnerstag, 7. Mai 2020 12:11
To: lester.corderio(a)ufomoviez.com; tpm2(a)lists.01.org
Subject: [tpm2] Re: tpm2_clear

Caution: This e-mail originated outside Infineon Technologies. Do not click=
 on links or open attachments unless you validate it is safe <http://iweb.i=
nfineon.com/en-US/Support/security/CDC/pse/Pages/pce.aspx>.


The purpose of tpm2_clear is for decommissioning so there is no way to reco=
ver.

You can call tpm2_clearcontrol to disable "owner-authorized" clearing, so t=
hat you cannot clear from OS anymore.
Then, the only way to clear the TPM is via BIOS which you can secure with a=
 password.

That's as secure as it gets.
________________________________________
From: lester.corderio(a)ufomoviez.com [lester.corderio(a)ufomoviez.com]
Sent: Thursday, May 07, 2020 11:51
To: tpm2(a)lists.01.org
Subject: [tpm2] tpm2_clear

hi, i am complete newbie to TPM so please excuse me if my question is silly=
, i wanted to know if anyone uses tpm2_clear command is all the data and ke=
ys lost?? so what if a disgrunted employee takes access and clears the TPM =
how can we recover from this?
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org %(web_page_url)sl=
istinfo%(cgiext)s/%(_internal_name)s
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org %(web_page_url)sl=
istinfo%(cgiext)s/%(_internal_name)s

--===============5181503928579777975==--

