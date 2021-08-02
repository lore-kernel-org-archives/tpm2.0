Content-Type: multipart/mixed; boundary="===============4712051203779360191=="
MIME-Version: 1.0
From: joseph at zeronsoftn.com
Subject: [tpm2] Re: Is the tpm2_create command safe against sniffing attacks?
Date: Tue, 03 Aug 2021 01:41:22 +0300
Message-ID: <1627944082.541093249@f20.my.com>
In-Reply-To: OF8BBF26A9.0B99F84B-ON00258725.00602982-85258725.006843B9@ibm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4712051203779360191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


"salted session" was the keyword I was looking for!
Really thank you :) =ED=99=94=EC=9A=94=EC=9D=BC, 03 8=EC=9B=94 2021, 03:59=
=EC=98=A4=EC=A0=84 +09:00 =EB=B0=9C=EC=8B=A0 Kenneth Goldman  kgoldman(a)us=
.ibm.com :

>"Steven Clark" < davolfman(a)gmail.com> wrote on 08/02/2021 01:26:56 PM:
>
> I think it may be an optional standard but my TPM has some certs =

> permanently stored in nv-indices in the 0x1c0000x range that can be =

> checked against the manufacturer cert.=C2=A0 I haven't=C2=A0learned how t=
o =

> leverage those into trusted parameter encryption keys yet but they =

> should be able to verify there's a real TPM at the other end at the =

