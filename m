Content-Type: multipart/mixed; boundary="===============4111875830771121989=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Programatically obtaining session handle -
 tpm2_session_get_handle()
Date: Wed, 14 Apr 2021 20:03:49 +0000
Message-ID: <SN6PR11MB34371A356FD5115BF0EED431B84E9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAMMN_YBtKOCZEb9R-HN1aMfXEeiiDOJv3zwP28Nf37_C7x5SKw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4111875830771121989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The function ESYS_TR tpm2_session_get_handle(tpm2_session *session), return=
s an ESYS_TR object. Which is an opaque handle, so you cant use the various=
 masks to figure out what it is.

However, you can pass that ESYS_TR to=C2=A0

TSS2_RC Esys_TR_GetTpmHandle(ESYS_CONTEXT * esys_context, ESYS_TR esys_hand=
le,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPM2_HANDLE =
* tpm_handle)

Which will return the RAW tpm handle you could pass to the kernel keyring.


There is a tool called tpm2_sessionconfig I added this feature there:
https://github.com/tpm2-software/tpm2-tools/pull/2700

I asked Imran to stage it for 5.1, lets see if that's possible.

-------------------------


From: Jo=C3=A3o Lima <jlima(a)cloudflare.com>
Sent: Friday, April 9, 2021 11:38 AM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Programatically obtaining session handle - tpm2_session_get=
_handle() =

=C2=A0
Hello folks! =


I've been trying to cobble together an implementation for a ContextLoad and=
 ContextSave tpm2_tool, so that one can save a session context to the TPM a=
nd get the session handle for it. The reasoning is to have a way to manipul=
ate policy validation using tpm2_tools, but then have the saved session con=
text be converted to the TPM handle, so that it can be passed to the kernel=
 keyring trusted keys subsystem.

It seems I have most of it working (was really a matter of just copying wha=
t's done on other commands), except for the bit where I get the session han=
dle itself. I was expecting to get the session handle through the tpm2_sess=
ion_get_handle() command, but instead I'm getting a handle on the permanent=
 object handle space (MSO 0x40).

This is the verbose output I get for tpm2_startauthsession:

tpm2_startauthsession --policy-session -S session.dat -V
INFO on line: "403" in file: "lib/tpm2_session.c": Saved session: ESYS_TR(0=
x40418477)
INFO on line: "246" in file: "lib/files.c": Save TPMS_CONTEXT->savedHandle:=
 0x3000000

This is the verbose output for the new command (tpm2_contextload):

tpm2_contextload -S session.dat -V
INFO on line: "418" in file: "lib/files.c": Assuming tpm context file
INFO on line: "349" in file: "lib/files.c": load: TPMS_CONTEXT->savedHandle=
: 0x3000000
INFO on line: "306" in file: "lib/tpm2_session.c": Restored session: ESYS_T=
R(0x40418477) attrs(0x1)
session handle: 0x40418477

I'm calling tpm2_get_session_handle() over the tpm2_session object, expecti=
ng to get the 0x3000000 but am getting=C2=A00x40418477 instead. Here's the =
commit for reference:=C2=A0https://github.com/jopelima/tpm2-tools/commit/be=
3d011d86531f45cc820d244329c451e246034f

Can anyone help me get the right handle here?

Thanks in advance.

Kind regards,
Jo=C3=A3o Lima=C2=A0=C2=A0|=C2=A0=C2=A0Infrastructure Security Engineer
jlima(a)cloudflare.com
cell:=C2=A0(+351) 914 907 591
 =

1 888 99 FLARE=C2=A0=C2=A0|=C2=A0=C2=A0www.cloudflare.com
--===============4111875830771121989==--

