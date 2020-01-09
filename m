Content-Type: multipart/mixed; boundary="===============3707536107001380729=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: some questions about Identity
Date: Thu, 09 Jan 2020 19:43:57 +0100
Message-ID: <CAJ8N_u-f9F50HpHJzGZVTgdqV5PRobOs6CA5W04M0FOqB71yFA@mail.gmail.com>
In-Reply-To: 18a6bd1e-30cb-2ed5-7f3d-f9ab40b8ed46@uvensys.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3707536107001380729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dell should keep tab on all Endorsement Certificates that their computers
comes with and give you that list.

You then check for a valid Endorsement cert as part of enrollment.

- Niklas

On Thu, Jan 9, 2020, 09:34 Steffen Schwebel <s.schwebel(a)uvensys.de> wrote:

> Hello,
>
> Currently I'm helping a company to roll-out tpm2 support for their Linux
> Laptops.
> These are mainly Dell Laptops and they come with activate TPM and secure
> boot.
>
> Everything working nicely so far.
> Right now Im looking for a way to confirm that the device is really the
> one Dell provided to us.
> Im still waiting for an answer on Dell for that but Im assuming it
> should be possible to identify any given system by the Key the OEM
> deployed.
>
> Am I correct in assuming that? What would be the correct way to do that?
>
> I hope I'm asking this questions in the right mailing list.
> This is my first message to the group.
>
> Regards,
> Steffen
>
> --
> Steffen Schwebel
> Mail: s.schwebel(a)uvensys.de
> uvensys GmbH
>
> Firmensitz und Sitz der Gesellschaft:
> uvensys GmbH
> Schorbachstra=C3=9Fe 11
> 35510 Butzbach
>
> HRB: AG Friedberg, 7780
> USt-Id: DE282879294
>
> Gesch=C3=A4ftsf=C3=BChrer:
> Dr. Thomas Licht, t.licht(a)uvensys.de
> Volker Lieder, v.lieder(a)uvensys.de
>
> Mail: info(a)uvensys.de
> Internet: www.uvensys.de
>
> Durchwahl: 06033 - 18 19 225
> Hotline: 06033 - 18 19 288
> Zentrale: 06033 - 18 19 20
> Fax: 06033 - 18 19 299
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Jegliche Stellungnahmen und Meinungen dieser E-Mail sind
> alleine die des Autors und nicht notwendigerweise die der
> Firma. Falls erforderlich, k=C3=B6nnen Sie eine gesonderte
> schriftliche Best=C3=A4tigung anfordern.
>
> Any views or opinions presented in this email are solely
> those of the author and do not necessarily represent those
> of the company. If verification is required please request
> a hard-copy version.
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3707536107001380729==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkRlbGwgc2hvdWxkIGtlZXAgdGFiIG9uIGFsbCBFbmRvcnNlbWVudCBD
ZXJ0aWZpY2F0ZXMgdGhhdCB0aGVpciBjb21wdXRlcnMgY29tZXMgd2l0aCBhbmQgZ2l2ZSB5b3Ug
dGhhdCBsaXN0LsKgPGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+WW91
IHRoZW4gY2hlY2sgZm9yIGEgdmFsaWQgRW5kb3JzZW1lbnQgY2VydCBhcyBwYXJ0IG9mIGVucm9s
bG1lbnQuwqA8L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj4t
IE5pa2xhczwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9
Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFRodSwgSmFuIDksIDIwMjAsIDA5OjM0IFN0ZWZm
ZW4gU2Nod2ViZWwgJmx0OzxhIGhyZWY9Im1haWx0bzpzLnNjaHdlYmVsQHV2ZW5zeXMuZGUiPnMu
c2Nod2ViZWxAdXZlbnN5cy5kZTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDox
cHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5IZWxsbyw8YnI+Cjxicj4KQ3VycmVudGx5
IEkmIzM5O20gaGVscGluZyBhIGNvbXBhbnkgdG8gcm9sbC1vdXQgdHBtMiBzdXBwb3J0IGZvciB0
aGVpciBMaW51eDxicj4KTGFwdG9wcy48YnI+ClRoZXNlIGFyZSBtYWlubHkgRGVsbCBMYXB0b3Bz
IGFuZCB0aGV5IGNvbWUgd2l0aCBhY3RpdmF0ZSBUUE0gYW5kIHNlY3VyZTxicj4KYm9vdC48YnI+
Cjxicj4KRXZlcnl0aGluZyB3b3JraW5nIG5pY2VseSBzbyBmYXIuPGJyPgpSaWdodCBub3cgSW0g
bG9va2luZyBmb3IgYSB3YXkgdG8gY29uZmlybSB0aGF0IHRoZSBkZXZpY2UgaXMgcmVhbGx5IHRo
ZTxicj4Kb25lIERlbGwgcHJvdmlkZWQgdG8gdXMuPGJyPgpJbSBzdGlsbCB3YWl0aW5nIGZvciBh
biBhbnN3ZXIgb24gRGVsbCBmb3IgdGhhdCBidXQgSW0gYXNzdW1pbmcgaXQ8YnI+CnNob3VsZCBi
ZSBwb3NzaWJsZSB0byBpZGVudGlmeSBhbnkgZ2l2ZW4gc3lzdGVtIGJ5IHRoZSBLZXkgdGhlIE9F
TSBkZXBsb3llZC48YnI+Cjxicj4KQW0gSSBjb3JyZWN0IGluIGFzc3VtaW5nIHRoYXQ/IFdoYXQg
d291bGQgYmUgdGhlIGNvcnJlY3Qgd2F5IHRvIGRvIHRoYXQ/PGJyPgo8YnI+CkkgaG9wZSBJJiMz
OTttIGFza2luZyB0aGlzIHF1ZXN0aW9ucyBpbiB0aGUgcmlnaHQgbWFpbGluZyBsaXN0Ljxicj4K
VGhpcyBpcyBteSBmaXJzdCBtZXNzYWdlIHRvIHRoZSBncm91cC48YnI+Cjxicj4KUmVnYXJkcyw8
YnI+ClN0ZWZmZW48YnI+Cjxicj4KLS0gPGJyPgpTdGVmZmVuIFNjaHdlYmVsPGJyPgpNYWlsOiA8
YSBocmVmPSJtYWlsdG86cy5zY2h3ZWJlbEB1dmVuc3lzLmRlIiB0YXJnZXQ9Il9ibGFuayIgcmVs
PSJub3JlZmVycmVyIj5zLnNjaHdlYmVsQHV2ZW5zeXMuZGU8L2E+PGJyPgp1dmVuc3lzIEdtYkg8
YnI+Cjxicj4KRmlybWVuc2l0eiB1bmQgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0Ojxicj4KdXZlbnN5
cyBHbWJIPGJyPgpTY2hvcmJhY2hzdHJhw59lIDExPGJyPgozNTUxMCBCdXR6YmFjaDxicj4KPGJy
PgpIUkI6IEFHIEZyaWVkYmVyZywgNzc4MDxicj4KVVN0LUlkOiBERTI4Mjg3OTI5NDxicj4KPGJy
PgpHZXNjaMOkZnRzZsO8aHJlcjo8YnI+CkRyLiBUaG9tYXMgTGljaHQsIDxhIGhyZWY9Im1haWx0
bzp0LmxpY2h0QHV2ZW5zeXMuZGUiIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnQu
bGljaHRAdXZlbnN5cy5kZTwvYT48YnI+ClZvbGtlciBMaWVkZXIsIDxhIGhyZWY9Im1haWx0bzp2
LmxpZWRlckB1dmVuc3lzLmRlIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj52Lmxp
ZWRlckB1dmVuc3lzLmRlPC9hPjxicj4KPGJyPgpNYWlsOiA8YSBocmVmPSJtYWlsdG86aW5mb0B1
dmVuc3lzLmRlIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5pbmZvQHV2ZW5zeXMu
ZGU8L2E+PGJyPgpJbnRlcm5ldDogPGEgaHJlZj0iaHR0cDovL3d3dy51dmVuc3lzLmRlIiByZWw9
Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnd3dy51dmVuc3lzLmRlPC9h
Pjxicj4KPGJyPgpEdXJjaHdhaGw6IDA2MDMzIC0gMTggMTkgMjI1PGJyPgpIb3RsaW5lOiAwNjAz
MyAtIDE4IDE5IDI4ODxicj4KWmVudHJhbGU6IDA2MDMzIC0gMTggMTkgMjA8YnI+CkZheDogMDYw
MzMgLSAxOCAxOSAyOTk8YnI+Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT08YnI+Cjxicj4KSmVnbGljaGUgU3RlbGx1bmduYWhtZW4gdW5k
IE1laW51bmdlbiBkaWVzZXIgRS1NYWlsIHNpbmQ8YnI+CmFsbGVpbmUgZGllIGRlcyBBdXRvcnMg
dW5kIG5pY2h0IG5vdHdlbmRpZ2Vyd2Vpc2UgZGllIGRlcjxicj4KRmlybWEuIEZhbGxzIGVyZm9y
ZGVybGljaCwga8O2bm5lbiBTaWUgZWluZSBnZXNvbmRlcnRlPGJyPgpzY2hyaWZ0bGljaGUgQmVz
dMOkdGlndW5nIGFuZm9yZGVybi48YnI+Cjxicj4KQW55IHZpZXdzIG9yIG9waW5pb25zIHByZXNl
bnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHk8YnI+CnRob3NlIG9mIHRoZSBhdXRob3IgYW5k
IGRvIG5vdCBuZWNlc3NhcmlseSByZXByZXNlbnQgdGhvc2U8YnI+Cm9mIHRoZSBjb21wYW55LiBJ
ZiB2ZXJpZmljYXRpb24gaXMgcmVxdWlyZWQgcGxlYXNlIHJlcXVlc3Q8YnI+CmEgaGFyZC1jb3B5
IHZlcnNpb24uPGJyPgo8YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTJAbGlzdHMu
MDEub3JnPC9hPjxicj4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJt
YWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVm
ZXJyZXIiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xp
c3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============3707536107001380729==--

