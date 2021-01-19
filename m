Content-Type: multipart/mixed; boundary="===============2260676215113755025=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-abrmd pending RC request for feedback
Date: Tue, 19 Jan 2021 20:43:34 +0000
Message-ID: <SN6PR11MB3437BAF9C26A262738690FE7B8A30@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2260676215113755025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I am getting ready to cut an RC for tpm2-abrmd project, but before I start =
I want to get as much community involvement possible with some questions.


  1.  I dropped the ASAN configure options in favor of ASAN enabled builds.=
 I consider configure options never really part of the shippable API, so I =
am not going to be bumping the major version number. Is everyone OK with th=
at?
  2.  I added ASAN support to configure time, but since I don't consider co=
nfigure features really features, I am not bumping the minor version number=
, is everyone OK with that?
  3.  Are there any open tickets that are blocking anyone that I should fix=
 and include in this RC?

Current changelog:
https://github.com/tpm2-software/tpm2-abrmd/blob/master/CHANGELOG.md


--===============2260676215113755025==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+IFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSA8L3N0
eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgpJIGFtIGdldHRpbmcgcmVhZHkgdG8gY3V0IGFuIFJDIGZvciB0
cG0yLWFicm1kIHByb2plY3QsIGJ1dCBiZWZvcmUgSSBzdGFydCBJIHdhbnQgdG8gZ2V0IGFzIG11
Y2ggY29tbXVuaXR5IGludm9sdmVtZW50IHBvc3NpYmxlIHdpdGggc29tZSBxdWVzdGlvbnMuPC9k
aXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBz
YW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KPGJyPgo8
L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2Es
IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgo8b2w+
CjxsaT5JIGRyb3BwZWQgdGhlIEFTQU4gY29uZmlndXJlIG9wdGlvbnMgaW4gZmF2b3Igb2YgQVNB
TiBlbmFibGVkIGJ1aWxkcy4gSSBjb25zaWRlciBjb25maWd1cmUgb3B0aW9ucyBuZXZlciByZWFs
bHkgcGFydCBvZiB0aGUgc2hpcHBhYmxlIEFQSSwgc28gSSBhbSBub3QgZ29pbmcgdG8gYmUgYnVt
cGluZyB0aGUgbWFqb3IgdmVyc2lvbiBudW1iZXIuIElzIGV2ZXJ5b25lIE9LIHdpdGggdGhhdD88
YnI+CjwvbGk+PGxpPkkgYWRkZWQgQVNBTiBzdXBwb3J0IHRvIGNvbmZpZ3VyZSB0aW1lLCBidXQg
c2luY2UgSSBkb24ndCBjb25zaWRlciBjb25maWd1cmUgZmVhdHVyZXMgcmVhbGx5IGZlYXR1cmVz
LCBJIGFtIG5vdCBidW1waW5nIHRoZSBtaW5vciB2ZXJzaW9uIG51bWJlciwgaXMgZXZlcnlvbmUg
T0sgd2l0aCB0aGF0Pzxicj4KPC9saT48bGk+QXJlIHRoZXJlIGFueSBvcGVuIHRpY2tldHMgdGhh
dCBhcmUgYmxvY2tpbmcgYW55b25lIHRoYXQgSSBzaG91bGQgZml4IGFuZCBpbmNsdWRlIGluIHRo
aXMgUkM/PC9saT48L29sPgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+Q3VycmVudCBjaGFuZ2Vsb2c6
PC9kaXY+CjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBt
Mi1hYnJtZC9ibG9iL21hc3Rlci9DSEFOR0VMT0cubWQiIGlkPSJMUGxuazg4OTI0OCI+aHR0cHM6
Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi1hYnJtZC9ibG9iL21hc3Rlci9DSEFOR0VM
T0cubWQ8L2E+PGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0
bWw+Cg==

--===============2260676215113755025==--

