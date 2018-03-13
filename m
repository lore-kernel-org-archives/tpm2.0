Content-Type: multipart/mixed; boundary="===============5284524519629328892=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: [tpm2] tpm2_quote and "safe"
Date: Tue, 13 Mar 2018 15:11:28 +0200
Message-ID: <CAAxBZJuw-tw5QxJ2rr7BbH1Y9EDq6s=Kv84XxK8cWjUmRz4imw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5284524519629328892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

other than various clock errors what causes the safe flag to be set to 1 as
written into the output of tpm2_quote ?

We're seeing some odd behaviour from some machines where safe is always set
to 1 (Lenovo laptop) and on other servers occasionally safe is set to 1 and
then returning to 0 on subsequent quotes.

For example, we might take a number of quotes over time, eg: 5 minutes
apart. One of those quotes will have safe set to 1, the others are all 0.
During this time the machine will *not* have experienced a reboot/reset nor
- as far as we can tell - any form of powersave or shutdown. We've also
noticed that safe gets set to 1 only on some quotes, eg: when quoting
sha256:16,17,18 for the DRTM measurements.

The machines are all Xeon-E5 based servers, TPM2.0,  tpm2_tools 1.3-rc2
installed, Ubuntu 17.04 with 4.13 kernel

Any information appreciated here,

thanks

Ian

-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Privacy Engineering:  via Amazon <http://www.amazon.co.uk/dp/1497569710>
*Twitter: @i_j_oliver*

--===============5284524519629328892==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+PGRpdj5IaSw8YnI+
PGJyPjwvZGl2Pm90aGVyIHRoYW4gdmFyaW91cyBjbG9jayBlcnJvcnMgd2hhdCBjYXVzZXMgdGhl
IHNhZmUgZmxhZyB0byBiZSBzZXQgdG8gMSBhcyB3cml0dGVuIGludG8gdGhlIG91dHB1dCBvZiB0
cG0yX3F1b3RlID88YnI+PGJyPjwvZGl2PldlJiMzOTtyZSBzZWVpbmcgc29tZSBvZGQgYmVoYXZp
b3VyIGZyb20gc29tZSBtYWNoaW5lcyB3aGVyZSBzYWZlIGlzIGFsd2F5cyBzZXQgdG8gMSAoTGVu
b3ZvIGxhcHRvcCkgYW5kIG9uIG90aGVyIHNlcnZlcnMgb2NjYXNpb25hbGx5IHNhZmUgaXMgc2V0
IHRvIDEgYW5kIHRoZW4gcmV0dXJuaW5nIHRvIDAgb24gc3Vic2VxdWVudCBxdW90ZXMuPGJyPjxi
cj48L2Rpdj5Gb3IgZXhhbXBsZSwgd2UgbWlnaHQgdGFrZSBhIG51bWJlciBvZiBxdW90ZXMgb3Zl
ciB0aW1lLCBlZzogNSBtaW51dGVzIGFwYXJ0LiBPbmUgb2YgdGhvc2UgcXVvdGVzIHdpbGwgaGF2
ZSBzYWZlIHNldCB0byAxLCB0aGUgb3RoZXJzIGFyZSBhbGwgMC7CoCBEdXJpbmcgdGhpcyB0aW1l
IHRoZSBtYWNoaW5lIHdpbGwgKm5vdCogaGF2ZSBleHBlcmllbmNlZCBhIHJlYm9vdC9yZXNldCBu
b3IgLSBhcyBmYXIgYXMgd2UgY2FuIHRlbGwgLSBhbnkgZm9ybSBvZiBwb3dlcnNhdmUgb3Igc2h1
dGRvd24uIFdlJiMzOTt2ZSBhbHNvIG5vdGljZWQgdGhhdCBzYWZlIGdldHMgc2V0IHRvIDEgb25s
eSBvbiBzb21lIHF1b3RlcywgZWc6IHdoZW4gcXVvdGluZyBzaGEyNTY6MTYsMTcsMTggZm9yIHRo
ZSBEUlRNIG1lYXN1cmVtZW50cy48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+VGhlIG1hY2hpbmVz
IGFyZSBhbGwgWGVvbi1FNSBiYXNlZCBzZXJ2ZXJzLCBUUE0yLjAswqAgdHBtMl90b29scyAxLjMt
cmMyIGluc3RhbGxlZCwgVWJ1bnR1IDE3LjA0IHdpdGggNC4xMyBrZXJuZWw8YnI+PGJyPjwvZGl2
PkFueSBpbmZvcm1hdGlvbiBhcHByZWNpYXRlZCBoZXJlLDxicj48YnI+PC9kaXY+dGhhbmtzPGJy
Pjxicj48L2Rpdj5JYW48YnIgY2xlYXI9ImFsbCI+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2Pjxk
aXY+PGRpdj48ZGl2PjxkaXY+PGJyPi0tIDxicj48ZGl2IGNsYXNzPSJnbWFpbF9zaWduYXR1cmUi
IGRhdGEtc21hcnRtYWlsPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRp
diBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXYg
c3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsO2ZvbnQtc2l6ZTpzbWFsbCI+PGI+RHIuIElhbiBPbGl2
ZXI8L2I+PGJyPj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08YnI+PC9kaXY+PGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6YXJpYWw7Zm9udC1zaXplOnNtYWxsIj5Qcml2YWN5IEVuZ2luZWVy
aW5nOsKgIDxiPjwvYj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDE3LDE3LDE3KTtmb250LWZhbWls
eTpBcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxM3B4O2xpbmUtaGVpZ2h0OjE5cHgiPjxhIGhy
ZWY9Imh0dHA6Ly93d3cuYW1hem9uLmNvLnVrL2RwLzE0OTc1Njk3MTAiIHRhcmdldD0iX2JsYW5r
Ij52aWEgQW1hem9uPC9hPjwvc3Bhbj48Yj48YnI+VHdpdHRlcjogQGlfal9vbGl2ZXI8L2I+PC9k
aXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+CjwvZGl2
PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo=

--===============5284524519629328892==--

