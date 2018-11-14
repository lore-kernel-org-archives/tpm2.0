Content-Type: multipart/mixed; boundary="===============6758090429940380762=="
MIME-Version: 1.0
From: Nick Meyer <nimeyer at oath.com>
Subject: [tpm2] TPM2_Sign odd behavior
Date: Wed, 14 Nov 2018 15:38:25 -0600
Message-ID: <CAO6U=Ob53FFC+AR5M7s4KxwbwDiz-wtjNJrKRzj6jE8E_FUgjA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6758090429940380762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Good afternoon all,

I'm seeing some odd behavior when trying to use the TPM2_Sign command in an
EFI application.
I'm guessing what I'm seeing is vendor-dependent, but I wanted to throw it
out here too in case there are other avenues I can look down while I'm
trying to contact the vendor.

What I'm seeing is, when trying to sign with a loaded key, I'm getting a
TPM_RC_VALUE error (exact code 0x84). The specification indicates this
would be received if "the value to sign is larger than allowed for the type
of keyHandle". However, I have intercepted the marshaled command and
inspected it, and this is not the case.

I have verified that the key has the Sign attribute; the key's signature
scheme is TPM_ALG_NULL and this is defined to SHA256 in the TPM2_Sign
command; and that the hash value being sent in the TPM2_Sign TPM2B_DIGEST
value is in fact the 32 bytes expected for an SHA256 hash.

The command is being sent via the EFI EFI_TCG2_PROTOCOL Submit Command
operation, and I've validated in the vendor BIOS this is the correct
protocol; plus there are some cases on other machines where this sign
operation DOES work.

Is there any other reason this error code might be returned from a
TPM2_Sign command? I can't believe it would be, but is there some kind of
format or value expected in the provided hash? (This is NOT a restricted
signing key)

For reference, here is an example marshaled command that fails:

     | 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
------------------------------------------------------
0x00 | 80 02 00 00 00 49 00 00 01 5d 80 00 00 01 00 00
0x10 | 00 09 03 00 00 00 00 00 01 00 00 00 20 e8 d0 09
0x20 | 45 d9 65 bf 21 46 cd 48 1f 57 72 82 bb 38 a7 a6
0x30 | 70 c6 4d e3 a9 32 21 4f f3 7b 63 3f 8e 00 14 00
0x40 | 0b 80 24 40 00 00 07 00 00

Thanks for any insight.
-- =


*Nick Meyer*

*Oath:*

