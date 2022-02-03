Content-Type: multipart/mixed; boundary="===============5082547493441584171=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: How to store AES key inside the TPM and then use it?
Date: Wed, 02 Feb 2022 19:27:37 -0800
Message-ID: <CAOCvsSmRQVp35+-0aE-k+Qy85iYyt9+mwn_hw=_VjdwgBPcakg@mail.gmail.com>
In-Reply-To: BN8PR15MB275343B5EC9754A33E23CEBDF2279@BN8PR15MB2753.namprd15.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5082547493441584171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For small data it's also possible to store it sealed as a "keyedhash" and
put it in one of the NVM "persistent object" locations as if it's key.

On Wed, Feb 2, 2022, 1:06 PM Kenneth Goldman <kgoldman(a)us.ibm.com> wrote:

> There are two ways.  Note that, since you're encrypting outside the TPM,
> the 'key' is just a byte stream to the TPM.
>
>
>
>    1. If you have storage available, create the key as sealed data using
>    'create'.  Retrieve the key with 'unseal', with application specific
>    authorization for the unseal operation.
>    2. If you have no external storage available, create the key as an NV
>    index using NVdefinespace. Retrieve the key using NV read, again with
>    application specific authorization for the read.
>
>
>
> *From:* Gabriele Saturni <gabriele.saturni(a)wsense.it>
> *Sent:* Wednesday, February 2, 2022 12:31 PM
> *To:* tpm2(a)lists.01.org
> *Subject:* [EXTERNAL] [tpm2] How to store AES key inside the TPM and then
> use it?
>
>
>
> Hi to everybody, I'm pretty new to the TPM and looking for a way to store
> a premade AES key inside the TPM and retrieve it for encrypting the data =
of
> my application. Is there any way to do it since a lot of TPM does not
> support AES ? =E2=80=8D =E2=80=8D ZjQcmQRYFpfptBannerStart
>
> Hi to everybody,
>
> I'm pretty new to the TPM and looking for a way to store a premade AES key
> inside the TPM and retrieve it for encrypting the data of my application.
> Is there any way to do it since a lot of TPM does not support AES ?
>
>
>
> Thank you for your time
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============5082547493441584171==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkZvciBzbWFsbCBkYXRhIGl0JiMzOTtzIGFsc28gcG9zc2libGUgdG8g
c3RvcmUgaXQgc2VhbGVkIGFzIGEgJnF1b3Q7a2V5ZWRoYXNoJnF1b3Q7IGFuZCBwdXQgaXQgaW4g
b25lIG9mIHRoZSBOVk0gJnF1b3Q7cGVyc2lzdGVudCBvYmplY3QmcXVvdDsgbG9jYXRpb25zIGFz
IGlmIGl0JiMzOTtzIGtleS48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBXZWQsIEZlYiAyLCAyMDIyLCAxOjA2IFBN
IEtlbm5ldGggR29sZG1hbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmtnb2xkbWFuQHVzLmlibS5jb20i
Pmtnb2xkbWFuQHVzLmlibS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUg
Y2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+CgoKCgoKPGRpdiBsYW5nPSJFTi1VUyIg
bGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiIHN0eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29y
ZCI+CjxkaXYgY2xhc3M9Im1fLTUxNzY3MzgzNDU0NzA2Njg3OTRXb3JkU2VjdGlvbjEiPgo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5UaGVyZSBhcmUgdHdvIHdheXMuwqAgTm90ZSB0aGF0LCBzaW5jZSB5
b3UmIzM5O3JlIGVuY3J5cHRpbmcgb3V0c2lkZSB0aGUgVFBNLCB0aGUgJiMzOTtrZXkmIzM5OyBp
cyBqdXN0IGEgYnl0ZSBzdHJlYW0gdG8gdGhlIFRQTS48dT48L3U+PHU+PC91PjwvcD4KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHU+PC91PsKgPHU+PC91PjwvcD4KPG9sIHN0eWxlPSJtYXJnaW4tdG9w
OjBpbiIgc3RhcnQ9IjEiIHR5cGU9IjEiPgo8bGkgY2xhc3M9Im1fLTUxNzY3MzgzNDU0NzA2Njg3
OTRNc29MaXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluIj5JZiB5b3UgaGF2ZSBz
dG9yYWdlIGF2YWlsYWJsZSwgY3JlYXRlIHRoZSBrZXkgYXMgc2VhbGVkIGRhdGEgdXNpbmcgJiMz
OTtjcmVhdGUmIzM5Oy7CoCBSZXRyaWV2ZSB0aGUga2V5IHdpdGggJiMzOTt1bnNlYWwmIzM5Oywg
d2l0aCBhcHBsaWNhdGlvbiBzcGVjaWZpYyBhdXRob3JpemF0aW9uIGZvciB0aGUgdW5zZWFsIG9w
ZXJhdGlvbi48dT48L3U+PHU+PC91PjwvbGk+PGxpIGNsYXNzPSJtXy01MTc2NzM4MzQ1NDcwNjY4
Nzk0TXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbiI+SWYgeW91IGhhdmUg
bm8gZXh0ZXJuYWwgc3RvcmFnZSBhdmFpbGFibGUsIGNyZWF0ZSB0aGUga2V5IGFzIGFuIE5WIGlu
ZGV4IHVzaW5nIE5WZGVmaW5lc3BhY2UuIFJldHJpZXZlIHRoZSBrZXkgdXNpbmcgTlYgcmVhZCwg
YWdhaW4gd2l0aCBhcHBsaWNhdGlvbiBzcGVjaWZpYyBhdXRob3JpemF0aW9uIGZvciB0aGUKIHJl
YWQuPHU+PC91Pjx1PjwvdT48L2xpPjwvb2w+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7C
oDx1PjwvdT48L3A+CjxkaXY+CjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29s
aWQgI2UxZTFlMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4KPHAgY2xhc3M9Ik1z
b05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi41aW4iPjxiPkZyb206PC9iPiBHYWJyaWVsZSBT
YXR1cm5pICZsdDs8YSBocmVmPSJtYWlsdG86Z2FicmllbGUuc2F0dXJuaUB3c2Vuc2UuaXQiIHRh
cmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPmdhYnJpZWxlLnNhdHVybmlAd3NlbnNlLml0
PC9hPiZndDsKPGJyPgo8Yj5TZW50OjwvYj4gV2VkbmVzZGF5LCBGZWJydWFyeSAyLCAyMDIyIDEy
OjMxIFBNPGJyPgo8Yj5Ubzo8L2I+IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJy
Pgo8Yj5TdWJqZWN0OjwvYj4gW0VYVEVSTkFMXSBbdHBtMl0gSG93IHRvIHN0b3JlIEFFUyBrZXkg
aW5zaWRlIHRoZSBUUE0gYW5kIHRoZW4gdXNlIGl0Pzx1PjwvdT48dT48L3U+PC9wPgo8L2Rpdj4K
PC9kaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDouNWluIj48dT48
L3U+wqA8dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6
LjVpbiI+PHNwYW4gY2xhc3M9Im1fLTUxNzY3MzgzNDU0NzA2Njg3OTRwZnB0cHJlaGVhZGVyMSI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxLjBwdDtjb2xvcjp3aGl0ZSI+SGkgdG8gZXZlcnlib2R5
LCBJJiMzOTttIHByZXR0eSBuZXcgdG8gdGhlIFRQTSBhbmQgbG9va2luZyBmb3IgYSB3YXkgdG8g
c3RvcmUgYSBwcmVtYWRlIEFFUyBrZXkgaW5zaWRlIHRoZSBUUE0gYW5kIHJldHJpZXZlIGl0IGZv
ciBlbmNyeXB0aW5nIHRoZQogZGF0YSBvZiBteSBhcHBsaWNhdGlvbi4gSXMgdGhlcmUgYW55IHdh
eSB0byBkbyBpdCBzaW5jZSBhIGxvdCBvZiBUUE0gZG9lcyBub3Qgc3VwcG9ydCBBRVMgPyDigI0g
4oCNCjwvc3Bhbj48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxLjBwdDtjb2xvcjp3aGl0
ZSI+WmpRY21RUllGcGZwdEJhbm5lclN0YXJ0PC9zcGFuPgo8dT48L3U+PHU+PC91PjwvcD4KPGRp
dj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi41aW4iPkhp
IHRvIGV2ZXJ5Ym9keSw8dT48L3U+PHU+PC91PjwvcD4KPC9kaXY+CjxkaXY+CjxwIGNsYXNzPSJN
c29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDouNWluIj5JJiMzOTttIHByZXR0eSBuZXcgdG8g
dGhlIFRQTSBhbmQgbG9va2luZyBmb3IgYSB3YXkgdG8gc3RvcmUgYSBwcmVtYWRlIEFFUyBrZXkg
aW5zaWRlIHRoZSBUUE0gYW5kIHJldHJpZXZlIGl0IGZvciBlbmNyeXB0aW5nIHRoZSBkYXRhIG9m
IG15IGFwcGxpY2F0aW9uLiBJcyB0aGVyZSBhbnkgd2F5IHRvIGRvIGl0IHNpbmNlIGEgbG90IG9m
IFRQTSBkb2VzIG5vdCBzdXBwb3J0CiBBRVMgPzx1PjwvdT48dT48L3U+PC9wPgo8L2Rpdj4KPGRp
dj4KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi41aW4iPjx1PjwvdT7C
oDx1PjwvdT48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFy
Z2luLWxlZnQ6LjVpbiI+VGhhbmsgeW91IGZvciB5b3VyIHRpbWU8dT48L3U+PHU+PC91PjwvcD4K
PC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFp
bHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8g
PGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIg
cmVsPSJub3JlZmVycmVyIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiUod2ViX3Bh
Z2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPC9ibG9ja3F1b3Rl
PjwvZGl2Pgo=

--===============5082547493441584171==--

