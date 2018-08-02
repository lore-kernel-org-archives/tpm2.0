Content-Type: multipart/mixed; boundary="===============1758643061103419554=="
MIME-Version: 1.0
From: Arvind Kumar <arvind.kumar at iotium.io>
Subject: [tpm2] Initializing & Programming PCRs
Date: Wed, 01 Aug 2018 19:06:23 -0700
Message-ID: <CAHa3UP6tGfSv6fAo6avmCRfU5R+-VqFoF+Z32zriL8TV9n52MA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1758643061103419554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi All,

I have a hardware with TPM 2.0 on which I have installed ubuntu in UEFI
mode. I need to trigger UEFI  to measure the boot components
(uefi/shim/boot loader, kernel, initrd) into respective PCRs. For which, I
have following questions.

a. As soon as the  TPM 2.0  is enabled from BIOS and device is booted, does
UEFI start the measurements and record them into PCRS by default or there
is some config to tell UEFI to start measurements ?

b. Should secure boot be enabled in order to trigger the UEFI to start
above measurements ?

c. I enabled TPM 2.0 and installed ubuntu in UEFI mode, and I can see that
PCR 0 to 7 are populated with some values and all other PCRs are zeros. Are
these boot measurements correct, how can I verify ?

d. Is there any logs on TPM 2.0 or UEFI that I can refer to ?

Any help is appreciated.

Thanks,
Arvind

--===============1758643061103419554==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBBbGwsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGhh
dmUgYSBoYXJkd2FyZSB3aXRoIFRQTSAyLjAgb24gd2hpY2ggSSBoYXZlIGluc3RhbGxlZCB1YnVu
dHUgaW4gVUVGSSBtb2RlLiBJIG5lZWQgdG8gdHJpZ2dlciBVRUZJwqAgdG8gbWVhc3VyZSB0aGUg
Ym9vdCBjb21wb25lbnRzICh1ZWZpL3NoaW0vYm9vdCBsb2FkZXIsIGtlcm5lbCwgaW5pdHJkKSBp
bnRvIHJlc3BlY3RpdmUgUENScy4gRm9yIHdoaWNoLCBJIGhhdmUgZm9sbG93aW5nIHF1ZXN0aW9u
cy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmEuIEFzIHNvb24gYXMgdGhlwqAgVFBNIDIuMMKg
IGlzIGVuYWJsZWQgZnJvbSBCSU9TIGFuZCBkZXZpY2UgaXMgYm9vdGVkLCBkb2VzIFVFRkkgc3Rh
cnQgdGhlIG1lYXN1cmVtZW50cyBhbmQgcmVjb3JkIHRoZW0gaW50byBQQ1JTIGJ5IGRlZmF1bHQg
b3IgdGhlcmUgaXMgc29tZSBjb25maWcgdG8gdGVsbCBVRUZJIHRvIHN0YXJ0IG1lYXN1cmVtZW50
cyA/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5iLiBTaG91bGQgc2VjdXJlIGJvb3QgYmUgZW5h
YmxlZCBpbiBvcmRlciB0byB0cmlnZ2VyIHRoZSBVRUZJIHRvIHN0YXJ0IGFib3ZlIG1lYXN1cmVt
ZW50cyA/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5jLiBJIGVuYWJsZWQgVFBNIDIuMCBhbmQg
aW5zdGFsbGVkIHVidW50dSBpbiBVRUZJIG1vZGUsIGFuZCBJIGNhbiBzZWUgdGhhdCBQQ1IgMCB0
byA3IGFyZSBwb3B1bGF0ZWQgd2l0aCBzb21lIHZhbHVlcyBhbmQgYWxsIG90aGVyIFBDUnMgYXJl
IHplcm9zLiBBcmUgdGhlc2UgYm9vdCBtZWFzdXJlbWVudHMgY29ycmVjdCwgaG93IGNhbiBJIHZl
cmlmeSA/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5kLiBJcyB0aGVyZSBhbnkgbG9ncyBvbiBU
UE0gMi4wIG9yIFVFRkkgdGhhdCBJIGNhbiByZWZlciB0byA/PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5BbnkgaGVscCBpcyBhcHByZWNpYXRlZC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRo
YW5rcyw8L2Rpdj48ZGl2PkFydmluZDwvZGl2PjxkaXY+wqA8YnI+PC9kaXY+PC9kaXY+Cg==

--===============1758643061103419554==--

