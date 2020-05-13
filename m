Content-Type: multipart/mixed; boundary="===============1420386556049050365=="
MIME-Version: 1.0
From: ted.h.kim at oracle.com
Subject: [tpm2] compile error on tpm2-tools (4.2.X branch)
Date: Wed, 13 May 2020 09:14:38 -0700
Message-ID: <727e9e27-8689-9a70-65fc-06199f26af98@oracle.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1420386556049050365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Folks,

I got an "error" compiling tpm2-tools (4.2.X branch).
Yes, I realize this is because warnings being converted to errors.
Don't think I changed the CC flags, but maybe this is just my environment?

Haven't checked the new 4.2.1 release update - does that take care of this?

Thanks,
-ted

++++

from the make output:

lib/tpm2.c: In function =E2=80=98tpm2_getsapicontext=E2=80=99:
lib/tpm2.c:4070:20: error: implicit declaration of function =

=E2=80=98Esys_GetSysContext=E2=80=99
; did you mean =E2=80=98Esys_FlushContext=E2=80=99? [-Werror=3Dimplicit-fun=
ction-declaration]
 =C2=A0=C2=A0=C2=A0=C2=A0 TSS2_RC rval =3D Esys_GetSysContext(esys_context,=
 sys_context);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Esys_FlushContext
cc1: all warnings being treated as errors
make: *** [Makefile:4857: lib/libcommon_a-tpm2.o] Error 1

-- =

Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515


--===============1420386556049050365==--

