Content-Type: multipart/mixed; boundary="===============3909623068623274146=="
MIME-Version: 1.0
From: Gabriele Saturni <gabriele.saturni at wsense.it>
Subject: [tpm2] Re: How to store AES key inside the TPM and then use it?
Date: Thu, 03 Feb 2022 09:07:05 +0100
Message-ID: <CAFruog32AO9iLzRgOp4wD_2qQnV3nTHCwxJdPFCNywiZrK--jQ@mail.gmail.com>
In-Reply-To: CAOCvsSmRQVp35+-0aE-k+Qy85iYyt9+mwn_hw=_VjdwgBPcakg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3909623068623274146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the answers, basing on your experiences, since I have storage
available outside the TPM, which of the two proposed approaches is the best
(in terms of both security and efficiency)?

Il giorno gio 3 feb 2022 alle ore 04:27 Steven Clark <davolfman(a)gmail.com>
ha scritto:

> For small data it's also possible to store it sealed as a "keyedhash" and
> put it in one of the NVM "persistent object" locations as if it's key.
>
> On Wed, Feb 2, 2022, 1:06 PM Kenneth Goldman <kgoldman(a)us.ibm.com> wrot=
e:
>
>> There are two ways.  Note that, since you're encrypting outside the TPM,
>> the 'key' is just a byte stream to the TPM.
>>
>>
>>
>>    1. If you have storage available, create the key as sealed data using
>>    'create'.  Retrieve the key with 'unseal', with application specific
>>    authorization for the unseal operation.
>>    2. If you have no external storage available, create the key as an NV
>>    index using NVdefinespace. Retrieve the key using NV read, again with
>>    application specific authorization for the read.
>>
>>
>>
>> *From:* Gabriele Saturni <gabriele.saturni(a)wsense.it>
>> *Sent:* Wednesday, February 2, 2022 12:31 PM
>> *To:* tpm2(a)lists.01.org
>> *Subject:* [EXTERNAL] [tpm2] How to store AES key inside the TPM and
>> then use it?
>>
>>
>>
>> Hi to everybody, I'm pretty new to the TPM and looking for a way to store
>> a premade AES key inside the TPM and retrieve it for encrypting the data=
 of
>> my application. Is there any way to do it since a lot of TPM does not
>> support AES ? =E2=80=8D =E2=80=8D ZjQcmQRYFpfptBannerStart
>>
>> Hi to everybody,
>>
>> I'm pretty new to the TPM and looking for a way to store a premade AES
>> key inside the TPM and retrieve it for encrypting the data of my
>> application. Is there any way to do it since a lot of TPM does not suppo=
rt
>> AES ?
>>
>>
>>
>> Thank you for your time
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>

-- =

Gabriele Saturni, PhD
R&D Developer, WSense Srl
E-mail: gabriele.saturni(a)wsense.it <giovanni.pagnotta(a)wsense.it>
WSense Srl web site:  https://www.wsense.it/

This message is confidential. Any unauthorised disclosure,  use or
dissemination, either whole or partial, is prohibited. If  you are not the
intended recipient of the message, please notify the sender immediately.

Questo messaggio e riservato;Qualsiasi pubblicazione, utilizzo o
diffusione, anche parziale di questo messaggio, deve essere preventivamente
autorizzata. Nel caso in cui non foste destinatari del presente
messaggio,vogliate cortesemente avvertire immediatamente il mittente.

Ce message est confidentiel. Toute publication,  utilisation ou diffusion,
meme partielle, doit etre autorisee  prealablement. Si vous n' etes pas
destinataire de ce message, merci d'en avertir immediatement l'expediteur.