> very least (and more if you learn to use them correctly).
>
>The EK certificates in NV are in theory optional, but every TPM
>I have encountered has them.
>
>Checking the certificate against the manufacturer's CA is
>a standard crypto library function.
>
>Once you have an authentic EK, create a salted session using
>the EK.
>
>Once you have the salted session, set the encrypt and/or decrypt bit
>when running the command.
>
>Underneath, there's some complicated crypto, but it's all
>hidden from the application.
>
>_______________________________________________
>tpm2 mailing list --  tpm2(a)lists.01.org
>To unsubscribe send an email to  tpm2-leave(a)lists.01.org
>%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============4712051203779360191==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PC9oZWFkPjxib2R5PjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IiBkaXI9
Imx0ciI+InNhbHRlZCBzZXNzaW9uIiB3YXMgdGhlIGtleXdvcmQgSSB3YXMgbG9va2luZyBmb3Ih
PGJyPgpSZWFsbHkgdGhhbmsgeW91IDopPC9wPgrtmZTsmpTsnbwsIDAzIDjsm5QgMjAyMSwgMDM6
NTnsmKTsoIQgKzA5OjAwIOuwnOyLoCBLZW5uZXRoIEdvbGRtYW4gPGEgaHJlZj0ibWFpbHRvOmtn
b2xkbWFuQHVzLmlibS5jb20iPmtnb2xkbWFuQHVzLmlibS5jb208L2E+Ojxicj48YnI+PGJsb2Nr
cXVvdGUgaWQ9Im1haWwtYXBwLWF1dG8tcXVvdGUiIGNpdGU9IjE2Mjc5MzA3NDIwMDAwMDA1NjA2
IiBzdHlsZT0iYm9yZGVyLWxlZnQ6MXB4IHNvbGlkICNGQzJDMzg7IG1hcmdpbjowcHggMHB4IDBw
eCAxMHB4OyBwYWRkaW5nOjBweCAwcHggMHB4IDEwcHg7Ij4KCQoKCgogICAgCgoKCgoKCgoKCgkK
CQoKCgkKCQoJCgkKCQoKCQoJCgoJCgkKCgoKPGRpdiBjbGFzcz0ianMtaGVscGVyIGpzLXJlYWRt
c2ctbXNnIj4KCTxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PC9zdHlsZT4KIAk8ZGl2PgoJCTxiYXNl
IHRhcmdldD0iX3NlbGYiIGhyZWY9Imh0dHBzOi8vZS1hai5teS5jb20vIj4KCQkKCQkJPGRpdiBp
ZD0ic3R5bGVfMTYyNzkzMDc0MjAwMDAwMDU2MDZfQk9EWSI+PGRpdiBjbGFzcz0iY2xfOTM4NjU2
Ij48cD48dHQ+PGZvbnQgc2l6ZT0iMiI+IlN0ZXZlbiBDbGFyayIgJmx0OzxhIGhyZWY9Im1haWx0
bzpkYXZvbGZtYW5AZ21haWwuY29tIj5kYXZvbGZtYW5AZ21haWwuY29tPC9hPiZndDsgd3JvdGUg
b24gMDgvMDIvMjAyMSAwMToyNjo1NiBQTTo8YnI+PGJyPiZndDsgSSB0aGluayBpdCBtYXkgYmUg
YW4gb3B0aW9uYWwgc3RhbmRhcmQgYnV0IG15IFRQTSBoYXMgc29tZSBjZXJ0cyA8YnI+Jmd0OyBw
ZXJtYW5lbnRseSBzdG9yZWQgaW4gbnYtaW5kaWNlcyBpbiB0aGUgMHgxYzAwMDB4IHJhbmdlIHRo
YXQgY2FuIGJlIDxicj4mZ3Q7IGNoZWNrZWQgYWdhaW5zdCB0aGUgbWFudWZhY3R1cmVyIGNlcnQu
Jm5ic3A7IEkgaGF2ZW4ndCZuYnNwO2xlYXJuZWQgaG93IHRvIDxicj4mZ3Q7IGxldmVyYWdlIHRo
b3NlIGludG8gdHJ1c3RlZCBwYXJhbWV0ZXIgZW5jcnlwdGlvbiBrZXlzIHlldCBidXQgdGhleSA8
YnI+Jmd0OyBzaG91bGQgYmUgYWJsZSB0byB2ZXJpZnkgdGhlcmUncyBhIHJlYWwgVFBNIGF0IHRo
ZSBvdGhlciBlbmQgYXQgdGhlIDxicj4mZ3Q7IHZlcnkgbGVhc3QgKGFuZCBtb3JlIGlmIHlvdSBs
ZWFybiB0byB1c2UgdGhlbSBjb3JyZWN0bHkpLjwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6
ZT0iMiI+PGJyPlRoZSBFSyBjZXJ0aWZpY2F0ZXMgaW4gTlYgYXJlIGluIHRoZW9yeSBvcHRpb25h
bCwgYnV0IGV2ZXJ5IFRQTTwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+SSBoYXZl
IGVuY291bnRlcmVkIGhhcyB0aGVtLjwvZm9udD48L3R0Pjxicj48YnI+PHR0Pjxmb250IHNpemU9
IjIiPkNoZWNraW5nIHRoZSBjZXJ0aWZpY2F0ZSBhZ2FpbnN0IHRoZSBtYW51ZmFjdHVyZXIncyBD
QSBpczwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+YSBzdGFuZGFyZCBjcnlwdG8g
bGlicmFyeSBmdW5jdGlvbi48L2ZvbnQ+PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5P
bmNlIHlvdSBoYXZlIGFuIGF1dGhlbnRpYyBFSywgY3JlYXRlIGEgc2FsdGVkIHNlc3Npb24gdXNp
bmc8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPnRoZSBFSy48L2ZvbnQ+PC90dD48
YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5PbmNlIHlvdSBoYXZlIHRoZSBzYWx0ZWQgc2Vzc2lv
biwgc2V0IHRoZSBlbmNyeXB0IGFuZC9vciBkZWNyeXB0IGJpdDwvZm9udD48L3R0Pjxicj48dHQ+
PGZvbnQgc2l6ZT0iMiI+d2hlbiBydW5uaW5nIHRoZSBjb21tYW5kLjwvZm9udD48L3R0Pjxicj48
YnI+PHR0Pjxmb250IHNpemU9IjIiPlVuZGVybmVhdGgsIHRoZXJlJ3Mgc29tZSBjb21wbGljYXRl
ZCBjcnlwdG8sIGJ1dCBpdCdzIGFsbDwvZm9udD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+
aGlkZGVuIGZyb20gdGhlIGFwcGxpY2F0aW9uLjwvZm9udD48L3R0Pjxicj4KPGJyPgoKPC9wPjwv
ZGl2PjwvZGl2PgoJCQk8ZGl2Pl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciPnRw
bTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShj
Z2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Rpdj4KCQkKCQk8YmFzZSB0YXJnZXQ9Il9zZWxm
IiBocmVmPSJodHRwczovL2UtYWoubXkuY29tLyI+Cgk8L2Rpdj4KCgkKPC9kaXY+CgoKPC9ibG9j
a3F1b3RlPgo8ZGl2Pjxicj48YnI+PGJyPjxpbWcgc3JjPSJodHRwczovL21haWwuemVyb25zb2Z0
bi5jb20vbXRodW1ibmFpbC80ZTY0NWIwNS1mOTQ4LTQwOTAtOGE3ZC1hMTE5NmYxZmFmYmUucG5n
IiBzdHlsZT0ibWF4LWhlaWdodDogMzJweCI+PC9kaXY+PC9ib2R5PjwvaHRtbD4=
--===============4712051203779360191==--

