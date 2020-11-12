Content-Type: multipart/mixed; boundary="===============0922681325735863854=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] Re: TPM within Containers
Date: Thu, 12 Nov 2020 10:19:08 +0000
Message-ID: <CAKrSGQQSKG3PHHGJO-GEx8=fNUDFDCUE7pUrmLyP3b6C74zrsA@mail.gmail.com>
In-Reply-To: 20201112013022.2865.84931@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0922681325735863854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Take a look at our CI (you just need to ignore the rust specific tests)

https://github.com/keylime/rust-keylime/commit/2added70c8b7b7f06f318ee27ed7=
6549301afcf0

On Thu, 12 Nov 2020, 01:30 Eduardo Falc=C3=A3o, <eduardolfalcao(a)gmail.com=
> wrote:

> Hello everyone
>
> Does anyone know any tutorial to deploy TPM-enabled containers?
> I was looking for some example with vTPM, instead of simulation tools like
> IBM and others.
> In addition, it seems that enabling IMA in containers is a challenging
> task...
> I came across 2 papers, "Container-IMA: A privacy-preserving Integrity
> Measurement Architecture for Containers" and " Integrity verification of
> docker containers for a lightweight cloud environment", but there is no
> tutorial on how to deploy such a container.
>
> Any help is appreciated.
>
> Best regards.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>

--===============0922681325735863854==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPlRha2UgYSBsb29rIGF0IG91ciBDSSAoeW91IGp1c3QgbmVlZCB0byBp
Z25vcmUgdGhlIHJ1c3Qgc3BlY2lmaWMgdGVzdHMpPGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48
ZGl2IGRpcj0iYXV0byI+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2tleWxpbWUvcnVzdC1r
ZXlsaW1lL2NvbW1pdC8yYWRkZWQ3MGM4YjdiN2YwNmYzMThlZTI3ZWQ3NjU0OTMwMWFmY2YwIj5o
dHRwczovL2dpdGh1Yi5jb20va2V5bGltZS9ydXN0LWtleWxpbWUvY29tbWl0LzJhZGRlZDcwYzhi
N2I3ZjA2ZjMxOGVlMjdlZDc2NTQ5MzAxYWZjZjA8L2E+PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9u
IFRodSwgMTIgTm92IDIwMjAsIDAxOjMwIEVkdWFyZG8gRmFsY8OjbywgJmx0OzxhIGhyZWY9Im1h
aWx0bzplZHVhcmRvbGZhbGNhb0BnbWFpbC5jb20iPmVkdWFyZG9sZmFsY2FvQGdtYWlsLmNvbTwv
YT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5n
LWxlZnQ6MWV4Ij5IZWxsbyBldmVyeW9uZTxicj4KPGJyPgpEb2VzIGFueW9uZSBrbm93IGFueSB0
dXRvcmlhbCB0byBkZXBsb3kgVFBNLWVuYWJsZWQgY29udGFpbmVycz8gPGJyPgpJIHdhcyBsb29r
aW5nIGZvciBzb21lIGV4YW1wbGUgd2l0aCB2VFBNLCBpbnN0ZWFkIG9mIHNpbXVsYXRpb24gdG9v
bHMgbGlrZSBJQk0gYW5kIG90aGVycy48YnI+CkluIGFkZGl0aW9uLCBpdCBzZWVtcyB0aGF0IGVu
YWJsaW5nIElNQSBpbiBjb250YWluZXJzIGlzIGEgY2hhbGxlbmdpbmcgdGFzay4uLjxicj4KSSBj
YW1lIGFjcm9zcyAyIHBhcGVycywgJnF1b3Q7Q29udGFpbmVyLUlNQTogQSBwcml2YWN5LXByZXNl
cnZpbmcgSW50ZWdyaXR5IE1lYXN1cmVtZW50IEFyY2hpdGVjdHVyZSBmb3IgQ29udGFpbmVycyZx
dW90OyBhbmQgJnF1b3Q7IEludGVncml0eSB2ZXJpZmljYXRpb24gb2YgZG9ja2VyIGNvbnRhaW5l
cnMgZm9yIGEgbGlnaHR3ZWlnaHQgY2xvdWQgZW52aXJvbm1lbnQmcXVvdDssIGJ1dCB0aGVyZSBp
cyBubyB0dXRvcmlhbCBvbiBob3cgdG8gZGVwbG95IHN1Y2ggYSBjb250YWluZXIuPGJyPgo8YnI+
CkFueSBoZWxwIGlzIGFwcHJlY2lhdGVkLjxicj4KPGJyPgpCZXN0IHJlZ2FyZHMuPGJyPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWls
aW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayIgcmVsPSJub3JlZmVycmVyIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+ClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMu
MDEub3JnIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj50cG0yLWxlYXZlQGxpc3Rz
LjAxLm9yZzwvYT48YnI+CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50
ZXJuYWxfbmFtZSlzPGJyPgo8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============0922681325735863854==--

