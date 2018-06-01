Content-Type: multipart/mixed; boundary="===============6270553277843566181=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] dlopen()'ing raw .so files considered bad
Date: Fri, 01 Jun 2018 16:51:53 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D010EB3C750@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D010EB3C73E@EXCH2010B.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6270553277843566181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

P.S. or should we just install everything as .so.0 and merely never imagine=
 to have a .so.1 file for
any tcti ever ?

I'm not that familiar with conventions here.
________________________________
From: Fuchs, Andreas
Sent: Friday, June 01, 2018 18:49
To: Trevor Woerner; Philip Tricca
Cc: tpm2(a)lists.01.org
Subject: RE: [tpm2] dlopen()'ing raw .so files considered bad

I just wanted to make sure we're not doing the same work twice.

The (one) symbol Tss2_Tcti_GetInfo() exported by TCTI-so-files is fixed. Th=
e data structures
returned by this (the info itself and the function lookup table) are versio=
ned in their first field.

The purpose of this was to not require so-file versioning.

Given this background, would you agree that we should not even start introd=
ucing versioned
so-file (e.g. tss2_tcti_socket.so.0) but only ever deploy unversioned so-fi=
les (tss2_tcti_socket.so).


________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Trevor Woerner [twoer=
ner(a)gmail.com]
Sent: Friday, June 01, 2018 02:15
To: Philip Tricca
Cc: tpm2(a)lists.01.org
Subject: Re: [tpm2] dlopen()'ing raw .so files considered bad

Thank you. I had been working on this for part of the afternoon and wasn't =
successful, but I wanted to raise the flag sooner rather than later.

I had tried William's patch in isolation, but found more was needed. I was =
going to dive into it harder tomorrow.

