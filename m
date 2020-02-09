Content-Type: multipart/mixed; boundary="===============1362664343176936720=="
MIME-Version: 1.0
From: Ben Saunders <ben at fuszle.com>
Subject: [tpm2] Save Hash to TPM Memory
Date: Mon, 10 Feb 2020 09:29:29 +1100
Message-ID: <CAGkJ=LH0rnTyjXvkT_hhKs_ZAoz1baD71Q6PhS=yjLFubWDaLA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1362664343176936720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi guys,

I would like some help if at all possible. I'm fairly new to the TPM but
have been able to get some stuff working like the following:
https://gist.github.com/dnoliver/04364e72d8b81368f72ad4e6896f688d

I want to save and load an sha256sum of an important file to check if its
been modified

If I run: sha256sum importantfile.txt i get:
aea86e3c73495f205929cfebba0d63f1382c8ac59be081b6351681415f4063cf
 importantfile.txt

I would like to save the sum into the TPM and quickly retrieve it and
update it when necessary.I think with a session would be appropriate.

Any help would be appreciated, thankyou so much

Ben


-- =

Ben Saunders
0421 935 776

--===============1362664343176936720==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+SGkgZ3V5cyw8ZGl2Pjxicj48L2Rpdj48ZGl2Pkkgd291bGQgbGlrZSBz
b21lIGhlbHAgaWYgYXQgYWxswqBwb3NzaWJsZS4gSSYjMzk7bSBmYWlybHkgbmV3IHRvIHRoZSBU
UE0gYnV0IGhhdmUgYmVlbiBhYmxlIHRvIGdldCBzb21lIHN0dWZmIHdvcmtpbmcgbGlrZSB0aGUg
Zm9sbG93aW5nOjxhIGhyZWY9Imh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2Rub2xpdmVyLzA0MzY0
ZTcyZDhiODEzNjhmNzJhZDRlNjg5NmY2ODhkIj5odHRwczovL2dpc3QuZ2l0aHViLmNvbS9kbm9s
aXZlci8wNDM2NGU3MmQ4YjgxMzY4ZjcyYWQ0ZTY4OTZmNjg4ZDwvYT48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2Pkkgd2FudCB0byBzYXZlIGFuZCBsb2FkIGFuIHNoYTI1NnN1bSBvZiBhbiBpbXBv
cnRhbnQgZmlsZSB0byBjaGVjayBpZiBpdHMgYmVlbiBtb2RpZmllZDwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+SWYgSSBydW46IHNoYTI1NnN1bSBpbXBvcnRhbnRmaWxlLnR4dCBpIGdldDo8L2Rp
dj48ZGl2PmFlYTg2ZTNjNzM0OTVmMjA1OTI5Y2ZlYmJhMGQ2M2YxMzgyYzhhYzU5YmUwODFiNjM1
MTY4MTQxNWY0MDYzY2YgwqBpbXBvcnRhbnRmaWxlLnR4dDxicj48L2Rpdj48ZGl2Pjxicj5JIHdv
dWxkIGxpa2UgdG8gc2F2ZSB0aGUgc3VtIGludG8gdGhlIFRQTSBhbmQgcXVpY2tsecKgcmV0cmll
dmUgaXQgYW5kIHVwZGF0ZSBpdCB3aGVuIG5lY2Vzc2FyeS5JIHRoaW5rIHdpdGggYSBzZXNzaW9u
IHdvdWxkIGJlIGFwcHJvcHJpYXRlLsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BbnkgaGVs
cCB3b3VsZCBiZSBhcHByZWNpYXRlZCwgdGhhbmt5b3Ugc28gbXVjaDwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+QmVuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2Pjxicj48L2Rpdj4tLSA8
YnI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9
ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+QmVuIFNhdW5k
ZXJzPC9kaXY+PGRpdiBkaXI9Imx0ciI+PGRpdj4wNDIxIDkzNSA3NzY8L2Rpdj48L2Rpdj48L2Rp
dj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============1362664343176936720==--

