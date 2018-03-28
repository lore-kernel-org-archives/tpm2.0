Content-Type: multipart/mixed; boundary="===============1400407043077845894=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: Re: [tpm2] Problem with Infineon Iridium SLB 9670 TPM2.0
Date: Wed, 28 Mar 2018 11:51:26 -0400
Message-ID: <CAHUNapQacFucznccuXp5SeKm566wwXCGz91ckvJ-JcupuNqM1A@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC563FF08D22@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1400407043077845894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Wow, what a great time to come across this thread!

I also have been trying to use TPM on a RPi3 and was seeing the exact same
problems. I, however, was using OE and meta-measured to build my images. It
turns out that meta-measured/recipes-tpm/tpm2-tools wasn't DEPENDing on
tpm2-abrmd, so all builds as a result were not enabling the tabrmd TCTI.

Hence: https://github.com/flihp/meta-measured/pull/68

By the way, what's the difference between "abrmd" and "tabrmd"? It seems
rather confusing that the tools list "tabrmd" as a TCTI, but in order to
use it one specifies "abrmd". Something feels wrong.

# tpm2_pcrlist -v
tool=3D"tpm2_pcrlist" version=3D"" tctis=3D"tabrmd,socket,device,"

# tpm2_pcrlist -T tabrmd
ERROR: Unknown tcti, got: "tabrmd"

# tpm2_pcrlist -T abrmd
sha1 :
  0  : 0000000000000000000000000000000000000000
  1  : 0000000000000000000000000000000000000000
...

--===============1400407043077845894==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+V293LCB3aGF0IGEgZ3JlYXQgdGltZSB0byBj
b21lIGFjcm9zcyB0aGlzIHRocmVhZCE8YnI+PGJyPjwvZGl2PkkgYWxzbyBoYXZlIGJlZW4gdHJ5
aW5nIHRvIHVzZSBUUE0gb24gYSBSUGkzIGFuZCB3YXMgc2VlaW5nIHRoZSBleGFjdCBzYW1lIHBy
b2JsZW1zLiBJLCBob3dldmVyLCB3YXMgdXNpbmcgT0UgYW5kIG1ldGEtbWVhc3VyZWQgdG8gYnVp
bGQgbXkgaW1hZ2VzLiBJdCB0dXJucyBvdXQgdGhhdCBtZXRhLW1lYXN1cmVkL3JlY2lwZXMtdHBt
L3RwbTItdG9vbHMgd2FzbiYjMzk7dCBERVBFTkRpbmcgb24gdHBtMi1hYnJtZCwgc28gYWxsIGJ1
aWxkcyBhcyBhIHJlc3VsdCB3ZXJlIG5vdCBlbmFibGluZyB0aGUgdGFicm1kIFRDVEkuPGJyPjxi
cj48L2Rpdj5IZW5jZTogPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2ZsaWhwL21ldGEtbWVh
c3VyZWQvcHVsbC82OCI+aHR0cHM6Ly9naXRodWIuY29tL2ZsaWhwL21ldGEtbWVhc3VyZWQvcHVs
bC82ODwvYT48YnI+PGJyPjwvZGl2PkJ5IHRoZSB3YXksIHdoYXQmIzM5O3MgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiAmcXVvdDthYnJtZCZxdW90OyBhbmQgJnF1b3Q7dGFicm1kJnF1b3Q7PyBJdCBz
ZWVtcyByYXRoZXIgY29uZnVzaW5nIHRoYXQgdGhlIHRvb2xzIGxpc3QgJnF1b3Q7dGFicm1kJnF1
b3Q7IGFzIGEgVENUSSwgYnV0IGluIG9yZGVyIHRvIHVzZSBpdCBvbmUgc3BlY2lmaWVzICZxdW90
O2Ficm1kJnF1b3Q7LiBTb21ldGhpbmcgZmVlbHMgd3JvbmcuPGJyPjxicj4jIHRwbTJfcGNybGlz
dCAtdjxicj50b29sPSZxdW90O3RwbTJfcGNybGlzdCZxdW90OyB2ZXJzaW9uPSZxdW90OyZxdW90
OyB0Y3Rpcz0mcXVvdDt0YWJybWQsc29ja2V0LGRldmljZSwmcXVvdDs8YnI+PGJyPiMgdHBtMl9w
Y3JsaXN0IC1UIHRhYnJtZDxicj5FUlJPUjogVW5rbm93biB0Y3RpLCBnb3Q6ICZxdW90O3RhYnJt
ZCZxdW90Ozxicj48YnI+IyB0cG0yX3Bjcmxpc3QgLVQgYWJybWQgPGJyPnNoYTEgOjxicj7CoCAw
wqAgOiAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwPGJyPsKgIDHCoCA6
IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA8YnI+Li4uPGJyPjwvZGl2
Pgo=

--===============1400407043077845894==--

