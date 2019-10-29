Content-Type: multipart/mixed; boundary="===============5294338835845212677=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: [tpm2] Re: unique identifier
Date: Tue, 29 Oct 2019 18:58:53 +0200
Message-ID: <CAAxBZJsn7+9T_WmWuOtsKUXh-0eK3wrV0TEswHxfy-3ej-sNKA@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E2C231@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5294338835845212677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

IIRC the EK is generated from a seed unique to each TPM and typically
implemented as a set of fuses blown at manufacturing time. So the EK can be
generated in a predictable manner and therefore the EK_public can act as an
identifier for that TPM.

The privacy aspect applies to the AK as far as I recall reading, but the
notion of privacy here is rather tenuous anyway.

At least in our work, the EK and AK have proven robust enough to be used as
permanent identifiers

Ian

On Tue, 29 Oct 2019 at 18:40, Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> I think that's intentional by design due to privacy concerns.
>
> > -----Original Message-----
> > From: Max Halld=C3=A9n [mailto:max.hallden(a)wisi.se]
> > Sent: Tuesday, October 29, 2019 9:58 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] unique identifier
> >
> > Hi all,
> >
> > I'm looking for some kind of unique identifier for the tpm that can't be
> cleared.
> > AFAICT the TPM2 standard doesn't contain anything like this? The closest
> thing is
> > the EK I guess, but even that can be cleared.
> >
> > Regards,
> > Max
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

--===============5294338835845212677==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5JSVJDIHRoZSBFSyBpcyBnZW5lcmF0ZWQgZnJvbSBhIHNlZWQg
dW5pcXVlIHRvIGVhY2ggVFBNIGFuZCB0eXBpY2FsbHkgaW1wbGVtZW50ZWQgYXMgYSBzZXQgb2Yg
ZnVzZXMgYmxvd24gYXQgbWFudWZhY3R1cmluZyB0aW1lLiBTbyB0aGUgRUsgY2FuIGJlIGdlbmVy
YXRlZCBpbiBhIHByZWRpY3RhYmxlIG1hbm5lciBhbmQgdGhlcmVmb3JlIHRoZSBFS19wdWJsaWMg
Y2FuIGFjdCBhcyBhbiBpZGVudGlmaWVyIGZvciB0aGF0IFRQTS4gPGJyPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+VGhlIHByaXZhY3kgYXNwZWN0IGFwcGxpZXMgdG8gdGhlIEFLIGFzIGZhciBh
cyBJIHJlY2FsbCByZWFkaW5nLCBidXQgdGhlIG5vdGlvbiBvZiBwcml2YWN5IGhlcmUgaXMgcmF0
aGVyIHRlbnVvdXMgYW55d2F5LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QXQgbGVhc3QgaW4g
b3VyIHdvcmssIHRoZSBFSyBhbmQgQUsgaGF2ZSBwcm92ZW4gcm9idXN0IGVub3VnaCB0byBiZSB1
c2VkIGFzIHBlcm1hbmVudCBpZGVudGlmaWVyczxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
Pklhbjxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGly
PSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIDI5IE9jdCAyMDE5IGF0IDE4OjQwLCBS
b2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0Bp
bnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGlu
Zy1sZWZ0OjFleCI+SSB0aGluayB0aGF0JiMzOTtzIGludGVudGlvbmFsIGJ5IGRlc2lnbiBkdWUg
dG8gcHJpdmFjeSBjb25jZXJucy48YnI+Cjxicj4KJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLTxicj4KJmd0OyBGcm9tOiBNYXggSGFsbGTDqW4gW21haWx0bzo8YSBocmVmPSJtYWlsdG86
bWF4LmhhbGxkZW5Ad2lzaS5zZSIgdGFyZ2V0PSJfYmxhbmsiPm1heC5oYWxsZGVuQHdpc2kuc2U8
L2E+XTxicj4KJmd0OyBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI5LCAyMDE5IDk6NTggQU08YnI+
CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyBTdWJqZWN0OiBbdHBtMl0gdW5pcXVl
IGlkZW50aWZpZXI8YnI+CiZndDsgPGJyPgomZ3Q7IEhpIGFsbCw8YnI+CiZndDsgPGJyPgomZ3Q7
IEkmIzM5O20gbG9va2luZyBmb3Igc29tZSBraW5kIG9mIHVuaXF1ZSBpZGVudGlmaWVyIGZvciB0
aGUgdHBtIHRoYXQgY2FuJiMzOTt0IGJlIGNsZWFyZWQuPGJyPgomZ3Q7IEFGQUlDVCB0aGUgVFBN
MiBzdGFuZGFyZCBkb2VzbiYjMzk7dCBjb250YWluIGFueXRoaW5nIGxpa2UgdGhpcz8gVGhlIGNs
b3Nlc3QgdGhpbmcgaXM8YnI+CiZndDsgdGhlIEVLIEkgZ3Vlc3MsIGJ1dCBldmVuIHRoYXQgY2Fu
IGJlIGNsZWFyZWQuPGJyPgomZ3Q7IDxicj4KJmd0OyBSZWdhcmRzLDxicj4KJmd0OyBNYXg8YnI+
CiZndDsgPGJyPgomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fPGJyPgomZ3Q7IHRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4K
Jmd0OyBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0y
LWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnPC9hPjxicj4KJmd0OyAlKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2lu
dGVybmFsX25hbWUpczxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT48
YnI+CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============5294338835845212677==--

