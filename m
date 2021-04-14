Content-Type: multipart/mixed; boundary="===============3085288235302499402=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Programatically obtaining session handle -
 tpm2_session_get_handle()
Date: Wed, 14 Apr 2021 21:58:20 +0000
Message-ID: <SN6PR11MB34373BB9E84835DEB0C684A7B84E9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: SN6PR11MB34371A356FD5115BF0EED431B84E9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3085288235302499402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Also, if you can confirm it works as expected in a reply or on github, that=
 would be helpful.
________________________________
From: Roberts, William C <william.c.roberts(a)intel.com>
Sent: Wednesday, April 14, 2021 3:03 PM
To: Jo=C3=A3o Lima <jlima(a)cloudflare.com>; tpm2(a)lists.01.org <tpm2(a)li=
sts.01.org>
Subject: [tpm2] Re: Programatically obtaining session handle - tpm2_session=
_get_handle()

The function ESYS_TR tpm2_session_get_handle(tpm2_session *session), return=
s an ESYS_TR object. Which is an opaque handle, so you cant use the various=
 masks to figure out what it is.

However, you can pass that ESYS_TR to

TSS2_RC Esys_TR_GetTpmHandle(ESYS_CONTEXT * esys_context, ESYS_TR esys_hand=
le,
                  TPM2_HANDLE * tpm_handle)

Which will return the RAW tpm handle you could pass to the kernel keyring.


There is a tool called tpm2_sessionconfig I added this feature there:
https://github.com/tpm2-software/tpm2-tools/pull/2700

I asked Imran to stage it for 5.1, lets see if that's possible.

-------------------------


From: Jo=C3=A3o Lima <jlima(a)cloudflare.com>
Sent: Friday, April 9, 2021 11:38 AM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Programatically obtaining session handle - tpm2_session_get=
_handle()

Hello folks!

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
ng to get the 0x3000000 but am getting 0x40418477 instead. Here's the commi=
t for reference: https://github.com/jopelima/tpm2-tools/commit/be3d011d8653=
1f45cc820d244329c451e246034f

Can anyone help me get the right handle here?

Thanks in advance.

Kind regards,
Jo=C3=A3o Lima  |  Infrastructure Security Engineer
jlima(a)cloudflare.com
cell: (+351) 914 907 591

