Content-Type: multipart/mixed; boundary="===============6166552034575615690=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] does anyone compile tpm2-tss-2.1.0 successful on CentOS7?
Date: Thu, 18 Oct 2018 10:35:15 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0147347A88@exch2010c.sit.fraunhofer.de>
In-Reply-To: CA+tBKVgSH+YAbvO1NPiNvnbzExS3e0Tc1dERG9wZoZg8vTQ_rw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6166552034575615690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tpm2-tss requires libgcrypt20 (at least that's was it's called on Ubuntu).
libgcrypt (which is the 1.x branch) is quite old and had a different API th=
an the 20 series...

Maybe that's the problem...
________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Terry An [terry.an.bj=
(a)gmail.com]
Sent: Thursday, October 18, 2018 12:18
To: tpm2(a)lists.01.org
Subject: [tpm2] does anyone compile tpm2-tss-2.1.0 successful on CentOS7?

lots of errors on my laptop.

I have updated libgpg-error, libgcrypt-devel, etc..

--===============6166552034575615690==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+UCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9tYTtjb2xvcjogIzAwMDAwMDtmb250LXNp
emU6IDEwcHQ7Ij4KPGRpdj50cG0yLXRzcyByZXF1aXJlcyBsaWJnY3J5cHQyMCAoYXQgbGVhc3Qg
dGhhdCdzIHdhcyBpdCdzIGNhbGxlZCBvbiBVYnVudHUpLjwvZGl2Pgo8ZGl2PmxpYmdjcnlwdCAo
d2hpY2ggaXMgdGhlIDEueCBicmFuY2gpIGlzIHF1aXRlIG9sZCBhbmQgaGFkIGEgZGlmZmVyZW50
IEFQSSB0aGFuIHRoZSAyMCBzZXJpZXMuLi48YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+Cjxk
aXY+TWF5YmUgdGhhdCdzIHRoZSBwcm9ibGVtLi4uPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6IFRpbWVzIE5ldyBSb21hbjsgY29sb3I6ICMwMDAwMDA7IGZvbnQtc2l6ZTogMTZw
eCI+CjxociB0YWJpbmRleD0iLTEiPgo8ZGl2IGlkPSJkaXZScEYzMzExMDAiIHN0eWxlPSJkaXJl
Y3Rpb246IGx0cjsiPjxmb250IHNpemU9IjIiIGZhY2U9IlRhaG9tYSIgY29sb3I9IiMwMDAwMDAi
PjxiPkZyb206PC9iPiB0cG0yIFt0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnXSBvbiBiZWhhbGYg
b2YgVGVycnkgQW4gW3RlcnJ5LmFuLmJqQGdtYWlsLmNvbV08YnI+CjxiPlNlbnQ6PC9iPiBUaHVy
c2RheSwgT2N0b2JlciAxOCwgMjAxOCAxMjoxODxicj4KPGI+VG86PC9iPiB0cG0yQGxpc3RzLjAx
Lm9yZzxicj4KPGI+U3ViamVjdDo8L2I+IFt0cG0yXSBkb2VzIGFueW9uZSBjb21waWxlIHRwbTIt
dHNzLTIuMS4wIHN1Y2Nlc3NmdWwgb24gQ2VudE9TNz88YnI+CjwvZm9udD48YnI+CjwvZGl2Pgo8
ZGl2PjwvZGl2Pgo8ZGl2Pgo8ZGl2IGRpcj0ibHRyIj5sb3RzIG9mIGVycm9ycyBvbiBteSBsYXB0
b3AuCjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5JIGhhdmUgdXBkYXRlZCBsaWJncGctZXJyb3IsIGxp
YmdjcnlwdC1kZXZlbCwgZXRjLi48L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+Cjwv
Ym9keT4KPC9odG1sPgo=

--===============6166552034575615690==--

