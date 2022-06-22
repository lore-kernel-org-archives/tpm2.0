Content-Type: multipart/mixed; boundary="===============1464392102415102251=="
MIME-Version: 1.0
From: Shaw, Adrian <adrian.shaw at hp.com>
Subject: [tpm2] Using a session with TPM2_CreatePrimary
Date: Wed, 22 Jun 2022 17:10:12 +0000
Message-ID: <9A503D60-6A12-4B6E-BA3F-ECF7B99F5F3D@hp.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1464392102415102251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I=E2=80=99m trying to create a primary key using an authenticated and encry=
pted session.

I looked at the man page for tpm2_createprimary https://github.com/tpm2-sof=
tware/tpm2-tools/blob/1226b5333e0f051edf67739743a68f668f9ba07a/man/tpm2_cre=
ateprimary.1.md

It does not seem to be possible - there is no way to specify the session to=
 use.

However, it is possible to do this in the IBM TSS equivalent https://www.ma=
nkier.com/1/tsscreateprimary

I noticed you can specify a session for other commands though, like tpm2_cr=
eate, but not with tpm2_createprimary.

Is this a missing feature or am I missing some fundamental understanding?

Thanks,
Adrian

--===============1464392102415102251==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCkhpIGV2ZXJ5b25lLA0KPGRpdiBjbGFzcz0iIj48
YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+SeKAmW0gdHJ5aW5nIHRvIGNyZWF0
ZSBhIHByaW1hcnkga2V5IHVzaW5nIGFuIGF1dGhlbnRpY2F0ZWQgYW5kIGVuY3J5cHRlZCBzZXNz
aW9uLjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xh
c3M9IiI+SSBsb29rZWQgYXQgdGhlIG1hbiBwYWdlIGZvciB0cG0yX2NyZWF0ZXByaW1hcnkmbmJz
cDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Js
b2IvMTIyNmI1MzMzZTBmMDUxZWRmNjc3Mzk3NDNhNjhmNjY4ZjliYTA3YS9tYW4vdHBtMl9jcmVh
dGVwcmltYXJ5LjEubWQiIGNsYXNzPSIiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJl
L3RwbTItdG9vbHMvYmxvYi8xMjI2YjUzMzNlMGYwNTFlZGY2NzczOTc0M2E2OGY2NjhmOWJhMDdh
L21hbi90cG0yX2NyZWF0ZXByaW1hcnkuMS5tZDwvYT48L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJy
IGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPkl0IGRvZXMgbm90IHNlZW0gdG8gYmUg
cG9zc2libGUgLSB0aGVyZSBpcyBubyB3YXkgdG8gc3BlY2lmeSB0aGUgc2Vzc2lvbiB0byB1c2Uu
Jm5ic3A7PC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRpdiBj
bGFzcz0iIj5Ib3dldmVyLCBpdCBpcyBwb3NzaWJsZSB0byBkbyB0aGlzIGluIHRoZSBJQk0gVFNT
IGVxdWl2YWxlbnQmbmJzcDs8YSBocmVmPSJodHRwczovL3d3dy5tYW5raWVyLmNvbS8xL3Rzc2Ny
ZWF0ZXByaW1hcnkiIGNsYXNzPSIiPmh0dHBzOi8vd3d3Lm1hbmtpZXIuY29tLzEvdHNzY3JlYXRl
cHJpbWFyeTwvYT48L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9kaXY+DQo8
ZGl2IGNsYXNzPSIiPjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBjb2xv
cjogcmdiKDAsIDAsIDApOyIgY2xhc3M9IiI+SSBub3RpY2VkIHlvdSBjYW4gc3BlY2lmeSBhIHNl
c3Npb24gZm9yIG90aGVyIGNvbW1hbmRzIHRob3VnaCwgbGlrZSB0cG0yX2NyZWF0ZSwgYnV0IG5v
dCB3aXRoIHRwbTJfY3JlYXRlcHJpbWFyeS48L3NwYW4+PC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxi
ciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5JcyB0aGlzIGEgbWlzc2luZyBmZWF0
dXJlIG9yIGFtIEkgbWlzc2luZyBzb21lIGZ1bmRhbWVudGFsIHVuZGVyc3RhbmRpbmc/PC9kaXY+
DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5UaGFu
a3MsPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPkFkcmlhbjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--===============1464392102415102251==--

