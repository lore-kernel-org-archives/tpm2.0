Content-Type: multipart/mixed; boundary="===============8392448469098529643=="
MIME-Version: 1.0
From: Graham Bartlett <graham.ietf at gmail.com>
Subject: [tpm2] assistance with TPM2 - StrongSwan
Date: Fri, 09 Oct 2020 16:17:08 +0100
Message-ID: <CAO4D2DNYVG9XS3r1LKc35FtGX=zCnQRgqJf-tsjPz8p32AugPA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8392448469098529643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

I'm following the StrongSwan example of using the TPM;

https://wiki.strongswan.org/projects/strongswan/wiki/TpmPlugin

The StrongSwan guide suggests;

Derive a Persistent RSA Endorsement Key

The following tpm2-tools command derives a 2048 bit RSA Endorsement Key
(EK) in a deterministic way from the secret *Endorsement Primary Seed*
*unique* to each TPM device and makes the key persistent in the
non-volatile memory of the TPM under the object handle 0x81010001

tpm2_getpubek -H 0x81010001 -g rsa -f ek_rsa.pub

The EK public key stored in the ek_rsa.pub file is encoded in a TPM 2.0
proprietary format but the key can be exported from the TPM in the regular
PKCS#1 format using the *pki* tool

pki --pub --keyid 0x81010001 --outform pem > ek_rsa_pub.pem

/

I am running the latest/greatest TPM on Ubuntu 20.04.

I have created an EK as per;

$ sudo tpm2_createek -G rsa -u ek.pub -c 0x81010004

When I then try to export this it fails;

$ pki --pub --keyid 0x81010004 --outform pem > ek_rsa_pub.pem
building CRED_PRIVATE_KEY - ANY failed, tried 5 builders
parsing private key failed

Would anyone know what I'm doing wrong, or have any guidance on an
upto date example?

many thanks

--===============8392448469098529643==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSYjMzk7bSBm
b2xsb3dpbmcgdGhlIFN0cm9uZ1N3YW4gZXhhbXBsZSBvZiB1c2luZyB0aGUgVFBNOzwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly93aWtpLnN0cm9uZ3N3YW4ub3JnL3By
b2plY3RzL3N0cm9uZ3N3YW4vd2lraS9UcG1QbHVnaW4iPmh0dHBzOi8vd2lraS5zdHJvbmdzd2Fu
Lm9yZy9wcm9qZWN0cy9zdHJvbmdzd2FuL3dpa2kvVHBtUGx1Z2luPC9hPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+VGhlIFN0cm9uZ1N3YW4gZ3VpZGUgc3VnZ2VzdHM7PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj48aDI+RGVyaXZlIGEgUGVyc2lzdGVudCBSU0EgRW5kb3JzZW1lbnQgS2V5PC9o
Mj4KCgoJPHA+VGhlIGZvbGxvd2luZyB0cG0yLXRvb2xzIGNvbW1hbmQgZGVyaXZlcyBhIDIwNDgg
Yml0IFJTQSBFbmRvcnNlbWVudCBLZXkgKEVLKSBpbiBhIGRldGVybWluaXN0aWMgd2F5IGZyb20g
dGhlIHNlY3JldCA8ZW0+RW5kb3JzZW1lbnQgUHJpbWFyeSBTZWVkPC9lbT4gPHN0cm9uZz51bmlx
dWU8L3N0cm9uZz4gdG8gZWFjaCBUUE0gZGV2aWNlIGFuZCBtYWtlcyB0aGUga2V5IHBlcnNpc3Rl
bnQgaW4gdGhlIG5vbi12b2xhdGlsZSBtZW1vcnkgb2YgdGhlIFRQTSB1bmRlciB0aGUgb2JqZWN0
IGhhbmRsZSAweDgxMDEwMDAxPC9wPgoKCgk8cHJlPjxjb2RlPnRwbTJfZ2V0cHViZWsgLUggMHg4
MTAxMDAwMSAtZyByc2EgLWYgZWtfcnNhLnB1YjwvY29kZT48L3ByZT4KCgoJPHA+VGhlIEVLIHB1
YmxpYyBrZXkgc3RvcmVkIGluIHRoZSBla19yc2EucHViIGZpbGUgaXMgZW5jb2RlZCBpbiBhIFRQ
TSAKMi4wIHByb3ByaWV0YXJ5IGZvcm1hdCBidXQgdGhlIGtleSBjYW4gYmUgZXhwb3J0ZWQgZnJv
bSB0aGUgVFBNIGluIHRoZSAKcmVndWxhciBQS0NTIzEgZm9ybWF0IHVzaW5nIHRoZSA8c3Ryb25n
PnBraTwvc3Ryb25nPiB0b29sPC9wPgoKCgk8cHJlPjxjb2RlPnBraSAtLXB1YiAtLWtleWlkIDB4
ODEwMTAwMDEgLS1vdXRmb3JtIHBlbSAmZ3Q7IGVrX3JzYV9wdWIucGVtPGJyPjxicj4vPGJyPjwv
Y29kZT48L3ByZT48cHJlPjxjb2RlPkkgYW0gcnVubmluZyB0aGUgbGF0ZXN0L2dyZWF0ZXN0IFRQ
TSBvbiBVYnVudHUgMjAuMDQuPGJyPjwvY29kZT48L3ByZT48cHJlPjxjb2RlPkkgaGF2ZSBjcmVh
dGVkIGFuIEVLIGFzIHBlcjs8YnI+PGJyPiQgc3VkbyB0cG0yX2NyZWF0ZWVrIC1HIHJzYSAtdSBl
ay5wdWIgLWMgMHg4MTAxMDAwNDxicj48YnI+V2hlbiBJIHRoZW4gdHJ5IHRvIGV4cG9ydCB0aGlz
IGl0IGZhaWxzOzxicj48YnI+JCBwa2kgLS1wdWIgLS1rZXlpZCAweDgxMDEwMDA0IC0tb3V0Zm9y
bSBwZW0gJmd0OyBla19yc2FfcHViLnBlbTxicj5idWlsZGluZyBDUkVEX1BSSVZBVEVfS0VZIC0g
QU5ZIGZhaWxlZCwgdHJpZWQgNSBidWlsZGVyczxicj5wYXJzaW5nIHByaXZhdGUga2V5IGZhaWxl
ZDxicj48YnI+PC9jb2RlPjwvcHJlPjxwcmU+PGNvZGU+V291bGQgYW55b25lIGtub3cgd2hhdCBJ
JiMzOTttIGRvaW5nIHdyb25nLCBvciBoYXZlIGFueSBndWlkYW5jZSBvbiBhbiB1cHRvIGRhdGUg
ZXhhbXBsZT88YnI+PGJyPjwvY29kZT48L3ByZT48cHJlPjxjb2RlPm1hbnkgdGhhbmtzPGJyPjwv
Y29kZT48L3ByZT48L2Rpdj48L2Rpdj4K

--===============8392448469098529643==--

