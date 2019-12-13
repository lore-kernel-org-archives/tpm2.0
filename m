Content-Type: multipart/mixed; boundary="===============8415689435055765227=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Pipe the TMP2 directly into /dev/random
Date: Fri, 13 Dec 2019 14:39:56 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E5AE45@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CALtZhhMoeDg_Tx5_x7p4WPPudyUV8JuwbGZ_J3qq=msZ76cEHg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8415689435055765227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Frederick Gotham [mailto:cauldwell.thomas(a)gmail.com]
> Sent: Friday, December 13, 2019 3:54 AM
> To: tpm2 <tpm2(a)lists.01.org>
> Subject: [tpm2] Pipe the TMP2 directly into /dev/random
> =

> Hi
> =

> I realise that we can use rng-tools to use the TPM2 to seed the random nu=
mber
> generator built into the Linux kernel.
> =

> What I'd like to ask though, is if anyone has done any work connecting
> /dev/random directly to the TPM2 so that there's no software pseudo-
> randomness at all.
> =

> If this hasn't been done, would anyone like to work on it with me?

IIUC the kernel pulls in many sources of entropy including the tpm2 if
present.

> =

> Frederick
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8415689435055765227==--

