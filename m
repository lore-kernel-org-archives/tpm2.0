Content-Type: multipart/mixed; boundary="===============0167046146370137362=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: [tpm2] Creating a TPM EK Public object at the server
Date: Tue, 27 Aug 2019 11:00:53 -0700
Message-ID: <CAP3jAwRgHb4UCEQS9Dqa0LvmKyPX_AB64F-wujSyuLg9P6Ao1A@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0167046146370137362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi All,
Now that the make_external_credential is compiling I wanted to understand
what should the EK Pub object look like to pass to the
make_external_credential.
Since it is done off tpm chip and client only sends the EK certificate (and
ak_name) so in order to create a TPM2B_PUBLIC structure,
1. I fill the standard template to create EK Key (parameters like nameAlg,
object attributes, RSA symmetric details)
2. Extract the EKPUB key and copy it to the unique field in this structure

My question is:
1. Do we need to also copy the standard AuthPolicy digest into the
structure too? This is definitely needed in TPM to recreate the EK but do
we need it for make_credential_external?
2. The EKCert is in ASN.1 DER format which i convert to PEM, is it okay to
copy it directly or do I need to convert it to some other format and then
copy the ek public key?

Thanks,
Rahul

--===============0167046146370137362==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGkgQWxsLDxicj48ZGl2Pk5vdyB0aGF0IHRoZSBtYWtlX2V4dGVybmFs
X2NyZWRlbnRpYWwgaXMgY29tcGlsaW5nIEkgd2FudGVkIHRvIHVuZGVyc3RhbmQgd2hhdCBzaG91
bGQgdGhlIEVLIFB1YiBvYmplY3QgbG9vayBsaWtlIHRvIHBhc3MgdG8gdGhlIG1ha2VfZXh0ZXJu
YWxfY3JlZGVudGlhbC48L2Rpdj48ZGl2PlNpbmNlIGl0IGlzIGRvbmUgb2ZmIHRwbSBjaGlwIGFu
ZCBjbGllbnQgb25seSBzZW5kcyB0aGUgRUsgY2VydGlmaWNhdGUgKGFuZCBha19uYW1lKSBzbyBp
biBvcmRlciB0byBjcmVhdGUgYSBUUE0yQl9QVUJMSUMgc3RydWN0dXJlLDwvZGl2PjxkaXY+MS4g
SSBmaWxsIHRoZSBzdGFuZGFyZCB0ZW1wbGF0ZSB0byBjcmVhdGUgRUsgS2V5IChwYXJhbWV0ZXJz
IGxpa2UgbmFtZUFsZywgb2JqZWN0IGF0dHJpYnV0ZXMsIFJTQSBzeW1tZXRyaWMgZGV0YWlscynC
oDwvZGl2PjxkaXY+Mi4gRXh0cmFjdCB0aGUgRUtQVUIga2V5IGFuZCBjb3B5IGl0IHRvIHRoZSB1
bmlxdWUgZmllbGQgaW4gdGhpcyBzdHJ1Y3R1cmU8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk15
IHF1ZXN0aW9uIGlzOjwvZGl2PjxkaXY+MS4gRG8gd2UgbmVlZCB0byBhbHNvIGNvcHkgdGhlIHN0
YW5kYXJkIEF1dGhQb2xpY3kgZGlnZXN0IGludG8gdGhlIHN0cnVjdHVyZSB0b28/IFRoaXMgaXMg
ZGVmaW5pdGVseSBuZWVkZWQgaW4gVFBNIHRvIHJlY3JlYXRlIHRoZSBFSyBidXQgZG8gd2UgbmVl
ZCBpdCBmb3IgbWFrZV9jcmVkZW50aWFsX2V4dGVybmFsPzwvZGl2PjxkaXY+Mi4gVGhlIEVLQ2Vy
dCBpcyBpbiBBU04uMSBERVIgZm9ybWF0IHdoaWNoIGkgY29udmVydCB0byBQRU0sIGlzIGl0IG9r
YXkgdG8gY29weSBpdCBkaXJlY3RseSBvciBkbyBJIG5lZWQgdG8gY29udmVydCBpdCB0byBzb21l
IG90aGVyIGZvcm1hdCBhbmQgdGhlbiBjb3B5IHRoZSBlayBwdWJsaWMga2V5PzwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+UmFodWw8L2Rpdj48ZGl2Pjxicj48L2Rp
dj48L2Rpdj4K

--===============0167046146370137362==--

