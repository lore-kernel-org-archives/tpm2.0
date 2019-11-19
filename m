Content-Type: multipart/mixed; boundary="===============8728998097390226460=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: raspi tpm in lockdown
Date: Tue, 19 Nov 2019 14:40:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E45687@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 123f9fb5-0ae1-0810-56b9-c394b04da637@gmx.net
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8728998097390226460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I always recommend that you use tpm2-tools >=3D 4.0, versions < 4.0 are leg=
acy at this point.

Eventually, depending on configuration, the lockout mode should expire. You=
 should
Be able to run tpm2_getcap -c properties-variable | grep LOCKOUT
TPM2_PT_LOCKOUT_COUNTER: 0x0
TPM2_PT_LOCKOUT_INTERVAL: 0x3E8
TPM2_PT_LOCKOUT_RECOVERY: 0x3E8

Should tell you how long you need to wait.

I remember their being all sorts of issues with tpm2_takeownership, dependi=
ng
On version where it was running all the changeauth commands even when the o=
ther
hierarchies were not specified.

On PC's the bios usually has a reset option for the tpm. On raspberry pi, I=
 am not sure
how you would reset it. @idsea any idea?

Bill

> -----Original Message-----
> From: Dennis Knorr [mailto:dennis.knorr(a)gmx.net]
> Sent: Saturday, November 16, 2019 2:09 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] raspi tpm in lockdown
> =

> Hi,
> i tried to play with an tpm from letstrust.de. i played around a bit, but=
 now it
> seems to be in lockdown:
> https://pastebin.com/S59y4tQk
> =

> but i am SURE that i have the correct password. Any Idea what i did wrong?
> anything i can do? i could remove the tpm chip from the raspberry? would =
that
> help
> =

> i hope you can help me.
> =

> Dennis
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============8728998097390226460==--

