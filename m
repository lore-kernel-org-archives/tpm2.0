Content-Type: multipart/mixed; boundary="===============1018679729024428367=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Implementing a TPM EA Policy with Fingerprints
Date: Tue, 22 Oct 2019 11:33:15 -0700
Message-ID: <CAJLNp_Wj9Ke=5yHhHVxzG6rc4Uyh+5r0gmfECjWV1JRuQeuzwA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1018679729024428367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I have read about EA Policies in the book "A Practical Guide to TPM 2.0". I
understand the theoritical part of how everything works with EA policies.
My question is regarding how to implement an EA policy with a fingerprint
authentication attached to it in Windows.

How does communication work between the TPM and the fingerprint reader if
someone tries to access an object attached to such a policy? I read in the
TPM Software Stack chapter on the same book that policies can have
callbacks. So does the policy have a callback function to code that we
write - which , in turn, shows up the fingerprint dialog, captures the
fingerprint and then hashes a string "Arun's fingerprint" (say) if the
fingerprint matches "Arun". If that is the case, what stops someone some
swapping out that function to just supplying a hash of that string (and
skip the fingerprint altogether)?

If there is someone who has done this, i'd really appreciate tips or even
sample code on how it is done.

Thanks
Arun

--===============1018679729024428367==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5JIGhhdmUgcmVhZCBhYm91dCBF
QSBQb2xpY2llcyBpbiB0aGUgYm9vayAmcXVvdDtBIFByYWN0aWNhbCBHdWlkZSB0byBUUE0gMi4w
JnF1b3Q7LiBJIHVuZGVyc3RhbmQgdGhlIHRoZW9yaXRpY2FsIHBhcnQgb2YgaG93IGV2ZXJ5dGhp
bmcgd29ya3Mgd2l0aCBFQSBwb2xpY2llcy4gTXkgcXVlc3Rpb24gaXMgcmVnYXJkaW5nIGhvdyB0
byBpbXBsZW1lbnQgYW4gRUEgcG9saWN5IHdpdGggYSBmaW5nZXJwcmludCBhdXRoZW50aWNhdGlv
biBhdHRhY2hlZCB0byBpdCBpbiBXaW5kb3dzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SG93
IGRvZXMgY29tbXVuaWNhdGlvbiB3b3JrIGJldHdlZW4gdGhlIFRQTSBhbmQgdGhlIGZpbmdlcnBy
aW50IHJlYWRlciBpZiBzb21lb25lIHRyaWVzIHRvIGFjY2VzcyBhbiBvYmplY3QgYXR0YWNoZWQg
dG8gc3VjaCBhIHBvbGljeT8gSSByZWFkIGluIHRoZSBUUE0gU29mdHdhcmUgU3RhY2sgY2hhcHRl
ciBvbiB0aGUgc2FtZSBib29rIHRoYXQgcG9saWNpZXMgY2FuIGhhdmUgY2FsbGJhY2tzLiBTbyBk
b2VzIHRoZSBwb2xpY3kgaGF2ZSBhIGNhbGxiYWNrIGZ1bmN0aW9uIHRvIGNvZGUgdGhhdCB3ZSB3
cml0ZSAtIHdoaWNoICwgaW4gdHVybiwgc2hvd3MgdXAgdGhlIGZpbmdlcnByaW50IGRpYWxvZywg
Y2FwdHVyZXMgdGhlIGZpbmdlcnByaW50IGFuZCB0aGVuIGhhc2hlcyBhIHN0cmluZyAmcXVvdDtB
cnVuJiMzOTtzIGZpbmdlcnByaW50JnF1b3Q7IChzYXkpIGlmIHRoZSBmaW5nZXJwcmludCBtYXRj
aGVzICZxdW90O0FydW4mcXVvdDsuIElmIHRoYXQgaXMgdGhlIGNhc2UsIHdoYXQgc3RvcHMgc29t
ZW9uZSBzb21lIHN3YXBwaW5nIG91dCB0aGF0IGZ1bmN0aW9uIHRvIGp1c3Qgc3VwcGx5aW5nIGEg
aGFzaCBvZiB0aGF0IHN0cmluZyAoYW5kIHNraXAgdGhlIGZpbmdlcnByaW50IGFsdG9nZXRoZXIp
PzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SWYgdGhlcmUgaXMgc29tZW9uZSB3aG8gaGFzIGRv
bmUgdGhpcywgaSYjMzk7ZCByZWFsbHkgYXBwcmVjaWF0ZSB0aXBzIG9yIGV2ZW4gc2FtcGxlIGNv
ZGUgb24gaG93IGl0IGlzIGRvbmUuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3M8L2Rp
dj48ZGl2PkFydW48L2Rpdj48L2Rpdj4K

--===============1018679729024428367==--

