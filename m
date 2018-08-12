Content-Type: multipart/mixed; boundary="===============9184804917118007970=="
MIME-Version: 1.0
From: Davide Rutigliano <davide.ruti at gmail.com>
Subject: [tpm2] Tpm2 NV read public
Date: Sun, 12 Aug 2018 14:49:12 +0200
Message-ID: <CAOysEadPje6YNsL6tKB7nHUSBZB_yRgqUKRSuf8zON=cz0YuBg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9184804917118007970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm in trouble with tpm2 NV read public command.

What I mean is that everything goes fine if I run first DefineSpace and
then ReadPublic, passing as an argument to the latter the nvHandle obtained
from the NV_DefineSpace.

The problem arises when I run for the second time the program and the NV
Index is already defined and I would not create another one, but simply run
ReadPublic on the already existent nvIndex.

The problem is I don't know how to obtain the nvHandle to properly run the
TPM command (I receive error code: 0x00000184 -> ESYS_TR not correct).

Can someone help me?

Hope my question is clear,
thanks in advance.

Regards,
Davide.

--===============9184804917118007970==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OnNhbnMtc2VyaWY7Zm9udC1z
aXplOjEyLjhweCIgZGlyPSJhdXRvIj48ZGl2IHN0eWxlPSJtYXJnaW46MTZweCAwcHgiPjxkaXY+
PGRpdiBkaXI9ImF1dG8iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij5IaSBhbGwsPC9z
cGFuPjxkaXYgZGlyPSJhdXRvIiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+PGJyPjwvZGl2Pjxk
aXYgZGlyPSJhdXRvIiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+SSYjMzk7bSBpbiB0cm91Ymxl
IHdpdGggdHBtMiBOViByZWFkIHB1YmxpYyBjb21tYW5kLjwvZGl2PjxkaXYgZGlyPSJhdXRvIiBz
dHlsZT0iZm9udC1zaXplOjEyLjhweCI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIiBzdHlsZT0i
Zm9udC1zaXplOjEyLjhweCI+V2hhdCBJIG1lYW4gaXMgdGhhdCBldmVyeXRoaW5nIGdvZXMgZmlu
ZSBpZiBJIHJ1biBmaXJzdCBEZWZpbmVTcGFjZSBhbmQgdGhlbiBSZWFkUHVibGljLCBwYXNzaW5n
IGFzIGFuIGFyZ3VtZW50IHRvIHRoZSBsYXR0ZXIgdGhlIG52SGFuZGxlIG9idGFpbmVkIGZyb20g
dGhlIE5WX0RlZmluZVNwYWNlLjwvZGl2PjxkaXYgZGlyPSJhdXRvIiBzdHlsZT0iZm9udC1zaXpl
OjEyLjhweCI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIiBzdHlsZT0iZm9udC1zaXplOjEyLjhw
eCI+VGhlIHByb2JsZW0gYXJpc2VzIHdoZW4gSSBydW4gZm9yIHRoZSBzZWNvbmQgdGltZSB0aGUg
cHJvZ3JhbSBhbmQgdGhlIE5WIEluZGV4IGlzIGFscmVhZHkgZGVmaW5lZCBhbmQgSSB3b3VsZCBu
b3QgY3JlYXRlIGFub3RoZXIgb25lLCBidXQgc2ltcGx5IHJ1biBSZWFkUHVibGljIG9uIHRoZSBh
bHJlYWR5IGV4aXN0ZW50IG52SW5kZXguPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJmb250
LXNpemU6MTIuOHB4Ij48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJmb250LXNpemU6
MTIuOHB4Ij5UaGUgcHJvYmxlbSBpcyBJIGRvbiYjMzk7dCBrbm93IGhvdyB0byBvYnRhaW4gdGhl
IG52SGFuZGxlIHRvIHByb3Blcmx5IHJ1biB0aGUgVFBNIGNvbW1hbmQgKEkgcmVjZWl2ZSBlcnJv
ciBjb2RlOiAweDAwMDAwMTg0IC0mZ3Q7IEVTWVNfVFIgbm90IGNvcnJlY3QpLjwvZGl2PjxkaXYg
ZGlyPSJhdXRvIiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+PGJyPjwvZGl2PjxkaXYgZGlyPSJh
dXRvIiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+Q2FuIHNvbWVvbmUgaGVscCBtZT88L2Rpdj48
ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPjxicj48L2Rpdj48ZGl2IGRp
cj0iYXV0byIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPkhvcGUgbXkgcXVlc3Rpb24gaXMgY2xl
YXIsPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij50aGFua3Mg
aW4gYWR2YW5jZS48L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgi
Pjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPlJlZ2Fy
ZHMsPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij5EYXZpZGUu
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBzdHlsZT0iaGVpZ2h0OjBweCI+PC9kaXY+PC9k
aXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6c2Fucy1zZXJpZjtmb250LXNpemU6MTIuOHB4IiBk
aXI9ImF1dG8iPjxicj48L2Rpdj48L2Rpdj4K

--===============9184804917118007970==--

