Content-Type: multipart/mixed; boundary="===============7530555533856772480=="
MIME-Version: 1.0
From: Chris Richardson <chris.richardson77 at gmail.com>
Subject: [tpm2] Re: Resource Mgr, resMgr, failed initialization: 0x1
Date: Sun, 16 Feb 2020 10:46:33 +0000
Message-ID: <CAJ0SV8O05wjthTi5AEVTUFYnPEdS+waGfwnDPbYAJ6MOaGfnMw@mail.gmail.com>
In-Reply-To: 59A5855F-A3CB-496F-9A4F-62EF6C6525B0@rowan.moul.ca
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7530555533856772480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks Rowan, it looks like I was indeed doing what you're suggesting, and
my tpm2.takeownership was from a snap-installed version and not my
source-installed one. Now that that's removed I no longer have a
tpm2.takeownershipt command so that's a step... sideways, I guess? ;)

Anyway, thanks again for the tip.

On Sat, 15 Feb 2020 at 20:48, Rowan Moul <lists(a)rowan.moul.ca> wrote:

> =EF=BB=BFHi Chris,
> I would double check the versions your shell is finding on your path.
> tpm2_takeownership was removed in tpm2-tools 4.0.0, and there were many
> other breaking changes related to CLI options in that release too.
>
>
> https://github.com/tpm2-software/tpm2-tools/blob/c375bb10f7e9b23e7aa74fca=
f372342775060228/CHANGELOG.m
> <https://github.com/tpm2-software/tpm2-tools/blob/c375bb10f7e9b23e7aa74fc=
af372342775060228/CHANGELOG.md>
>
> Hope that helps!
>
> Rowan
>
>
>
>
> Rowan
>
> On Feb 15, 2020, at 04:02, Chris Richardson <chris.richardson77(a)gmail.c=
om>
> wrote:
>
> =EF=BB=BF
> Hi,
>
> I'm trying to use tpm2-tools on Ubuntu 18.04.4 LTS. When I try to use eg:
> tpm2.takeownership -c
> I get an error message saying
> Resource Mgr, resMgr, failed initialization: 0x1.  Exiting...
>
> A packet trace shows a connection attempt to port 2324, but there's
> nothing listening on that port even though my tpm2-tabrmd service reports
> that it's running OK, which I assume means it's successfully connected to
> /dev/tpm0 (owned by tss) and the dbus daemon.
>
> I did have versions of tools installed from apt and snap but I've removed
> them (I think) and am now using
> tpm2-abrmd-2.3.1
> tpm2-tools-4.1.1
> tpm2-tss-2.3.2
> all built from source, using entirely default settings.
>
> Am I missing something? I seem to be lacking a resource manager of some
> sort...
>
> Thanks in advance
>
> Chris
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>

