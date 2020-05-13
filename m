Content-Type: multipart/mixed; boundary="===============6788019074320635432=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] Re: compile error on tpm2-tools (4.2.X branch)
Date: Wed, 13 May 2020 09:22:49 -0700
Message-ID: <fa6d34a0-f22d-ccae-01b9-382e4a7ae865@oracle.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D0171B4DE32@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6788019074320635432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Is the stuff in tpm2-tss 2.3.X - not good enough?

-ted

On 5/13/20 9:18 AM, Fuchs, Andreas wrote:
> I guess your tpm2-tss and thus your tss2_esys.h / libtss2-esys.so are too=
 old.
>
> Cheers,
> Andreas
> ________________________________________
> From: ted.h.kim(a)oracle.com [ted.h.kim(a)oracle.com]
> Sent: Wednesday, May 13, 2020 18:14
> To: tpm2(a)lists.01.org
> Subject: [tpm2] compile error on tpm2-tools (4.2.X branch)
>
> Folks,
>
> I got an "error" compiling tpm2-tools (4.2.X branch).
> Yes, I realize this is because warnings being converted to errors.
> Don't think I changed the CC flags, but maybe this is just my environment?
>
> Haven't checked the new 4.2.1 release update - does that take care of thi=
s?
>
> Thanks,
> -ted
>
> ++++
>
> from the make output:
>
> lib/tpm2.c: In function =E2=80=98tpm2_getsapicontext=E2=80=99:
> lib/tpm2.c:4070:20: error: implicit declaration of function
> =E2=80=98Esys_GetSysContext=E2=80=99
> ; did you mean =E2=80=98Esys_FlushContext=E2=80=99? [-Werror=3Dimplicit-f=
unction-declaration]
>        TSS2_RC rval =3D Esys_GetSysContext(esys_context, sys_context);
>                       ^~~~~~~~~~~~~~~~~~
>                       Esys_FlushContext
> cc1: all warnings being treated as errors
> make: *** [Makefile:4857: lib/libcommon_a-tpm2.o] Error 1
>
> --
> Ted H. Kim, PhD
> ted.h.kim(a)oracle.com
> +1 310-258-7515
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============6788019074320635432==--

