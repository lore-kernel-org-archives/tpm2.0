Content-Type: multipart/mixed; boundary="===============6125539885579207564=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] tpm2-tss 2.3.0-rc0 - bug
Date: Sat, 27 Jul 2019 16:43:54 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DD3A12@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6125539885579207564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I'm seeing spurious error messages about the default tcti not being configu=
red and thus
open fails with file not found. I would imagine we would want to ignore err=
no ENOENT.

I reported bug against rc0:
https://github.com/tpm2-software/tpm2-tss/issues/1482

Thanks,
Bill

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Fuchs, Andre=
as
> Sent: Friday, July 26, 2019 4:21 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2-tss 2.3.0-rc0
> =

> Hi all,
> =

> I just taged the release candidate for version 2.3.0-rc0 Please find it h=
ere:
> https://github.com/tpm2-software/tpm2-tss/releases/tag/2.3.0-rc0
> =

> It includes a lot of new things, most notably, two new libraries:
> - tss2-tctildr: simplifying and unifying the setting of custom tctis.
>   it's as simple as Tss2_TctiLdr_Initilialize(getenv("MY_TCTI", &tcti));
>   so give it a try.
> - tss2-rc: converts tpm and tss return codes into strings
> =

> Also, we fixed some dependency bug with the tss2-esys.pc file that falsely
> reuired tss2-mu.pc. If you encounter linker errors, please consider addin=
g tss2-
> mu.pc directly in your build scripts.
> =

> Finally, this release marks the end of life for the 2.1.x series. Upgradi=
ng is highly
> recommended. (Everything < 2.2.x is eol)
> =

> Please give this some thorough testing. We'll also not merge non-bugfix P=
Rs until
> 2.3.0 is finally release.
> =

> Happy testing,
> Andreas
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2

--===============6125539885579207564==--

