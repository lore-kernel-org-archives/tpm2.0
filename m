Content-Type: multipart/mixed; boundary="===============4408934513450526651=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] 1.2 and 2.0
Date: Tue, 17 Sep 2019 07:22:57 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163B3091D@exch2010c.sit.fraunhofer.de>
In-Reply-To: CAP3jAwS+7nWaOFjPicN9im6+_3Kit1guceu=gb3hLvA8LG5+pA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4408934513450526651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

yes, 2.0 is a complete rework and not compatible with 1.2
Thus one would have to do a complete rewrite of said software.

The protocol and schemes would remain the same, but data-types and API are =
new.

Cheers,
Andreas

________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Rahul Hardikar [rahul=
hardikar(a)gmail.com]
Sent: Tuesday, September 17, 2019 03:08
To: tpm2(a)lists.01.org
Subject: [tpm2] 1.2 and 2.0

Hi All,
General question here.
Is 2.0 not at all compatible with 1.2?  The AIK scheme in 1.2 looks quite d=
ifferent than that of 2.0.

How would one migrate to 2.0 support if they implemented AIK (attestation C=
A) using 1.2 structures, for example,  1.2 defines TCPA_IDENTITY_REQ which =
is so different that what's in 2.0

How would one migrate such code?
Thanks,
Rahul

--===============4408934513450526651==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIx
IiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9t
YTtjb2xvcjogIzAwMDAwMDtmb250LXNpemU6IDEwcHQ7Ij4KPGRpdj5IaSw8L2Rpdj4KPGRpdj48
YnI+CjwvZGl2Pgo8ZGl2PnllcywgMi4wIGlzIGEgY29tcGxldGUgcmV3b3JrIGFuZCBub3QgY29t
cGF0aWJsZSB3aXRoIDEuMjwvZGl2Pgo8ZGl2PlRodXMgb25lIHdvdWxkIGhhdmUgdG8gZG8gYSBj
b21wbGV0ZSByZXdyaXRlIG9mIHNhaWQgc29mdHdhcmUuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4K
PGRpdj5UaGUgcHJvdG9jb2wgYW5kIHNjaGVtZXMgd291bGQgcmVtYWluIHRoZSBzYW1lLCBidXQg
ZGF0YS10eXBlcyBhbmQgQVBJIGFyZSBuZXcuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5D
aGVlcnMsPC9kaXY+CjxkaXY+QW5kcmVhczxicj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IFRpbWVzIE5ldyBSb21hbjsgY29sb3I6ICMwMDAwMDA7IGZv
bnQtc2l6ZTogMTZweCI+CjxociB0YWJpbmRleD0iLTEiPgo8ZGl2IGlkPSJkaXZScEYyNjY4MjUi
IHN0eWxlPSJkaXJlY3Rpb246IGx0cjsiPjxmb250IHNpemU9IjIiIGZhY2U9IlRhaG9tYSIgY29s
b3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiB0cG0yIFt0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3Jn
XSBvbiBiZWhhbGYgb2YgUmFodWwgSGFyZGlrYXIgW3JhaHVsaGFyZGlrYXJAZ21haWwuY29tXTxi
cj4KPGI+U2VudDo8L2I+IFR1ZXNkYXksIFNlcHRlbWJlciAxNywgMjAxOSAwMzowODxicj4KPGI+
VG86PC9iPiB0cG0yQGxpc3RzLjAxLm9yZzxicj4KPGI+U3ViamVjdDo8L2I+IFt0cG0yXSAxLjIg
YW5kIDIuMDxicj4KPC9mb250Pjxicj4KPC9kaXY+CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgZGly
PSJsdHIiPkhpIEFsbCwKPGRpdj5HZW5lcmFsIHF1ZXN0aW9uIGhlcmUuPGJyPgo8ZGl2PklzIDIu
MCBub3QgYXQgYWxsIGNvbXBhdGlibGUgd2l0aCAxLjI/Jm5ic3A7IFRoZSBBSUsgc2NoZW1lIGlu
IDEuMiBsb29rcyBxdWl0ZSBkaWZmZXJlbnQmbmJzcDt0aGFuIHRoYXQgb2YgMi4wLjwvZGl2Pgo8
L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PkhvdyB3b3VsZCBvbmUgbWlncmF0ZSB0byAyLjAg
c3VwcG9ydCBpZiB0aGV5IGltcGxlbWVudGVkIEFJSyAoYXR0ZXN0YXRpb24gQ0EpIHVzaW5nIDEu
MiBzdHJ1Y3R1cmVzLCBmb3IgZXhhbXBsZSwgJm5ic3A7MS4yIGRlZmluZXMgVENQQV9JREVOVElU
WV9SRVEgd2hpY2ggaXMgc28gZGlmZmVyZW50IHRoYXQgd2hhdCdzIGluIDIuMDwvZGl2Pgo8ZGl2
Pjxicj4KPC9kaXY+CjxkaXY+SG93IHdvdWxkIG9uZSBtaWdyYXRlIHN1Y2ggY29kZT8mbmJzcDs8
L2Rpdj4KPGRpdj5UaGFua3MsPC9kaXY+CjxkaXY+UmFodWw8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8
L2Rpdj4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============4408934513450526651==--

