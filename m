Content-Type: multipart/mixed; boundary="===============2014989227909672472=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: [RELEASE CANDIDATES] tpm2-tss 3.2.0-rc1 3.1.1-rc1 3.0.5-rc1
Date: Wed, 16 Feb 2022 19:45:37 +0000
Message-ID: <SN6PR11MB34378DAE9F608D8015F095F6B8359@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: AS8P194MB1669C63EAE2FE6600D1E8085A6359@AS8P194MB1669.EURP194.PROD.OUTLOOK.COM
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2014989227909672472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I think you'll need an rc3 with: https://github.com/tpm2-software/tpm2-tss/=
pull/2308

________________________________
From: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
Sent: Wednesday, February 16, 2022 11:21 AM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Re: [RELEASE CANDIDATES] tpm2-tss 3.2.0-rc1 3.1.1-rc1 3.0.5=
-rc1

Hi all,

I just tagged 3.2.0-rc2 with a fix to curl invocation.

Give it some testing and I'll release tomorrow if there are no further comp=
laints.

Thanks,
Andreas

________________________________________
Von: Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de>
Gesendet: Montag, 14. Februar 2022 18:43
An: tpm2(a)lists.01.org
Betreff: [tpm2] [RELEASE CANDIDATES] tpm2-tss 3.2.0-rc1 3.1.1-rc1 3.0.5-rc1

Hi all,

I wanted to announce that I've just tagged versions 3.2.0-rc1 3.1.1-rc1 and=
 3.0.5-rc1 of the tpm2-tss project.

You can find the tags in git and here: https://github.com/tpm2-software/tpm=
2-tss/tags

For your convenience, here are the changelog-changes for this rc:
## [3.2.0-rc1] - 2022-02-14
### Fixed
- Fix buffer upcast leading to misalignment
- Fix check whether SM3 is available
- Update git.mk to support R/O src-dir

### Added
- Add additional IFX root CAs

Since we had only few feedback on -rc0 I want to release final in the next =
few days.

