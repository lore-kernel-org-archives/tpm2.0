Content-Type: multipart/mixed; boundary="===============0011865925603143042=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Java support for TPM2 ?
Date: Thu, 03 Jun 2021 14:50:18 +0000
Message-ID: <SN6PR11MB3437A90322B63798A433A722B83C9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: d48b6048-a98a-b237-0b3f-93fed4ecc35a@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0011865925603143042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

You can use the PCKS11 adapter and the pcks11 library:
  - https://github.com/tpm2-software/tpm2-pkcs11/blob/master/test/integrati=
on/PKCS11JavaTests.java

However, this only really exposes the crypto side of the TPM. If you need o=
ther commands, we will need
a JNI adapter.
________________________________
From: Ted Kim <ted.h.kim(a)oracle.com>
Sent: Wednesday, June 2, 2021 7:00 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Java support for TPM2 ?

Folks,

Does anyone know of any current projects to support Java with TPM2 ?


I saw TSS.Java over at Microsoft TSS.MSR (last commit 7 months ago).

But aside from that I only saw projects which look really old (several
years since last update).

Any leads ?


Thanks,
-ted

--
Ted H. Kim, PhD
ted.h.kim(a)oracle.com
+1 310-258-7515
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0011865925603143042==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KWW91IGNhbiB1c2UgdGhlIFBDS1MxMSBhZGFwdGVyIGFuZCB0aGUg
cGNrczExIGxpYnJhcnk6PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBB
cmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij4KJm5ic3A7IC0mbmJzcDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBt
Mi1zb2Z0d2FyZS90cG0yLXBrY3MxMS9ibG9iL21hc3Rlci90ZXN0L2ludGVncmF0aW9uL1BLQ1Mx
MUphdmFUZXN0cy5qYXZhIiBpZD0iTFBsbms4Njk0MTEiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItcGtjczExL2Jsb2IvbWFzdGVyL3Rlc3QvaW50ZWdyYXRpb24vUEtDUzEx
SmF2YVRlc3RzLmphdmE8L2E+PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJp
LCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGli
cmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6
IHJnYigwLCAwLCAwKTsiPgpIb3dldmVyLCB0aGlzIG9ubHkgcmVhbGx5IGV4cG9zZXMgdGhlIGNy
eXB0byBzaWRlIG9mIHRoZSBUUE0uIElmIHlvdSBuZWVkIG90aGVyIGNvbW1hbmRzLCB3ZSB3aWxs
IG5lZWQ8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
PgphIEpOSSBhZGFwdGVyLjwvZGl2Pgo8ZGl2IGlkPSJhcHBlbmRvbnNlbmQiPjwvZGl2Pgo8aHIg
c3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4KPGRp
diBpZD0iZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGlicmksIHNhbnMt
c2VyaWYiIHN0eWxlPSJmb250LXNpemU6MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9i
PiBUZWQgS2ltICZsdDt0ZWQuaC5raW1Ab3JhY2xlLmNvbSZndDs8YnI+CjxiPlNlbnQ6PC9iPiBX
ZWRuZXNkYXksIEp1bmUgMiwgMjAyMSA3OjAwIFBNPGJyPgo8Yj5Ubzo8L2I+IHRwbTJAbGlzdHMu
MDEub3JnICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8YnI+CjxiPlN1YmplY3Q6PC9iPiBbdHBt
Ml0gSmF2YSBzdXBwb3J0IGZvciBUUE0yID88L2ZvbnQ+CjxkaXY+Jm5ic3A7PC9kaXY+CjwvZGl2
Pgo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTFwdDsiPgo8ZGl2IGNsYXNzPSJQbGFpblRleHQiPkZvbGtzLDxicj4KPGJyPgpE
b2VzIGFueW9uZSBrbm93IG9mIGFueSBjdXJyZW50IHByb2plY3RzIHRvIHN1cHBvcnQgSmF2YSB3
aXRoIFRQTTIgPzxicj4KPGJyPgo8YnI+Ckkgc2F3IFRTUy5KYXZhIG92ZXIgYXQgTWljcm9zb2Z0
IFRTUy5NU1IgKGxhc3QgY29tbWl0IDcgbW9udGhzIGFnbykuPGJyPgo8YnI+CkJ1dCBhc2lkZSBm
cm9tIHRoYXQgSSBvbmx5IHNhdyBwcm9qZWN0cyB3aGljaCBsb29rIHJlYWxseSBvbGQgKHNldmVy
YWwgPGJyPgp5ZWFycyBzaW5jZSBsYXN0IHVwZGF0ZSkuPGJyPgo8YnI+CkFueSBsZWFkcyA/PGJy
Pgo8YnI+Cjxicj4KVGhhbmtzLDxicj4KLXRlZDxicj4KPGJyPgotLSA8YnI+ClRlZCBILiBLaW0s
IFBoRDxicj4KdGVkLmgua2ltQG9yYWNsZS5jb208YnI+CisxIDMxMC0yNTgtNzUxNTxicj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFp
bGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEub3JnPGJyPgolKHdlYl9wYWdlX3VybClzbGlz
dGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KPC9kaXY+Cjwvc3Bhbj48L2Zv
bnQ+PC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============0011865925603143042==--

