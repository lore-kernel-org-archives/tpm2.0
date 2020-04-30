Content-Type: multipart/mixed; boundary="===============0894366871248585681=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Has the take_ownership tool been deprecated in the last
 release of tpm2-tools?
Date: Wed, 29 Apr 2020 17:01:29 -0700
Message-ID: <CAOCvsS=jjJrjQ7m6er+1ET7O+Yx45ybFNMLNeWqeJHpSOoqonQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649ED8A72@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0894366871248585681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Also some hardware TPMs come with randomized authorizations to prevent an
attacker from taking control of an unused TPM.  These can usually be
cleared from the BIOS menu, which uses the platform authorization, to prove
physical control/ownership of the machine.

On Wed, Apr 29, 2020 at 2:06 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> The take ownership tool was a combination of tpm2_changeauth and
> tpm2_clear, so you can use those tools
> To do it.
>
> The old tools -c would call tpm2_clear using the lockout hierarchy, which
> is the default for the tool tpm2_clear.
> Tpm2_changeauth, you can just pick what hierarchy and the old and new
> passwords respectively.
>
> Bill
>
>
> > -----Original Message-----
> > From: eduardolfalcao(a)gmail.com [mailto:eduardolfalcao(a)gmail.com]
> > Sent: Wednesday, April 29, 2020 3:59 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Has the take_ownership tool been deprecated in the last
> release
> > of tpm2-tools?
> >
> > I know it may be a silly question, but where is the take_ownership
> utility
> > (https://github.com/tpm2-software/tpm2-tools/tree/master/tools)?
> > In previous versions of tpm2-tool, the first step to use the TPM was
> taking
> > ownership.
> > Has this process changed? Do I still need to take ownership?
> >
> > Best regards.
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============0894366871248585681==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+QWxzbyBzb21lIGhhcmR3YXJlIFRQTXMgY29tZSB3aXRoIHJhbmRvbWl6
ZWQgYXV0aG9yaXphdGlvbnMgdG8gcHJldmVudCBhbiBhdHRhY2tlciBmcm9tIHRha2luZyBjb250
cm9sIG9mIGFuIHVudXNlZCBUUE0uwqAgVGhlc2UgY2FuIHVzdWFsbHkgYmUgY2xlYXJlZCBmcm9t
IHRoZSBCSU9TIG1lbnUsIHdoaWNoIHVzZXMgdGhlIHBsYXRmb3JtIGF1dGhvcml6YXRpb24sIHRv
IHByb3ZlIHBoeXNpY2FsIGNvbnRyb2wvb3duZXJzaGlwIG9mIHRoZSBtYWNoaW5lLjwvZGl2Pjxi
cj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0
dHIiPk9uIFdlZCwgQXByIDI5LCAyMDIwIGF0IDI6MDYgUE0gUm9iZXJ0cywgV2lsbGlhbSBDICZs
dDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMu
cm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xh
c3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1s
ZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPlRoZSB0YWtl
IG93bmVyc2hpcCB0b29sIHdhcyBhIGNvbWJpbmF0aW9uIG9mIHRwbTJfY2hhbmdlYXV0aCBhbmQg
dHBtMl9jbGVhciwgc28geW91IGNhbiB1c2UgdGhvc2UgdG9vbHM8YnI+ClRvIGRvIGl0Ljxicj4K
PGJyPgpUaGUgb2xkIHRvb2xzIC1jIHdvdWxkIGNhbGwgdHBtMl9jbGVhciB1c2luZyB0aGUgbG9j
a291dCBoaWVyYXJjaHksIHdoaWNoIGlzIHRoZSBkZWZhdWx0IGZvciB0aGUgdG9vbCB0cG0yX2Ns
ZWFyLjxicj4KVHBtMl9jaGFuZ2VhdXRoLCB5b3UgY2FuIGp1c3QgcGljayB3aGF0IGhpZXJhcmNo
eSBhbmQgdGhlIG9sZCBhbmQgbmV3IHBhc3N3b3JkcyByZXNwZWN0aXZlbHkuPGJyPgo8YnI+CkJp
bGw8YnI+Cjxicj4KPGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7
IEZyb206IDxhIGhyZWY9Im1haWx0bzplZHVhcmRvbGZhbGNhb0BnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5lZHVhcmRvbGZhbGNhb0BnbWFpbC5jb208L2E+IFttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOmVkdWFyZG9sZmFsY2FvQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmVkdWFyZG9sZmFs
Y2FvQGdtYWlsLmNvbTwvYT5dPGJyPgomZ3Q7IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjksIDIw
MjAgMzo1OSBQTTxicj4KJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6
IFt0cG0yXSBIYXMgdGhlIHRha2Vfb3duZXJzaGlwIHRvb2wgYmVlbiBkZXByZWNhdGVkIGluIHRo
ZSBsYXN0IHJlbGVhc2U8YnI+CiZndDsgb2YgdHBtMi10b29scz88YnI+CiZndDsgPGJyPgomZ3Q7
IEkga25vdyBpdCBtYXkgYmUgYSBzaWxseSBxdWVzdGlvbiwgYnV0IHdoZXJlIGlzIHRoZSB0YWtl
X293bmVyc2hpcCB1dGlsaXR5PGJyPgomZ3Q7ICg8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
dHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL3RyZWUvbWFzdGVyL3Rvb2xzIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LXRvb2xzL3RyZWUvbWFzdGVyL3Rvb2xzPC9hPik/PGJyPgomZ3Q7IEluIHByZXZpb3VzIHZlcnNp
b25zIG9mIHRwbTItdG9vbCwgdGhlIGZpcnN0IHN0ZXAgdG8gdXNlIHRoZSBUUE0gd2FzIHRha2lu
Zzxicj4KJmd0OyBvd25lcnNoaXAuPGJyPgomZ3Q7IEhhcyB0aGlzIHByb2Nlc3MgY2hhbmdlZD8g
RG8gSSBzdGlsbCBuZWVkIHRvIHRha2Ugb3duZXJzaGlwPzxicj4KJmd0OyA8YnI+CiZndDsgQmVz
dCByZWdhcmRzLjxicj4KJmd0OyBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXzxicj4KJmd0OyB0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86
dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48
YnI+CiZndDsgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86
dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3Rz
LjAxLm9yZzwvYT48YnI+CiZndDsgJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8l
KF9pbnRlcm5hbF9uYW1lKXM8YnI+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBt
MkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+
ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVh
dmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8
L2E+PGJyPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25h
bWUpczxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============0894366871248585681==--

