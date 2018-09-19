Content-Type: multipart/mixed; boundary="===============4549475132602118693=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Any way to change NVRAM index password?
Date: Wed, 19 Sep 2018 14:37:11 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0142646272@exch2010c.sit.fraunhofer.de>
In-Reply-To: d4e8010b6f3e4edc9054f0a96a3efd58@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4549475132602118693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The normal anser:
It's complicated and requires quite some thought, so release+define is prob=
ably easier.

The TPM-nerd answer:
The TPM-function for this is TPM2_NV_ChangeAuth, but it requires a policy-s=
ession and you must have defined a policy with PolicyCommandCode(TPM2_CC_NV=
_CHANGEAUTH), since it's an admin auth.

Cheers,
Andreas

________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Scheie, Peter M [Petr=
e.Scheie(a)gd-ms.com]
Sent: Wednesday, September 19, 2018 14:47
To: tpm2(a)lists.01.org
Subject: [tpm2] Any way to change NVRAM index password?

When I define an NVRAM index using tpm2_nvdefine, one thing I set is the in=
dex password with the =E2=80=93I option.  I=E2=80=99m also setting the attr=
ibute ownerwrite for the index so the index can be written only if one know=
s the index password.  Is there any way to change this password after I=E2=
=80=99ve set it, or do I have to remove the whole index (tpm2_nvrelease) an=
d recreate it with the new password?

Peter