--===============6270553277843566181==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+CjwhLS0KcAoJe21hcmdpbi10b3A6MDsKCW1hcmdpbi1i
b3R0b206MH0KLS0+ClAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fTwvc3R5bGU+Cjwv
aGVhZD4KPGJvZHkgZnBzdHlsZT0iMSIgb2NzaT0iMCI+CjxkaXYgc3R5bGU9ImRpcmVjdGlvbjog
bHRyO2ZvbnQtZmFtaWx5OiBUYWhvbWE7Y29sb3I6ICMwMDAwMDA7Zm9udC1zaXplOiAxMHB0OyI+
CjxkaXY+UC5TLiBvciBzaG91bGQgd2UganVzdCBpbnN0YWxsIGV2ZXJ5dGhpbmcgYXMgLnNvLjAg
YW5kIG1lcmVseSBuZXZlciBpbWFnaW5lIHRvIGhhdmUgYSAuc28uMSBmaWxlIGZvcjwvZGl2Pgo8
ZGl2PmFueSB0Y3RpIGV2ZXIgPzwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSdtIG5vdCB0
aGF0IGZhbWlsaWFyIHdpdGggY29udmVudGlvbnMgaGVyZS48YnI+CjwvZGl2Pgo8ZGl2IHN0eWxl
PSJmb250LWZhbWlseTogVGltZXMgTmV3IFJvbWFuOyBjb2xvcjogIzAwMDAwMDsgZm9udC1zaXpl
OiAxNnB4Ij4KPGhyIHRhYmluZGV4PSItMSI+CjxkaXYgaWQ9ImRpdlJwRjExMDc0OSIgc3R5bGU9
ImRpcmVjdGlvbjogbHRyOyI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAw
MDAwMCI+PGI+RnJvbTo8L2I+IEZ1Y2hzLCBBbmRyZWFzPGJyPgo8Yj5TZW50OjwvYj4gRnJpZGF5
LCBKdW5lIDAxLCAyMDE4IDE4OjQ5PGJyPgo8Yj5Ubzo8L2I+IFRyZXZvciBXb2VybmVyOyBQaGls
aXAgVHJpY2NhPGJyPgo8Yj5DYzo8L2I+IHRwbTJAbGlzdHMuMDEub3JnPGJyPgo8Yj5TdWJqZWN0
OjwvYj4gUkU6IFt0cG0yXSBkbG9wZW4oKSdpbmcgcmF3IC5zbyBmaWxlcyBjb25zaWRlcmVkIGJh
ZDxicj4KPC9mb250Pjxicj4KPC9kaXY+CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgc3R5bGU9ImRp
cmVjdGlvbjpsdHI7IGZvbnQtZmFtaWx5OlRhaG9tYTsgY29sb3I6IzAwMDAwMDsgZm9udC1zaXpl
OjEwcHQiPgo8ZGl2PkkganVzdCB3YW50ZWQgdG8gbWFrZSBzdXJlIHdlJ3JlIG5vdCBkb2luZyB0
aGUgc2FtZSB3b3JrIHR3aWNlLjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhlIChvbmUp
IHN5bWJvbCBUc3MyX1RjdGlfR2V0SW5mbygpIGV4cG9ydGVkIGJ5IFRDVEktc28tZmlsZXMgaXMg
Zml4ZWQuIFRoZSBkYXRhIHN0cnVjdHVyZXM8L2Rpdj4KPGRpdj5yZXR1cm5lZCBieSB0aGlzICh0
aGUgaW5mbyBpdHNlbGYgYW5kIHRoZSBmdW5jdGlvbiBsb29rdXAgdGFibGUpIGFyZSB2ZXJzaW9u
ZWQgaW4gdGhlaXIgZmlyc3QgZmllbGQuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5UaGUg
cHVycG9zZSBvZiB0aGlzIHdhcyB0byBub3QgcmVxdWlyZSBzby1maWxlIHZlcnNpb25pbmcuPC9k
aXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5HaXZlbiB0aGlzIGJhY2tncm91bmQsIHdvdWxkIHlv
dSBhZ3JlZSB0aGF0IHdlIHNob3VsZCBub3QgZXZlbiBzdGFydCBpbnRyb2R1Y2luZyB2ZXJzaW9u
ZWQ8L2Rpdj4KPGRpdj5zby1maWxlIChlLmcuIHRzczJfdGN0aV9zb2NrZXQuc28uMCkgYnV0IG9u
bHkgZXZlciBkZXBsb3kgdW52ZXJzaW9uZWQgc28tZmlsZXMgKHRzczJfdGN0aV9zb2NrZXQuc28p
LjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6VGltZXMgTmV3IFJvbWFuOyBjb2xvcjojMDAwMDAwOyBmb250LXNpemU6MTZweCI+
CjxociB0YWJpbmRleD0iLTEiPgo8ZGl2IGlkPSJkaXZScEY1NTc5ODYiIHN0eWxlPSJkaXJlY3Rp
b246bHRyIj48Zm9udCBzaXplPSIyIiBmYWNlPSJUYWhvbWEiIGNvbG9yPSIjMDAwMDAwIj48Yj5G
cm9tOjwvYj4gdHBtMiBbdHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZ10gb24gYmVoYWxmIG9mIFRy
ZXZvciBXb2VybmVyIFt0d29lcm5lckBnbWFpbC5jb21dPGJyPgo8Yj5TZW50OjwvYj4gRnJpZGF5
LCBKdW5lIDAxLCAyMDE4IDAyOjE1PGJyPgo8Yj5Ubzo8L2I+IFBoaWxpcCBUcmljY2E8YnI+Cjxi
PkNjOjwvYj4gdHBtMkBsaXN0cy4wMS5vcmc8YnI+CjxiPlN1YmplY3Q6PC9iPiBSZTogW3RwbTJd
IGRsb3BlbigpJ2luZyByYXcgLnNvIGZpbGVzIGNvbnNpZGVyZWQgYmFkPGJyPgo8L2ZvbnQ+PGJy
Pgo8L2Rpdj4KPGRpdj48L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+CjxkaXYgY2xhc3M9Imdt
YWlsX2V4dHJhIj5UaGFuayB5b3UuIEkgaGFkIGJlZW4gd29ya2luZyBvbiB0aGlzIGZvciBwYXJ0
IG9mIHRoZSBhZnRlcm5vb24gYW5kIHdhc24ndCBzdWNjZXNzZnVsLCBidXQgSSB3YW50ZWQgdG8g
cmFpc2UgdGhlIGZsYWcgc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLjwvZGl2Pgo8ZGl2IGNsYXNz
PSJnbWFpbF9leHRyYSI+PGJyPgo8L2Rpdj4KPGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPkkgaGFk
IHRyaWVkIFdpbGxpYW0ncyBwYXRjaCBpbiBpc29sYXRpb24sIGJ1dCBmb3VuZCBtb3JlIHdhcyBu
ZWVkZWQuIEkgd2FzIGdvaW5nIHRvIGRpdmUgaW50byBpdCBoYXJkZXIgdG9tb3Jyb3cuPC9kaXY+
CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2JvZHk+
CjwvaHRtbD4K

--===============6270553277843566181==--

