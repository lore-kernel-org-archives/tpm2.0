Content-Type: multipart/mixed; boundary="===============7232902405321746069=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] abrmd crashing - how to debug?
Date: Fri, 05 Mar 2021 17:29:20 -0500
Message-ID: <OF20698D64.A63FD5D5-ON0025868F.007A7AC8-8525868F.007B8904@notes.na.collabserv.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7232902405321746069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Ubuntu focal with WSL, abrmd compiled from source

After about 5 minutes of sending commands, abrmd crashes.  I originally
found it with keylime, but I can reproduce it with a simple bash loop on
pcrread.

abrmd exits, the tool output is:

** (process:21067): CRITICAL **: 17:25:10.862: failed to allocate dbus
proxy object: Could not connect: Connection refused
WARNING:tcti:src/tss2-tcti/tctildr.c:79:tcti_from_init() TCTI init for
function 0x7ff5f6dbbe10 failed with a0008
WARNING:tcti:src/tss2-tcti/tctildr.c:109:tcti_from_info() Could not
initialize TCTI named: tcti-abrmd
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:154:tcti_from_file() Could not
initialize TCTI file: tabrmd
ERROR:tcti:src/tss2-tcti/tctildr.c:416:Tss2_TctiLdr_Initialize_Ex() Failed
to instantiate TCTI
ERROR: Could not load tcti, got: "tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"

How would I debug?

I would expect that nothing that a single application does should crash
abrmd.


--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)

--===============7232902405321746069==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+VWJ1bnR1IGZvY2FsIHdpdGggV1NMLCBhYnJt
ZCBjb21waWxlZCBmcm9tIHNvdXJjZTwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIiPkFmdGVy
IGFib3V0IDUgbWludXRlcyBvZiBzZW5kaW5nIGNvbW1hbmRzLCBhYnJtZCBjcmFzaGVzLiAgSSBv
cmlnaW5hbGx5IGZvdW5kIGl0IHdpdGgga2V5bGltZSwgYnV0IEkgY2FuIHJlcHJvZHVjZSBpdCB3
aXRoIGEgc2ltcGxlIGJhc2ggbG9vcCBvbiBwY3JyZWFkLjwvZm9udD48YnI+PGJyPjxmb250IHNp
emU9IjIiPmFicm1kIGV4aXRzLCB0aGUgdG9vbCBvdXRwdXQgaXM6PC9mb250Pjxicj48YnI+PGZv
bnQgc2l6ZT0iMiI+KiogKHByb2Nlc3M6MjEwNjcpOiBDUklUSUNBTCAqKjogMTc6MjU6MTAuODYy
OiBmYWlsZWQgdG8gYWxsb2NhdGUgZGJ1cyBwcm94eSBvYmplY3Q6IENvdWxkIG5vdCBjb25uZWN0
OiBDb25uZWN0aW9uIHJlZnVzZWQ8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPldBUk5JTkc6dGN0
aTpzcmMvdHNzMi10Y3RpL3RjdGlsZHIuYzo3OTp0Y3RpX2Zyb21faW5pdCgpIFRDVEkgaW5pdCBm
b3IgZnVuY3Rpb24gMHg3ZmY1ZjZkYmJlMTAgZmFpbGVkIHdpdGggYTAwMDggPC9mb250Pjxicj48
Zm9udCBzaXplPSIyIj5XQVJOSU5HOnRjdGk6c3JjL3RzczItdGN0aS90Y3RpbGRyLmM6MTA5OnRj
dGlfZnJvbV9pbmZvKCkgQ291bGQgbm90IGluaXRpYWxpemUgVENUSSBuYW1lZDogdGN0aS1hYnJt
ZCA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPkVSUk9SOnRjdGk6c3JjL3RzczItdGN0aS90Y3Rp
bGRyLWRsLmM6MTU0OnRjdGlfZnJvbV9maWxlKCkgQ291bGQgbm90IGluaXRpYWxpemUgVENUSSBm
aWxlOiB0YWJybWQgPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5FUlJPUjp0Y3RpOnNyYy90c3My
LXRjdGkvdGN0aWxkci5jOjQxNjpUc3MyX1RjdGlMZHJfSW5pdGlhbGl6ZV9FeCgpIEZhaWxlZCB0
byBpbnN0YW50aWF0ZSBUQ1RJIDwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+RVJST1I6IENvdWxk
IG5vdCBsb2FkIHRjdGksIGdvdDogJnF1b3Q7dGFicm1kOmJ1c19uYW1lPWNvbS5pbnRlbC50c3My
LlRhYnJtZCZxdW90OzwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIiPkhvdyB3b3VsZCBJIGRl
YnVnPzwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIiPkkgd291bGQgZXhwZWN0IHRoYXQgbm90
aGluZyB0aGF0IGEgc2luZ2xlIGFwcGxpY2F0aW9uIGRvZXMgc2hvdWxkIGNyYXNoIGFicm1kLjwv
Zm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+PGJyPjxicj4tLTxicj5LZW4gR29sZG1hbiAgIGtnb2xk
bWFuQHVzLmlibS5jb20gICA8YnI+OTE0LTk0NS0yNDE1ICg4NjItMjQxNSk8YnI+PC9mb250PjxC
Uj4KPC9ib2R5PjwvaHRtbD4K

--===============7232902405321746069==--

