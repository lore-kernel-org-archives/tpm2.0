Content-Type: multipart/mixed; boundary="===============3393799288218601089=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Recommended way to encrypt a credential
Date: Tue, 19 Jul 2022 14:19:30 +0000
Message-ID: <DM6PR11MB3434C6DDBA462B3079B918B3B88F9@DM6PR11MB3434.namprd11.prod.outlook.com>
In-Reply-To: 20220719024411.2549.766@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3393799288218601089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No, all roads lead to Rome. Using gnupg or openssl are great alternatives t=
o using raw tpm commands directly.
they often hide some of the complexities of dealing with the TPM as well.
________________________________
From: Tim K <tpm2(a)bitzap.e4ward.com>
Sent: Monday, July 18, 2022 9:44 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Re: Recommended way to encrypt a credential

For method #3: any benefit to using tpm2_encryptdecrypt vs gpg --symmetric?=
 just more streamlined in a single command?

Looks like newer GPG versions integrate with the TPM
https://gnupg.org/blog/20210315-using-tpm-with-gnupg-2.3.html
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3393799288218601089==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPgpObywgYWxsIHJvYWRzIGxl
YWQgdG8gUm9tZS4gVXNpbmcgZ251cGcgb3Igb3BlbnNzbCBhcmUgZ3JlYXQgYWx0ZXJuYXRpdmVz
IHRvIHVzaW5nIHJhdyB0cG0gY29tbWFuZHMgZGlyZWN0bHkuPC9kaXY+CjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPgp0
aGV5IG9mdGVuIGhpZGUgc29tZSBvZiB0aGUgY29tcGxleGl0aWVzIG9mIGRlYWxpbmcgd2l0aCB0
aGUgVFBNIGFzIHdlbGwuPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+CjxociBz
dHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRleD0iLTEiPgo8ZGl2
IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1z
ZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+
IFRpbSBLICZsdDt0cG0yQGJpdHphcC5lNHdhcmQuY29tJmd0Ozxicj4KPGI+U2VudDo8L2I+IE1v
bmRheSwgSnVseSAxOCwgMjAyMiA5OjQ0IFBNPGJyPgo8Yj5Ubzo8L2I+IHRwbTJAbGlzdHMuMDEu
b3JnICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8YnI+CjxiPlN1YmplY3Q6PC9iPiBbdHBtMl0g
UmU6IFJlY29tbWVuZGVkIHdheSB0byBlbmNyeXB0IGEgY3JlZGVudGlhbDwvZm9udD4KPGRpdj4m
bmJzcDs8L2Rpdj4KPC9kaXY+CjxkaXYgY2xhc3M9IkJvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0i
MiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+
Rm9yIG1ldGhvZCAjMzogYW55IGJlbmVmaXQgdG8gdXNpbmcgdHBtMl9lbmNyeXB0ZGVjcnlwdCB2
cyBncGcgLS1zeW1tZXRyaWM/IGp1c3QgbW9yZSBzdHJlYW1saW5lZCBpbiBhIHNpbmdsZSBjb21t
YW5kPzxicj4KPGJyPgpMb29rcyBsaWtlIG5ld2VyIEdQRyB2ZXJzaW9ucyBpbnRlZ3JhdGUgd2l0
aCB0aGUgVFBNPGJyPgo8YSBocmVmPSJodHRwczovL2dudXBnLm9yZy9ibG9nLzIwMjEwMzE1LXVz
aW5nLXRwbS13aXRoLWdudXBnLTIuMy5odG1sIj5odHRwczovL2dudXBnLm9yZy9ibG9nLzIwMjEw
MzE1LXVzaW5nLXRwbS13aXRoLWdudXBnLTIuMy5odG1sPC9hPjxicj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0t
IHRwbTJAbGlzdHMuMDEub3JnPGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRw
bTItbGVhdmVAbGlzdHMuMDEub3JnPGJyPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4
dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KPC9kaXY+Cjwvc3Bhbj48L2ZvbnQ+PC9kaXY+Cjwv
Ym9keT4KPC9odG1sPgo=

--===============3393799288218601089==--

