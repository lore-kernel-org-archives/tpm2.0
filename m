Content-Type: multipart/mixed; boundary="===============1455128578180388943=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] question about tpm2-tools pull request: Update
 tpm2_pcrlist.c #728
Date: Mon, 08 Jan 2018 17:11:00 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FE77A60@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20180102230550.hcgairgol7mmk6ts@cantor
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1455128578180388943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Jerry Snitselaar [mailto:jsnitsel(a)redhat.com]
> Sent: Tuesday, January 2, 2018 3:06 PM
> To: tpm2(a)lists.01.org; Roberts, William C <william.c.roberts(a)intel.co=
m>; Javier
> Martinez Canillas <javierm(a)redhat.com>
> Subject: question about tpm2-tools pull request: Update tpm2_pcrlist.c #7=
28
> =

> I'm wondering if that is the correct solution. I don't think I've ever se=
en
> sizeofSelect greater than 3, so the change of pcr_id to UINT8 probably do=
esn't
> hurt, but I'm not sure how the compiler decided that was okay all the sud=
den
> over the UINT32 since I think the problem arose from the * 8. I think the=
 more
> correct thing probably is to explicitly make that 8 unsigned, so '* 8u', =
and leave
> pcr_id alone.
> =

> I still don't comletely understand the type conversions taking place in t=
he for loop
> condition check with and without the patch.
> =

> Thoughts?

I don't either, and that code is a terrible leftover. Feel free to re-write=
 large swaths
In simpler, more clear logic. I'll take just about anything that reduces co=
mplexity, LoC,
Etc.

Sorry for the delay, I was away last week.

Bill

--===============1455128578180388943==--

