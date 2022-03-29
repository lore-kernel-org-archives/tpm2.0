Content-Type: multipart/mixed; boundary="===============0810262652777481962=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: TPM2 for PKCS#11 for SoftEther Client Smart Card
Date: Tue, 29 Mar 2022 19:59:26 +0000
Message-ID: <SN6PR11MB34379448712DACDF4337F01DB81E9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20220328224640.2815.81034@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0810262652777481962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We don't provide prebuilt binaries at all, its a source distribution that c=
an be built. I've never tried tpm2-pkcs11 on windows and I have no idea wha=
t level of work it would take to get it working on Windows.

Bill
________________________________
From: duncan(a)touch-fire.com <duncan(a)touch-fire.com>
Sent: Monday, March 28, 2022 5:46 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] TPM2 for PKCS#11 for SoftEther Client Smart Card

Hi,
I have been searching for a way to use the TPM2 module already in my window=
s laptop, to use as a Smart Card for the SoftEther windows VPN client that =
I use to connect to work.

SoftEther states that it requires a PKCS#11 device driver, and when I googl=
e for this, every possible combination of TPM2 and PKCS#11 and windows poin=
ts to the tpm2-pkcs11 github project.
However, I cannot see any module / dll download link and I only see a very =
occasional mention of windows in the github issue list.

I feel like this might be a dumb question, but could I ask if there is an e=
asy way to achieve this?
If this project is only for application developers, then does anyone know o=
f any projects or products that support this? Or even if it is already part=
 of windows?
(I am assuming that I am misunderstanding something here, as this seems lik=
e there would be a huge demand for this with everyone working from home the=
se days).
Thank you!
Duncan.
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============0810262652777481962==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KV2UgZG9uJ3QgcHJvdmlkZSBwcmVidWlsdCBiaW5hcmllcyBhdCBh
bGwsIGl0cyBhIHNvdXJjZSBkaXN0cmlidXRpb24gdGhhdCBjYW4gYmUgYnVpbHQuIEkndmUgbmV2
ZXIgdHJpZWQgdHBtMi1wa2NzMTEgb24gd2luZG93cyBhbmQgSSBoYXZlIG5vIGlkZWEgd2hhdCBs
ZXZlbCBvZiB3b3JrIGl0IHdvdWxkIHRha2UgdG8gZ2V0IGl0IHdvcmtpbmcgb24gV2luZG93cy48
L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2Es
IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgo8YnI+
CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGlj
YSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+CkJp
bGw8L2Rpdj4KPGRpdiBpZD0iYXBwZW5kb25zZW5kIj48L2Rpdj4KPGhyIHN0eWxlPSJkaXNwbGF5
OmlubGluZS1ibG9jazt3aWR0aDo5OCUiIHRhYmluZGV4PSItMSI+CjxkaXYgaWQ9ImRpdlJwbHlG
d2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0i
Zm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gZHVuY2FuQHRvdWNo
LWZpcmUuY29tICZsdDtkdW5jYW5AdG91Y2gtZmlyZS5jb20mZ3Q7PGJyPgo8Yj5TZW50OjwvYj4g
TW9uZGF5LCBNYXJjaCAyOCwgMjAyMiA1OjQ2IFBNPGJyPgo8Yj5Ubzo8L2I+IHRwbTJAbGlzdHMu
MDEub3JnICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8YnI+CjxiPlN1YmplY3Q6PC9iPiBbdHBt
Ml0gVFBNMiBmb3IgUEtDUyMxMSBmb3IgU29mdEV0aGVyIENsaWVudCBTbWFydCBDYXJkPC9mb250
Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdiBjbGFzcz0iQm9keUZyYWdtZW50Ij48Zm9u
dCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4KPGRpdiBjbGFzcz0iUGxh
aW5UZXh0Ij5IaSwgPGJyPgpJIGhhdmUgYmVlbiBzZWFyY2hpbmcgZm9yIGEgd2F5IHRvIHVzZSB0
aGUgVFBNMiBtb2R1bGUgYWxyZWFkeSBpbiBteSB3aW5kb3dzIGxhcHRvcCwgdG8gdXNlIGFzIGEg
U21hcnQgQ2FyZCBmb3IgdGhlIFNvZnRFdGhlciB3aW5kb3dzIFZQTiBjbGllbnQgdGhhdCBJIHVz
ZSB0byBjb25uZWN0IHRvIHdvcmsuCjxicj4KPGJyPgpTb2Z0RXRoZXIgc3RhdGVzIHRoYXQgaXQg
cmVxdWlyZXMgYSBQS0NTIzExIGRldmljZSBkcml2ZXIsIGFuZCB3aGVuIEkgZ29vZ2xlIGZvciB0
aGlzLCBldmVyeSBwb3NzaWJsZSBjb21iaW5hdGlvbiBvZiBUUE0yIGFuZCBQS0NTIzExIGFuZCB3
aW5kb3dzIHBvaW50cyB0byB0aGUgdHBtMi1wa2NzMTEgZ2l0aHViIHByb2plY3QuCjxicj4KSG93
ZXZlciwgSSBjYW5ub3Qgc2VlIGFueSBtb2R1bGUgLyBkbGwgZG93bmxvYWQgbGluayBhbmQgSSBv
bmx5IHNlZSBhIHZlcnkgb2NjYXNpb25hbCBtZW50aW9uIG9mIHdpbmRvd3MgaW4gdGhlIGdpdGh1
YiBpc3N1ZSBsaXN0Lgo8YnI+Cjxicj4KSSBmZWVsIGxpa2UgdGhpcyBtaWdodCBiZSBhIGR1bWIg
cXVlc3Rpb24sIGJ1dCBjb3VsZCBJIGFzayBpZiB0aGVyZSBpcyBhbiBlYXN5IHdheSB0byBhY2hp
ZXZlIHRoaXM/Cjxicj4KSWYgdGhpcyBwcm9qZWN0IGlzIG9ubHkgZm9yIGFwcGxpY2F0aW9uIGRl
dmVsb3BlcnMsIHRoZW4gZG9lcyBhbnlvbmUga25vdyBvZiBhbnkgcHJvamVjdHMgb3IgcHJvZHVj
dHMgdGhhdCBzdXBwb3J0IHRoaXM/IE9yIGV2ZW4gaWYgaXQgaXMgYWxyZWFkeSBwYXJ0IG9mIHdp
bmRvd3M/Cjxicj4KKEkgYW0gYXNzdW1pbmcgdGhhdCBJIGFtIG1pc3VuZGVyc3RhbmRpbmcgc29t
ZXRoaW5nIGhlcmUsIGFzIHRoaXMgc2VlbXMgbGlrZSB0aGVyZSB3b3VsZCBiZSBhIGh1Z2UgZGVt
YW5kIGZvciB0aGlzIHdpdGggZXZlcnlvbmUgd29ya2luZyBmcm9tIGhvbWUgdGhlc2UgZGF5cyku
Cjxicj4KVGhhbmsgeW91ITxicj4KRHVuY2FuLjxicj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlz
dHMuMDEub3JnPGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVA
bGlzdHMuMDEub3JnPGJyPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2lu
dGVybmFsX25hbWUpczxicj4KPC9kaXY+Cjwvc3Bhbj48L2ZvbnQ+PC9kaXY+CjwvYm9keT4KPC9o
dG1sPgo=

--===============0810262652777481962==--

