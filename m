Content-Type: multipart/mixed; boundary="===============1988804333004098508=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] Re: Resource Mgr, resMgr, failed initialization: 0x1
Date: Sat, 15 Feb 2020 13:48:42 -0700
Message-ID: <59A5855F-A3CB-496F-9A4F-62EF6C6525B0@rowan.moul.ca>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1988804333004098508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFHi Chris,
I would double check the versions your shell is finding on your path.
tpm2_takeownership was removed in tpm2-tools 4.0.0, and there were many oth=
er breaking changes related to CLI options in that release too.

https://github.com/tpm2-software/tpm2-tools/blob/c375bb10f7e9b23e7aa74fcaf3=
72342775060228/CHANGELOG.m

Hope that helps!

Rowan




Rowan
>> On Feb 15, 2020, at 04:02, Chris Richardson <chris.richardson77(a)gmail.=
com> wrote:
> =EF=BB=BF
> Hi,
> =

> I'm trying to use tpm2-tools on Ubuntu 18.04.4 LTS. When I try to use eg:
> tpm2.takeownership -c
> I get an error message saying =

> Resource Mgr, resMgr, failed initialization: 0x1.  Exiting...
> =

> A packet trace shows a connection attempt to port 2324, but there's nothi=
ng listening on that port even though my tpm2-tabrmd service reports that i=
t's running OK, which I assume means it's successfully connected to /dev/tp=
m0 (owned by tss) and the dbus daemon.
> =

> I did have versions of tools installed from apt and snap but I've removed=
 them (I think) and am now using =

> tpm2-abrmd-2.3.1
> tpm2-tools-4.1.1
> tpm2-tss-2.3.2
> all built from source, using entirely default settings.
> =

> Am I missing something? I seem to be lacking a resource manager of some s=
ort...
> =

> Thanks in advance
> =

