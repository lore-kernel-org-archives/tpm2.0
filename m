Content-Type: multipart/mixed; boundary="===============6884113362258648300=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: tpm2_clear
Date: Thu, 07 May 2020 10:11:27 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171B48679@exch2010c.sit.fraunhofer.de>
In-Reply-To: 20200507095119.2843.54742@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6884113362258648300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6884113362258648300==--

