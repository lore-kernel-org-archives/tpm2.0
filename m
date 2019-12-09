Content-Type: multipart/mixed; boundary="===============3810181094189573514=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Generate keypair using OpenSSL, then load into TPM2
Date: Mon, 09 Dec 2019 12:48:11 -0800
Message-ID: <CAOCvsS=1Y-F4dBSHN4+Q=GxzHoC=0OCVSSPhZGEBg3-qgQyTVQ@mail.gmail.com>
In-Reply-To: CALtZhhN+bZh7NicxBZ9yjo1CQS7m0bbj=wgh9ueVPafKVC1xWQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3810181094189573514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Have you tried loading the keypair with permissions that let you sign and
try to sign a digest with it?  Maybe you've just zero'd out a copy of the
public key and a self signature or something?  Even a DER of an openSSL
private key is much larger than it needs to be.

Here's a rough layout of a 2048RSA private key I'm looking at with -text.
Modulus ~256 bytes
public exponent <=3D4 bytes
Private exponent ~256 bytes
Prime 1 ~128 bytes
Prime 2 ~128 bytes
Exponent 1 ~128 bytes
Exponent 2 ~128 bytes
Coefficient ~128 bytes
If that helps you might be able to guess which parts of the key you're
zeroing.

--===============3810181094189573514==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPkhhdmUgeW91IHRyaWVkIGxvYWRpbmcgdGhlIGtleXBhaXIgd2l0aCBw
ZXJtaXNzaW9ucyB0aGF0IGxldCB5b3Ugc2lnbiBhbmQgdHJ5IHRvIHNpZ24gYSBkaWdlc3Qgd2l0
aCBpdD/CoCBNYXliZSB5b3UmIzM5O3ZlIGp1c3QgemVybyYjMzk7ZCBvdXQgYSBjb3B5IG9mIHRo
ZSBwdWJsaWMga2V5IGFuZCBhIHNlbGYgc2lnbmF0dXJlIG9yIHNvbWV0aGluZz/CoCBFdmVuIGEg
REVSIG9mIGFuIG9wZW5TU0wgcHJpdmF0ZSBrZXkgaXMgbXVjaCBsYXJnZXIgdGhhbiBpdCBuZWVk
cyB0byBiZS7CoDxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkhlcmUm
IzM5O3MgYSByb3VnaCBsYXlvdXQgb2YgYSAyMDQ4UlNBIHByaXZhdGUga2V5IEkmIzM5O20gbG9v
a2luZyBhdCB3aXRoIC10ZXh0LjwvZGl2PjxkaXYgZGlyPSJhdXRvIj5Nb2R1bHVzIH4yNTYgYnl0
ZXM8L2Rpdj48ZGl2IGRpcj0iYXV0byI+cHVibGljIGV4cG9uZW50ICZsdDs9NCBieXRlczwvZGl2
PjxkaXYgZGlyPSJhdXRvIj5Qcml2YXRlIGV4cG9uZW50IH4yNTYgYnl0ZXM8L2Rpdj48ZGl2IGRp
cj0iYXV0byI+UHJpbWUgMSB+MTI4IGJ5dGVzPC9kaXY+PGRpdiBkaXI9ImF1dG8iPlByaW1lIDLC
oDxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpzYW5zLXNlcmlmIj5+MTI4IGJ5dGVzPC9zcGFuPjwv
ZGl2PjxkaXYgZGlyPSJhdXRvIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6c2Fucy1zZXJpZiI+
RXhwb25lbnQgMcKgPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpzYW5zLXNlcmlmIj5+
MTI4IGJ5dGVzPC9zcGFuPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6c2Fucy1zZXJpZiI+RXhwb25lbnQgMsKgPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZh
bWlseTpzYW5zLXNlcmlmIj5+MTI4IGJ5dGVzPC9zcGFuPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6c2Fucy1zZXJpZiI+Q29lZmZpY2llbnTCoDwvc3Bhbj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6c2Fucy1zZXJpZiI+fjEyOCBieXRlczwvc3Bhbj48L2Rp
dj48ZGl2IGRpcj0iYXV0byI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OnNhbnMtc2VyaWYiPklm
IHRoYXQgaGVscHMgeW91IG1pZ2h0IGJlIGFibGUgdG8gZ3Vlc3Mgd2hpY2ggcGFydHMgb2YgdGhl
IGtleSB5b3UmIzM5O3JlIHplcm9pbmcuPC9zcGFuPjwvZGl2PjwvZGl2Pgo=

--===============3810181094189573514==--

