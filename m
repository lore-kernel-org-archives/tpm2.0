Content-Type: multipart/mixed; boundary="===============7618021486636028297=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: Re: [tpm2] How do I import a PEM format privateKey into TPM2 ?
Date: Tue, 23 Oct 2018 16:19:02 +0800
Message-ID: <CA+tBKVjp1yyThoP5Ur_ttb9uoQngjbKU_=4Ptm-s+FkzU18znw@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649C60421@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7618021486636028297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Cool, thanks!

On Mon, Oct 22, 2018 at 11:29 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Terry An
> > Sent: Sunday, October 21, 2018 11:26 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] How do I import a PEM format privateKey into TPM2 ?
> >
> > Hi everyone,
> >
> > I generated a PEM format keypair using openssl:
> > # openssl genrsa -out priv.key
> >
> > # openssl rsa -in priv.key  -out pub.key -pubout
> >
> >
> > and then I used tpm2-tools to import:
> > # tpm2_createprimary -H o -g sha256 -G ecc -C context.out
> > ObjectAttribute: 0x00030072
> > CreatePrimary Succeed ! Handle: 0x800000ff
> >
> > # tpm2_load -H 0x80000ff -c context.out -r priv.key
> > ERROR: File "priv.key" size is larger than buffer, got 1766 expected
> less than 1552
> > an error appeared.
>
> tpm2_load is not the command you want. tpm2_loads a TPM controlled object
> into the TPM.
> You want to use tpm2_import which is only available on the master branch.
>
> Examples in the man page:
>
> https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_import.1=
.md
>
>
> >
> > My purpose is to encrypt by public key and decrypt by tpm2.0
> > Encrypt:
> > # openssl rsautl -encrypt -inkey pub.key  -pubin -in data.in <
> http://data.in>  -out
> > data.enc
> >
> > Decrypt:
> > what should I do?
>

--===============7618021486636028297==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+Q29vbCwgdGhhbmtzIcKgPGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciI+T24gTW9uLCBPY3QgMjIsIDIwMTggYXQgMTE6Mjkg
UE0gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAg
MCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGJy
Pgo8YnI+CiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+CiZndDsgRnJvbTogdHBt
MiBbbWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZzwvYT5dIE9uIEJlaGFsZiBPZiBU
ZXJyeSBBbjxicj4KJmd0OyBTZW50OiBTdW5kYXksIE9jdG9iZXIgMjEsIDIwMTggMTE6MjYgUE08
YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyBTdWJqZWN0OiBbdHBtMl0gSG93
IGRvIEkgaW1wb3J0IGEgUEVNIGZvcm1hdCBwcml2YXRlS2V5IGludG8gVFBNMiA/PGJyPgomZ3Q7
IDxicj4KJmd0OyBIaSBldmVyeW9uZSw8YnI+CiZndDsgPGJyPgomZ3Q7IEkgZ2VuZXJhdGVkIGEg
UEVNIGZvcm1hdCBrZXlwYWlyIHVzaW5nIG9wZW5zc2w6PGJyPgomZ3Q7ICMgb3BlbnNzbCBnZW5y
c2EgLW91dCBwcml2LmtleTxicj4KJmd0OyA8YnI+CiZndDsgIyBvcGVuc3NsIHJzYSAtaW4gcHJp
di5rZXnCoCAtb3V0IHB1Yi5rZXkgLXB1Ym91dDxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7
IGFuZCB0aGVuIEkgdXNlZCB0cG0yLXRvb2xzIHRvIGltcG9ydDo8YnI+CiZndDsgIyB0cG0yX2Ny
ZWF0ZXByaW1hcnkgLUggbyAtZyBzaGEyNTYgLUcgZWNjIC1DIGNvbnRleHQub3V0PGJyPgomZ3Q7
IE9iamVjdEF0dHJpYnV0ZTogMHgwMDAzMDA3Mjxicj4KJmd0OyBDcmVhdGVQcmltYXJ5IFN1Y2Nl
ZWQgISBIYW5kbGU6IDB4ODAwMDAwZmY8YnI+CiZndDsgPGJyPgomZ3Q7ICMgdHBtMl9sb2FkIC1I
IDB4ODAwMDBmZiAtYyBjb250ZXh0Lm91dCAtciBwcml2LmtleTxicj4KJmd0OyBFUlJPUjogRmls
ZSAmcXVvdDtwcml2LmtleSZxdW90OyBzaXplIGlzIGxhcmdlciB0aGFuIGJ1ZmZlciwgZ290IDE3
NjYgZXhwZWN0ZWQgbGVzcyB0aGFuIDE1NTI8YnI+CiZndDsgYW4gZXJyb3IgYXBwZWFyZWQuPGJy
Pgo8YnI+CnRwbTJfbG9hZCBpcyBub3QgdGhlIGNvbW1hbmQgeW91IHdhbnQuIHRwbTJfbG9hZHMg
YSBUUE0gY29udHJvbGxlZCBvYmplY3QgaW50byB0aGUgVFBNLjxicj4KWW91IHdhbnQgdG8gdXNl
IHRwbTJfaW1wb3J0IHdoaWNoIGlzIG9ubHkgYXZhaWxhYmxlIG9uIHRoZSBtYXN0ZXIgYnJhbmNo
Ljxicj4KPGJyPgpFeGFtcGxlcyBpbiB0aGUgbWFuIHBhZ2U6PGJyPgo8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvbWFzdGVyL21hbi90cG0y
X2ltcG9ydC4xLm1kIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dp
dGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvbWFzdGVyL21hbi90cG0yX2lt
cG9ydC4xLm1kPC9hPjxicj4KPGJyPgo8YnI+CiZndDsgPGJyPgomZ3Q7IE15IHB1cnBvc2UgaXMg
dG8gZW5jcnlwdCBieSBwdWJsaWMga2V5IGFuZCBkZWNyeXB0IGJ5IHRwbTIuMDxicj4KJmd0OyBF
bmNyeXB0Ojxicj4KJmd0OyAjIG9wZW5zc2wgcnNhdXRsIC1lbmNyeXB0IC1pbmtleSBwdWIua2V5
wqAgLXB1YmluIC1pbiA8YSBocmVmPSJodHRwOi8vZGF0YS5pbiIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+ZGF0YS5pbjwvYT4gJmx0OzxhIGhyZWY9Imh0dHA6Ly9kYXRhLmluIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vZGF0YS5pbjwvYT4mZ3Q7wqAg
LW91dDxicj4KJmd0OyBkYXRhLmVuYzxicj4KJmd0OyA8YnI+CiZndDsgRGVjcnlwdDo8YnI+CiZn
dDsgd2hhdCBzaG91bGQgSSBkbz88YnI+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============7618021486636028297==--

