Content-Type: multipart/mixed; boundary="===============2074194994838261529=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Has the take_ownership tool been deprecated in the last
 release of tpm2-tools?
Date: Wed, 29 Apr 2020 14:04:09 -0700
Message-ID: <CAOCvsSk6nZE-WTh-QrjWuD24LbbzEJtjQJWK6J0s79-qY2WgUw@mail.gmail.com>
In-Reply-To: 20200429205841.2763.64051@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2074194994838261529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yes, I think the name was a holdover from TPM 1.2.  You should be able to
use tpm2_changeauth to directly change the auths of the
individual hierarchies now (like "-c o" for owner being the object you're
changing the auth on).

On Wed, Apr 29, 2020 at 1:59 PM <eduardolfalcao(a)gmail.com> wrote:

> I know it may be a silly question, but where is the take_ownership utility
> (https://github.com/tpm2-software/tpm2-tools/tree/master/tools)?
> In previous versions of tpm2-tool, the first step to use the TPM was
> taking ownership.
> Has this process changed? Do I still need to take ownership?
>
> Best regards.
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============2074194994838261529==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+WWVzLCBJIHRoaW5rIHRoZSBuYW1lIHdhcyBhIGhvbGRvdmVyIGZyb20g
VFBNIDEuMi7CoCBZb3Ugc2hvdWxkIGJlIGFibGUgdG8gdXNlIHRwbTJfY2hhbmdlYXV0aCB0byBk
aXJlY3RseSBjaGFuZ2UgdGhlIGF1dGhzIG9mIHRoZSBpbmRpdmlkdWFswqBoaWVyYXJjaGllcyBu
b3cgKGxpa2UgJnF1b3Q7LWMgbyZxdW90OyBmb3Igb3duZXIgYmVpbmcgdGhlIG9iamVjdCB5b3Um
IzM5O3JlIGNoYW5naW5nIHRoZSBhdXRoIG9uKS48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxf
cXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBXZWQsIEFwciAyOSwg
MjAyMCBhdCAxOjU5IFBNICZsdDs8YSBocmVmPSJtYWlsdG86ZWR1YXJkb2xmYWxjYW9AZ21haWwu
Y29tIj5lZHVhcmRvbGZhbGNhb0BnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJs
b2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAu
OGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDox
ZXgiPkkga25vdyBpdCBtYXkgYmUgYSBzaWxseSBxdWVzdGlvbiwgYnV0IHdoZXJlIGlzIHRoZSB0
YWtlX293bmVyc2hpcCB1dGlsaXR5ICg8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1z
b2Z0d2FyZS90cG0yLXRvb2xzL3RyZWUvbWFzdGVyL3Rvb2xzIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xz
L3RyZWUvbWFzdGVyL3Rvb2xzPC9hPik/PGJyPgpJbiBwcmV2aW91cyB2ZXJzaW9ucyBvZiB0cG0y
LXRvb2wsIHRoZSBmaXJzdCBzdGVwIHRvIHVzZSB0aGUgVFBNIHdhcyB0YWtpbmcgb3duZXJzaGlw
Ljxicj4KSGFzIHRoaXMgcHJvY2VzcyBjaGFuZ2VkPyBEbyBJIHN0aWxsIG5lZWQgdG8gdGFrZSBv
d25lcnNoaXA/PGJyPgo8YnI+CkJlc3QgcmVnYXJkcy48YnI+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBo
cmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3Rz
LjAxLm9yZzwvYT48YnI+ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0i
bWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2
ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClz
LyUoX2ludGVybmFsX25hbWUpczxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============2074194994838261529==--

