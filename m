Content-Type: multipart/mixed; boundary="===============2891991232540606881=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Failed to acquire DBus name com.intel.tss2.Tabrmd
Date: Fri, 30 Apr 2021 14:54:00 -0400
Message-ID: <OFD21FE05E.520EF7F2-ON002586C7.0067AFCF-852586C7.0067D264@notes.na.collabserv.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2891991232540606881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


This is my variation on what seems to be a frequent issue. Ubuntu groovy,
abrmd installed with apt.


      tpm2-abrmd --tcti=3Dmssim (not as root)


Gives this error:


** (tpm2-abrmd:2275): CRITICAL **: 14:38:22.835: Failed to acquire DBus
name com.intel.tss2.Tabrmd. UID 1000 must be allowed to "own" this name.
Check DBus config and check that this is running as user tss or root.
      How should I 'own' this name?
      What's 'DBUS config' and what should be checked
      What is 'this' that should be running as user tss or root?


UID 1000 is kgold


My tpm2-abrmd.conf was edited to add:


/etc/group has



tss:111:kgold


--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)

--===============2891991232540606881==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+VGhpcyBpcyBteSB2YXJpYXRpb24gb24gd2hhdCBzZWVtcyB0byBiZSBh
IGZyZXF1ZW50IGlzc3VlLiBVYnVudHUgZ3Jvb3Z5LCBhYnJtZCBpbnN0YWxsZWQgd2l0aCBhcHQu
Cjx1bD48dWw+dHBtMi1hYnJtZCAtLXRjdGk9bXNzaW0gKG5vdCBhcyByb290KTwvdWw+PC91bD5H
aXZlcyB0aGlzIGVycm9yOgo8cD4qKiAodHBtMi1hYnJtZDoyMjc1KTogQ1JJVElDQUwgKio6IDE0
OjM4OjIyLjgzNTogRmFpbGVkIHRvIGFjcXVpcmUgREJ1cyBuYW1lIGNvbS5pbnRlbC50c3MyLlRh
YnJtZC4gVUlEIDEwMDAgbXVzdCBiZSBhbGxvd2VkIHRvICZxdW90O293biZxdW90OyB0aGlzIG5h
bWUuIENoZWNrIERCdXMgY29uZmlnIGFuZCBjaGVjayB0aGF0IHRoaXMgaXMgcnVubmluZyBhcyB1
c2VyIHRzcyBvciByb290Lgo8dWw+PHVsIHR5cGU9ImRpc2MiPjxsaT5Ib3cgc2hvdWxkIEkgJ293
bicgdGhpcyBuYW1lPwo8bGk+V2hhdCdzICdEQlVTIGNvbmZpZycgYW5kIHdoYXQgc2hvdWxkIGJl
IGNoZWNrZWQKPGxpPldoYXQgaXMgJ3RoaXMnIHRoYXQgc2hvdWxkIGJlIHJ1bm5pbmcgYXMgdXNl
ciB0c3Mgb3Igcm9vdD88L3VsPjwvdWw+VUlEIDEwMDAgaXMga2dvbGQKPHA+TXkgdHBtMi1hYnJt
ZC5jb25mIHdhcyBlZGl0ZWQgdG8gYWRkOgo8cD4vZXRjL2dyb3VwIGhhcwo8cD48YnI+dHNzOjEx
MTprZ29sZCA8YnI+PGZvbnQgc2l6ZT0iMiI+PGJyPjxicj4tLTxicj5LZW4gR29sZG1hbiAgIGtn
b2xkbWFuQHVzLmlibS5jb20gICA8YnI+OTE0LTk0NS0yNDE1ICg4NjItMjQxNSk8YnI+PC9mb250
PjxCUj4KPC9ib2R5PjwvaHRtbD4K

--===============2891991232540606881==--

