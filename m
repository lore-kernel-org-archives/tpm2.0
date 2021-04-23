Content-Type: multipart/mixed; boundary="===============0980507996986923069=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Failing to build tss tools - Ubuntu groovy
Date: Fri, 23 Apr 2021 15:24:45 -0400
Message-ID: <OF7EB02048.E3CBA041-ON002586C0.0069F203-852586C0.006AA32B@notes.na.collabserv.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0980507996986923069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


My project specifies branch 3.X, which fails because it uses python, not
python3.

checking for module yaml in python... Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: No module named yaml

~~~~~~~~~~~~~~~~~~~~~~~~~~

I tried instead branch 3.0.x.  Is that newer or older than 3.X.

This one failed because - what - sapi is not installed or it's the wrong
version???

checking for sapi >=3D 1.3.0 sapi < 2.0.0... no

The tpm2-tss is 2.4.x.  The project wants 2.0.x but that did not build.

~~~

Is there a patch for 3.X or 3.0.X that I can use to build?


--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)

--===============0980507996986923069==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+TXkgcHJvamVjdCBzcGVjaWZpZXMgYnJhbmNo
IDMuWCwgd2hpY2ggZmFpbHMgYmVjYXVzZSBpdCB1c2VzIHB5dGhvbiwgbm90IHB5dGhvbjMuPC9m
b250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiI+Y2hlY2tpbmcgZm9yIG1vZHVsZSB5YW1sIGluIHB5
dGhvbi4uLiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6PC9mb250Pjxicj48Zm9u
dCBzaXplPSIyIj4gIEZpbGUgJnF1b3Q7Jmx0O3N0ZGluJmd0OyZxdW90OywgbGluZSAxLCBpbiAm
bHQ7bW9kdWxlJmd0OzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+SW1wb3J0RXJyb3I6IE5vIG1v
ZHVsZSBuYW1lZCB5YW1sPC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiI+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn48L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPSIyIj5JIHRyaWVkIGluc3Rl
YWQgYnJhbmNoIDMuMC54LiAgSXMgdGhhdCBuZXdlciBvciBvbGRlciB0aGFuIDMuWC48L2ZvbnQ+
PGJyPjxicj48Zm9udCBzaXplPSIyIj5UaGlzIG9uZSBmYWlsZWQgYmVjYXVzZSAtIHdoYXQgLSBz
YXBpIGlzIG5vdCBpbnN0YWxsZWQgb3IgaXQncyB0aGUgd3JvbmcgdmVyc2lvbj8/PzwvZm9udD48
YnI+PGJyPjxmb250IHNpemU9IjIiPmNoZWNraW5nIGZvciBzYXBpICZndDs9IDEuMy4wIHNhcGkg
Jmx0OyAyLjAuMC4uLiBubzwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIiPlRoZSB0cG0yLXRz
cyBpcyAyLjQueC4gIFRoZSBwcm9qZWN0IHdhbnRzIDIuMC54IGJ1dCB0aGF0IGRpZCBub3QgYnVp
bGQuPC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiI+fn5+PC9mb250Pjxicj48YnI+PGZvbnQg
c2l6ZT0iMiI+SXMgdGhlcmUgYSBwYXRjaCBmb3IgMy5YIG9yIDMuMC5YIHRoYXQgSSBjYW4gdXNl
IHRvIGJ1aWxkPzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+PGJyPjxicj4tLTxicj5LZW4gR29s
ZG1hbiAgIGtnb2xkbWFuQHVzLmlibS5jb20gICA8YnI+OTE0LTk0NS0yNDE1ICg4NjItMjQxNSk8
YnI+PC9mb250PjxCUj4KPC9ib2R5PjwvaHRtbD4K

--===============0980507996986923069==--

