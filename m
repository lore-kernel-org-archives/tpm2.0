Content-Type: multipart/mixed; boundary="===============2737217736702866440=="
MIME-Version: 1.0
From: Lihui <leehui_hrbeu71102 at 163.com>
Subject: Re: [tpm2] when SPI controller is DMA mode, TPM can not work
Date: Wed, 27 Feb 2019 11:20:35 +0800
Message-ID: <E5FE5267-A06E-42EA-B180-A0D2BAB3EAB8@163.com>
In-Reply-To: 83b85a63a25642e9bae1c881b56a82d5@zhaoxin.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2737217736702866440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi sherry,
It seems that your kernel does NOT know there is tpm device using space   F=
ED40000-FED44000.
Check your acpi table=EF=BC=8Csee if there is a =E2=80=9Ddeclaration=E2=80=
=9D for tpm. Ask your bios team for help.

Refer to =

TCG ACPIGeneralSpecification =

TCG PC Client Platform TPM Profile PTP Specification =

Linux tpm driver =

for more information.

Best Regards,
Hui

> On Feb 26, 2019, at 16:03, Sherry Zhang(BJ-RD) <SherryZhang(a)zhaoxin.com=
> wrote:
> =

> HI All,
> X86, kernel4.16:
> SPI port0 flash is used to boot BIOS.
> SPI port1 flash is a device.
> SPI port2 is connected with TPM.
>  =

>  =

> I set the SPI controller is DMA mode, port0/1 flash can work well.
> devmem 0xfed40000
> OS hang and reboot can not work .So I poweroff.
> Does anyone know what is cause?
> =

> =

> =E4=BF=9D=E5=AF=86=E5=A3=B0=E6=98=8E=EF=BC=9A
> =E6=9C=AC=E9=82=AE=E4=BB=B6=E5=90=AB=E6=9C=89=E4=BF=9D=E5=AF=86=E6=88=96=
=E4=B8=93=E6=9C=89=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=8C=87=E5=
=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E4=BD=BF=E7=94=A8=E3=80=82=E4=B8=A5=E7=A6=
=81=E5=AF=B9=E6=9C=AC=E9=82=AE=E4=BB=B6=E6=88=96=E5=85=B6=E5=86=85=E5=AE=B9=
=E5=81=9A=E4=BB=BB=E4=BD=95=E6=9C=AA=E7=BB=8F=E6=8E=88=E6=9D=83=E7=9A=84=E6=
=9F=A5=E9=98=85=E3=80=81=E4=BD=BF=E7=94=A8=E3=80=81=E5=A4=8D=E5=88=B6=E6=88=
=96=E8=BD=AC=E5=8F=91=E3=80=82
> CONFIDENTIAL NOTE:
> This email contains confidential or legally privileged information and is=
 for the sole use of its intended recipient. Any unauthorized review, use, =
copying or forwarding of this email or the content of this email is strictl=
y prohibited.
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>=20

