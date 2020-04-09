Content-Type: multipart/mixed; boundary="===============7845918858961993925=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Re: ESys_ActivateCredential
Date: Wed, 08 Apr 2020 19:02:51 -0700
Message-ID: <CAP3jAwTeq-A4QV6zPrYyT=hZ2x9GxkxHfiVL6C18dN9sPC7w6Q@mail.gmail.com>
In-Reply-To: 20200317132045.2753.53204@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7845918858961993925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks guys, I'll try this but  i also wanted to know if there is a way to
know if the TPM still has the EK and AK keys loaded? I have the EK handle
and AK handle (not made it persistent) but I want to make sure it's present
as these are necessary for ActivateCredential to succeed
ESys_ActivateCredential complaining about secret parameter doesn't make
sense to me, I tested on server side, ak_name is same as that sent and so
is EK_PUB object as well as  EK_Cert in nvram, I call the same
external_makecredential call that's in the GitHub to create secret and made
sure secret,credblob matches on the client side when received from server.

Thanks,
Rahul

On Tue, Mar 17, 2020 at 6:19 AM Imran Desai <imran.desai(a)intel.com> wrote:

> Set this up with all handles in use made persistent. If you still see
> issues, gdb-break or turn on debug logging at the Esys call and compare t=
he
> function arguments.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============7845918858961993925==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIGd1eXMsIEkmIzM5O2xsIHRyeSB0aGlzIGJ1dCDCoGkgYWxz
byB3YW50ZWQgdG8ga25vdyBpZsKgdGhlcmUgaXMgYSB3YXkgdG8ga25vdyBpZiB0aGUgVFBNIHN0
aWxsIGhhcyB0aGUgRUsgYW5kIEFLIGtleXMgbG9hZGVkPyBJIGhhdmUgdGhlIEVLIGhhbmRsZSBh
bmQgQUsgaGFuZGxlIChub3QgbWFkZSBpdCBwZXJzaXN0ZW50KSBidXQgSSB3YW50IHRvIG1ha2Ug
c3VyZSBpdCYjMzk7cyBwcmVzZW50IGFzIHRoZXNlIGFyZSBuZWNlc3NhcnkgZm9yIEFjdGl2YXRl
Q3JlZGVudGlhbCB0byBzdWNjZWVkwqA8ZGl2PkVTeXNfQWN0aXZhdGVDcmVkZW50aWFsIGNvbXBs
YWluaW5nIGFib3V0IHNlY3JldCBwYXJhbWV0ZXIgZG9lc24mIzM5O3QgbWFrZSBzZW5zZSB0byBt
ZSwgSSB0ZXN0ZWQgb24gc2VydmVyIHNpZGUsIGFrX25hbWUgaXMgc2FtZSBhcyB0aGF0IHNlbnQg
YW5kIHNvIGlzIEVLX1BVQiBvYmplY3QgYXMgd2VsbCBhcyDCoEVLX0NlcnQgaW4gbnZyYW0sIEkg
Y2FsbCB0aGUgc2FtZSBleHRlcm5hbF9tYWtlY3JlZGVudGlhbCBjYWxsIHRoYXQmIzM5O3MgaW4g
dGhlIEdpdEh1YiB0byBjcmVhdGUgc2VjcmV0IGFuZCBtYWRlIHN1cmUgc2VjcmV0LGNyZWRibG9i
IG1hdGNoZXMgb24gdGhlIGNsaWVudCBzaWRlIHdoZW4gcmVjZWl2ZWQgZnJvbSBzZXJ2ZXIuPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5SYWh1bDwvZGl2PjwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPk9uIFR1ZSwgTWFyIDE3LCAyMDIwIGF0IDY6MTkgQU0gSW1yYW4gRGVzYWkgJmx0Ozxh
IGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iPmltcmFuLmRlc2FpQGludGVsLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O2Jv
cmRlci1sZWZ0LXN0eWxlOnNvbGlkO2JvcmRlci1sZWZ0LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7
cGFkZGluZy1sZWZ0OjFleCI+U2V0IHRoaXMgdXAgd2l0aCBhbGwgaGFuZGxlcyBpbiB1c2UgbWFk
ZSBwZXJzaXN0ZW50LiBJZiB5b3Ugc3RpbGwgc2VlIGlzc3VlcywgZ2RiLWJyZWFrIG9yIHR1cm4g
b24gZGVidWcgbG9nZ2luZyBhdCB0aGUgRXN5cyBjYWxsIGFuZCBjb21wYXJlIHRoZSBmdW5jdGlv
biBhcmd1bWVudHMuPGJyPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxi
cj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8
YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============7845918858961993925==--

