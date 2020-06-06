Content-Type: multipart/mixed; boundary="===============0197677781284020148=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Re: TPM 2.0 hardware error DA lockout mode
Date: Sat, 06 Jun 2020 08:00:59 -0600
Message-ID: <F358FC80-9694-4232-8D1A-64B132B24172@rowan.moul.ca>
In-Reply-To: 20200606063524.2851.57600@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0197677781284020148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tpm2-tools is now on version 4.1.3, and tpm2-tss (the core library that the=
 tools use to communicate with the tpm) has also gone through a number of c=
hanges since 2016.

I imagine there have been many bug fixes and improvements since version 1.1=
 so I would suggest updating both of the above packages and and seeing if i=
t is still not working after that.

Rowan




Rowan
> On Jun 6, 2020, at 00:35, Chenxi Z <cxzhang1981(a)hotmail.com> wrote:
> =

> =EF=BB=BFI have the exactly same issue as https://superuser.com/questions=
/1404738/tpm-2-0-hardware-error-da-lockout-mode
> =

> TPM2 tools version v1.1
> =

> Tried clearing ownership:
> =

> linux-host:~ # tpm2_takeownership -c -L lockpass
> ERROR: Clearing Failed! TPM error code: 0x921
> =

> =

> Tried clearing dictionary lockout:
> =

> linux-host:~ # tpm2_dictionarylockout -c -P lockpass
> ERROR: 0x921 Error clearing dictionary lockout.
> =

> =

> Neither works.
> =

> The error id decode says:
> =

> linux-host:~ # tpm2_rc_decode 0x921
> error layer
> hex: 0x0
> identifier: TSS2_TPM_RC_LEVEL
> description: Error produced by the TPM
> format 0 warning code
> hex: 0x21
> name: TPM2_RC_LOCKOUT
> description: authorizations for objects subject to DA protection are not =
allowed at this time because the TPM is in DA lockout mode
> =

> Can't figure out how to get out of this lockout state. Has someone came a=
cross same error before? How to fix it? Thanks.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0197677781284020148==--