--===============6758090429940380762==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+R29vZCBhZnRlcm5vb24gYWxsLDxkaXY+PGJy
PjwvZGl2PjxkaXY+SSYjMzk7bSBzZWVpbmcgc29tZSBvZGQgYmVoYXZpb3Igd2hlbiB0cnlpbmcg
dG8gdXNlIHRoZSBUUE0yX1NpZ24gY29tbWFuZCBpbiBhbiBFRkkgYXBwbGljYXRpb24uPC9kaXY+
PGRpdj5JJiMzOTttIGd1ZXNzaW5nIHdoYXQgSSYjMzk7bSBzZWVpbmcgaXMgdmVuZG9yLWRlcGVu
ZGVudCwgYnV0IEkgd2FudGVkIHRvIHRocm93IGl0IG91dCBoZXJlIHRvbyBpbiBjYXNlIHRoZXJl
IGFyZSBvdGhlciBhdmVudWVzIEkgY2FuIGxvb2sgZG93biB3aGlsZSBJJiMzOTttIHRyeWluZyB0
byBjb250YWN0IHRoZSB2ZW5kb3IuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XaGF0IEkmIzM5
O20gc2VlaW5nIGlzLCB3aGVuIHRyeWluZyB0byBzaWduIHdpdGggYSBsb2FkZWQga2V5LCBJJiMz
OTttIGdldHRpbmcgYSBUUE1fUkNfVkFMVUUgZXJyb3IgKGV4YWN0IGNvZGUgMHg4NCkuIFRoZSBz
cGVjaWZpY2F0aW9uIGluZGljYXRlcyB0aGlzIHdvdWxkIGJlIHJlY2VpdmVkIGlmICZxdW90O3Ro
ZSB2YWx1ZSB0byBzaWduIGlzIGxhcmdlciB0aGFuIGFsbG93ZWQgZm9yIHRoZSB0eXBlIG9mIGtl
eUhhbmRsZSZxdW90Oy4gSG93ZXZlciwgSSBoYXZlIGludGVyY2VwdGVkIHRoZSBtYXJzaGFsZWQg
Y29tbWFuZCBhbmQgaW5zcGVjdGVkIGl0LCBhbmQgdGhpcyBpcyBub3QgdGhlIGNhc2UuPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5JIGhhdmUgdmVyaWZpZWQgdGhhdCB0aGUga2V5IGhhcyB0aGUg
U2lnbiBhdHRyaWJ1dGU7IHRoZSBrZXkmIzM5O3Mgc2lnbmF0dXJlIHNjaGVtZSBpcyBUUE1fQUxH
X05VTEwgYW5kIHRoaXMgaXMgZGVmaW5lZCB0byBTSEEyNTYgaW4gdGhlIFRQTTJfU2lnbiBjb21t
YW5kOyBhbmQgdGhhdCB0aGUgaGFzaCB2YWx1ZSBiZWluZyBzZW50IGluIHRoZSBUUE0yX1NpZ24g
VFBNMkJfRElHRVNUIHZhbHVlIGlzIGluIGZhY3QgdGhlIDMyIGJ5dGVzIGV4cGVjdGVkIGZvciBh
biBTSEEyNTYgaGFzaC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBjb21tYW5kIGlzIGJl
aW5nIHNlbnQgdmlhIHRoZSBFRkkgRUZJX1RDRzJfUFJPVE9DT0wgU3VibWl0IENvbW1hbmQgb3Bl
cmF0aW9uLCBhbmQgSSYjMzk7dmUgdmFsaWRhdGVkIGluIHRoZSB2ZW5kb3IgQklPUyB0aGlzIGlz
IHRoZSBjb3JyZWN0IHByb3RvY29sOyBwbHVzIHRoZXJlIGFyZSBzb21lIGNhc2VzIG9uIG90aGVy
IG1hY2hpbmVzIHdoZXJlIHRoaXMgc2lnbiBvcGVyYXRpb24gRE9FUyB3b3JrLjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+SXMgdGhlcmUgYW55IG90aGVyIHJlYXNvbiB0aGlzIGVycm9yIGNvZGUg
bWlnaHQgYmUgcmV0dXJuZWQgZnJvbSBhIFRQTTJfU2lnbiBjb21tYW5kPyBJIGNhbiYjMzk7dCBi
ZWxpZXZlIGl0IHdvdWxkIGJlLCBidXQgaXMgdGhlcmUgc29tZSBraW5kIG9mIGZvcm1hdCBvciB2
YWx1ZSBleHBlY3RlZCBpbiB0aGUgcHJvdmlkZWQgaGFzaD8gKFRoaXMgaXMgTk9UIGEgcmVzdHJp
Y3RlZCBzaWduaW5nIGtleSk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkZvciByZWZlcmVuY2Us
IGhlcmUgaXMgYW4gZXhhbXBsZSBtYXJzaGFsZWQgY29tbWFuZCB0aGF0IGZhaWxzOjwvZGl2Pjxk
aXY+PGZvbnQgZmFjZT0ibW9ub3NwYWNlLCBtb25vc3BhY2UiPjxicj48L2ZvbnQ+PC9kaXY+PGRp
dj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFjZSwgbW9ub3NwYWNlIj7CoCDCoCDCoHwgMDAgMDEg
MDIgMDMgMDQgMDUgMDYgMDcgMDggMDkgMEEgMEIgMEMgMEQgMEUgMEY8L2ZvbnQ+PC9kaXY+PGRp
dj48Zm9udCBmYWNlPSJtb25vc3BhY2UsIG1vbm9zcGFjZSI+LS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPC9mb250PjwvZGl2PjxkaXY+PGZvbnQg
ZmFjZT0ibW9ub3NwYWNlLCBtb25vc3BhY2UiPjB4MDAgfCA4MCAwMiAwMCAwMCAwMCA0OSAwMCAw
MCAwMSA1ZCA4MCAwMCAwMCAwMSAwMCAwMMKgPC9mb250PjwvZGl2PjxkaXY+PGZvbnQgZmFjZT0i
bW9ub3NwYWNlLCBtb25vc3BhY2UiPjB4MTAgfCAwMCAwOSAwMyAwMCAwMCAwMCAwMCAwMCAwMSAw
MCAwMCAwMCAyMCBlOCBkMCAwOTwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFj
ZSwgbW9ub3NwYWNlIj4weDIwIHwgNDUgZDkgNjUgYmYgMjEgNDYgY2QgNDggMWYgNTcgNzIgODIg
YmIgMzggYTcgYTbCoDwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGZhY2U9Im1vbm9zcGFjZSwgbW9u
b3NwYWNlIj4weDMwIHwgNzAgYzYgNGQgZTMgYTkgMzIgMjEgNGYgZjMgN2IgNjMgM2YgOGUgMDAg
MTQgMDA8L2ZvbnQ+PC9kaXY+PGRpdj48Zm9udCBmYWNlPSJtb25vc3BhY2UsIG1vbm9zcGFjZSI+
MHg0MCB8IDBiIDgwIDI0IDQwIDAwIDAwIDA3IDAwIDAwPC9mb250PjwvZGl2PjwvZGl2PjxkaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgZm9yIGFueSBpbnNpZ2h0LjwvZGl2Pi0tIDxicj48
ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj48ZGl2IGRpcj0ibHRyIj48ZGl2
PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PHAgc3R5bGU9Im1hcmdpbjoxLjI1
ZW0gMHB4O2NvbG9yOnJnYigwLDAsMCk7Zm9udC1mYW1pbHk6TmV1ZUhhYXMtV2ViLEhlbHZldGlj
YSxBcmlhbCxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToyMHB4Ij48c3Ryb25nPk5pY2sgTWV5ZXI8L3N0
cm9uZz48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46MS4yNWVtIDBweDtjb2xvcjpyZ2IoMCwwLDAp
O2ZvbnQtZmFtaWx5Ok5ldWVIYWFzLVdlYixIZWx2ZXRpY2EsQXJpYWwsc2Fucy1zZXJpZjtmb250
LXNpemU6MjBweCI+PHN0cm9uZz5PYXRoOjwvc3Ryb25nPjwvcD48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============6758090429940380762==--

