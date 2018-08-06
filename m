Content-Type: multipart/mixed; boundary="===============7763329547399796778=="
MIME-Version: 1.0
From: Davide Rutigliano <davide.ruti at gmail.com>
Subject: [tpm2] Tpm2 NV read public
Date: Mon, 06 Aug 2018 21:18:24 +0200
Message-ID: <CAOysEad6=vv4UkMy4JJWMQ=yTDbFESHDj7wetAjfovFoq+e8qA@mail.gmail.com>
In-Reply-To: CAOysEaeT6ochmz2Cu4mxVQ97ukik0gHMG_Y8vqmBc-yZ8ad7sA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7763329547399796778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'm in trouble with tpm2 NV read public command.

What I mean is that everything goes fine if I run first DefineSpace and
then ReadPublic, passing as an argument to the latter the nvHandle obtained
from the NV_DefineSpace.

The problem arises when I run for the second time the program and the NV
Index is already defined and I would not create another one, but simply run
ReadPublic on the already existent nvIndex.
The problem is I don't know how to obtain the nvHandle to properly run the
TPM command (I receive error code: 0x00000184 -> ESYS_TR not correct).

Can you help me?

Hope my question is clear,
thanks in advance.

Regards,
Davide.

--===============7763329547399796778==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIiBkaXI9ImF1dG8iPjxkaXYg
ZGlyPSJsdHIiPkhlbGxvLDxicj48L2Rpdj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0iYXV0byI+
PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SSYjMzk7bSBpbiB0cm91
YmxlIHdpdGggdHBtMiBOViByZWFkIHB1YmxpYyBjb21tYW5kLjwvZGl2PjxkaXYgZGlyPSJhdXRv
Ij48YnI+PC9kaXY+PGRpdj5XaGF0IEkgbWVhbiBpcyB0aGF0IGV2ZXJ5dGhpbmcgZ29lcyBmaW5l
IGlmIEkgcnVuIGZpcnN0IERlZmluZVNwYWNlIGFuZCB0aGVuIFJlYWRQdWJsaWMsIHBhc3Npbmcg
YXMgYW4gYXJndW1lbnQgdG8gdGhlIGxhdHRlciB0aGUgbnZIYW5kbGUgb2J0YWluZWQgZnJvbSB0
aGUgTlZfRGVmaW5lU3BhY2UuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgcHJvYmxlbSBh
cmlzZXMgd2hlbiBJIHJ1biBmb3IgdGhlIHNlY29uZCB0aW1lIHRoZSBwcm9ncmFtIGFuZCB0aGUg
TlYgSW5kZXggaXMgYWxyZWFkeSBkZWZpbmVkIGFuZCBJIHdvdWxkIG5vdCBjcmVhdGUgYW5vdGhl
ciBvbmUsIGJ1dCBzaW1wbHkgcnVuIFJlYWRQdWJsaWMgb24gdGhlIGFscmVhZHkgZXhpc3RlbnQg
bnZJbmRleC48L2Rpdj48ZGl2PlRoZSBwcm9ibGVtIGlzIEkgZG9uJiMzOTt0IGtub3cgaG93IHRv
IG9idGFpbiB0aGUgbnZIYW5kbGUgdG8gcHJvcGVybHkgcnVuIHRoZSBUUE0gY29tbWFuZCAoSSBy
ZWNlaXZlIGVycm9yIGNvZGU6IDB4MDAwMDAxODQgLSZndDsgRVNZU19UUiBub3QgY29ycmVjdCku
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DYW4geW91IGhlbHAgbWU/PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5Ib3BlIG15IHF1ZXN0aW9uIGlzIGNsZWFyLDwvZGl2PjxkaXY+dGhhbmtzIGlu
IGFkdmFuY2UuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5SZWdhcmRzLDwvZGl2PjxkaXY+RGF2
aWRlLjwvZGl2PjwvZGl2Pgo8L2Rpdj4KPC9kaXY+PC9kaXY+Cg==

--===============7763329547399796778==--

