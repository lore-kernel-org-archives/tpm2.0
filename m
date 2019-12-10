Content-Type: multipart/mixed; boundary="===============2691890310578840547=="
MIME-Version: 1.0
From: Zhao, Shirley <shirley.zhao at intel.com>
Subject: [tpm2] Re: Question about marshal/un-marshal TPM2.0 packet
Date: Tue, 10 Dec 2019 07:58:41 +0000
Message-ID: <A888B25CD99C1141B7C254171A953E8E4909F284@shsmsx102.ccr.corp.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E4CD13@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2691890310578840547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Get it. =

Thanks so much, Roberts.

- Shirley =


-----Original Message-----
From: Roberts, William C <william.c.roberts(a)intel.com> =

Sent: Friday, December 6, 2019 10:34 PM
To: Zhao, Shirley <shirley.zhao(a)intel.com>; tpm2(a)lists.01.org
Subject: RE: Question about marshal/un-marshal TPM2.0 packet



> -----Original Message-----
> From: Zhao, Shirley [mailto:shirley.zhao(a)intel.com]
> Sent: Thursday, December 5, 2019 8:11 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Question about marshal/un-marshal TPM2.0 packet
> =

> Hi, all,
> =

> =

> =

> I want to know how TPM2.0 marshal the command packet, especially some =

> parameter is optional.
> =

> There is only  marshal/un-marshal API defined in tpm2- =

> tss/include/tss2.0/tss2_mu.h, like:
> =

> =

> =

> TSS2_RC
> =

> Tss2_MU_TPMA_ALGORITHM_Marshal(
> =

>     TPMA_ALGORITHM  src,
> =

>     uint8_t         buffer[],
> =

>     size_t          buffer_size,
> =

>     size_t          *offset);
> =

> =

> =

> TSS2_RC
> =

> Tss2_MU_TPMA_ALGORITHM_Unmarshal(
> =

>     uint8_t const   buffer[],
> =

>     size_t          buffer_size,
> =

>     size_t         *offset,
> =

>     TPMA_ALGORITHM *dest);
> =

> =

> =

> But I can't find function body, how to get the detailed function body?

They are all generated from macro's so you need to expand them.
I just hack up a build command with gcc -E option to expand them.

For example Tss2_MU_8_Marshal is generated here:
https://github.com/tpm2-software/tpm2-tss/blob/master/src/tss2-mu/base-type=
s.c#L159

> =

> =

> =

> Thanks.
> =

> =

> =

> *	Shirley
> =

>=20

--===============2691890310578840547==--

