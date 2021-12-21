Content-Type: multipart/mixed; boundary="===============5291316463013261834=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Tue, 21 Dec 2021 14:40:24 +0000
Message-ID: <SN6PR11MB34371336904EF1DF2C479899B87C9@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: d9e4b269-39ec-b350-a6cc-ffed39b90ba7@sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5291316463013261834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI I reported this bug to the linux integrity mailing list:
  - https://marc.info/?l=3Dlinux-integrity&m=3D164009679300941&w=3D2
________________________________
From: Juergen Repp <Juergen.Repp(a)sit.fraunhofer.de>
Sent: Monday, December 20, 2021 4:06 PM
To: Kenneth Goldman <kgoldman(a)us.ibm.com>
Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Re: tpm2_flushcontext stuck

When /dev/tpmrm0 was used with kernel 5.10.
After sending the command read public:
0x80 0x01 0x00 0x00 0x00 0x0e 0x00 0x00 0x01 0x73 0x80 0x00 0x00 0x00
the write worked but the poll call in  tcti_device_receive did stuck.
With kernel 4.19 write for this command did return -1



Am 20.12.21 um 21:04 schrieb Kenneth Goldman:
> They way I use it:
>
>
>
> /dev/tpm0 is locking, one user at a time.  I use it for debug only.  IMHO=
, production applications should not use it.
>
>
>
> /dev/tpmrm0 is the multi-user interface.  Use it for production applicati=
ons, where the TPM is shared.
>
>
>
> I suspect (not sure) that /dev/tpm0 will have unexpected effects when the=
 kernel is also trying to use the TPM.
