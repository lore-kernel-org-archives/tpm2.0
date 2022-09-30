Content-Type: multipart/mixed; boundary="===============6319563196391272727=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Clearing TPM
Date: Fri, 30 Sep 2022 13:07:53 -0700
Message-ID: <CAOCvsSnLQRZOkvo=yey3w6XtL17TKo7A9C1kY=eGFj+wvZ9o1Q@mail.gmail.com>
In-Reply-To: d531f4528e631a01755f6d0a6e6907dd4964c420.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6319563196391272727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Also there's the Physical Presence Interface if your device supports it.
You echo a number representing the type of reset you want to the sysfs path
at /sys/class/tpm/tpm0/ppi/request, read out the success or failure at
/sys/class/tpm/tpm0/ppi/response and reboot.  The BIOS then uses it's
platform authority to issue a clear, usually after prompting you to press
some key to indicate you're at the console and agree.

For example:
$echo 5 > /sys/class/tpm/tpm0/ppi/request
$reboot

On Fri, Sep 30, 2022, 12:50 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> On Fri, 2022-09-30 at 17:46 +0000, burnsds.accounts(a)protonmail.com
> wrote:
> > Is there any way to get out of this state without the lockout
> > password?
>
> Platform auth, which you won't have as its typically randomly set by
> the OS on boot or you can use the bios settings to clear an Intel or
> AMD based TPM. For discrete TPMs you need to consult their manuals.
> Typically, its playing with some jumpers.
>
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============6319563196391272727==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9ImF1dG8iPkFsc28gdGhlcmUmIzM5O3MgdGhlIFBoeXNpY2FsIFByZXNlbmNlIElu
dGVyZmFjZSBpZiB5b3VyIGRldmljZSBzdXBwb3J0cyBpdC7CoCBZb3UgZWNobyBhIG51bWJlciBy
ZXByZXNlbnRpbmcgdGhlIHR5cGUgb2YgcmVzZXQgeW91IHdhbnQgdG8gdGhlIHN5c2ZzIHBhdGgg
YXQgL3N5cy9jbGFzcy90cG0vdHBtMC9wcGkvcmVxdWVzdCwgcmVhZCBvdXQgdGhlIHN1Y2Nlc3Mg
b3IgZmFpbHVyZSBhdCAvc3lzL2NsYXNzL3RwbS90cG0wL3BwaS9yZXNwb25zZSBhbmQgcmVib290
LsKgIFRoZSBCSU9TIHRoZW4gdXNlcyBpdCYjMzk7cyBwbGF0Zm9ybSBhdXRob3JpdHkgdG8gaXNz
dWUgYSBjbGVhciwgdXN1YWxseSBhZnRlciBwcm9tcHRpbmcgeW91IHRvIHByZXNzIHNvbWUga2V5
IHRvIGluZGljYXRlIHlvdSYjMzk7cmUgYXQgdGhlIGNvbnNvbGUgYW5kIGFncmVlLjxkaXYgZGly
PSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkZvciBleGFtcGxlOjwvZGl2PjxkaXYg
ZGlyPSJhdXRvIj4kZWNobyA1ICZndDsgL3N5cy9jbGFzcy90cG0vdHBtMC9wcGkvcmVxdWVzdDwv
ZGl2PjxkaXYgZGlyPSJhdXRvIj4kcmVib290PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9Imdt
YWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gRnJpLCBTZXAg
MzAsIDIwMjIsIDEyOjUwIFBNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRv
OndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
PC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIg
c3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRp
bmctbGVmdDoxZXgiPk9uIEZyaSwgMjAyMi0wOS0zMCBhdCAxNzo0NiArMDAwMCwgPGEgaHJlZj0i
bWFpbHRvOmJ1cm5zZHMuYWNjb3VudHNAcHJvdG9ubWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIiBy
ZWw9Im5vcmVmZXJyZXIiPmJ1cm5zZHMuYWNjb3VudHNAcHJvdG9ubWFpbC5jb208L2E+PGJyPgp3
cm90ZTo8YnI+CiZndDsgSXMgdGhlcmUgYW55IHdheSB0byBnZXQgb3V0IG9mIHRoaXMgc3RhdGUg
d2l0aG91dCB0aGUgbG9ja291dDxicj4KJmd0OyBwYXNzd29yZD88YnI+Cjxicj4KUGxhdGZvcm0g
YXV0aCwgd2hpY2ggeW91IHdvbiYjMzk7dCBoYXZlIGFzIGl0cyB0eXBpY2FsbHkgcmFuZG9tbHkg
c2V0IGJ5PGJyPgp0aGUgT1Mgb24gYm9vdCBvciB5b3UgY2FuIHVzZSB0aGUgYmlvcyBzZXR0aW5n
cyB0byBjbGVhciBhbiBJbnRlbCBvcjxicj4KQU1EIGJhc2VkIFRQTS4gRm9yIGRpc2NyZXRlIFRQ
TXMgeW91IG5lZWQgdG8gY29uc3VsdCB0aGVpciBtYW51YWxzLjxicj4KVHlwaWNhbGx5LCBpdHMg
cGxheWluZyB3aXRoIHNvbWUganVtcGVycy4gPGJyPgo8YnI+CiZndDsgX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsgdHBtMiBtYWlsaW5nIGxp
c3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayIg
cmVsPSJub3JlZmVycmVyIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgVG8gdW5zdWJz
Y3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPnRwbTItbGVhdmVAbGlzdHMu
MDEub3JnPC9hPjxicj4KJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUo
X2ludGVybmFsX25hbWUpczxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dHBtMkBsaXN0
cy4wMS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9
Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9y
ZWZlcnJlciI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgolKHdlYl9wYWdlX3VybClz
bGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KPC9ibG9ja3F1b3RlPjwv
ZGl2Pgo=

--===============6319563196391272727==--