--===============3909623068623274146==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIGZvciB0aGUgYW5zd2VycywgYmFzaW5nIG9uIHlvdXIgZXhw
ZXJpZW5jZXMsIHNpbmNlIEkgaGF2ZSBzdG9yYWdlIGF2YWlsYWJsZSBvdXRzaWRlIHRoZSBUUE0s
IHdoaWNoIG9mIHRoZSB0d28gcHJvcG9zZWQgYXBwcm9hY2hlcyBpcyB0aGUgYmVzdCAoaW4gdGVy
bXMgb2YgYm90aCBzZWN1cml0eSBhbmQgZWZmaWNpZW5jeSk/PGJyPjwvZGl2Pjxicj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPklsIGdp
b3JubyBnaW8gMyBmZWIgMjAyMiBhbGxlIG9yZSAwNDoyNyBTdGV2ZW4gQ2xhcmsgJmx0OzxhIGhy
ZWY9Im1haWx0bzpkYXZvbGZtYW5AZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZGF2b2xmbWFu
QGdtYWlsLmNvbTwvYT4mZ3Q7IGhhIHNjcml0dG86PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVm
dDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0i
YXV0byI+Rm9yIHNtYWxsIGRhdGEgaXQmIzM5O3MgYWxzbyBwb3NzaWJsZSB0byBzdG9yZSBpdCBz
ZWFsZWQgYXMgYSAmcXVvdDtrZXllZGhhc2gmcXVvdDsgYW5kIHB1dCBpdCBpbiBvbmUgb2YgdGhl
IE5WTSAmcXVvdDtwZXJzaXN0ZW50IG9iamVjdCZxdW90OyBsb2NhdGlvbnMgYXMgaWYgaXQmIzM5
O3Mga2V5LjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIg
Y2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgRmViIDIsIDIwMjIsIDE6MDYgUE0gS2VubmV0aCBH
b2xkbWFuICZsdDs8YSBocmVmPSJtYWlsdG86a2dvbGRtYW5AdXMuaWJtLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmtnb2xkbWFuQHVzLmlibS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4
O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgi
PgoKCgoKCjxkaXYgbGFuZz0iRU4tVVMiPgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGVy
ZSBhcmUgdHdvIHdheXMuwqAgTm90ZSB0aGF0LCBzaW5jZSB5b3UmIzM5O3JlIGVuY3J5cHRpbmcg
b3V0c2lkZSB0aGUgVFBNLCB0aGUgJiMzOTtrZXkmIzM5OyBpcyBqdXN0IGEgYnl0ZSBzdHJlYW0g
dG8gdGhlIFRQTS48dT48L3U+PHU+PC91PjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHU+PC91
PsKgPHU+PC91PjwvcD4KPG9sIHN0eWxlPSJtYXJnaW4tdG9wOjBpbiIgdHlwZT0iMSIgc3RhcnQ9
IjEiPgo8bGkgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbiI+SWYgeW91IGhhdmUgc3RvcmFnZSBhdmFp
bGFibGUsIGNyZWF0ZSB0aGUga2V5IGFzIHNlYWxlZCBkYXRhIHVzaW5nICYjMzk7Y3JlYXRlJiMz
OTsuwqAgUmV0cmlldmUgdGhlIGtleSB3aXRoICYjMzk7dW5zZWFsJiMzOTssIHdpdGggYXBwbGlj
YXRpb24gc3BlY2lmaWMgYXV0aG9yaXphdGlvbiBmb3IgdGhlIHVuc2VhbCBvcGVyYXRpb24uPHU+
PC91Pjx1PjwvdT48L2xpPjxsaSBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluIj5JZiB5b3UgaGF2ZSBu
byBleHRlcm5hbCBzdG9yYWdlIGF2YWlsYWJsZSwgY3JlYXRlIHRoZSBrZXkgYXMgYW4gTlYgaW5k
ZXggdXNpbmcgTlZkZWZpbmVzcGFjZS4gUmV0cmlldmUgdGhlIGtleSB1c2luZyBOViByZWFkLCBh
Z2FpbiB3aXRoIGFwcGxpY2F0aW9uIHNwZWNpZmljIGF1dGhvcml6YXRpb24gZm9yIHRoZQogcmVh
ZC48dT48L3U+PHU+PC91PjwvbGk+PC9vbD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHU+PC91PsKg
PHU+PC91PjwvcD4KPGRpdj4KPGRpdiBzdHlsZT0iYm9yZGVyLWNvbG9yOnJnYigyMjUsMjI1LDIy
NSkgY3VycmVudGNvbG9yIGN1cnJlbnRjb2xvcjtib3JkZXItc3R5bGU6c29saWQgbm9uZSBub25l
O2JvcmRlci13aWR0aDoxcHQgbWVkaXVtIG1lZGl1bTtwYWRkaW5nOjNwdCAwaW4gMGluIj4KPHAg
Y2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjAuNWluIj48Yj5Gcm9tOjwvYj4g
R2FicmllbGUgU2F0dXJuaSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmdhYnJpZWxlLnNhdHVybmlAd3Nl
bnNlLml0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5nYWJyaWVsZS5zYXR1cm5p
QHdzZW5zZS5pdDwvYT4mZ3Q7Cjxicj4KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwgRmVicnVhcnkg
MiwgMjAyMiAxMjozMSBQTTxicj4KPGI+VG86PC9iPiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0
cy4wMS5vcmciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPjxicj4KPGI+U3ViamVjdDo8L2I+IFtFWFRFUk5BTF0gW3RwbTJdIEhvdyB0byBzdG9y
ZSBBRVMga2V5IGluc2lkZSB0aGUgVFBNIGFuZCB0aGVuIHVzZSBpdD88dT48L3U+PHU+PC91Pjwv
cD4KPC9kaXY+CjwvZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6
MC41aW4iPjx1PjwvdT7CoDx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJt
YXJnaW4tbGVmdDowLjVpbiI+PHNwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxcHQ7Y29sb3I6
d2hpdGUiPkhpIHRvIGV2ZXJ5Ym9keSwgSSYjMzk7bSBwcmV0dHkgbmV3IHRvIHRoZSBUUE0gYW5k
IGxvb2tpbmcgZm9yIGEgd2F5IHRvIHN0b3JlIGEgcHJlbWFkZSBBRVMga2V5IGluc2lkZSB0aGUg
VFBNIGFuZCByZXRyaWV2ZSBpdCBmb3IgZW5jcnlwdGluZyB0aGUKIGRhdGEgb2YgbXkgYXBwbGlj
YXRpb24uIElzIHRoZXJlIGFueSB3YXkgdG8gZG8gaXQgc2luY2UgYSBsb3Qgb2YgVFBNIGRvZXMg
bm90IHN1cHBvcnQgQUVTID8g4oCNIOKAjQo8L3NwYW4+PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MXB0O2NvbG9yOndoaXRlIj5aalFjbVFSWUZwZnB0QmFubmVyU3RhcnQ8L3NwYW4+Cjx1
PjwvdT48dT48L3U+PC9wPgo8ZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0i
bWFyZ2luLWxlZnQ6MC41aW4iPkhpIHRvIGV2ZXJ5Ym9keSw8dT48L3U+PHU+PC91PjwvcD4KPC9k
aXY+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDowLjVpbiI+
SSYjMzk7bSBwcmV0dHkgbmV3IHRvIHRoZSBUUE0gYW5kIGxvb2tpbmcgZm9yIGEgd2F5IHRvIHN0
b3JlIGEgcHJlbWFkZSBBRVMga2V5IGluc2lkZSB0aGUgVFBNIGFuZCByZXRyaWV2ZSBpdCBmb3Ig
ZW5jcnlwdGluZyB0aGUgZGF0YSBvZiBteSBhcHBsaWNhdGlvbi4gSXMgdGhlcmUgYW55IHdheSB0
byBkbyBpdCBzaW5jZSBhIGxvdCBvZiBUUE0gZG9lcyBub3Qgc3VwcG9ydAogQUVTID88dT48L3U+
PHU+PC91PjwvcD4KPC9kaXY+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJn
aW4tbGVmdDowLjVpbiI+PHU+PC91PsKgPHU+PC91PjwvcD4KPC9kaXY+CjxkaXY+CjxwIGNsYXNz
PSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDowLjVpbiI+VGhhbmsgeW91IGZvciB5b3Vy
IHRpbWU8dT48L3U+PHU+PC91PjwvcD4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWls
aW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+ClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMu
MDEub3JnIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3Rz
LjAxLm9yZzwvYT48YnI+CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50
ZXJuYWxfbmFtZSlzPC9ibG9ja3F1b3RlPjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNs
ZWFyPSJhbGwiPjxicj4tLSA8YnI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5H
YWJyaWVsZSBTYXR1cm5pLCBQaEQ8YnI+PC9kaXY+PGRpdj48ZGl2IGRpcj0ibHRyIj5SJmFtcDtE
IERldmVsb3BlciwgV1NlbnNlIFNybDxicj5FLW1haWw6IDxhIGhyZWY9Im1haWx0bzpnaW92YW5u
aS5wYWdub3R0YUB3c2Vuc2UuaXQiIHRhcmdldD0iX2JsYW5rIj5nYWJyaWVsZS5zYXR1cm5pQHdz
ZW5zZS5pdDwvYT48YnI+PC9kaXY+PGRpdiBkaXI9Imx0ciI+V1NlbnNlIFNybCB3ZWIgc2l0ZTrC
oMKgPGEgaHJlZj0iaHR0cHM6Ly93d3cud3NlbnNlLml0LyIgcmVsPSJub3JlZmVycmVyIiBzdHls
ZT0iY29sb3I6cmdiKDE3LDg1LDIwNCkiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3d3dy53c2Vu
c2UuaXQvPC9hPjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdj5UaGlzIG1lc3Nh
Z2UgaXMgY29uZmlkZW50aWFsLsKgQW55IHVuYXV0aG9yaXNlZCBkaXNjbG9zdXJlLCDCoHVzZSBv
ciBkaXNzZW1pbmF0aW9uLCBlaXRoZXIgd2hvbGUgb3IgcGFydGlhbCwgaXMgcHJvaGliaXRlZC4g
SWYgwqB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoZSBtZXNzYWdlLCBw
bGVhc2Ugbm90aWZ5wqB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5LjwvZGl2PjxkaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5RdWVzdG8gbWVzc2FnZ2lvIGUgcmlzZXJ2YXRvO1F1YWxzaWFzaSBwdWJibGlj
YXppb25lLCB1dGlsaXp6byBvIGRpZmZ1c2lvbmUsIGFuY2hlIHBhcnppYWxlIGRpwqBxdWVzdG8g
bWVzc2FnZ2lvLCBkZXZlIGVzc2VyZSBwcmV2ZW50aXZhbWVudGUgYXV0b3JpenphdGEuIE5lbMKg
Y2FzbyBpbiBjdWkgbm9uIGZvc3RlIGRlc3RpbmF0YXJpIGRlbCBwcmVzZW50ZSBtZXNzYWdnaW8s
dm9nbGlhdGXCoGNvcnRlc2VtZW50ZSBhdnZlcnRpcmUgaW1tZWRpYXRhbWVudGUgaWwgbWl0dGVu
dGUuwqA8YnI+PGJyPkNlIG1lc3NhZ2UgZXN0IGNvbmZpZGVudGllbC7CoFRvdXRlIHB1YmxpY2F0
aW9uLCDCoHV0aWxpc2F0aW9uIG91IGRpZmZ1c2lvbiwgbWVtZSBwYXJ0aWVsbGUsIGRvaXQgZXRy
ZSBhdXRvcmlzZWUgwqBwcmVhbGFibGVtZW50LiBTaSB2b3VzIG4mIzM5OyBldGVzIHBhcyBkZXN0
aW5hdGFpcmUgZGUgY2UgbWVzc2FnZSzCoG1lcmNpIGQmIzM5O2VuIGF2ZXJ0aXIgaW1tZWRpYXRl
bWVudCBsJiMzOTtleHBlZGl0ZXVyLjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============3909623068623274146==--

