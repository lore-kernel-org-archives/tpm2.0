Content-Type: multipart/mixed; boundary="===============8782590183424189529=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: Re: [tpm2] meta-measured updates
Date: Thu, 31 May 2018 17:20:38 -0400
Message-ID: <CAHUNapSfPkqMdeZVJv7sbcNvEzh3ad-GV2U7aGu9P-F1cnE4Bg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649BD577E@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8782590183424189529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2018 at 5:14 PM, Roberts, William C <
william.c.roberts(a)intel.com> wrote:

>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Trevor
> Woerner
> > Sent: Wednesday, May 30, 2018 4:49 PM
> > To: tpm2(a)lists.01.org
> > Subject: Re: [tpm2] meta-measured updates
> >
> > On Wed, May 30, 2018 at 5:13 PM, Trevor Woerner <twoerner(a)gmail.com
> > <mailto:twoerner(a)gmail.com> > wrote:
> >
> >
> >       Are you still keen to fold meta-measured into something else? If
> not I
> > could
> >       prepare a set of patches for meta-measured as well.
> >
> >       Looking at the master commit of tpm2-tss, specifically, I've
> noticed a
> > number
> >       of changes and was hoping for your feedback.
> >
> >       With the tss 1.x stuff we had:
> >               - libtcti-device
> >               - libtcti-socket
> >               - libsapi
> >
> >       The new tss 2.x stuff has:
> >               - libtss2-esys
>
> This is the new enhanced (I think its enhanced) system api
>
> >               - libtss2-mu
>
> This is the new marshaling library
>
> >               - libtss2-sys
>
> This is the old libsapi
>
> >               - libtss2-tcti-device
>
> This is the old device tcti
>
> >               - libtss2-tcti-mssim
>
> This is the old socket tcti
>
> >
> >       I'm guessing libtss2-tcti-device is the new name for the old
> libtcti-device.
> >       But are there any mappings from the new stuff to the older
> libtcti-socket
> > and
> >       libsapi?
>
> See above inline comments.
>

Excellent, thank you! :-)

--===============8782590183424189529==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBUaHUsIE1heSAzMSwgMjAxOCBhdCA1OjE0IFBNLCBSb2JlcnRzLCBXaWxsaWFt
IEMgPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9h
PiZndDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5n
LWxlZnQ6MWV4Ij48c3BhbiBjbGFzcz0iIj48YnI+Cjxicj4KJmd0OyAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLTxicj4KJmd0OyBGcm9tOiB0cG0yIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRw
bTItYm91bmNlc0BsaXN0cy4wMS5vcmciPnRwbTItYm91bmNlc0BsaXN0cy4wMS48d2JyPm9yZzwv
YT5dIE9uIEJlaGFsZiBPZiBUcmV2b3IgV29lcm5lcjxicj4KJmd0OyBTZW50OiBXZWRuZXNkYXks
IE1heSAzMCwgMjAxOCA0OjQ5IFBNPGJyPgomZ3Q7IFRvOiA8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyBTdWJqZWN0OiBSZTog
W3RwbTJdIG1ldGEtbWVhc3VyZWQgdXBkYXRlczxicj4KJmd0OyA8YnI+CiZndDsgT24gV2VkLCBN
YXkgMzAsIDIwMTggYXQgNToxMyBQTSwgVHJldm9yIFdvZXJuZXIgJmx0OzxhIGhyZWY9Im1haWx0
bzp0d29lcm5lckBnbWFpbC5jb20iPnR3b2VybmVyQGdtYWlsLmNvbTwvYT48YnI+Cjwvc3Bhbj48
c3BhbiBjbGFzcz0iIj4mZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnR3b2VybmVyQGdt
YWlsLmNvbSI+dHdvZXJuZXJAZ21haWwuY29tPC9hPiZndDsgJmd0OyB3cm90ZTo8YnI+CiZndDsg
PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgQXJlIHlvdSBzdGlsbCBrZWVuIHRvIGZvbGQg
bWV0YS1tZWFzdXJlZCBpbnRvIHNvbWV0aGluZyBlbHNlPyBJZiBub3QgSTxicj4KJmd0OyBjb3Vs
ZDxicj4KJmd0O8KgIMKgIMKgIMKgcHJlcGFyZSBhIHNldCBvZiBwYXRjaGVzIGZvciBtZXRhLW1l
YXN1cmVkIGFzIHdlbGwuPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgTG9va2luZyBhdCB0
aGUgbWFzdGVyIGNvbW1pdCBvZiB0cG0yLXRzcywgc3BlY2lmaWNhbGx5LCBJJiMzOTt2ZSBub3Rp
Y2VkIGE8YnI+CiZndDsgbnVtYmVyPGJyPgomZ3Q7wqAgwqAgwqAgwqBvZiBjaGFuZ2VzIGFuZCB3
YXMgaG9waW5nIGZvciB5b3VyIGZlZWRiYWNrLjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDC
oFdpdGggdGhlIHRzcyAxLnggc3R1ZmYgd2UgaGFkOjxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgLSBsaWJ0Y3RpLWRldmljZTxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLSBs
aWJ0Y3RpLXNvY2tldDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLSBsaWJzYXBpPGJy
PgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgVGhlIG5ldyB0c3MgMi54IHN0dWZmIGhhczo8YnI+
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC0gbGlidHNzMi1lc3lzPGJyPgo8YnI+Cjwvc3Bh
bj5UaGlzIGlzIHRoZSBuZXcgZW5oYW5jZWQgKEkgdGhpbmsgaXRzIGVuaGFuY2VkKSBzeXN0ZW0g
YXBpIDxicj4KPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAtIGxpYnRzczItbXU8YnI+
Cjxicj4KVGhpcyBpcyB0aGUgbmV3IG1hcnNoYWxpbmcgbGlicmFyeTxicj4KPGJyPgomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAtIGxpYnRzczItc3lzPGJyPgo8YnI+ClRoaXMgaXMgdGhlIG9s
ZCBsaWJzYXBpPGJyPgo8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC0gbGlidHNzMi10
Y3RpLWRldmljZTxicj4KPGJyPgpUaGlzIGlzIHRoZSBvbGQgZGV2aWNlIHRjdGk8YnI+Cjxicj4K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLSBsaWJ0c3MyLXRjdGktbXNzaW08YnI+Cjxicj4K
VGhpcyBpcyB0aGUgb2xkIHNvY2tldCB0Y3RpPGJyPgo8c3BhbiBjbGFzcz0iIj48YnI+CiZndDsg
PGJyPgomZ3Q7wqAgwqAgwqAgwqBJJiMzOTttIGd1ZXNzaW5nIGxpYnRzczItdGN0aS1kZXZpY2Ug
aXMgdGhlIG5ldyBuYW1lIGZvciB0aGUgb2xkIGxpYnRjdGktZGV2aWNlLjxicj4KJmd0O8KgIMKg
IMKgIMKgQnV0IGFyZSB0aGVyZSBhbnkgbWFwcGluZ3MgZnJvbSB0aGUgbmV3IHN0dWZmIHRvIHRo
ZSBvbGRlciBsaWJ0Y3RpLXNvY2tldDxicj4KJmd0OyBhbmQ8YnI+CiZndDvCoCDCoCDCoCDCoGxp
YnNhcGk/PGJyPgo8YnI+Cjwvc3Bhbj5TZWUgYWJvdmUgaW5saW5lIGNvbW1lbnRzLjxicj48L2Js
b2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+RXhjZWxsZW50LCB0aGFuayB5b3UhIDotKTxicj48L2Rp
dj48L2Rpdj48L2Rpdj4K

--===============8782590183424189529==--

