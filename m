Content-Type: multipart/mixed; boundary="===============8068823762792029975=="
MIME-Version: 1.0
From: Frederick Gotham <cauldwell.thomas at gmail.com>
Subject: [tpm2] Re: Generate keypair using OpenSSL, then load into TPM2
Date: Fri, 06 Dec 2019 17:52:08 +0000
Message-ID: <CALtZhhN+bZh7NicxBZ9yjo1CQS7m0bbj=wgh9ueVPafKVC1xWQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E4CCEF@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8068823762792029975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Friday, December 6, 2019, Roberts, William C:


> Import essentially creates blobs that can be loaded into the tpm (key.pub
> and key.priv)
> These can be loaded via tpm2_load
>
> tpm2_load -C primary.ctx -u key.pub -r key.priv -c key.ctx
>


Thank you, I finally got it working. I can load the RSA keypair into the
device in the factory, and from that point forward, I can use 0x81000000 to
validate signatures.

I came up with a trick to scramble the private key. I take the entire key
which is 608 bytes in raw binary form, and then I iterate through each of
the bytes trying to set each byte to zero. I try to feed the altered key
into the TMP2 and see if I get an error (e.g. it might fail and say
"private and public portions are not cryptographically bound"). I was able
to zero out 64% of the RSA keypair and still load it into the TPM2 to use
the public key to validate signatures. This way the private key never has
to leave the office (i.e. it doesn't need to go on a disk that's used in
the factory). Only the public key leaves the office.

--===============8068823762792029975==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

T24gRnJpZGF5LCBEZWNlbWJlciA2LCAyMDE5LCBSb2JlcnRzLCBXaWxsaWFtIEM6PGRpdj48YnI+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+Cjxicj4KSW1wb3J0
IGVzc2VudGlhbGx5IGNyZWF0ZXMgYmxvYnMgdGhhdCBjYW4gYmUgbG9hZGVkIGludG8gdGhlIHRw
bSAoa2V5LnB1YiBhbmQga2V5LnByaXYpPGJyPgpUaGVzZSBjYW4gYmUgbG9hZGVkIHZpYSB0cG0y
X2xvYWQ8YnI+Cjxicj4KdHBtMl9sb2FkIC1DIHByaW1hcnkuY3R4IC11IGtleS5wdWIgLXIga2V5
LnByaXYgLWMga2V5LmN0eDxicj4KPC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+VGhhbmsgeW91LCBJIGZpbmFsbHkgZ290IGl0IHdvcmtpbmcuIEkgY2FuIGxv
YWQgdGhlIFJTQSBrZXlwYWlyIGludG8gdGhlIGRldmljZSBpbiB0aGUgZmFjdG9yeSwgYW5kIGZy
b20gdGhhdCBwb2ludCBmb3J3YXJkLCBJIGNhbiB1c2UgMHg4MTAwMDAwMCB0byB2YWxpZGF0ZSBz
aWduYXR1cmVzLjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBjYW1lIHVwIHdpdGgg
YSB0cmljayB0byBzY3JhbWJsZSB0aGUgcHJpdmF0ZSBrZXkuIEkgdGFrZSB0aGUgZW50aXJlIGtl
eSB3aGljaCBpcyA2MDggYnl0ZXMgaW4gcmF3IGJpbmFyeSBmb3JtLCBhbmQgdGhlbiBJIGl0ZXJh
dGUgdGhyb3VnaCBlYWNoIG9mIHRoZSBieXRlcyB0cnlpbmcgdG8gc2V0IGVhY2ggYnl0ZSB0byB6
ZXJvLiBJIHRyeSB0byBmZWVkIHRoZSBhbHRlcmVkIGtleSBpbnRvIHRoZSBUTVAyIGFuZCBzZWUg
aWYgSSBnZXQgYW4gZXJyb3IgKGUuZy4gaXQgbWlnaHQgZmFpbCBhbmQgc2F5ICZxdW90O3ByaXZh
dGUgYW5kIHB1YmxpYyBwb3J0aW9ucyBhcmUgbm90IGNyeXB0b2dyYXBoaWNhbGx5IGJvdW5kJnF1
b3Q7KS4gSSB3YXMgYWJsZSB0byB6ZXJvIG91dCA2NCUgb2YgdGhlIFJTQSBrZXlwYWlyIGFuZCBz
dGlsbCBsb2FkIGl0IGludG8gdGhlIFRQTTIgdG8gdXNlIHRoZSBwdWJsaWMga2V5IHRvIHZhbGlk
YXRlIHNpZ25hdHVyZXMuIFRoaXMgd2F5IHRoZSBwcml2YXRlIGtleSBuZXZlciBoYXMgdG8gbGVh
dmUgdGhlIG9mZmljZSAoaS5lLiBpdCBkb2VzbiYjMzk7dCBuZWVkIHRvIGdvIG9uIGEgZGlzayB0
aGF0JiMzOTtzIHVzZWQgaW4gdGhlIGZhY3RvcnkpLiBPbmx5IHRoZSBwdWJsaWMga2V5IGxlYXZl
cyB0aGUgb2ZmaWNlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJy
PjwvZGl2Pgo=

--===============8068823762792029975==--

