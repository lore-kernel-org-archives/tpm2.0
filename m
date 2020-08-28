Content-Type: multipart/mixed; boundary="===============3134239345822378798=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: [RELEASE] tpm2-tools: 4.3.0
Date: Fri, 28 Aug 2020 15:06:54 +0000
Message-ID: <SN6PR11MB343746B1AE04DD2DA0F14711B8520@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: SN6PR11MB3437B56514C3E94E9E0CFA0DB8520@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3134239345822378798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Just an FYI, that changelog shows the release date as 2020-08-24

I had the release staged and didn't update that date, however, it's not
really material to the contents so I am not going to update the release and
thus force push for something that minor.

> -----Original Message-----
> From: Roberts, William C <william.c.roberts(a)intel.com>
> Sent: Friday, August 28, 2020 9:46 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] [RELEASE] tpm2-tools: 4.3.0
> =

> Hello,
> =

> I would like to announce the release of tpm2-tools version 4.3.0 with the
> following changelog:
> =

> ### 4.3.0 - 2020-08-24
> =

>  * tss2_*: Fix double-free errors in commands asking for password authori=
zation
> =

>  * tss2_*: Fix shorthand command -f that was falsely requiring an argument
> =

>  * tss2_*: Update tss2_encrypt to the new FAPI interface
>    - The argument 'policyPath' is removed which was never read anyway
> =

>  * tss2_*: Remove the additional '\n' that was appended when redirecting =
to
> stdout
> =

>  * tss2_*: Update mandatory vs optional treatment of arguments according =
to
> latest Fapi spec
> =

>  * tss2_*: tss2_getinfo now retrieves the correct FAPI version from Fapi_=
GetInfo
> =

>  * tss2_*: Fix the error handling in case of multiple inputs and/or outpu=
ts from
> stdin/stdout
> =

>  * tss2_*: Fix syntax errors and update content of man pages according to=
 latest
> Fapi spec
> =

>  * tss2_*: Add parameter types to all man page
> =

>  * tss2_*: tss2_setappdata now reads from file or stdin allowing to store=
 also
> binary data
> =

>  * tss2_*: Memory leaks are fixed in cases when a returned empty non-char
> output value was passed to file output
> =

>  * tss2_pcrextend: fix extending PCR 0
> =

>  * tss2_quote: fix unused TSS2_RC in LOG_ERR
> =

> =

> The release can be found here:
> https://github.com/tpm2-software/tpm2-tools/releases/tag/4.3.0
> =

> Bill
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============3134239345822378798==--

