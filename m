Content-Type: multipart/mixed; boundary="===============0780793452039857253=="
MIME-Version: 1.0
From: Emmanuel Deloget <logout at free.fr>
Subject: [tpm2] Re: Dropping Openssl < 1.1 support
Date: Fri, 03 Jan 2020 00:51:19 +0100
Message-ID: <CAKh=nwEeMvSjZ-8TNDYwBfFPVResE5tKPj25vVgwyZBDQZhVrw@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E6327F@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0780793452039857253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello William,

This is something we discussed on the OpenVPN list for the same reason.
While OpenSSL 1.0 is EoL'ed, it's still supported on RHEL7 for a few month
(according to https://access.redhat.com/support/policy/updates/errata and
https://access.redhat.com/articles/1462343). If you want your users to be
able to compile/install the TPM2 stack on RHEL7 you will need to support
OpenSSL 1.0 until November 2020.

Of course, it's your call. You may also say "those who want to use OpenSSL
1.0 shall stick to branch XXXX".

Best regards,

-- Emmanuel Deloget

On Thu, Jan 2, 2020 at 6:39 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> Now that the new year is upon us, we should consider dropping OSSL < 1.1
> support since it's no longer supported. I'm proposing on everyone's
> mainline, we drop
> That support and the next major feature bump release contains this change.
> Any objections?
>
> Bill
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============0780793452039857253==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFt
aWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPkhlbGxvIFdpbGxpYW0swqA8L2Rpdj48ZGl2IGNsYXNz
PSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+
PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTpt
b25vc3BhY2UsbW9ub3NwYWNlIj5UaGlzIGlzIHNvbWV0aGluZ8Kgd2UgZGlzY3Vzc2VkIG9uIHRo
ZSBPcGVuVlBOIGxpc3QgZm9yIHRoZSBzYW1lIHJlYXNvbi4gV2hpbGUgT3BlblNTTCAxLjAgaXMg
RW9MJiMzOTtlZCwgaXQmIzM5O3Mgc3RpbGwgc3VwcG9ydGVkIG9uIFJIRUw3IGZvciBhIGZldyBt
b250aCAoYWNjb3JkaW5nIHRvwqA8YSBocmVmPSJodHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3N1
cHBvcnQvcG9saWN5L3VwZGF0ZXMvZXJyYXRhIiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWwsSGVs
dmV0aWNhLHNhbnMtc2VyaWYiPmh0dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vc3VwcG9ydC9wb2xp
Y3kvdXBkYXRlcy9lcnJhdGE8L2E+wqBhbmTCoDxhIGhyZWY9Imh0dHBzOi8vYWNjZXNzLnJlZGhh
dC5jb20vYXJ0aWNsZXMvMTQ2MjM0MyIgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsLEhlbHZldGlj
YSxzYW5zLXNlcmlmIj5odHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL2FydGljbGVzLzE0NjIzNDM8
L2E+KS4gSWYgeW91IHdhbnQgeW91ciB1c2VycyB0byBiZSBhYmxlIHRvIGNvbXBpbGUvaW5zdGFs
bCB0aGUgVFBNMiBzdGFjayBvbiBSSEVMNyB5b3Ugd2lsbCBuZWVkIHRvIHN1cHBvcnQgT3BlblNT
TCAxLjAgdW50aWwgTm92ZW1iZXIgMjAyMC7CoDwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1
bHQiIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj48YnI+PC9kaXY+PGRp
diBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxtb25v
c3BhY2UiPk9mIGNvdXJzZSwgaXQmIzM5O3MgeW91ciBjYWxsLiBZb3UgbWF5IGFsc28gc2F5ICZx
dW90O3Rob3NlIHdobyB3YW50IHRvIHVzZSBPcGVuU1NMIDEuMCBzaGFsbCBzdGljayB0byBicmFu
Y2ggWFhYWCZxdW90Oy7CoDwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJm
b250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21h
aWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPkJlc3Qg
cmVnYXJkcyzCoDwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZh
bWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj48YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZGVm
YXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPi0tIEVtbWFudWVs
IERlbG9nZXQ8L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGly
PSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUaHUsIEphbiAyLCAyMDIwIGF0IDY6MzkgUE0g
Um9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+
PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAw
cHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRp
bmctbGVmdDoxZXgiPk5vdyB0aGF0IHRoZSBuZXcgeWVhciBpcyB1cG9uIHVzLCB3ZSBzaG91bGQg
Y29uc2lkZXIgZHJvcHBpbmcgT1NTTCAmbHQ7IDEuMSBzdXBwb3J0IHNpbmNlIGl0JiMzOTtzIG5v
IGxvbmdlciBzdXBwb3J0ZWQuIEkmIzM5O20gcHJvcG9zaW5nIG9uIGV2ZXJ5b25lJiMzOTtzIG1h
aW5saW5lLCB3ZSBkcm9wPGJyPgpUaGF0IHN1cHBvcnQgYW5kIHRoZSBuZXh0IG1ham9yIGZlYXR1
cmUgYnVtcCByZWxlYXNlIGNvbnRhaW5zIHRoaXMgY2hhbmdlLiBBbnkgb2JqZWN0aW9ucz88YnI+
Cjxicj4KQmlsbDxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KVG8gdW5z
dWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0
cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48YnI+
CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJy
Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============0780793452039857253==--

