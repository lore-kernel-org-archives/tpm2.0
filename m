Content-Type: multipart/mixed; boundary="===============6916373251677119118=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: How to store AES key inside the TPM and then use it?
Date: Mon, 07 Feb 2022 18:40:44 +0000
Message-ID: <DM6PR11MB34344426CB816F97BE19468EB82C9@DM6PR11MB3434.namprd11.prod.outlook.com>
In-Reply-To: CAOCvsSmtc+02t89bnziYVEyicJqN3ArCDCiZtWtDXNGkKMNfkA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6916373251677119118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Intel TPM's support AES, but it's not widely available in other TPM's. It's=
 better to "seal" the key to the TPM and then "unseal"
it as you need it and use it in software crypto. See "Seal Data to the TPM"=
 in examples: https://tpm2-tools.readthedocs.io/en/stable/man/tpm2_create.1/

Bill
________________________________
From: Steven Clark <davolfman(a)gmail.com>
Sent: Wednesday, February 2, 2022 12:07 PM
To: Gabriele Saturni <gabriele.saturni(a)wsense.it>
Cc: tpm2 <tpm2(a)lists.01.org>
Subject: [tpm2] Re: How to store AES key inside the TPM and then use it?

As far as I know, no one produces a TPM with bulk symmetric encryption feat=
ures.  It would be both slow and likely to have export law problems.

On Wed, Feb 2, 2022, 9:32 AM Gabriele Saturni <gabriele.saturni(a)wsense.it=
<mailto:gabriele.saturni(a)wsense.it>> wrote:
Hi to everybody,
I'm pretty new to the TPM and looking for a way to store a premade AES key =
inside the TPM and retrieve it for encrypting the data of my application. I=
s there any way to do it since a lot of TPM does not support AES ?

Thank you for your time
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org>
To unsubscribe send an email to tpm2-leave(a)lists.01.org<mailto:tpm2-leave=
(a)lists.01.org>
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============6916373251677119118==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KSW50ZWwgVFBNJ3Mgc3VwcG9ydCBBRVMsIGJ1dCBpdCdzIG5vdCB3
aWRlbHkgYXZhaWxhYmxlIGluIG90aGVyIFRQTSdzLiBJdCdzIGJldHRlciB0byAmcXVvdDtzZWFs
JnF1b3Q7IHRoZSBrZXkgdG8gdGhlIFRQTSBhbmQgdGhlbiAmcXVvdDt1bnNlYWwmcXVvdDs8L2Rp
dj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgppdCBhcyB5
b3UgbmVlZCBpdCBhbmQgdXNlIGl0IGluIHNvZnR3YXJlIGNyeXB0by4gU2VlICZxdW90O1NlYWwg
RGF0YSB0byB0aGUgVFBNJnF1b3Q7IGluIGV4YW1wbGVzOiZuYnNwOzxhIGhyZWY9Imh0dHBzOi8v
dHBtMi10b29scy5yZWFkdGhlZG9jcy5pby9lbi9zdGFibGUvbWFuL3RwbTJfY3JlYXRlLjEvIiBp
ZD0iTFBOb0xQT1dBTGlua1ByZXZpZXciPmh0dHBzOi8vdHBtMi10b29scy5yZWFkdGhlZG9jcy5p
by9lbi9zdGFibGUvbWFuL3RwbTJfY3JlYXRlLjEvPC9hPjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgY2xhc3M9Il9F
bnRpdHkgX0VUeXBlX09XQUxpbmtQcmV2aWV3IF9FSWRfT1dBTGlua1ByZXZpZXcgX0VSZWFkb25s
eV8xIj48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
PgpCaWxsPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+CjxociBzdHlsZT0iZGlz
cGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRleD0iLTEiPgo8ZGl2IGlkPSJkaXZS
cGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5
bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IFN0ZXZlbiBD
bGFyayAmbHQ7ZGF2b2xmbWFuQGdtYWlsLmNvbSZndDs8YnI+CjxiPlNlbnQ6PC9iPiBXZWRuZXNk
YXksIEZlYnJ1YXJ5IDIsIDIwMjIgMTI6MDcgUE08YnI+CjxiPlRvOjwvYj4gR2FicmllbGUgU2F0
dXJuaSAmbHQ7Z2FicmllbGUuc2F0dXJuaUB3c2Vuc2UuaXQmZ3Q7PGJyPgo8Yj5DYzo8L2I+IHRw
bTIgJmx0O3RwbTJAbGlzdHMuMDEub3JnJmd0Ozxicj4KPGI+U3ViamVjdDo8L2I+IFt0cG0yXSBS
ZTogSG93IHRvIHN0b3JlIEFFUyBrZXkgaW5zaWRlIHRoZSBUUE0gYW5kIHRoZW4gdXNlIGl0Pzwv
Zm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+CjxkaXY+CjxkaXYgZGlyPSJhdXRvIj5BcyBm
YXIgYXMgSSBrbm93LCBubyBvbmUgcHJvZHVjZXMgYSBUUE0gd2l0aCBidWxrIHN5bW1ldHJpYyBl
bmNyeXB0aW9uIGZlYXR1cmVzLiZuYnNwOyBJdCB3b3VsZCBiZSBib3RoIHNsb3cgYW5kIGxpa2Vs
eSB0byBoYXZlIGV4cG9ydCBsYXcgcHJvYmxlbXMuPC9kaXY+Cjxicj4KPGRpdiBjbGFzcz0ieF9n
bWFpbF9xdW90ZSI+CjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJ4X2dtYWlsX2F0dHIiPk9uIFdlZCwg
RmViIDIsIDIwMjIsIDk6MzIgQU0gR2FicmllbGUgU2F0dXJuaSAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmdhYnJpZWxlLnNhdHVybmlAd3NlbnNlLml0Ij5nYWJyaWVsZS5zYXR1cm5pQHdzZW5zZS5pdDwv
YT4mZ3Q7IHdyb3RlOjxicj4KPC9kaXY+CjxibG9ja3F1b3RlIGNsYXNzPSJ4X2dtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkOyBw
YWRkaW5nLWxlZnQ6MWV4Ij4KPGRpdiBkaXI9Imx0ciI+CjxkaXY+SGkgdG8gZXZlcnlib2R5LDxi
cj4KPC9kaXY+CjxkaXY+SSdtIHByZXR0eSBuZXcgdG8gdGhlIFRQTSBhbmQgbG9va2luZyBmb3Ig
YSB3YXkgdG8gc3RvcmUgYSBwcmVtYWRlIEFFUyBrZXkgaW5zaWRlIHRoZSBUUE0gYW5kIHJldHJp
ZXZlIGl0IGZvciBlbmNyeXB0aW5nIHRoZSBkYXRhIG9mIG15IGFwcGxpY2F0aW9uLiBJcyB0aGVy
ZSBhbnkgd2F5IHRvIGRvIGl0IHNpbmNlIGEgbG90IG9mIFRQTSBkb2VzIG5vdCBzdXBwb3J0IEFF
UyA/PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5UaGFuayB5b3UgZm9yIHlvdXIgdGltZTwv
ZGl2Pgo8L2Rpdj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+CnRwbTJAbGlzdHMuMDEub3Jn
PC9hPjxicj4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86
dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIi
Pgp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5m
byUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPC9ibG9ja3F1b3RlPgo8L2Rpdj4KPC9kaXY+
CjwvYm9keT4KPC9odG1sPgo=

--===============6916373251677119118==--

