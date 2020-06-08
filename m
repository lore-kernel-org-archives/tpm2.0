Content-Type: multipart/mixed; boundary="===============6039046820647562976=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: TPM 2.0 hardware error DA lockout mode
Date: Mon, 08 Jun 2020 14:16:27 +0000
Message-ID: <SN6PR11MB3437F6091BFDC50104185C1FB8850@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20200606063524.2851.57600@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6039046820647562976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Usually in your bios you can clear the tpm. If you're on an embedded device
It's usually a jumper setting.

Bill

> -----Original Message-----
> From: Chenxi Z <cxzhang1981(a)hotmail.com>
> Sent: Saturday, June 6, 2020 1:35 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] TPM 2.0 hardware error DA lockout mode
> =

> I have the exactly same issue as https://superuser.com/questions/1404738/=
tpm-
> 2-0-hardware-error-da-lockout-mode
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
>   hex: 0x0
>   identifier: TSS2_TPM_RC_LEVEL
>   description: Error produced by the TPM format 0 warning code
>   hex: 0x21
>   name: TPM2_RC_LOCKOUT
>   description: authorizations for objects subject to DA protection are no=
t allowed
> at this time because the TPM is in DA lockout mode
> =

> Can't figure out how to get out of this lockout state. Has someone came a=
cross
> same error before? How to fix it? Thanks.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============6039046820647562976==--

