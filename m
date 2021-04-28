Content-Type: multipart/mixed; boundary="===============1565284659902894211=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: : AW: Re: get TPM applications to happily co-exist
Date: Wed, 28 Apr 2021 16:42:04 -0400
Message-ID: <OFB94B9CF3.92C5DD99-ON002586C5.007154A7-852586C5.0071B716@notes.na.collabserv.com>
In-Reply-To: 6002bce5-70ec-6ec9-eab0-3e7b3ccb6294@oracle.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1565284659902894211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: Ted Kim <ted.h.kim(a)oracle.com>
>
> OK, but then the problem of preventing other applications from evicting
> persistent objects from our application doesn't seem to have a solution,
> except by locking down the owner hierarchy (e.g. my application has the
> password) - which doesn't seem very friendly. How does any other
> application create a primary object, etc. ?

A typical design has the owner create a primary storage key with an empty
password and make it persistent at a standard handle.

	That's similar to the TPM 1.2 SRK.

Each application creates a key hierarchy under that storage key, with
whatever authorization they want.

The problem with a well-known owner auth is that everyone can Dos
the TPM.

--===============1565284659902894211==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PHR0Pjxmb250IHNpemU9IjIiPiZndDsgRnJvbTogVGVkIEtpbSAmbHQ7
dGVkLmgua2ltQG9yYWNsZS5jb20mZ3Q7PC9mb250PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIy
Ij4mZ3Q7IDxicj4mZ3Q7IE9LLCBidXQgdGhlbiB0aGUgcHJvYmxlbSBvZiBwcmV2ZW50aW5nIG90
aGVyIGFwcGxpY2F0aW9ucyBmcm9tIGV2aWN0aW5nIDxicj4mZ3Q7IHBlcnNpc3RlbnQgb2JqZWN0
cyBmcm9tIG91ciBhcHBsaWNhdGlvbiBkb2Vzbid0IHNlZW0gdG8gaGF2ZSBhIHNvbHV0aW9uLCA8
YnI+Jmd0OyBleGNlcHQgYnkgbG9ja2luZyBkb3duIHRoZSBvd25lciBoaWVyYXJjaHkgKGUuZy4g
bXkgYXBwbGljYXRpb24gaGFzIHRoZSA8YnI+Jmd0OyBwYXNzd29yZCkgLSB3aGljaCBkb2Vzbid0
IHNlZW0gdmVyeSBmcmllbmRseS4gSG93IGRvZXMgYW55IG90aGVyIDxicj4mZ3Q7IGFwcGxpY2F0
aW9uIGNyZWF0ZSBhIHByaW1hcnkgb2JqZWN0LCBldGMuID88YnI+PGJyPkEgdHlwaWNhbCBkZXNp
Z24gaGFzIHRoZSBvd25lciBjcmVhdGUgYSBwcmltYXJ5IHN0b3JhZ2Uga2V5IHdpdGggYW4gZW1w
dHk8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPnBhc3N3b3JkIGFuZCBtYWtlIGl0
IHBlcnNpc3RlbnQgYXQgYSBzdGFuZGFyZCBoYW5kbGUuPC9mb250PjwvdHQ+PGJyPjxicj48dHQ+
PGZvbnQgc2l6ZT0iMiI+ICAgICAgICBUaGF0J3Mgc2ltaWxhciB0byB0aGUgVFBNIDEuMiBTUksu
PC9mb250PjwvdHQ+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+RWFjaCBhcHBsaWNhdGlvbiBj
cmVhdGVzIGEga2V5IGhpZXJhcmNoeSB1bmRlciB0aGF0IHN0b3JhZ2Uga2V5LCB3aXRoPC9mb250
PjwvdHQ+PGJyPjx0dD48Zm9udCBzaXplPSIyIj53aGF0ZXZlciBhdXRob3JpemF0aW9uIHRoZXkg
d2FudC48L2ZvbnQ+PC90dD48YnI+PGJyPjx0dD48Zm9udCBzaXplPSIyIj5UaGUgcHJvYmxlbSB3
aXRoIGEgd2VsbC1rbm93biBvd25lciBhdXRoIGlzIHRoYXQgZXZlcnlvbmUgY2FuIERvczwvZm9u
dD48L3R0Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+dGhlIFRQTS48L2ZvbnQ+PC90dD48YnI+PEJS
Pgo8L2JvZHk+PC9odG1sPgo=

--===============1565284659902894211==--

