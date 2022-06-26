Content-Type: multipart/mixed; boundary="===============6465308223877875188=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Using a session with TPM2_CreatePrimary
Date: Sun, 26 Jun 2022 22:31:56 +0000
Message-ID: <SN6PR11MB343712D5C5189D76DE87CA8DB8B69@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 9A503D60-6A12-4B6E-BA3F-ECF7B99F5F3D@hp.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6465308223877875188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm pretty sure it's just missing; we haven't enabled session support throu=
ghout all the tools yet. Imran am I correct?
________________________________
From: Shaw, Adrian <adrian.shaw(a)hp.com>
Sent: Wednesday, June 22, 2022 12:10 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] Using a session with TPM2_CreatePrimary

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

--===============6465308223877875188==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1XaW5kb3dzLTEyNTIiPgo8c3R5bGUgdHlwZT0idGV4dC9jc3MiIHN0
eWxlPSJkaXNwbGF5Om5vbmU7Ij4gUCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9IDwv
c3R5bGU+CjwvaGVhZD4KPGJvZHkgZGlyPSJsdHIiPgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
Q2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBj
b2xvcjogcmdiKDAsIDAsIDApOyI+CkknbSBwcmV0dHkgc3VyZSBpdCdzIGp1c3QgbWlzc2luZzsg
d2UgaGF2ZW4ndCBlbmFibGVkIHNlc3Npb24gc3VwcG9ydCB0aHJvdWdob3V0IGFsbCB0aGUgdG9v
bHMgeWV0LiBJbXJhbiBhbSBJIGNvcnJlY3Q/PC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+
PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRl
eD0iLTEiPgo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2Fs
aWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+
PGI+RnJvbTo8L2I+IFNoYXcsIEFkcmlhbiAmbHQ7YWRyaWFuLnNoYXdAaHAuY29tJmd0Ozxicj4K
PGI+U2VudDo8L2I+IFdlZG5lc2RheSwgSnVuZSAyMiwgMjAyMiAxMjoxMCBQTTxicj4KPGI+VG86
PC9iPiB0cG0yQGxpc3RzLjAxLm9yZyAmbHQ7dHBtMkBsaXN0cy4wMS5vcmcmZ3Q7PGJyPgo8Yj5T
dWJqZWN0OjwvYj4gW3RwbTJdIFVzaW5nIGEgc2Vzc2lvbiB3aXRoIFRQTTJfQ3JlYXRlUHJpbWFy
eTwvZm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+CjxkaXYgY2xhc3M9IiIgc3R5bGU9Indv
cmQtd3JhcDpicmVhay13b3JkOyBsaW5lLWJyZWFrOmFmdGVyLXdoaXRlLXNwYWNlIj5IaSBldmVy
eW9uZSwKPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+CjwvZGl2Pgo8ZGl2IGNsYXNzPSIiPkmS
bSB0cnlpbmcgdG8gY3JlYXRlIGEgcHJpbWFyeSBrZXkgdXNpbmcgYW4gYXV0aGVudGljYXRlZCBh
bmQgZW5jcnlwdGVkIHNlc3Npb24uPC9kaXY+CjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPgo8
L2Rpdj4KPGRpdiBjbGFzcz0iIj5JIGxvb2tlZCBhdCB0aGUgbWFuIHBhZ2UgZm9yIHRwbTJfY3Jl
YXRlcHJpbWFyeSZuYnNwOzxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJl
L3RwbTItdG9vbHMvYmxvYi8xMjI2YjUzMzNlMGYwNTFlZGY2NzczOTc0M2E2OGY2NjhmOWJhMDdh
L21hbi90cG0yX2NyZWF0ZXByaW1hcnkuMS5tZCIgY2xhc3M9IiI+aHR0cHM6Ly9naXRodWIuY29t
L3RwbTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iLzEyMjZiNTMzM2UwZjA1MWVkZjY3NzM5NzQz
YTY4ZjY2OGY5YmEwN2EvbWFuL3RwbTJfY3JlYXRlcHJpbWFyeS4xLm1kPC9hPjwvZGl2Pgo8ZGl2
IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4KPC9kaXY+CjxkaXYgY2xhc3M9IiI+SXQgZG9lcyBub3Qg
c2VlbSB0byBiZSBwb3NzaWJsZSAtIHRoZXJlIGlzIG5vIHdheSB0byBzcGVjaWZ5IHRoZSBzZXNz
aW9uIHRvIHVzZS4mbmJzcDs8L2Rpdj4KPGRpdiBjbGFzcz0iIj48YnIgY2xhc3M9IiI+CjwvZGl2
Pgo8ZGl2IGNsYXNzPSIiPkhvd2V2ZXIsIGl0IGlzIHBvc3NpYmxlIHRvIGRvIHRoaXMgaW4gdGhl
IElCTSBUU1MgZXF1aXZhbGVudCZuYnNwOzxhIGhyZWY9Imh0dHBzOi8vd3d3Lm1hbmtpZXIuY29t
LzEvdHNzY3JlYXRlcHJpbWFyeSIgY2xhc3M9IiI+aHR0cHM6Ly93d3cubWFua2llci5jb20vMS90
c3NjcmVhdGVwcmltYXJ5PC9hPjwvZGl2Pgo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4KPC9k
aXY+CjxkaXYgY2xhc3M9IiI+PHNwYW4gY2xhc3M9IiIgc3R5bGU9ImNvbG9yOnJnYigwLDAsMCki
Pkkgbm90aWNlZCB5b3UgY2FuIHNwZWNpZnkgYSBzZXNzaW9uIGZvciBvdGhlciBjb21tYW5kcyB0
aG91Z2gsIGxpa2UgdHBtMl9jcmVhdGUsIGJ1dCBub3Qgd2l0aCB0cG0yX2NyZWF0ZXByaW1hcnku
PC9zcGFuPjwvZGl2Pgo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4KPC9kaXY+CjxkaXYgY2xh
c3M9IiI+SXMgdGhpcyBhIG1pc3NpbmcgZmVhdHVyZSBvciBhbSBJIG1pc3Npbmcgc29tZSBmdW5k
YW1lbnRhbCB1bmRlcnN0YW5kaW5nPzwvZGl2Pgo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4K
PC9kaXY+CjxkaXYgY2xhc3M9IiI+VGhhbmtzLDwvZGl2Pgo8ZGl2IGNsYXNzPSIiPkFkcmlhbjwv
ZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============6465308223877875188==--

