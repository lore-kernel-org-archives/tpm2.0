Content-Type: multipart/mixed; boundary="===============7445787290653013121=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] tpm2_nvread Error:0x9a2
Date: Tue, 01 Oct 2019 12:11:38 +0100
Message-ID: <CAKrSGQRr0ZoP5hq9KFtgD45HbpT3dhBF6umG2-cZ73FC8YcEGQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7445787290653013121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Apologies, that might be hardware specific. but thought it might be worth
asking here, in case anyone has seen the same.

My Intel Nuc 7i7DNHE with an Infineon SLB9665VQ2.0 TPM is no longer
allowing me to read the NV index.

This is after clearing the TPM by removing the yellow jumper and selecting
4 to clear on first boot (and then placing the jumper back into position)

I can run tpm2_takeownership -c with no issues, but not 'tpm2_nvread'

0x1c00002:
  hash algorithm:
    friendly: sha256
    value: 0xB
  attributes:
    friendly:
ppwrite|writedefine|ppread|ownerread|authread|no_da|written|platformcreate
    value: 0x1200762
  size: 1177

tpm2_nvread -x 0x1c00002 -s 1171 -f outfile.out
ERROR: Failed to read NVRAM area at index 0x1c00002 (29360130). Error:0x9a2
ERROR: Unable to run tpm2_nvread

tpm2_rc_decode 0x9a2
error layer
  hex: 0x0
  identifier: TSS2_TPM_RC_LAYER
  description: Error produced by the TPM
format 1 error code
  hex: 0x22
  identifier: TPM2_RC_BAD_AUTH
  description: authorization failure without DA implications
session
  hex: 0x100
  identifier: TPM2_RC_1
  description:  (null)

Does this ring any bells for anyone?

-- =

Luke Hinds

--===============7445787290653013121==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFwb2xvZ2ll
cywgdGhhdCBtaWdodCBiZSBoYXJkd2FyZSBzcGVjaWZpYy4gYnV0IHRob3VnaHQgaXQgbWlnaHQg
YmUgd29ydGggYXNraW5nIGhlcmUsIGluIGNhc2UgYW55b25lIGhhcyBzZWVuIHRoZSBzYW1lLjxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk15IDxzcGFuIGNsYXNzPSJnbWFpbC1pbCI+SW50
ZWw8L3NwYW4+IDxzcGFuIGNsYXNzPSJnbWFpbC1pbCI+TnVjPC9zcGFuPiA3aTdETkhFIHdpdGgg
PHNwYW4gY2xhc3M9ImdtYWlsLXN0Ij5hbiBJbmZpbmVvbiBTTEI5NjY1VlEyLjAgVFBNIGlzIG5v
IGxvbmdlciBhbGxvd2luZyBtZSB0byByZWFkIHRoZSBOViBpbmRleC48YnI+PC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4gY2xhc3M9ImdtYWlsLXN0Ij48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4g
Y2xhc3M9ImdtYWlsLXN0Ij5UaGlzIGlzIGFmdGVyIGNsZWFyaW5nIHRoZSBUUE0gYnkgcmVtb3Zp
bmcgdGhlIHllbGxvdyBqdW1wZXIgYW5kIHNlbGVjdGluZyA0IHRvIGNsZWFyIG9uIGZpcnN0IGJv
b3QgKGFuZCB0aGVuIHBsYWNpbmcgdGhlIGp1bXBlciBiYWNrIGludG8gcG9zaXRpb24pPGJyPjwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGNsYXNzPSJnbWFpbC1zdCI+PGJyPjwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuIGNsYXNzPSJnbWFpbC1zdCI+SSBjYW4gcnVuIHRwbTJfdGFrZW93bmVyc2hpcCAt
YyB3aXRoIG5vIGlzc3VlcywgYnV0IG5vdCAmIzM5OzxzcGFuIGNsYXNzPSJnbWFpbC1zdCI+dHBt
Ml9udnJlYWQmIzM5Ozwvc3Bhbj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iZ21haWwt
c3QiPjxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iZ21haWwtc3QiPjB4MWMwMDAw
Mjo8YnI+wqAgaGFzaCBhbGdvcml0aG06PGJyPsKgIMKgIGZyaWVuZGx5OiBzaGEyNTY8YnI+wqAg
wqAgdmFsdWU6IDB4Qjxicj7CoCBhdHRyaWJ1dGVzOjxicj7CoCDCoCBmcmllbmRseTogcHB3cml0
ZXx3cml0ZWRlZmluZXxwcHJlYWR8b3duZXJyZWFkfGF1dGhyZWFkfG5vX2RhfHdyaXR0ZW58cGxh
dGZvcm1jcmVhdGU8YnI+wqAgwqAgdmFsdWU6IDB4MTIwMDc2Mjxicj7CoCBzaXplOiAxMTc3PGJy
Pjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGNsYXNzPSJnbWFpbC1zdCI+PGJyPjwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuIGNsYXNzPSJnbWFpbC1zdCI+dHBtMl9udnJlYWQgLXggMHgxYzAwMDAyIC1z
IDExNzEgLWYgb3V0ZmlsZS5vdXQ8YnI+RVJST1I6IEZhaWxlZCB0byByZWFkIE5WUkFNIGFyZWEg
YXQgaW5kZXggMHgxYzAwMDAyICgyOTM2MDEzMCkuIEVycm9yOjB4OWEyPGJyPkVSUk9SOiBVbmFi
bGUgdG8gcnVuIHRwbTJfbnZyZWFkPGJyPjwvc3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PnRwbTJfcmNfZGVjb2RlIDB4OWEyIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj5lcnJvciBsYXllcjxicj7CoCBoZXg6IDB4MDxi
cj7CoCBpZGVudGlmaWVyOiBUU1MyX1RQTV9SQ19MQVlFUjxicj7CoCBkZXNjcmlwdGlvbjogRXJy
b3IgcHJvZHVjZWQgYnkgdGhlIFRQTTxicj5mb3JtYXQgMSBlcnJvciBjb2RlPGJyPsKgIGhleDog
MHgyMjxicj7CoCBpZGVudGlmaWVyOiBUUE0yX1JDX0JBRF9BVVRIPGJyPsKgIGRlc2NyaXB0aW9u
OiBhdXRob3JpemF0aW9uIGZhaWx1cmUgd2l0aG91dCBEQSBpbXBsaWNhdGlvbnM8YnI+c2Vzc2lv
bjxicj7CoCBoZXg6IDB4MTAwPGJyPsKgIGlkZW50aWZpZXI6IFRQTTJfUkNfMTxicj7CoCBkZXNj
cmlwdGlvbjogwqAobnVsbCk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkRvZXMgdGhpcyByaW5n
IGFueSBiZWxscyBmb3IgYW55b25lPzxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj4tLSA8YnI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWls
X3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYg
ZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44
cHgiPkx1a2UgSGluZHM8L3NwYW4+PGJyIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48L2Rpdj48
L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============7445787290653013121==--

