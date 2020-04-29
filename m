Content-Type: multipart/mixed; boundary="===============2829559019179109079=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Can an ECC key both sign and perform ECDH key agreement?
Date: Wed, 29 Apr 2020 13:44:12 -0700
Message-ID: <CAOCvsSka0Nfa127=J_jKsycmNqhyqXgzObNKfZ_67ER=+p3vJQ@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2829559019179109079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For my project I need to create an ECC shared secret.  I'm going to need to
get up to speed to writing an ESAPI executable from scratch to do this.  In
the meantime I'm studying up on the specs again to see if they make me any
more confident, and if I find any theoretical gotchas.

Here's a potential:
Spec v1.59 part 1 appendix C.7.3 on TPM2_ECDH_ZGen says "To prevent
inadvertent compromise of a signing key, sign and restricted are required
to be CLEAR in the referenced key.
Spec v1.59 part 3 section 14.5.1 only says that restricted needs to be
CLEAR and decrypt SET.  Along with something about the scheme needing to be
TPM_ALG_ECDH or TPM_ALG_NULL, which I don't know is relevant yet.

To register this key with other parts of the system I may need to produce a
CSR from it, which presumably means I need to be able to sign with the key,
even though it's primary use is key agreement.

Is this going to be possible?  Does the first reference preclude a key that
is both a signing and encryption key? or only a key that can perform both
attestation and key agreement?

--===============2829559019179109079==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+Rm9yIG15IHByb2plY3QgSSBuZWVkIHRvIGNyZWF0ZSBhbiBFQ0Mgc2hh
cmVkIHNlY3JldC7CoCBJJiMzOTttIGdvaW5nIHRvIG5lZWQgdG8gZ2V0IHVwIHRvIHNwZWVkIHRv
IHdyaXRpbmcgYW4gRVNBUEkgZXhlY3V0YWJsZSBmcm9tIHNjcmF0Y2ggdG8gZG8gdGhpcy7CoCBJ
biB0aGUgbWVhbnRpbWUgSSYjMzk7bSBzdHVkeWluZyB1cCBvbiB0aGUgc3BlY3MgYWdhaW4gdG8g
c2VlIGlmIHRoZXkgbWFrZSBtZSBhbnkgbW9yZSBjb25maWRlbnQsIGFuZCBpZiBJIGZpbmQgYW55
IHRoZW9yZXRpY2FsIGdvdGNoYXMuPGRpdj48YnI+PC9kaXY+PGRpdj5IZXJlJiMzOTtzIGEgcG90
ZW50aWFsOjxkaXY+U3BlYyB2MS41OSBwYXJ0IDEgYXBwZW5kaXggQy43LjMgb24gVFBNMl9FQ0RI
X1pHZW4gc2F5cyAmcXVvdDtUbyBwcmV2ZW50IGluYWR2ZXJ0ZW50IGNvbXByb21pc2Ugb2YgYSBz
aWduaW5nIGtleSwgc2lnbiBhbmQgcmVzdHJpY3RlZCBhcmUgcmVxdWlyZWQgdG8gYmUgQ0xFQVIg
aW4gdGhlIHJlZmVyZW5jZWTCoGtleS48L2Rpdj48ZGl2PlNwZWMgdjEuNTkgcGFydCAzIHNlY3Rp
b24gMTQuNS4xIG9ubHkgc2F5cyB0aGF0IHJlc3RyaWN0ZWQgbmVlZHMgdG8gYmUgQ0xFQVIgYW5k
IGRlY3J5cHQgU0VULsKgIEFsb25nIHdpdGggc29tZXRoaW5nIGFib3V0IHRoZSBzY2hlbWUgbmVl
ZGluZyB0byBiZSBUUE1fQUxHX0VDREggb3IgVFBNX0FMR19OVUxMLCB3aGljaCBJIGRvbiYjMzk7
dCBrbm93IGlzIHJlbGV2YW50IHlldC48L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRv
IHJlZ2lzdGVyIHRoaXMga2V5IHdpdGggb3RoZXIgcGFydHMgb2YgdGhlIHN5c3RlbSBJIG1heSBu
ZWVkIHRvIHByb2R1Y2UgYSBDU1IgZnJvbSBpdCwgd2hpY2ggcHJlc3VtYWJseSBtZWFucyBJIG5l
ZWQgdG8gYmUgYWJsZSB0byBzaWduIHdpdGggdGhlIGtleSwgZXZlbiB0aG91Z2ggaXQmIzM5O3Mg
cHJpbWFyeSB1c2UgaXMga2V5IGFncmVlbWVudC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pklz
IHRoaXMgZ29pbmcgdG8gYmUgcG9zc2libGU/wqAgRG9lcyB0aGUgZmlyc3QgcmVmZXJlbmNlIHBy
ZWNsdWRlIGEga2V5IHRoYXQgaXMgYm90aCBhIHNpZ25pbmcgYW5kIGVuY3J5cHRpb24ga2V5PyBv
ciBvbmx5IGEga2V5IHRoYXQgY2FuIHBlcmZvcm0gYm90aCBhdHRlc3RhdGlvbiBhbmQga2V5IGFn
cmVlbWVudD88L2Rpdj48L2Rpdj4K

--===============2829559019179109079==--