--===============7530555533856772480==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5UaGFua3MgUm93YW4sIGl0IGxvb2tzIGxpa2UgSSB3YXMgaW5k
ZWVkIGRvaW5nIHdoYXQgeW91JiMzOTtyZSBzdWdnZXN0aW5nLCBhbmQgbXkgdHBtMi50YWtlb3du
ZXJzaGlwIHdhcyBmcm9tIGEgc25hcC1pbnN0YWxsZWQgdmVyc2lvbiBhbmQgbm90IG15IHNvdXJj
ZS1pbnN0YWxsZWQgb25lLiBOb3cgdGhhdCB0aGF0JiMzOTtzIHJlbW92ZWQgSSBubyBsb25nZXIg
aGF2ZSBhIHRwbTIudGFrZW93bmVyc2hpcHQgY29tbWFuZCBzbyB0aGF0JiMzOTtzIGEgc3RlcC4u
LiBzaWRld2F5cywgSSBndWVzcz8gOyk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFueXdheSwg
dGhhbmtzIGFnYWluIGZvciB0aGUgdGlwLjxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0i
Z21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBTYXQsIDE1
IEZlYiAyMDIwIGF0IDIwOjQ4LCBSb3dhbiBNb3VsICZsdDs8YSBocmVmPSJtYWlsdG86bGlzdHNA
cm93YW4ubW91bC5jYSI+bGlzdHNAcm93YW4ubW91bC5jYTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+PGRpdiBkaXI9ImF1dG8iPjxkaXYgZGlyPSJsdHIiPu+7v0hpIENocmlzLDxkaXY+
SSB3b3VsZCBkb3VibGUgY2hlY2sgdGhlIHZlcnNpb25zIHlvdXIgc2hlbGwgaXMgZmluZGluZyBv
biB5b3VyIHBhdGguPC9kaXY+PGRpdj50cG0yX3Rha2Vvd25lcnNoaXAgd2FzIHJlbW92ZWQgaW4g
dHBtMi10b29scyA0LjAuMCwgYW5kIHRoZXJlIHdlcmUgbWFueSBvdGhlciBicmVha2luZyBjaGFu
Z2VzIHJlbGF0ZWQgdG8gQ0xJIG9wdGlvbnMgaW4gdGhhdCByZWxlYXNlIHRvby48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJl
L3RwbTItdG9vbHMvYmxvYi9jMzc1YmIxMGY3ZTliMjNlN2FhNzRmY2FmMzcyMzQyNzc1MDYwMjI4
L0NIQU5HRUxPRy5tZCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNv
ZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9jMzc1YmIxMGY3ZTliMjNlN2FhNzRmY2FmMzcyMzQyNzc1
MDYwMjI4L0NIQU5HRUxPRy5tPC9hPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SG9wZSB0aGF0
IGhlbHBzITwvZGl2PjxkaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj48YnI+PC9kaXY+Um93YW48L2Rp
dj48ZGl2IGRpcj0ibHRyIj48YnI+PGJyPjxicj48ZGl2IGRpcj0ibHRyIj48ZGl2Pjxicj48L2Rp
dj5Sb3dhbjwvZGl2PjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPk9uIEZlYiAxNSwgMjAyMCwgYXQg
MDQ6MDIsIENocmlzIFJpY2hhcmRzb24gJmx0OzxhIGhyZWY9Im1haWx0bzpjaHJpcy5yaWNoYXJk
c29uNzdAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+Y2hyaXMucmljaGFyZHNvbjc3QGdtYWls
LmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48YnI+PC9ibG9ja3F1b3RlPjwvZGl2PjxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiPjxkaXYgZGlyPSJsdHIiPu+7vzxkaXYgZGlyPSJsdHIiPjxkaXY+SGksPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JJiMzOTttIHRyeWluZyB0byB1c2UgdHBtMi10b29scyBv
biBVYnVudHUgMTguMDQuNCBMVFMuIFdoZW4gSSB0cnkgdG8gdXNlIGVnOjwvZGl2PjxkaXY+dHBt
Mi50YWtlb3duZXJzaGlwIC1jPC9kaXY+PGRpdj5JIGdldCBhbiBlcnJvciBtZXNzYWdlIHNheWlu
ZyA8YnI+PC9kaXY+PGRpdj5SZXNvdXJjZSBNZ3IsIHJlc01nciwgZmFpbGVkIGluaXRpYWxpemF0
aW9uOiAweDEuwqAgRXhpdGluZy4uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QSBwYWNrZXQg
dHJhY2Ugc2hvd3MgYSBjb25uZWN0aW9uIGF0dGVtcHQgdG8gcG9ydCAyMzI0LCBidXQgdGhlcmUm
IzM5O3Mgbm90aGluZyBsaXN0ZW5pbmcgb24gdGhhdCBwb3J0IGV2ZW4gdGhvdWdoIG15IHRwbTIt
dGFicm1kIHNlcnZpY2UgcmVwb3J0cyB0aGF0IGl0JiMzOTtzIHJ1bm5pbmcgT0ssIHdoaWNoIEkg
YXNzdW1lIG1lYW5zIGl0JiMzOTtzIHN1Y2Nlc3NmdWxseSBjb25uZWN0ZWQgdG8gL2Rldi90cG0w
IChvd25lZCBieSB0c3MpIGFuZCB0aGUgZGJ1cyBkYWVtb24uPGJyPjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+SSBkaWQgaGF2ZSB2ZXJzaW9ucyBvZiB0b29scyBpbnN0YWxsZWQgZnJvbSBhcHQg
YW5kIHNuYXAgYnV0IEkmIzM5O3ZlIHJlbW92ZWQgdGhlbSAoSSB0aGluaykgYW5kIGFtIG5vdyB1
c2luZyA8YnI+PC9kaXY+PGRpdj50cG0yLWFicm1kLTIuMy4xPC9kaXY+PGRpdj50cG0yLXRvb2xz
LTQuMS4xPC9kaXY+PGRpdj50cG0yLXRzcy0yLjMuMjwvZGl2PjxkaXY+YWxsIGJ1aWx0IGZyb20g
c291cmNlLCB1c2luZyBlbnRpcmVseSBkZWZhdWx0IHNldHRpbmdzLjxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PkFtIEkgbWlzc2luZyBzb21ldGhpbmc/IEkgc2VlbSB0byBiZSBsYWNraW5n
IGEgcmVzb3VyY2UgbWFuYWdlciBvZiBzb21lIHNvcnQuLi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PlRoYW5rcyBpbiBhZHZhbmNlPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DaHJpczxicj48
L2Rpdj48L2Rpdj4KPHNwYW4+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX188L3NwYW4+PGJyPjxzcGFuPnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3Jn
PC9hPjwvc3Bhbj48YnI+PHNwYW4+VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBo
cmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0y
LWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48L3NwYW4+PGJyPjxzcGFuPiUod2ViX3BhZ2VfdXJsKXNs
aXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPC9zcGFuPjwvZGl2PjwvYmxvY2tx
dW90ZT48L2Rpdj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============7530555533856772480==--

