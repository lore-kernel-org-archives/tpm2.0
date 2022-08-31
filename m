Content-Type: multipart/mixed; boundary="===============2712618206563812901=="
MIME-Version: 1.0
From: David Challener <david.c.challener at gmail.com>
Subject: [tpm2] Re: System design question
Date: Wed, 31 Aug 2022 17:21:17 -0400
Message-ID: <CAAeabfaJSAHG_wAC98G6Md6JznZfQkM+O=uKt3VtfP6xTpvnbg@mail.gmail.com>
In-Reply-To: f05d55633d2abcf9521b3ee586a93c2018cb8717.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2712618206563812901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Generally you use NV when you either have a problem with hash loops (which
is solvable, by the way), or you don't have access to other storage that
can be read when you need the value.

On Mon, Aug 22, 2022, 9:09 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> On Sun, 2022-08-21 at 14:05 +0200, Felix Rubio Dalmau wrote:
> > My apologies, I have not played with TPM for long time: I had
> > forgotten I
> > could tpm2_nvdefine, and then tpm2_nvwrite/nvread.
> >
>
> The best rule of thumb is to do everything you can to not use NV
> Indices. This is a very small and finite amount of space. I don't think
> you need to use these if you just "hardcode" the hash values.
>
> > Regards!
> > Felix
> >
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>

--===============2712618206563812901==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5HZW5lcmFsbHkgeW91IHVzZSBOViB3aGVuIHlvdSBlaXRoZXIg
aGF2ZSBhIHByb2JsZW0gd2l0aCBoYXNoIGxvb3BzICh3aGljaCBpcyBzb2x2YWJsZSwgYnkgdGhl
IHdheSksIG9yIHlvdSBkb24mIzM5O3QgaGF2ZSBhY2Nlc3MgdG8gb3RoZXIgc3RvcmFnZSB0aGF0
IGNhbiBiZSByZWFkIHdoZW4geW91IG5lZWQgdGhlIHZhbHVlLiA8YnI+PC9kaXY+PC9kaXY+PGJy
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0
ciI+T24gTW9uLCBBdWcgMjIsIDIwMjIsIDk6MDkgQU0gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8
YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2Pjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6
MWV4Ij5PbiBTdW4sIDIwMjItMDgtMjEgYXQgMTQ6MDUgKzAyMDAsIEZlbGl4IFJ1YmlvIERhbG1h
dSB3cm90ZTo8YnI+CiZndDsgTXkgYXBvbG9naWVzLCBJIGhhdmUgbm90IHBsYXllZCB3aXRoIFRQ
TSBmb3IgbG9uZyB0aW1lOiBJIGhhZDxicj4KJmd0OyBmb3Jnb3R0ZW4gSSA8YnI+CiZndDsgY291
bGQgdHBtMl9udmRlZmluZSwgYW5kIHRoZW4gdHBtMl9udndyaXRlL252cmVhZC48YnI+CiZndDsg
PGJyPgo8YnI+ClRoZSBiZXN0IHJ1bGUgb2YgdGh1bWIgaXMgdG8gZG8gZXZlcnl0aGluZyB5b3Ug
Y2FuIHRvIG5vdCB1c2UgTlY8YnI+CkluZGljZXMuIFRoaXMgaXMgYSB2ZXJ5IHNtYWxsIGFuZCBm
aW5pdGUgYW1vdW50IG9mIHNwYWNlLiBJIGRvbiYjMzk7dCB0aGluazxicj4KeW91IG5lZWQgdG8g
dXNlIHRoZXNlIGlmIHlvdSBqdXN0ICZxdW90O2hhcmRjb2RlJnF1b3Q7IHRoZSBoYXNoIHZhbHVl
cy48YnI+Cjxicj4KJmd0OyBSZWdhcmRzITxicj4KJmd0OyBGZWxpeDxicj4KJmd0OyA8YnI+CiZn
dDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZn
dDsgdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3Jn
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48
YnI+CiZndDsgVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86
dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyAlKHdlYl9wYWdlX3VybClzbGlz
dGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxicj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxh
IGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJy
PgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczxi
cj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============2712618206563812901==--

