Content-Type: multipart/mixed; boundary="===============3118075305286394938=="
MIME-Version: 1.0
From: Ashok Kumar <ashokar.1980 at gmail.com>
Subject: [tpm2] Re: Failed to initialize tcti context: 0x1
Date: Thu, 26 Mar 2020 15:34:47 +0530
Message-ID: <CAE8e83QOwLDB51Kpejdjfi25gcHQSSSbPgHHg==8T-6L5g3CRQ@mail.gmail.com>
In-Reply-To: CAA3rH8YO-pha4Etyjx9iv7559ZDxOOQYfZwAXM=6fNQiivyp4Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3118075305286394938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Are you having resourcemgr daemon? If so, that may be listening on port
2323. You may try with option "-p 2323".

Regards,
Ashok Kumar


On Fri, Mar 13, 2020 at 3:41 PM Samuel Mutel <samuel.mutel(a)gmail.com> wro=
te:

> Hello,
>
> When I start the command sudo tpm2_listpcrs, I receive the message Failed
> to initialize tcti context: 0x1.
>
> How to resolve this?
>
> Thanks.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============3118075305286394938==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGVsbG8sPGRpdj48YnI+PC9kaXY+PGRpdj5BcmUgeW91IGhhdmluZyBy
ZXNvdXJjZW1nciBkYWVtb24/IElmIHNvLCB0aGF0IG1heSBiZSBsaXN0ZW5pbmcgb24gcG9ydCAy
MzIzLiBZb3UgbWF5IHRyeSB3aXRoIG9wdGlvbiAmcXVvdDstcCAyMzIzJnF1b3Q7LjwvZGl2Pjxk
aXY+PGJyIGNsZWFyPSJhbGwiPjxkaXY+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25h
dHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+UmVn
YXJkcyw8ZGl2PkFzaG9rIEt1bWFyPC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PGJyPjwvZGl2Pjwv
ZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9Imdt
YWlsX2F0dHIiPk9uIEZyaSwgTWFyIDEzLCAyMDIwIGF0IDM6NDEgUE0gU2FtdWVsIE11dGVsICZs
dDs8YSBocmVmPSJtYWlsdG86c2FtdWVsLm11dGVsQGdtYWlsLmNvbSI+c2FtdWVsLm11dGVsQGdt
YWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNv
bGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRp
dj5IZWxsbyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoZW4gSSBzdGFydCB0aGUgY29tbWFu
ZCBzdWRvIHRwbTJfbGlzdHBjcnMsIEkgcmVjZWl2ZSB0aGUgbWVzc2FnZSBGYWlsZWQgdG8gaW5p
dGlhbGl6ZSB0Y3RpIGNvbnRleHQ6IDB4MS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkhvdyB0
byByZXNvbHZlIHRoaXM/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MuPGJyPjwvZGl2
PjwvZGl2PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxi
cj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJf
cGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Jsb2NrcXVv
dGU+PC9kaXY+Cg==

--===============3118075305286394938==--