--===============2737217736702866440==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXY+SGkgc2hl
cnJ5LDwvZGl2PjxkaXY+SXQgc2VlbXMgdGhhdCB5b3VyIGtlcm5lbCBkb2VzIE5PVCBrbm93IHRo
ZXJlIGlzIHRwbSBkZXZpY2UgdXNpbmcgc3BhY2UgJm5ic3A7IEZFRDQwMDAwLUZFRDQ0MDAwLjwv
ZGl2PkNoZWNrIHlvdXIgYWNwaSB0YWJsZe+8jHNlZSBpZiB0aGVyZSBpcyBhIOKAnWRlY2xhcmF0
aW9u4oCdIGZvciB0cG0uIEFzayB5b3VyIGJpb3MgdGVhbSBmb3IgaGVscC48ZGl2Pjxicj48ZGl2
PlJlZmVyIHRvJm5ic3A7PC9kaXY+PGRpdj5UQ0cgQUNQSUdlbmVyYWxTcGVjaWZpY2F0aW9uJm5i
c3A7PC9kaXY+PGRpdj5UQ0cgUEMgQ2xpZW50IFBsYXRmb3JtIFRQTSBQcm9maWxlIFBUUCBTcGVj
aWZpY2F0aW9uJm5ic3A7PC9kaXY+PGRpdj5MaW51eCB0cG0gZHJpdmVyJm5ic3A7PC9kaXY+PGRp
dj5mb3IgbW9yZSBpbmZvcm1hdGlvbi48YnI+PGJyPjxkaXYgaWQ9IkFwcGxlTWFpbFNpZ25hdHVy
ZSIgZGlyPSJsdHIiPkJlc3QgUmVnYXJkcyw8ZGl2Pkh1aTwvZGl2PjwvZGl2PjxkaXYgZGlyPSJs
dHIiPjxicj5PbiBGZWIgMjYsIDIwMTksIGF0IDE2OjAzLCBTaGVycnkgWmhhbmcoQkotUkQpICZs
dDs8YSBocmVmPSJtYWlsdG86U2hlcnJ5WmhhbmdAemhhb3hpbi5jb20iPlNoZXJyeVpoYW5nQHpo
YW94aW4uY29tPC9hPiZndDsgd3JvdGU6PGJyPjxicj48L2Rpdj48YmxvY2txdW90ZSB0eXBlPSJj
aXRlIj48ZGl2IGRpcj0ibHRyIj4KCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29u
dGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXVzLWFzY2lpIj4KPG1ldGEgbmFtZT0iR2VuZXJhdG9y
IiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQgbWVkaXVtKSI+CjxzdHlsZT48
IS0tCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8KQGZvbnQtZmFjZQoJe2ZvbnQtZmFtaWx5OiJDYW1i
cmlhIE1hdGgiOwoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9CkBmb250LWZhY2UKCXtm
b250LWZhbWlseTpcN0I0OVw3RUJGOwoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9CkBm
b250LWZhY2UKCXtmb250LWZhbWlseToiXEBcN0I0OVw3RUJGIjsKCXBhbm9zZS0xOjIgMSA2IDAg
MyAxIDEgMSAxIDE7fQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLwpwLk1zb05vcm1hbCwgbGkuTXNv
Tm9ybWFsLCBkaXYuTXNvTm9ybWFsCgl7bWFyZ2luOjBjbTsKCW1hcmdpbi1ib3R0b206LjAwMDFw
dDsKCXRleHQtYWxpZ246anVzdGlmeTsKCXRleHQtanVzdGlmeTppbnRlci1pZGVvZ3JhcGg7Cglm
b250LXNpemU6MTAuNXB0OwoJZm9udC1mYW1pbHk6XDdCNDlcN0VCRjt9CmE6bGluaywgc3Bhbi5N
c29IeXBlcmxpbmsKCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7Cgljb2xvcjojMDU2M0MxOwoJdGV4
dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9CmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xs
b3dlZAoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsKCWNvbG9yOiM5NTRGNzI7Cgl0ZXh0LWRlY29y
YXRpb246dW5kZXJsaW5lO30Kc3Bhbi5FbWFpbFN0eWxlMTcKCXttc28tc3R5bGUtdHlwZTpwZXJz
b25hbC1jb21wb3NlOwoJZm9udC1mYW1pbHk6XDdCNDlcN0VCRjsKCWNvbG9yOndpbmRvd3RleHQ7
fQouTXNvQ2hwRGVmYXVsdAoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5OwoJZm9udC1mYW1p
bHk6XDdCNDlcN0VCRjt9Ci8qIFBhZ2UgRGVmaW5pdGlvbnMgKi8KQHBhZ2UgV29yZFNlY3Rpb24x
Cgl7c2l6ZTo2MTIuMHB0IDc5Mi4wcHQ7CgltYXJnaW46NzIuMHB0IDkwLjBwdCA3Mi4wcHQgOTAu
MHB0O30KZGl2LldvcmRTZWN0aW9uMQoJe3BhZ2U6V29yZFNlY3Rpb24xO30KLS0+PC9zdHlsZT48
IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3Bp
ZG1heD0iMTAyNiIgLz4KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+
CjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9
IjEiIC8+CjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4KCgo8ZGl2IGNsYXNzPSJX
b3JkU2VjdGlvbjEiPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+SEkg
QWxsLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFu
Zz0iRU4tVVMiPlg4Niwga2VybmVsNC4xNjo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5TUEkgcG9ydDAgZmxhc2ggaXMgdXNlZCB0
byBib290IEJJT1MuPG86cD48L286cD48L3NwYW4+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBsYW5nPSJFTi1VUyI+U1BJIHBvcnQxIGZsYXNoIGlzIGEgZGV2aWNlLjxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPlNQSSBw
b3J0MiBpcyBjb25uZWN0ZWQgd2l0aCBUUE0uPG86cD48L286cD48L3NwYW4+PC9wPgo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+
SSBzZXQgdGhlIFNQSSBjb250cm9sbGVyIGlzIERNQSBtb2RlLCBwb3J0MC8xIGZsYXNoIGNhbiB3
b3JrIHdlbGwuPG86cD48L286cD48L3NwYW4+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBsYW5nPSJFTi1VUyI+ZGV2bWVtIDB4ZmVkNDAwMDA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+Cjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5PUyBoYW5nIGFuZCByZWJvb3Qg
Y2FuIG5vdCB3b3JrIC5TbyBJIHBvd2Vyb2ZmLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPkRvZXMgYW55b25lIGtub3cgd2hhdCBp
cyBjYXVzZT88bzpwPjwvbzpwPjwvc3Bhbj48L3A+CjwvZGl2Pgo8cD48L3A+Cjxicj4KPGJyPgo8
ZGl2IHN0eWxlPSJmb250LXNpemU6MTBwdDsgbGluZS1oZWlnaHQ6MTBwdDsgZm9udC1mYW1pbHk6
ICflrovkvZMnO2NvbG9yOiM1OTU5NTk7Ij7kv53lr4blo7DmmI7vvJo8L2Rpdj4KPGRpdiBzdHls
ZT0iZm9udC1zaXplOjEwcHQ7IGxpbmUtaGVpZ2h0OjEwcHQ7IGZvbnQtZmFtaWx5OiAn5a6L5L2T
Jztjb2xvcjojNTk1OTU5OyI+5pys6YKu5Lu25ZCr5pyJ5L+d5a+G5oiW5LiT5pyJ5L+h5oGv77yM
5LuF5L6b5oyH5a6a5pS25Lu25Lq65L2/55So44CC5Lil56aB5a+55pys6YKu5Lu25oiW5YW25YaF
5a655YGa5Lu75L2V5pyq57uP5o6I5p2D55qE5p+l6ZiF44CB5L2/55So44CB5aSN5Yi25oiW6L2s
5Y+R44CCPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxMHB0OyBsaW5lLWhlaWdodDoxMHB0
OyBmb250LWZhbWlseTogJ1RpbWVzIE5ldyBSb21hbic7Y29sb3I6IzU5NTk1OTsiPgo8aT5DT05G
SURFTlRJQUwgTk9URTogPC9pPjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LXNpemU6MTBwdDsgbGlu
ZS1oZWlnaHQ6MTBwdDsgZm9udC1mYW1pbHk6ICdUaW1lcyBOZXcgUm9tYW4nO2NvbG9yOiM1OTU5
NTk7Ij4KPGk+VGhpcyBlbWFpbCBjb250YWlucyBjb25maWRlbnRpYWwgb3IgbGVnYWxseSBwcml2
aWxlZ2VkIGluZm9ybWF0aW9uIGFuZCBpcyBmb3IgdGhlIHNvbGUgdXNlIG9mIGl0cyBpbnRlbmRl
ZCByZWNpcGllbnQuIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIGNvcHlpbmcgb3IgZm9y
d2FyZGluZyBvZiB0aGlzIGVtYWlsIG9yIHRoZSBjb250ZW50IG9mIHRoaXMgZW1haWwgaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZC48L2k+PC9kaXY+CgoKCjwvZGl2PjwvYmxvY2txdW90ZT48YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIj48ZGl2IGRpcj0ibHRyIj48c3Bhbj5fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXzwvc3Bhbj48YnI+PHNwYW4+dHBtMiBtYWlsaW5n
IGxpc3Q8L3NwYW4+PGJyPjxzcGFuPjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyI+
dHBtMkBsaXN0cy4wMS5vcmc8L2E+PC9zcGFuPjxicj48c3Bhbj48YSBocmVmPSJodHRwczovL2xp
c3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3RwbTIiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21h
aWxtYW4vbGlzdGluZm8vdHBtMjwvYT48L3NwYW4+PGJyPjxzcGFuPjwvc3Bhbj48YnI+PC9kaXY+
PC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjwvYm9keT48L2h0bWw+
--===============2737217736702866440==--

