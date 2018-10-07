Content-Type: multipart/mixed; boundary="===============0041671746737828991=="
MIME-Version: 1.0
From: Davide Rutigliano <davide.ruti at gmail.com>
Subject: [tpm2] CertifyCreation and VerifySignature
Date: Sun, 07 Oct 2018 16:17:25 +0200
Message-ID: <CAOysEacUSQKU70M63LmwAzZ1gjBS8a-ckW+ssdDQy+hTRrPVpA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0041671746737828991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to use TPM2_VerifySignature to verify the signature (of
creationHash) produced by TPM2_CertifyCreation command, but there's
something wrong...

I have two different signing keys and I want to certify the latter with the
first one.

Key creation goes fine and CertifyCreation too, but when I try to verify
the signature done by TPM2_CertifyCreation with TPM2_VerifySignature on the
same creationHash I get rc =3D 0x000002db (i.e. tpm:parameter(2):the
signature is not valid).

I'm verifying the signature on the creationHash produced by CertifyCreation
command (as it is specified in TPM2 spec., part 3), but something goes
wrong and I cannot understand what. Could someone help me?

Thanks,
Davide.

--===============0041671746737828991==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGkgYWxsLDxkaXY+
PGJyPjwvZGl2PjxkaXY+SSYjMzk7bSB0cnlpbmcgdG8gdXNlIFRQTTJfVmVyaWZ5U2lnbmF0dXJl
IHRvIHZlcmlmeSB0aGUgc2lnbmF0dXJlIChvZiBjcmVhdGlvbkhhc2gpIHByb2R1Y2VkIGJ5IFRQ
TTJfQ2VydGlmeUNyZWF0aW9uIGNvbW1hbmQsIGJ1dCB0aGVyZSYjMzk7cyBzb21ldGhpbmcgd3Jv
bmcuLi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgaGF2ZSB0d28gZGlmZmVyZW50IHNpZ25p
bmcga2V5cyBhbmQgSSB3YW50IHRvIGNlcnRpZnkgdGhlIGxhdHRlciB3aXRoIHRoZSBmaXJzdCBv
bmUuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5LZXkgY3JlYXRpb24gZ29lcyBmaW5lIGFuZCBD
ZXJ0aWZ5Q3JlYXRpb24gdG9vLCBidXQgd2hlbiBJIHRyeSB0byB2ZXJpZnkgdGhlIHNpZ25hdHVy
ZSBkb25lIGJ5IFRQTTJfQ2VydGlmeUNyZWF0aW9uIHdpdGggVFBNMl9WZXJpZnlTaWduYXR1cmUg
b24gdGhlIHNhbWUgY3JlYXRpb25IYXNoIEkgZ2V0IHJjID0gMHgwMDAwMDJkYiAoaS5lLiB0cG06
cGFyYW1ldGVyKDIpOnRoZSBzaWduYXR1cmUgaXMgbm90IHZhbGlkKS48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkkmIzM5O20gdmVyaWZ5aW5nIHRoZSBzaWduYXR1cmUgb24gdGhlIGNyZWF0aW9u
SGFzaCBwcm9kdWNlZCBieSBDZXJ0aWZ5Q3JlYXRpb24gY29tbWFuZCAoYXMgaXQgaXMgc3BlY2lm
aWVkIGluIFRQTTIgc3BlYy4sIHBhcnQgMyksIGJ1dCBzb21ldGhpbmcgZ29lcyB3cm9uZyBhbmQg
SSBjYW5ub3QgdW5kZXJzdGFuZCB3aGF0LiBDb3VsZCBzb21lb25lIGhlbHAgbWU/PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5EYXZpZGUuPC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+Cg==

--===============0041671746737828991==--