--===============4549475132602118693==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9V2luZG93cy0xMjUyIj4KPHN0eWxlPgo8IS0tCkBm
b250LWZhY2UKCXtmb250LWZhbWlseTpDYWxpYnJpfQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFs
LCBkaXYuTXNvTm9ybWFsCgl7bWFyZ2luOjBpbjsKCW1hcmdpbi1ib3R0b206LjAwMDFwdDsKCWZv
bnQtc2l6ZToxMS4wcHQ7Cglmb250LWZhbWlseToiQ2FsaWJyaSIsInNhbnMtc2VyaWYifQphOmxp
bmssIHNwYW4uTXNvSHlwZXJsaW5rCgl7Y29sb3I6Ymx1ZTsKCXRleHQtZGVjb3JhdGlvbjp1bmRl
cmxpbmV9CmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZAoJe2NvbG9yOnB1cnBs
ZTsKCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmV9CnNwYW4uRW1haWxTdHlsZTE3Cgl7Zm9udC1m
YW1pbHk6IkNhbGlicmkiLCJzYW5zLXNlcmlmIjsKCWNvbG9yOndpbmRvd3RleHR9Ci5Nc29DaHBE
ZWZhdWx0Cgl7Zm9udC1mYW1pbHk6IkNhbGlicmkiLCJzYW5zLXNlcmlmIn0KQHBhZ2UgV29yZFNl
Y3Rpb24xCgl7bWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlufQotLT4KPC9zdHlsZT48c3R5
bGUgdHlwZT0idGV4dC9jc3MiIGlkPSJvd2FQYXJhU3R5bGUiPlAge21hcmdpbi10b3A6MDttYXJn
aW4tYm90dG9tOjA7fTwvc3R5bGU+CjwvaGVhZD4KPGJvZHkgZnBzdHlsZT0iMSIgb2NzaT0iMCIg
dmxpbms9InB1cnBsZSIgbGluaz0iYmx1ZSIgbGFuZz0iRU4tVVMiPgo8ZGl2IHN0eWxlPSJkaXJl
Y3Rpb246IGx0cjtmb250LWZhbWlseTogVGFob21hO2NvbG9yOiAjMDAwMDAwO2ZvbnQtc2l6ZTog
MTBwdDsiPgo8ZGl2Pgo8ZGl2PlRoZSBub3JtYWwgYW5zZXI6PC9kaXY+CjxkaXY+SXQncyBjb21w
bGljYXRlZCBhbmQgcmVxdWlyZXMgcXVpdGUgc29tZSB0aG91Z2h0LCBzbyByZWxlYXNlJiM0Mztk
ZWZpbmUgaXMgcHJvYmFibHkgZWFzaWVyLjxicj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPC9k
aXY+CjxkaXY+VGhlIFRQTS1uZXJkIGFuc3dlcjo8YnI+CjwvZGl2Pgo8ZGl2PlRoZSBUUE0tZnVu
Y3Rpb24gZm9yIHRoaXMgaXMgVFBNMl9OVl9DaGFuZ2VBdXRoLCBidXQgaXQgcmVxdWlyZXMgYSBw
b2xpY3ktc2Vzc2lvbiBhbmQgeW91IG11c3QgaGF2ZSBkZWZpbmVkIGEgcG9saWN5IHdpdGggUG9s
aWN5Q29tbWFuZENvZGUoVFBNMl9DQ19OVl9DSEFOR0VBVVRIKSwgc2luY2UgaXQncyBhbiBhZG1p
biBhdXRoLjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+Q2hlZXJzLDwvZGl2Pgo8ZGl2PkFu
ZHJlYXM8YnI+CjwvZGl2Pgo8YnI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBUaW1lcyBOZXcg
Um9tYW47IGNvbG9yOiAjMDAwMDAwOyBmb250LXNpemU6IDE2cHgiPgo8aHIgdGFiaW5kZXg9Ii0x
Ij4KPGRpdiBpZD0iZGl2UnBGNzYwMDY2IiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7Ij48Zm9udCBz
aXplPSIyIiBmYWNlPSJUYWhvbWEiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gdHBtMiBb
dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZ10gb24gYmVoYWxmIG9mIFNjaGVpZSwgUGV0ZXIgTSBb
UGV0cmUuU2NoZWllQGdkLW1zLmNvbV08YnI+CjxiPlNlbnQ6PC9iPiBXZWRuZXNkYXksIFNlcHRl
bWJlciAxOSwgMjAxOCAxNDo0Nzxicj4KPGI+VG86PC9iPiB0cG0yQGxpc3RzLjAxLm9yZzxicj4K
PGI+U3ViamVjdDo8L2I+IFt0cG0yXSBBbnkgd2F5IHRvIGNoYW5nZSBOVlJBTSBpbmRleCBwYXNz
d29yZD88YnI+CjwvZm9udD48YnI+CjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8ZGl2Pgo8ZGl2IGNsYXNz
PSJXb3JkU2VjdGlvbjEiPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj5XaGVuIEkgZGVmaW5lIGFuIE5W
UkFNIGluZGV4IHVzaW5nIHRwbTJfbnZkZWZpbmUsIG9uZSB0aGluZyBJIHNldCBpcyB0aGUgaW5k
ZXggcGFzc3dvcmQgd2l0aCB0aGUglkkgb3B0aW9uLiZuYnNwOyBJkm0gYWxzbyBzZXR0aW5nIHRo
ZSBhdHRyaWJ1dGUgb3duZXJ3cml0ZSBmb3IgdGhlIGluZGV4IHNvIHRoZSBpbmRleCBjYW4gYmUg
d3JpdHRlbiBvbmx5IGlmIG9uZSBrbm93cyB0aGUgaW5kZXggcGFzc3dvcmQuJm5ic3A7IElzIHRo
ZXJlCiBhbnkgd2F5IHRvIGNoYW5nZSB0aGlzIHBhc3N3b3JkIGFmdGVyIEmSdmUgc2V0IGl0LCBv
ciBkbyBJIGhhdmUgdG8gcmVtb3ZlIHRoZSB3aG9sZSBpbmRleCAodHBtMl9udnJlbGVhc2UpIGFu
ZCByZWNyZWF0ZSBpdCB3aXRoIHRoZSBuZXcgcGFzc3dvcmQ/PC9wPgo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4mbmJzcDs8L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBldGVyPC9wPgo8L2Rpdj4KPC9k
aXY+CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============4549475132602118693==--

