Content-Type: multipart/mixed; boundary="===============6048820721473223917=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] tpm2_abrmd: Intel tools with abrmd?
Date: Wed, 24 Feb 2021 17:07:27 -0500
Message-ID: <OFF8EAB942.0DE27369-ON00258686.00764B04-85258686.0079881E@notes.na.collabserv.com>
In-Reply-To: OF25443825.9823765F-ON00258686.0074602C-85258686.0074BB58@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6048820721473223917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have the Intel tools working with no abrmd and setenv TPM2TOOLS_TCTI
"mssim:host=3Dlocalhost,port=3D2321"

What would I set the env variable to for abrmd?

The docs at https://www.mankier.com/1/tpm2_getrandom

discuss command line argument but not the env variable.

1 - Should I use bus_name or bus_type?

"abrmd:bus_type=3Dsession" gives me this.

ERROR: Could not load tcti, got: "abrmd:bus_type=3Dsession"

2 - bus_name requires a name.  The example uses
bus_name=3Dcom.example.FooBar:
but I doubt foobar is correct.

--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)





--===============6048820721473223917==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+SSBoYXZlIHRoZSBJbnRlbCB0b29scyB3b3Jr
aW5nIHdpdGggbm8gYWJybWQgYW5kIHNldGVudiBUUE0yVE9PTFNfVENUSSAmcXVvdDttc3NpbTpo
b3N0PWxvY2FsaG9zdCxwb3J0PTIzMjEmcXVvdDs8L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPSIy
Ij5XaGF0IHdvdWxkIEkgc2V0IHRoZSBlbnYgdmFyaWFibGUgdG8gZm9yIGFicm1kPzwvZm9udD48
YnI+PGJyPjxmb250IHNpemU9IjIiPlRoZSBkb2NzIGF0IDwvZm9udD48YSBocmVmPSJodHRwczov
L3d3dy5tYW5raWVyLmNvbS8xL3RwbTJfZ2V0cmFuZG9tIj48Zm9udCBzaXplPSIyIj5odHRwczov
L3d3dy5tYW5raWVyLmNvbS8xL3RwbTJfZ2V0cmFuZG9tPC9mb250PjwvYT48YnI+PGJyPjxmb250
IHNpemU9IjIiPmRpc2N1c3MgY29tbWFuZCBsaW5lIGFyZ3VtZW50IGJ1dCBub3QgdGhlIGVudiB2
YXJpYWJsZS4gIDwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIiPjEgLSBTaG91bGQgSSB1c2Ug
YnVzX25hbWUgb3IgYnVzX3R5cGU/PC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiI+JnF1b3Q7
YWJybWQ6YnVzX3R5cGU9c2Vzc2lvbiZxdW90OyBnaXZlcyBtZSB0aGlzLjwvZm9udD48YnI+PGJy
Pjxmb250IHNpemU9IjIiPkVSUk9SOiBDb3VsZCBub3QgbG9hZCB0Y3RpLCBnb3Q6ICZxdW90O2Fi
cm1kOmJ1c190eXBlPXNlc3Npb24mcXVvdDs8L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPSIyIj4y
IC0gYnVzX25hbWUgcmVxdWlyZXMgYSBuYW1lLiAgVGhlIGV4YW1wbGUgdXNlcyBidXNfbmFtZT1j
b20uZXhhbXBsZS5Gb29CYXI6PC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5idXQgSSBkb3VidCBm
b29iYXIgaXMgY29ycmVjdC4gPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj48YnI+LS08YnI+S2Vu
IEdvbGRtYW4gICBrZ29sZG1hbkB1cy5pYm0uY29tICAgPGJyPjkxNC05NDUtMjQxNSAoODYyLTI0
MTUpPGJyPjwvZm9udD48YnI+CjxwPjxCUj4KPC9ib2R5PjwvaHRtbD4K

--===============6048820721473223917==--