> Chris
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============1988804333004098508==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXYgZGlyPSJs
dHIiPu+7vzxtZXRhIGh0dHAtZXF1aXY9ImNvbnRlbnQtdHlwZSIgY29udGVudD0idGV4dC9odG1s
OyBjaGFyc2V0PXV0Zi04Ij5IaSBDaHJpcyw8ZGl2Pkkgd291bGQgZG91YmxlIGNoZWNrIHRoZSB2
ZXJzaW9ucyB5b3VyIHNoZWxsIGlzIGZpbmRpbmcgb24geW91ciBwYXRoLjwvZGl2PjxkaXY+dHBt
Ml90YWtlb3duZXJzaGlwIHdhcyByZW1vdmVkIGluIHRwbTItdG9vbHMgNC4wLjAsIGFuZCB0aGVy
ZSB3ZXJlIG1hbnkgb3RoZXIgYnJlYWtpbmcgY2hhbmdlcyByZWxhdGVkIHRvIENMSSBvcHRpb25z
IGluIHRoYXQgcmVsZWFzZSB0b28uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvYzM3NWJiMTBm
N2U5YjIzZTdhYTc0ZmNhZjM3MjM0Mjc3NTA2MDIyOC9DSEFOR0VMT0cubWQiPmh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9jMzc1YmIxMGY3ZTliMjNlN2Fh
NzRmY2FmMzcyMzQyNzc1MDYwMjI4L0NIQU5HRUxPRy5tPC9hPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SG9wZSB0aGF0IGhlbHBzITwvZGl2PjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48YnI+
PC9kaXY+Um93YW48L2Rpdj48ZGl2IGRpcj0ibHRyIj48YnI+PGJyPjxicj48ZGl2IGRpcj0ibHRy
Ij48ZGl2Pjxicj48L2Rpdj5Sb3dhbjwvZGl2PjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPk9uIEZl
YiAxNSwgMjAyMCwgYXQgMDQ6MDIsIENocmlzIFJpY2hhcmRzb24gJmx0O2NocmlzLnJpY2hhcmRz
b243N0BnbWFpbC5jb20mZ3Q7IHdyb3RlOjxicj48YnI+PC9ibG9ja3F1b3RlPjwvZGl2PjxibG9j
a3F1b3RlIHR5cGU9ImNpdGUiPjxkaXYgZGlyPSJsdHIiPu+7vzxkaXYgZGlyPSJsdHIiPjxkaXY+
SGksPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JJ20gdHJ5aW5nIHRvIHVzZSB0cG0yLXRvb2xz
IG9uIFVidW50dSAxOC4wNC40IExUUy4gV2hlbiBJIHRyeSB0byB1c2UgZWc6PC9kaXY+PGRpdj50
cG0yLnRha2Vvd25lcnNoaXAgLWM8L2Rpdj48ZGl2PkkgZ2V0IGFuIGVycm9yIG1lc3NhZ2Ugc2F5
aW5nIDxicj48L2Rpdj48ZGl2PlJlc291cmNlIE1nciwgcmVzTWdyLCBmYWlsZWQgaW5pdGlhbGl6
YXRpb246IDB4MS4mbmJzcDsgRXhpdGluZy4uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QSBw
YWNrZXQgdHJhY2Ugc2hvd3MgYSBjb25uZWN0aW9uIGF0dGVtcHQgdG8gcG9ydCAyMzI0LCBidXQg
dGhlcmUncyBub3RoaW5nIGxpc3RlbmluZyBvbiB0aGF0IHBvcnQgZXZlbiB0aG91Z2ggbXkgdHBt
Mi10YWJybWQgc2VydmljZSByZXBvcnRzIHRoYXQgaXQncyBydW5uaW5nIE9LLCB3aGljaCBJIGFz
c3VtZSBtZWFucyBpdCdzIHN1Y2Nlc3NmdWxseSBjb25uZWN0ZWQgdG8gL2Rldi90cG0wIChvd25l
ZCBieSB0c3MpIGFuZCB0aGUgZGJ1cyBkYWVtb24uPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SSBkaWQgaGF2ZSB2ZXJzaW9ucyBvZiB0b29scyBpbnN0YWxsZWQgZnJvbSBhcHQgYW5kIHNu
YXAgYnV0IEkndmUgcmVtb3ZlZCB0aGVtIChJIHRoaW5rKSBhbmQgYW0gbm93IHVzaW5nIDxicj48
L2Rpdj48ZGl2PnRwbTItYWJybWQtMi4zLjE8L2Rpdj48ZGl2PnRwbTItdG9vbHMtNC4xLjE8L2Rp
dj48ZGl2PnRwbTItdHNzLTIuMy4yPC9kaXY+PGRpdj5hbGwgYnVpbHQgZnJvbSBzb3VyY2UsIHVz
aW5nIGVudGlyZWx5IGRlZmF1bHQgc2V0dGluZ3MuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+QW0gSSBtaXNzaW5nIHNvbWV0aGluZz8gSSBzZWVtIHRvIGJlIGxhY2tpbmcgYSByZXNvdXJj
ZSBtYW5hZ2VyIG9mIHNvbWUgc29ydC4uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtz
IGluIGFkdmFuY2U8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkNocmlzPGJyPjwvZGl2PjwvZGl2
Pgo8c3Bhbj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzwv
c3Bhbj48YnI+PHNwYW4+dHBtMiBtYWlsaW5nIGxpc3QgLS0gdHBtMkBsaXN0cy4wMS5vcmc8L3Nw
YW4+PGJyPjxzcGFuPlRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdHBtMi1sZWF2ZUBs
aXN0cy4wMS5vcmc8L3NwYW4+PGJyPjxzcGFuPiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dp
ZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPC9zcGFuPjwvZGl2PjwvYmxvY2txdW90ZT48L2Rpdj48
L2Rpdj48L2JvZHk+PC9odG1sPg==
--===============1988804333004098508==--

