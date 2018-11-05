Content-Type: multipart/mixed; boundary="===============8971557112965526068=="
MIME-Version: 1.0
From: Davide Rutigliano <davide.ruti at gmail.com>
Subject: [tpm2] CertifyCreation and VerifySignature
Date: Tue, 06 Nov 2018 00:23:20 +0100
Message-ID: <CAOysEad4d89cnGEJig1XEpUXF5PKp6568pwqriBU9dgwYTcwEw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8971557112965526068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I want to verify the signature of creationHash produced by
TPM2_CertifyCreation command.

When I run the TPM2_VerifySignature on the same creationHash I get rc =3D
0x000002db (i.e. tpm:parameter(2):the signature is not valid).

Something goes wrong and I cannot understand what.

Should I do sign of HMAC( proof( TK | obj->name | creationHash) ) and then
verify the signature on it?

Thanks,
Davide.

--===============8971557112965526068==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGkgYWxsLDxkaXY+
PGJyPjwvZGl2PjxkaXY+SSB3YW50IHRvIHZlcmlmeSB0aGUgc2lnbmF0dXJlIG9mIGNyZWF0aW9u
SGFzaCBwcm9kdWNlZCBieSBUUE0yX0NlcnRpZnlDcmVhdGlvbiBjb21tYW5kLjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+V2hlbiBJIHJ1biB0aGUgVFBNMl9WZXJpZnlTaWduYXR1cmUgb24gdGhl
IHNhbWUgY3JlYXRpb25IYXNoIEkgZ2V0IHJjID0gMHgwMDAwMDJkYiAoaS5lLiB0cG06cGFyYW1l
dGVyKDIpOnRoZSBzaWduYXR1cmUgaXMgbm90IHZhbGlkKS48YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5Tb21ldGhpbmcgZ29lcyB3cm9uZyBhbmQgSSBjYW5ub3QgdW5kZXJzdGFuZCB3aGF0
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+U2hvdWxkIEkgZG8gc2lnbiBvZiBITUFDKCBwcm9v
ZiggVEsgfCBvYmotJmd0O25hbWUgfCBjcmVhdGlvbkhhc2gpICkgYW5kIHRoZW4gdmVyaWZ5IHRo
ZSBzaWduYXR1cmUgb24gaXQ/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+
PGRpdj5EYXZpZGUuPC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============8971557112965526068==--

