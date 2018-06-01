Content-Type: multipart/mixed; boundary="===============7560760361304971120=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] dlopen()'ing raw .so files considered bad
Date: Fri, 01 Jun 2018 16:49:17 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D010EB3C73E@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: CAHUNapQFx2vAYaxJnuuwJ5OwdB8jJ0sKKijEhpxx1GgW2e-5xA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7560760361304971120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

--===============7560760361304971120==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+UCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9tYTtjb2xvcjogIzAwMDAwMDtmb250LXNp
emU6IDEwcHQ7Ij4KPGRpdj5JIGp1c3Qgd2FudGVkIHRvIG1ha2Ugc3VyZSB3ZSdyZSBub3QgZG9p
bmcgdGhlIHNhbWUgd29yayB0d2ljZS48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlRoZSAo
b25lKSBzeW1ib2wgVHNzMl9UY3RpX0dldEluZm8oKSBleHBvcnRlZCBieSBUQ1RJLXNvLWZpbGVz
IGlzIGZpeGVkLiBUaGUgZGF0YSBzdHJ1Y3R1cmVzPC9kaXY+CjxkaXY+cmV0dXJuZWQgYnkgdGhp
cyAodGhlIGluZm8gaXRzZWxmIGFuZCB0aGUgZnVuY3Rpb24gbG9va3VwIHRhYmxlKSBhcmUgdmVy
c2lvbmVkIGluIHRoZWlyIGZpcnN0IGZpZWxkLjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+
VGhlIHB1cnBvc2Ugb2YgdGhpcyB3YXMgdG8gbm90IHJlcXVpcmUgc28tZmlsZSB2ZXJzaW9uaW5n
LjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+R2l2ZW4gdGhpcyBiYWNrZ3JvdW5kLCB3b3Vs
ZCB5b3UgYWdyZWUgdGhhdCB3ZSBzaG91bGQgbm90IGV2ZW4gc3RhcnQgaW50cm9kdWNpbmcgdmVy
c2lvbmVkPC9kaXY+CjxkaXY+c28tZmlsZSAoZS5nLiB0c3MyX3RjdGlfc29ja2V0LnNvLjApIGJ1
dCBvbmx5IGV2ZXIgZGVwbG95IHVudmVyc2lvbmVkIHNvLWZpbGVzICh0c3MyX3RjdGlfc29ja2V0
LnNvKS48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBUaW1lcyBOZXcgUm9tYW47IGNvbG9yOiAjMDAwMDAwOyBmb250LXNpemU6
IDE2cHgiPgo8aHIgdGFiaW5kZXg9Ii0xIj4KPGRpdiBpZD0iZGl2UnBGNTU3OTg2IiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Ij48Zm9udCBzaXplPSIyIiBmYWNlPSJUYWhvbWEiIGNvbG9yPSIjMDAw
MDAwIj48Yj5Gcm9tOjwvYj4gdHBtMiBbdHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZ10gb24gYmVo
YWxmIG9mIFRyZXZvciBXb2VybmVyIFt0d29lcm5lckBnbWFpbC5jb21dPGJyPgo8Yj5TZW50Ojwv
Yj4gRnJpZGF5LCBKdW5lIDAxLCAyMDE4IDAyOjE1PGJyPgo8Yj5Ubzo8L2I+IFBoaWxpcCBUcmlj
Y2E8YnI+CjxiPkNjOjwvYj4gdHBtMkBsaXN0cy4wMS5vcmc8YnI+CjxiPlN1YmplY3Q6PC9iPiBS
ZTogW3RwbTJdIGRsb3BlbigpJ2luZyByYXcgLnNvIGZpbGVzIGNvbnNpZGVyZWQgYmFkPGJyPgo8
L2ZvbnQ+PGJyPgo8L2Rpdj4KPGRpdj48L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+CjxkaXYg
Y2xhc3M9ImdtYWlsX2V4dHJhIj5UaGFuayB5b3UuIEkgaGFkIGJlZW4gd29ya2luZyBvbiB0aGlz
IGZvciBwYXJ0IG9mIHRoZSBhZnRlcm5vb24gYW5kIHdhc24ndCBzdWNjZXNzZnVsLCBidXQgSSB3
YW50ZWQgdG8gcmFpc2UgdGhlIGZsYWcgc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyLjwvZGl2Pgo8
ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPgo8L2Rpdj4KPGRpdiBjbGFzcz0iZ21haWxfZXh0
cmEiPkkgaGFkIHRyaWVkIFdpbGxpYW0ncyBwYXRjaCBpbiBpc29sYXRpb24sIGJ1dCBmb3VuZCBt
b3JlIHdhcyBuZWVkZWQuIEkgd2FzIGdvaW5nIHRvIGRpdmUgaW50byBpdCBoYXJkZXIgdG9tb3Jy
b3cuPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============7560760361304971120==--