1 888 99 FLARE  |  www.cloudflare.com
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3085288235302499402==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+IFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSA8L3N0
eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgpBbHNvLCBpZiB5b3UgY2FuIGNvbmZpcm0gaXQgd29ya3MgYXMg
ZXhwZWN0ZWQgaW4gYSByZXBseSBvciBvbiBnaXRodWIsIHRoYXQgd291bGQgYmUgaGVscGZ1bC48
L2Rpdj4KPGRpdiBpZD0iYXBwZW5kb25zZW5kIj48L2Rpdj4KPGhyIHN0eWxlPSJkaXNwbGF5Omlu
bGluZS1ibG9jazt3aWR0aDo5OCUiIHRhYmluZGV4PSItMSI+CjxkaXYgaWQ9ImRpdlJwbHlGd2RN
c2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9u
dC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gUm9iZXJ0cywgV2lsbGlh
bSBDICZsdDt3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20mZ3Q7PGJyPgo8Yj5TZW50OjwvYj4g
V2VkbmVzZGF5LCBBcHJpbCAxNCwgMjAyMSAzOjAzIFBNPGJyPgo8Yj5Ubzo8L2I+IEpv428gTGlt
YSAmbHQ7amxpbWFAY2xvdWRmbGFyZS5jb20mZ3Q7OyB0cG0yQGxpc3RzLjAxLm9yZyAmbHQ7dHBt
MkBsaXN0cy4wMS5vcmcmZ3Q7PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIFJlOiBQcm9ncmFt
YXRpY2FsbHkgb2J0YWluaW5nIHNlc3Npb24gaGFuZGxlIC0gdHBtMl9zZXNzaW9uX2dldF9oYW5k
bGUoKTwvZm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+CjxkaXYgY2xhc3M9IkJvZHlGcmFn
bWVudCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+CjxkaXYg
Y2xhc3M9IlBsYWluVGV4dCI+VGhlIGZ1bmN0aW9uIEVTWVNfVFIgdHBtMl9zZXNzaW9uX2dldF9o
YW5kbGUodHBtMl9zZXNzaW9uICpzZXNzaW9uKSwgcmV0dXJucyBhbiBFU1lTX1RSIG9iamVjdC4g
V2hpY2ggaXMgYW4gb3BhcXVlIGhhbmRsZSwgc28geW91IGNhbnQgdXNlIHRoZSB2YXJpb3VzIG1h
c2tzIHRvIGZpZ3VyZSBvdXQgd2hhdCBpdCBpcy48YnI+Cjxicj4KSG93ZXZlciwgeW91IGNhbiBw
YXNzIHRoYXQgRVNZU19UUiB0byZuYnNwOzxicj4KPGJyPgpUU1MyX1JDIEVzeXNfVFJfR2V0VHBt
SGFuZGxlKEVTWVNfQ09OVEVYVCAqIGVzeXNfY29udGV4dCwgRVNZU19UUiBlc3lzX2hhbmRsZSw8
YnI+CiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7IFRQTTJfSEFORExFICogdHBtX2hhbmRsZSk8YnI+Cjxicj4KV2hpY2ggd2lsbCBy
ZXR1cm4gdGhlIFJBVyB0cG0gaGFuZGxlIHlvdSBjb3VsZCBwYXNzIHRvIHRoZSBrZXJuZWwga2V5
cmluZy48YnI+Cjxicj4KPGJyPgpUaGVyZSBpcyBhIHRvb2wgY2FsbGVkIHRwbTJfc2Vzc2lvbmNv
bmZpZyBJIGFkZGVkIHRoaXMgZmVhdHVyZSB0aGVyZTo8YnI+CjxhIGhyZWY9Imh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvcHVsbC8yNzAwIj5odHRwczovL2dpdGh1
Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL3B1bGwvMjcwMDwvYT48YnI+Cjxicj4KSSBh
c2tlZCBJbXJhbiB0byBzdGFnZSBpdCBmb3IgNS4xLCBsZXRzIHNlZSBpZiB0aGF0J3MgcG9zc2li
bGUuPGJyPgo8YnI+Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+Cjxicj4KPGJyPgpGcm9t
OiBKb+NvIExpbWEgJmx0O2psaW1hQGNsb3VkZmxhcmUuY29tJmd0Ozxicj4KU2VudDogRnJpZGF5
LCBBcHJpbCA5LCAyMDIxIDExOjM4IEFNPGJyPgpUbzogdHBtMkBsaXN0cy4wMS5vcmcgJmx0O3Rw
bTJAbGlzdHMuMDEub3JnJmd0Ozxicj4KU3ViamVjdDogW3RwbTJdIFByb2dyYW1hdGljYWxseSBv
YnRhaW5pbmcgc2Vzc2lvbiBoYW5kbGUgLSB0cG0yX3Nlc3Npb25fZ2V0X2hhbmRsZSgpCjxicj4K
Jm5ic3A7PGJyPgpIZWxsbyBmb2xrcyEgPGJyPgo8YnI+CkkndmUgYmVlbiB0cnlpbmcgdG8gY29i
YmxlIHRvZ2V0aGVyIGFuIGltcGxlbWVudGF0aW9uIGZvciBhIENvbnRleHRMb2FkIGFuZCBDb250
ZXh0U2F2ZSB0cG0yX3Rvb2wsIHNvIHRoYXQgb25lIGNhbiBzYXZlIGEgc2Vzc2lvbiBjb250ZXh0
IHRvIHRoZSBUUE0gYW5kIGdldCB0aGUgc2Vzc2lvbiBoYW5kbGUgZm9yIGl0LiBUaGUgcmVhc29u
aW5nIGlzIHRvIGhhdmUgYSB3YXkgdG8gbWFuaXB1bGF0ZSBwb2xpY3kgdmFsaWRhdGlvbiB1c2lu
ZyB0cG0yX3Rvb2xzLAogYnV0IHRoZW4gaGF2ZSB0aGUgc2F2ZWQgc2Vzc2lvbiBjb250ZXh0IGJl
IGNvbnZlcnRlZCB0byB0aGUgVFBNIGhhbmRsZSwgc28gdGhhdCBpdCBjYW4gYmUgcGFzc2VkIHRv
IHRoZSBrZXJuZWwga2V5cmluZyB0cnVzdGVkIGtleXMgc3Vic3lzdGVtLjxicj4KPGJyPgpJdCBz
ZWVtcyBJIGhhdmUgbW9zdCBvZiBpdCB3b3JraW5nICh3YXMgcmVhbGx5IGEgbWF0dGVyIG9mIGp1
c3QgY29weWluZyB3aGF0J3MgZG9uZSBvbiBvdGhlciBjb21tYW5kcyksIGV4Y2VwdCBmb3IgdGhl
IGJpdCB3aGVyZSBJIGdldCB0aGUgc2Vzc2lvbiBoYW5kbGUgaXRzZWxmLiBJIHdhcyBleHBlY3Rp
bmcgdG8gZ2V0IHRoZSBzZXNzaW9uIGhhbmRsZSB0aHJvdWdoIHRoZSB0cG0yX3Nlc3Npb25fZ2V0
X2hhbmRsZSgpIGNvbW1hbmQsIGJ1dCBpbnN0ZWFkCiBJJ20gZ2V0dGluZyBhIGhhbmRsZSBvbiB0
aGUgcGVybWFuZW50IG9iamVjdCBoYW5kbGUgc3BhY2UgKE1TTyAweDQwKS48YnI+Cjxicj4KVGhp
cyBpcyB0aGUgdmVyYm9zZSBvdXRwdXQgSSBnZXQgZm9yIHRwbTJfc3RhcnRhdXRoc2Vzc2lvbjo8
YnI+Cjxicj4KdHBtMl9zdGFydGF1dGhzZXNzaW9uIC0tcG9saWN5LXNlc3Npb24gLVMgc2Vzc2lv
bi5kYXQgLVY8YnI+CklORk8gb24gbGluZTogJnF1b3Q7NDAzJnF1b3Q7IGluIGZpbGU6ICZxdW90
O2xpYi90cG0yX3Nlc3Npb24uYyZxdW90OzogU2F2ZWQgc2Vzc2lvbjogRVNZU19UUigweDQwNDE4
NDc3KTxicj4KSU5GTyBvbiBsaW5lOiAmcXVvdDsyNDYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7bGli
L2ZpbGVzLmMmcXVvdDs6IFNhdmUgVFBNU19DT05URVhULSZndDtzYXZlZEhhbmRsZTogMHgzMDAw
MDAwPGJyPgo8YnI+ClRoaXMgaXMgdGhlIHZlcmJvc2Ugb3V0cHV0IGZvciB0aGUgbmV3IGNvbW1h
bmQgKHRwbTJfY29udGV4dGxvYWQpOjxicj4KPGJyPgp0cG0yX2NvbnRleHRsb2FkIC1TIHNlc3Np
b24uZGF0IC1WPGJyPgpJTkZPIG9uIGxpbmU6ICZxdW90OzQxOCZxdW90OyBpbiBmaWxlOiAmcXVv
dDtsaWIvZmlsZXMuYyZxdW90OzogQXNzdW1pbmcgdHBtIGNvbnRleHQgZmlsZTxicj4KSU5GTyBv
biBsaW5lOiAmcXVvdDszNDkmcXVvdDsgaW4gZmlsZTogJnF1b3Q7bGliL2ZpbGVzLmMmcXVvdDs6
IGxvYWQ6IFRQTVNfQ09OVEVYVC0mZ3Q7c2F2ZWRIYW5kbGU6IDB4MzAwMDAwMDxicj4KSU5GTyBv
biBsaW5lOiAmcXVvdDszMDYmcXVvdDsgaW4gZmlsZTogJnF1b3Q7bGliL3RwbTJfc2Vzc2lvbi5j
JnF1b3Q7OiBSZXN0b3JlZCBzZXNzaW9uOiBFU1lTX1RSKDB4NDA0MTg0NzcpIGF0dHJzKDB4MSk8
YnI+CnNlc3Npb24gaGFuZGxlOiAweDQwNDE4NDc3PGJyPgo8YnI+CkknbSBjYWxsaW5nIHRwbTJf
Z2V0X3Nlc3Npb25faGFuZGxlKCkgb3ZlciB0aGUgdHBtMl9zZXNzaW9uIG9iamVjdCwgZXhwZWN0
aW5nIHRvIGdldCB0aGUgMHgzMDAwMDAwIGJ1dCBhbSBnZXR0aW5nJm5ic3A7MHg0MDQxODQ3NyBp
bnN0ZWFkLiBIZXJlJ3MgdGhlIGNvbW1pdCBmb3IgcmVmZXJlbmNlOiZuYnNwOzxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS9qb3BlbGltYS90cG0yLXRvb2xzL2NvbW1pdC9iZTNkMDExZDg2NTMx
ZjQ1Y2M4MjBkMjQ0MzI5YzQ1MWUyNDYwMzRmIj5odHRwczovL2dpdGh1Yi5jb20vam9wZWxpbWEv
dHBtMi10b29scy9jb21taXQvYmUzZDAxMWQ4NjUzMWY0NWNjODIwZDI0NDMyOWM0NTFlMjQ2MDM0
ZjwvYT48YnI+Cjxicj4KQ2FuIGFueW9uZSBoZWxwIG1lIGdldCB0aGUgcmlnaHQgaGFuZGxlIGhl
cmU/PGJyPgo8YnI+ClRoYW5rcyBpbiBhZHZhbmNlLjxicj4KPGJyPgpLaW5kIHJlZ2FyZHMsPGJy
PgpKb+NvIExpbWEmbmJzcDsmbmJzcDt8Jm5ic3A7Jm5ic3A7SW5mcmFzdHJ1Y3R1cmUgU2VjdXJp
dHkgRW5naW5lZXI8YnI+CmpsaW1hQGNsb3VkZmxhcmUuY29tPGJyPgpjZWxsOiZuYnNwOygrMzUx
KSA5MTQgOTA3IDU5MTxicj4KJm5ic3A7PGJyPgoxIDg4OCA5OSBGTEFSRSZuYnNwOyZuYnNwO3wm
bmJzcDsmbmJzcDt3d3cuY2xvdWRmbGFyZS5jb208YnI+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdCAtLSB0cG0yQGxp
c3RzLjAxLm9yZzxicj4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byB0cG0yLWxlYXZl
QGxpc3RzLjAxLm9yZzxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9p
bnRlcm5hbF9uYW1lKXM8YnI+CjwvZGl2Pgo8L3NwYW4+PC9mb250PjwvZGl2Pgo8L2JvZHk+Cjwv
aHRtbD4K

--===============3085288235302499402==--

