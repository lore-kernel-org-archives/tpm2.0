Content-Type: multipart/mixed; boundary="===============7267046815852338023=="
MIME-Version: 1.0
From: Davide Rutigliano <davide.ruti at gmail.com>
Subject: [tpm2] ESAPI StartAuthSession
Date: Mon, 30 Apr 2018 22:16:02 +0200
Message-ID: <CAOysEaeeMgv0m0vCnE_mnKDKVVqE3QcMaNMxmAvCkr3TkFhhvA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7267046815852338023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I'm in trouble with Esys_StartAuthSession because I receive continuously
this error and I cannot understand why:

"""
ERROR:esys_iutil:esapi/esapi_util/esys_iutil.c:879:esys_GetResourceObject()
Error: Esys handle does not exist (70018).
ERROR:esys:esapi/esapi/Esys_StartAuthSession.c:124:Esys_StartAuthSession()
Error in async function ErrorCode (0x00070018)
TPM2_StartAuthSession failed with 0x70018
"""

I suppose I'm doing something wrong with session handles but I don't know
what.

Could someone help me please?

Thanks in advance,

Davide Rutigliano.

--===============7267046815852338023==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGVsbG8gZXZlcnlvbmUsPGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2IHN0
eWxlPSJmb250LXNpemU6MTIuODAwMDAwMTkwNzM0ODYzcHgiPkkmIzM5O20gaW4gdHJvdWJsZSB3
aXRoIEVzeXNfU3RhcnRBdXRoU2Vzc2lvbiBiZWNhdXNlIEkgcmVjZWl2ZSBjb250aW51b3VzbHkg
dGhpcyBlcnJvciBhbmQgSSBjYW5ub3QgdW5kZXJzdGFuZCB3aHk6PC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1zaXplOjEyLjgwMDAwMDE5MDczNDg2M3B4Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9u
dC1zaXplOjEyLjgwMDAwMDE5MDczNDg2M3B4Ij4mcXVvdDsmcXVvdDsmcXVvdDs8L2Rpdj48ZGl2
IHN0eWxlPSJmb250LXNpemU6MTIuODAwMDAwMTkwNzM0ODYzcHgiPjxkaXY+RVJST1I6ZXN5c19p
dXRpbDplc2FwaS9lc2FwaV88d2JyPnV0aWwvZXN5c19pdXRpbC5jOjg3OTplc3lzXzx3YnI+R2V0
UmVzb3VyY2VPYmplY3QoKSBFcnJvcjogRXN5cyBoYW5kbGUgZG9lcyBub3QgZXhpc3QgKDcwMDE4
KS7CoDwvZGl2PjxkaXY+RVJST1I6ZXN5czplc2FwaS9lc2FwaS9Fc3lzXzx3YnI+U3RhcnRBdXRo
U2Vzc2lvbi5jOjEyNDpFc3lzXzx3YnI+U3RhcnRBdXRoU2Vzc2lvbigpIEVycm9yIGluIGFzeW5j
IGZ1bmN0aW9uIEVycm9yQ29kZSAoMHgwMDA3MDAxOCnCoDwvZGl2PjxkaXY+VFBNMl9TdGFydEF1
dGhTZXNzaW9uIGZhaWxlZCB3aXRoIDB4NzAwMTg8L2Rpdj48L2Rpdj48ZGl2IHN0eWxlPSJmb250
LXNpemU6MTIuODAwMDAwMTkwNzM0ODYzcHgiPiZxdW90OyZxdW90OyZxdW90OzwvZGl2PjxkaXYg
c3R5bGU9ImZvbnQtc2l6ZToxMi44MDAwMDAxOTA3MzQ4NjNweCI+PGJyPjwvZGl2PjxkaXYgc3R5
bGU9ImZvbnQtc2l6ZToxMi44MDAwMDAxOTA3MzQ4NjNweCI+SSBzdXBwb3NlIEkmIzM5O20gZG9p
bmcgc29tZXRoaW5nIHdyb25nIHdpdGggc2Vzc2lvbiBoYW5kbGVzIGJ1dCBJIGRvbiYjMzk7dCBr
bm93IHdoYXQuPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEyLjgwMDAwMDE5MDczNDg2M3B4
Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEyLjgwMDAwMDE5MDczNDg2M3B4Ij5D
b3VsZCBzb21lb25lIGhlbHAgbWUgcGxlYXNlPzwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+VGhhbmtzIGluIGFkdmFuY2UsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5EYXZpZGUgUnV0
aWdsaWFuby48L2Rpdj48L2Rpdj4K

--===============7267046815852338023==--