>
>
>
>
>
> And as a newbie, I felt that the fact TPM exposes two devices (/dev/tpm0 =
and /dev/tpmrm0) under Linux is confusing and is making things more complic=
ated.  The architecture diagram (https://github.com/tpm2-software/tpm2-tss =
<https://github.com/tpm2-software/tpm2-tss>) shows all calls go through the=
 Resource Manager but that is not the case in reality.  I was wondering wha=
t is the benefit to have 2 devices instead of just one device in linux?
>
>
>
>
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============5291316463013261834==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KRllJIEkgcmVwb3J0ZWQgdGhpcyBidWcgdG8gdGhlIGxpbnV4IGlu
dGVncml0eSBtYWlsaW5nIGxpc3Q6PC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KJm5ic3A7IC0mbmJzcDs8YSBocmVmPSJodHRwczovL21hcmMuaW5m
by8/bD1saW51eC1pbnRlZ3JpdHkmYW1wO209MTY0MDA5Njc5MzAwOTQxJmFtcDt3PTIiIGlkPSJM
UGxuazUzMzg0MiI+aHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtaW50ZWdyaXR5JmFtcDttPTE2
NDAwOTY3OTMwMDk0MSZhbXA7dz0yPC9hPjwvZGl2Pgo8ZGl2IGlkPSJhcHBlbmRvbnNlbmQiPjwv
ZGl2Pgo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9
Ii0xIj4KPGRpdiBpZD0iZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGli
cmksIHNhbnMtc2VyaWYiIHN0eWxlPSJmb250LXNpemU6MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxi
PkZyb206PC9iPiBKdWVyZ2VuIFJlcHAgJmx0O0p1ZXJnZW4uUmVwcEBzaXQuZnJhdW5ob2Zlci5k
ZSZndDs8YnI+CjxiPlNlbnQ6PC9iPiBNb25kYXksIERlY2VtYmVyIDIwLCAyMDIxIDQ6MDYgUE08
YnI+CjxiPlRvOjwvYj4gS2VubmV0aCBHb2xkbWFuICZsdDtrZ29sZG1hbkB1cy5pYm0uY29tJmd0
Ozxicj4KPGI+Q2M6PC9iPiB0cG0yQGxpc3RzLjAxLm9yZyAmbHQ7dHBtMkBsaXN0cy4wMS5vcmcm
Z3Q7PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIFJlOiB0cG0yX2ZsdXNoY29udGV4dCBzdHVj
azwvZm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+CjxkaXYgY2xhc3M9IkJvZHlGcmFnbWVu
dCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+CjxkaXYgY2xh
c3M9IlBsYWluVGV4dCI+V2hlbiAvZGV2L3RwbXJtMCB3YXMgdXNlZCB3aXRoIGtlcm5lbCA1LjEw
Ljxicj4KQWZ0ZXIgc2VuZGluZyB0aGUgY29tbWFuZCByZWFkIHB1YmxpYzo8YnI+CjB4ODAgMHgw
MSAweDAwIDB4MDAgMHgwMCAweDBlIDB4MDAgMHgwMCAweDAxIDB4NzMgMHg4MCAweDAwIDB4MDAg
MHgwMDxicj4KdGhlIHdyaXRlIHdvcmtlZCBidXQgdGhlIHBvbGwgY2FsbCBpbiZuYnNwOyB0Y3Rp
X2RldmljZV9yZWNlaXZlIGRpZCBzdHVjay48YnI+CldpdGgga2VybmVsIDQuMTkgd3JpdGUgZm9y
IHRoaXMgY29tbWFuZCBkaWQgcmV0dXJuIC0xPGJyPgo8YnI+Cjxicj4KPGJyPgpBbSAyMC4xMi4y
MSB1bSAyMTowNCBzY2hyaWViIEtlbm5ldGggR29sZG1hbjo8YnI+CiZndDsgVGhleSB3YXkgSSB1
c2UgaXQ6PGJyPgomZ3Q7IDxicj4KJmd0OyAmbmJzcDs8YnI+CiZndDsgPGJyPgomZ3Q7IC9kZXYv
dHBtMCBpcyBsb2NraW5nLCBvbmUgdXNlciBhdCBhIHRpbWUuJm5ic3A7IEkgdXNlIGl0IGZvciBk
ZWJ1ZyBvbmx5LiZuYnNwOyBJTUhPLCBwcm9kdWN0aW9uIGFwcGxpY2F0aW9ucyBzaG91bGQgbm90
IHVzZSBpdC48YnI+CiZndDsgPGJyPgomZ3Q7ICZuYnNwOzxicj4KJmd0OyA8YnI+CiZndDsgL2Rl
di90cG1ybTAgaXMgdGhlIG11bHRpLXVzZXIgaW50ZXJmYWNlLiZuYnNwOyBVc2UgaXQgZm9yIHBy
b2R1Y3Rpb24gYXBwbGljYXRpb25zLCB3aGVyZSB0aGUgVFBNIGlzIHNoYXJlZC48YnI+CiZndDsg
PGJyPgomZ3Q7ICZuYnNwOzxicj4KJmd0OyA8YnI+CiZndDsgSSBzdXNwZWN0IChub3Qgc3VyZSkg
dGhhdCAvZGV2L3RwbTAgd2lsbCBoYXZlIHVuZXhwZWN0ZWQgZWZmZWN0cyB3aGVuIHRoZSBrZXJu
ZWwgaXMgYWxzbyB0cnlpbmcgdG8gdXNlIHRoZSBUUE0uPGJyPgomZ3Q7IDxicj4KJmd0OyAmbmJz
cDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZuYnNwOzxicj4KJmd0OyA8YnI+CiZndDsgQW5kIGFzIGEg
bmV3YmllLCBJIGZlbHQgdGhhdCB0aGUgZmFjdCBUUE0gZXhwb3NlcyB0d28gZGV2aWNlcyAoL2Rl
di90cG0wIGFuZCAvZGV2L3RwbXJtMCkgdW5kZXIgTGludXggaXMgY29uZnVzaW5nIGFuZCBpcyBt
YWtpbmcgdGhpbmdzJm5ic3A7bW9yZSZuYnNwO2NvbXBsaWNhdGVkLiZuYnNwOyBUaGUgYXJjaGl0
ZWN0dXJlIGRpYWdyYW0gKDxhIGhyZWY9IiI+PC9hPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNv
ZnR3YXJlL3RwbTItdHNzICZsdDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0
d2FyZS90cG0yLXRzcyI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3M8
L2E+Jmd0OykKIHNob3dzIGFsbCBjYWxscyBnbyB0aHJvdWdoIHRoZSBSZXNvdXJjZSBNYW5hZ2Vy
IGJ1dCB0aGF0IGlzIG5vdCB0aGUgY2FzZSBpbiByZWFsaXR5LiZuYnNwOyBJIHdhcyB3b25kZXJp
bmcgd2hhdCBpcyB0aGUgYmVuZWZpdCB0byBoYXZlIDIgZGV2aWNlcyBpbnN0ZWFkIG9mIGp1c3Qg
b25lIGRldmljZSBpbiBsaW51eD8mbmJzcDs8YnI+CiZndDsgPGJyPgomZ3Q7ICZuYnNwOzxicj4K
Jmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fPGJyPgomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMu
MDEub3JnPGJyPgomZ3Q7IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmc8YnI+CiZndDsgJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQp
cy8lKF9pbnRlcm5hbF9uYW1lKXM8YnI+CiZndDsgPGJyPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gdHBtMkBs
aXN0cy4wMS5vcmc8YnI+ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmc8YnI+CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlzPC9kaXY+Cjwvc3Bhbj48L2ZvbnQ+PC9kaXY+CjwvYm9keT4KPC9odG1s
Pgo=

--===============5291316463013261834==--