Cheers,
Andreas
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============2014989227909672472==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KSSB0aGluayB5b3UnbGwgbmVlZCBhbiByYzMgd2l0aDombmJzcDs8
YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9wdWxsLzIz
MDgiIGlkPSJMUE5vTFBPV0FMaW5rUHJldmlldyI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29m
dHdhcmUvdHBtMi10c3MvcHVsbC8yMzA4PC9hPjwvZGl2Pgo8ZGl2IGNsYXNzPSJfRW50aXR5IF9F
VHlwZV9PV0FMaW5rUHJldmlldyBfRUlkX09XQUxpbmtQcmV2aWV3IF9FUmVhZG9ubHlfMSI+PC9k
aXY+Cjxicj4KPGRpdiBpZD0iYXBwZW5kb25zZW5kIj48L2Rpdj4KPGhyIHN0eWxlPSJkaXNwbGF5
OmlubGluZS1ibG9jazt3aWR0aDo5OCUiIHRhYmluZGV4PSItMSI+CjxkaXYgaWQ9ImRpdlJwbHlG
d2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0i
Zm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gRnVjaHMsIEFuZHJl
YXMgJmx0O2FuZHJlYXMuZnVjaHNAc2l0LmZyYXVuaG9mZXIuZGUmZ3Q7PGJyPgo8Yj5TZW50Ojwv
Yj4gV2VkbmVzZGF5LCBGZWJydWFyeSAxNiwgMjAyMiAxMToyMSBBTTxicj4KPGI+VG86PC9iPiB0
cG0yQGxpc3RzLjAxLm9yZyAmbHQ7dHBtMkBsaXN0cy4wMS5vcmcmZ3Q7PGJyPgo8Yj5TdWJqZWN0
OjwvYj4gW3RwbTJdIFJlOiBbUkVMRUFTRSBDQU5ESURBVEVTXSB0cG0yLXRzcyAzLjIuMC1yYzEg
My4xLjEtcmMxIDMuMC41LXJjMTwvZm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+CjxkaXYg
Y2xhc3M9IkJvZHlGcmFnbWVudCI+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMXB0OyI+CjxkaXYgY2xhc3M9IlBsYWluVGV4dCI+SGkgYWxsLDxicj4KPGJyPgpJIGp1c3Qg
dGFnZ2VkIDMuMi4wLXJjMiB3aXRoIGEgZml4IHRvIGN1cmwgaW52b2NhdGlvbi48YnI+Cjxicj4K
R2l2ZSBpdCBzb21lIHRlc3RpbmcgYW5kIEknbGwgcmVsZWFzZSB0b21vcnJvdyBpZiB0aGVyZSBh
cmUgbm8gZnVydGhlciBjb21wbGFpbnRzLjxicj4KPGJyPgpUaGFua3MsPGJyPgpBbmRyZWFzPGJy
Pgo8YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+ClZvbjog
RnVjaHMsIEFuZHJlYXMgJmx0O2FuZHJlYXMuZnVjaHNAc2l0LmZyYXVuaG9mZXIuZGUmZ3Q7PGJy
PgpHZXNlbmRldDogTW9udGFnLCAxNC4gRmVicnVhciAyMDIyIDE4OjQzPGJyPgpBbjogdHBtMkBs
aXN0cy4wMS5vcmc8YnI+CkJldHJlZmY6IFt0cG0yXSBbUkVMRUFTRSBDQU5ESURBVEVTXSB0cG0y
LXRzcyAzLjIuMC1yYzEgMy4xLjEtcmMxIDMuMC41LXJjMTxicj4KPGJyPgpIaSBhbGwsPGJyPgo8
YnI+Ckkgd2FudGVkIHRvIGFubm91bmNlIHRoYXQgSSd2ZSBqdXN0IHRhZ2dlZCB2ZXJzaW9ucyAz
LjIuMC1yYzEgMy4xLjEtcmMxIGFuZCAzLjAuNS1yYzEgb2YgdGhlIHRwbTItdHNzIHByb2plY3Qu
PGJyPgo8YnI+CllvdSBjYW4gZmluZCB0aGUgdGFncyBpbiBnaXQgYW5kIGhlcmU6IDxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzL3RhZ3MiPgpodHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy90YWdzPC9hPjxicj4KPGJyPgpGb3Ig
eW91ciBjb252ZW5pZW5jZSwgaGVyZSBhcmUgdGhlIGNoYW5nZWxvZy1jaGFuZ2VzIGZvciB0aGlz
IHJjOjxicj4KIyMgWzMuMi4wLXJjMV0gLSAyMDIyLTAyLTE0PGJyPgojIyMgRml4ZWQ8YnI+Ci0g
Rml4IGJ1ZmZlciB1cGNhc3QgbGVhZGluZyB0byBtaXNhbGlnbm1lbnQ8YnI+Ci0gRml4IGNoZWNr
IHdoZXRoZXIgU00zIGlzIGF2YWlsYWJsZTxicj4KLSBVcGRhdGUgZ2l0Lm1rIHRvIHN1cHBvcnQg
Ui9PIHNyYy1kaXI8YnI+Cjxicj4KIyMjIEFkZGVkPGJyPgotIEFkZCBhZGRpdGlvbmFsIElGWCBy
b290IENBczxicj4KPGJyPgpTaW5jZSB3ZSBoYWQgb25seSBmZXcgZmVlZGJhY2sgb24gLXJjMCBJ
IHdhbnQgdG8gcmVsZWFzZSBmaW5hbCBpbiB0aGUgbmV4dCBmZXcgZGF5cy48YnI+Cjxicj4KQ2hl
ZXJzLDxicj4KQW5kcmVhczxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJy
PgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEub3Jn
PGJyPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUp
czxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+
CnRwbTIgbWFpbGluZyBsaXN0IC0tIHRwbTJAbGlzdHMuMDEub3JnPGJyPgpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIHRwbTItbGVhdmVAbGlzdHMuMDEub3JnPGJyPgolKHdlYl9wYWdl
X3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KPC9kaXY+Cjwv
c3Bhbj48L2ZvbnQ+PC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============2014989227909672472==--

