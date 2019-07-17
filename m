Content-Type: multipart/mixed; boundary="===============2540460977443287663=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Hmac session
Date: Wed, 17 Jul 2019 10:05:23 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163AE8437@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: CA+M7zR3b-aEx36Uuh7dShUPM9jPA6Basbzq07_OMWwWvb9CXRg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2540460977443287663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

HMAC sessions are used for authorizing key usage and such.
Please see Chapter 19 of https://www.trustedcomputinggroup.org/wp-content/u=
ploads/TPM-Rev-2.0-Part-1-Architecture-01.38.pdf for a destription. Very in=
formative.

You can start an HMAC session using Esys_StartAuthSession and the providing=
 this session in subsequent Esys_* calls to the TPM.

Cheers,
Andreas
________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of ramyasnair ramyasnair=
 [ramyasnair1996(a)gmail.com]
Sent: Wednesday, July 17, 2019 06:12
To: tpm2(a)lists.01.org
Subject: [tpm2] Hmac session

Hi,
What is the use of HMAC session authorisation and how to create a HMAC sess=
ion?
Thanks and Regards
Ramya

--===============2540460977443287663==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIx
IiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9t
YTtjb2xvcjogIzAwMDAwMDtmb250LXNpemU6IDEwcHQ7Ij4KPGRpdj5ITUFDIHNlc3Npb25zIGFy
ZSB1c2VkIGZvciBhdXRob3JpemluZyBrZXkgdXNhZ2UgYW5kIHN1Y2guPC9kaXY+CjxkaXY+UGxl
YXNlIHNlZSBDaGFwdGVyIDE5IG9mIDxhIGhyZWY9Imh0dHBzOi8vd3d3LnRydXN0ZWRjb21wdXRp
bmdncm91cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RQTS1SZXYtMi4wLVBhcnQtMS1BcmNoaXRl
Y3R1cmUtMDEuMzgucGRmIiB0YXJnZXQ9Il9ibGFuayI+Cmh0dHBzOi8vd3d3LnRydXN0ZWRjb21w
dXRpbmdncm91cC5vcmcvd3AtY29udGVudC91cGxvYWRzL1RQTS1SZXYtMi4wLVBhcnQtMS1BcmNo
aXRlY3R1cmUtMDEuMzgucGRmPC9hPiBmb3IgYSBkZXN0cmlwdGlvbi4gVmVyeSBpbmZvcm1hdGl2
ZS48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PllvdSBjYW4gc3RhcnQgYW4gSE1BQyBzZXNz
aW9uIHVzaW5nIEVzeXNfU3RhcnRBdXRoU2Vzc2lvbiBhbmQgdGhlIHByb3ZpZGluZyB0aGlzIHNl
c3Npb24gaW4gc3Vic2VxdWVudCBFc3lzXyogY2FsbHMgdG8gdGhlIFRQTS48L2Rpdj4KPGRpdj48
YnI+CjwvZGl2Pgo8ZGl2PkNoZWVycyw8L2Rpdj4KPGRpdj5BbmRyZWFzPGJyPgo8L2Rpdj4KPGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IFRpbWVzIE5ldyBSb21hbjsgY29sb3I6ICMwMDAwMDA7IGZv
bnQtc2l6ZTogMTZweCI+CjxociB0YWJpbmRleD0iLTEiPgo8ZGl2IGlkPSJkaXZScEYxNDAxODci
IHN0eWxlPSJkaXJlY3Rpb246IGx0cjsiPjxmb250IHNpemU9IjIiIGZhY2U9IlRhaG9tYSIgY29s
b3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiB0cG0yIFt0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3Jn
XSBvbiBiZWhhbGYgb2YgcmFteWFzbmFpciByYW15YXNuYWlyIFtyYW15YXNuYWlyMTk5NkBnbWFp
bC5jb21dPGJyPgo8Yj5TZW50OjwvYj4gV2VkbmVzZGF5LCBKdWx5IDE3LCAyMDE5IDA2OjEyPGJy
Pgo8Yj5Ubzo8L2I+IHRwbTJAbGlzdHMuMDEub3JnPGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJd
IEhtYWMgc2Vzc2lvbjxicj4KPC9mb250Pjxicj4KPC9kaXY+CjxkaXY+PC9kaXY+CjxkaXY+Cjxk
aXYgZGlyPSJhdXRvIj5IaSwKPGRpdiBkaXI9ImF1dG8iPldoYXQgaXMgdGhlIHVzZSBvZiBITUFD
IHNlc3Npb24gYXV0aG9yaXNhdGlvbiBhbmQgaG93IHRvIGNyZWF0ZSBhIEhNQUMgc2Vzc2lvbj88
L2Rpdj4KPGRpdiBkaXI9ImF1dG8iPlRoYW5rcyBhbmQgUmVnYXJkczwvZGl2Pgo8ZGl2IGRpcj0i
YXV0byI+UmFteWE8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvYm9keT4KPC9o
dG1sPgo=

--===============2540460977443287663==--

