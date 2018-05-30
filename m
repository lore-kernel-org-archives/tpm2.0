Content-Type: multipart/mixed; boundary="===============5731561870927396520=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: Re: [tpm2] meta-measured updates
Date: Wed, 30 May 2018 19:48:59 -0400
Message-ID: <CAHUNapSA-Etb1L3hkRwm6UkH4__LuWf9=ejLZ8mXetfirEniLA@mail.gmail.com>
In-Reply-To: 20180530211304.GA11797@linux-uys3
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5731561870927396520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2018 at 5:13 PM, Trevor Woerner <twoerner(a)gmail.com> wrot=
e:

> Are you still keen to fold meta-measured into something else? If not I
> could
> prepare a set of patches for meta-measured as well.
>
> Looking at the master commit of tpm2-tss, specifically, I've noticed a
> number
> of changes and was hoping for your feedback.
>
> With the tss 1.x stuff we had:
>         - libtcti-device
>         - libtcti-socket
>         - libsapi
>
> The new tss 2.x stuff has:
>         - libtss2-esys
>         - libtss2-mu
>         - libtss2-sys
>         - libtss2-tcti-device
>         - libtss2-tcti-mssim
>
> I'm guessing libtss2-tcti-device is the new name for the old
> libtcti-device.
> But are there any mappings from the new stuff to the older libtcti-socket
> and
> libsapi?
>

In any case, here's a WIP of my changes:
https://github.com/twoerner/meta-secure-core/tree/contrib/twoerner/tpm2-rec=
ipe-updates/meta-tpm2/recipes-tpm

Specifically, please take a look at the _git recipes, which currently build
off the master branch of all tpm2-software's components.
What do you think of tpm2-tss/tpm2-tss_git.bb's PACKAGES?

--===============5731561870927396520==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBXZWQsIE1heSAzMCwgMjAxOCBhdCA1OjEzIFBNLCBUcmV2b3IgV29lcm5lciA8
c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzp0d29lcm5lckBnbWFpbC5jb20iIHRh
cmdldD0iX2JsYW5rIj50d29lcm5lckBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJy
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij5BcmUgeW91IHN0aWxsIGtlZW4gdG8gZm9sZCBtZXRhLW1lYXN1cmVkIGludG8gc29t
ZXRoaW5nIGVsc2U/IElmIG5vdCBJIGNvdWxkPGJyPgpwcmVwYXJlIGEgc2V0IG9mIHBhdGNoZXMg
Zm9yIG1ldGEtbWVhc3VyZWQgYXMgd2VsbC48YnI+Cjxicj4KTG9va2luZyBhdCB0aGUgbWFzdGVy
IGNvbW1pdCBvZiB0cG0yLXRzcywgc3BlY2lmaWNhbGx5LCBJJiMzOTt2ZSBub3RpY2VkIGEgbnVt
YmVyPGJyPgpvZiBjaGFuZ2VzIGFuZCB3YXMgaG9waW5nIGZvciB5b3VyIGZlZWRiYWNrLjxicj4K
PGJyPgpXaXRoIHRoZSB0c3MgMS54IHN0dWZmIHdlIGhhZDo8YnI+CsKgIMKgIMKgIMKgIC0gbGli
dGN0aS1kZXZpY2U8YnI+CsKgIMKgIMKgIMKgIC0gbGlidGN0aS1zb2NrZXQ8YnI+CsKgIMKgIMKg
IMKgIC0gbGlic2FwaTxicj4KPGJyPgpUaGUgbmV3IHRzcyAyLnggc3R1ZmYgaGFzOjxicj4KwqAg
wqAgwqAgwqAgLSBsaWJ0c3MyLWVzeXM8YnI+CsKgIMKgIMKgIMKgIC0gbGlidHNzMi1tdTxicj4K
wqAgwqAgwqAgwqAgLSBsaWJ0c3MyLXN5czxicj4KwqAgwqAgwqAgwqAgLSBsaWJ0c3MyLXRjdGkt
ZGV2aWNlPGJyPgrCoCDCoCDCoCDCoCAtIGxpYnRzczItdGN0aS1tc3NpbTxicj4KPGJyPgpJJiMz
OTttIGd1ZXNzaW5nIGxpYnRzczItdGN0aS1kZXZpY2UgaXMgdGhlIG5ldyBuYW1lIGZvciB0aGUg
b2xkIGxpYnRjdGktZGV2aWNlLjxicj4KQnV0IGFyZSB0aGVyZSBhbnkgbWFwcGluZ3MgZnJvbSB0
aGUgbmV3IHN0dWZmIHRvIHRoZSBvbGRlciBsaWJ0Y3RpLXNvY2tldCBhbmQ8YnI+CmxpYnNhcGk/
PGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkluIGFueSBjYXNlLCBoZXJlJiMz
OTtzIGEgV0lQIG9mIG15IGNoYW5nZXM6PC9kaXY+PGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1
Yi5jb20vdHdvZXJuZXIvbWV0YS1zZWN1cmUtY29yZS90cmVlL2NvbnRyaWIvdHdvZXJuZXIvdHBt
Mi1yZWNpcGUtdXBkYXRlcy9tZXRhLXRwbTIvcmVjaXBlcy10cG0iPmh0dHBzOi8vZ2l0aHViLmNv
bS90d29lcm5lci9tZXRhLXNlY3VyZS1jb3JlL3RyZWUvY29udHJpYi90d29lcm5lci90cG0yLXJl
Y2lwZS11cGRhdGVzL21ldGEtdHBtMi9yZWNpcGVzLXRwbTwvYT48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PlNwZWNpZmljYWxseSwgcGxlYXNlIHRha2UgYSBsb29rIGF0IHRoZSBfZ2l0IHJlY2lw
ZXMsIHdoaWNoIGN1cnJlbnRseSBidWlsZCBvZmYgdGhlIG1hc3RlciBicmFuY2ggb2YgYWxsIHRw
bTItc29mdHdhcmUmIzM5O3MgY29tcG9uZW50cy48L2Rpdj48ZGl2PldoYXQgZG8geW91IHRoaW5r
IG9mIHRwbTItdHNzLzxhIGhyZWY9Imh0dHA6Ly90cG0yLXRzc19naXQuYmIiPnRwbTItdHNzX2dp
dC5iYjwvYT4mIzM5O3MgUEFDS0FHRVM/PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============5731561870927396520==--

