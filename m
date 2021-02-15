Content-Type: multipart/mixed; boundary="===============5512357410518767769=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Error on service tpm2-abrmd start
Date: Mon, 15 Feb 2021 18:19:22 -0500
Message-ID: <OFFF041332.ABD619F9-ON0025867D.007F45E6-8525867D.00801DF2@notes.na.collabserv.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5512357410518767769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Two questions actually, trying to run the Intel TSS with a SW TPM

1

Instructions for a project say to run
	service tpm2-abrmd start
When I do that, I get

 * Starting TPM2 Access Broker and Resource Management Daemon tpm2-abrmd
** (process:19039): WARNING **: 18:06:45.480: tcti_conf before:
"device:/dev/tpm0"

** (tpm2-abrmd:19039): WARNING **: 18:06:45.488: tcti_conf after:
"device:/dev/tpm0"
Refusing to run as root. Pass --allow-root if you know what you are doing.

This probably fails because I don't have /dev/tpm0,ight?

2

Later instructions says to

	sudo -u tss /usr/local/sbin/tpm2-abrmd --tcti=3Dmssim &

which fails because I don't have tpm2-abrmd.  I did install the packages -
Ubuntu 20.

3

Finally, if I'm using the SW TPM, can I simply skip the abrmd complexity
and somehow point the Intel TSS to the SW TPM socket.






--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)

--===============5512357410518767769==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgZmFjZT0iQXJpYWwiPlR3byBxdWVzdGlvbnMgYWN0dWFsbHks
IHRyeWluZyB0byBydW4gdGhlIEludGVsIFRTUyB3aXRoIGEgU1cgVFBNPC9mb250Pjxicj48YnI+
PGZvbnQgZmFjZT0iQXJpYWwiPjE8L2ZvbnQ+PGJyPjxicj48Zm9udCBmYWNlPSJBcmlhbCI+SW5z
dHJ1Y3Rpb25zIGZvciBhIHByb2plY3Qgc2F5IHRvIHJ1biAgPC9mb250Pjxicj48Zm9udCBmYWNl
PSJBcmlhbCI+ICAgICAgICBzZXJ2aWNlIHRwbTItYWJybWQgc3RhcnQ8L2ZvbnQ+PGJyPjxmb250
IGZhY2U9IkFyaWFsIj5XaGVuIEkgZG8gdGhhdCwgSSBnZXQ8L2ZvbnQ+PGJyPjxicj4gKiBTdGFy
dGluZyBUUE0yIEFjY2VzcyBCcm9rZXIgYW5kIFJlc291cmNlIE1hbmFnZW1lbnQgRGFlbW9uIHRw
bTItYWJybWQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGJyPioqIChwcm9jZXNzOjE5
MDM5KTogV0FSTklORyAqKjogMTg6MDY6NDUuNDgwOiB0Y3RpX2NvbmYgYmVmb3JlOiAmcXVvdDtk
ZXZpY2U6L2Rldi90cG0wJnF1b3Q7PGJyPjxicj4qKiAodHBtMi1hYnJtZDoxOTAzOSk6IFdBUk5J
TkcgKio6IDE4OjA2OjQ1LjQ4ODogdGN0aV9jb25mIGFmdGVyOiAmcXVvdDtkZXZpY2U6L2Rldi90
cG0wJnF1b3Q7PGJyPlJlZnVzaW5nIHRvIHJ1biBhcyByb290LiBQYXNzIC0tYWxsb3ctcm9vdCBp
ZiB5b3Uga25vdyB3aGF0IHlvdSBhcmUgZG9pbmcuPGJyPjxicj5UaGlzIHByb2JhYmx5IGZhaWxz
IGJlY2F1c2UgSSBkb24ndCBoYXZlIC9kZXYvdHBtMCxpZ2h0Pzxicj48YnI+Mjxicj48YnI+TGF0
ZXIgaW5zdHJ1Y3Rpb25zIHNheXMgdG8gPGJyPjxicj4gICAgICAgIHN1ZG8gLXUgdHNzIC91c3Iv
bG9jYWwvc2Jpbi90cG0yLWFicm1kIC0tdGN0aT1tc3NpbSAmYW1wOzxicj48YnI+d2hpY2ggZmFp
bHMgYmVjYXVzZSBJIGRvbid0IGhhdmUgdHBtMi1hYnJtZC4gIEkgZGlkIGluc3RhbGwgdGhlIHBh
Y2thZ2VzIC0gVWJ1bnR1IDIwLjxicj48YnI+Mzxicj48YnI+RmluYWxseSwgaWYgSSdtIHVzaW5n
IHRoZSBTVyBUUE0sIGNhbiBJIHNpbXBseSBza2lwIHRoZSBhYnJtZCBjb21wbGV4aXR5IGFuZCBz
b21laG93IHBvaW50IHRoZSBJbnRlbCBUU1MgdG8gdGhlIFNXIFRQTSBzb2NrZXQuPGJyPjxicj48
YnI+ICAgICAgICA8YnI+PGJyPjxicj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8YnI+
LS08Zm9udCBzaXplPSIyIj48YnI+S2VuIEdvbGRtYW4gICBrZ29sZG1hbkB1cy5pYm0uY29tICAg
PGJyPjkxNC05NDUtMjQxNSAoODYyLTI0MTUpPGJyPjwvZm9udD48QlI+CjwvYm9keT48L2h0bWw+
Cg==

--===============5512357410518767769==--

