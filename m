Content-Type: multipart/mixed; boundary="===============0191170232612908159=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: building tpm tools - only built one tool?
Date: Tue, 23 Feb 2021 20:19:08 +0000
Message-ID: <SN6PR11MB3437D4EDB56C9AF668CCAB6DB8809@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: OF2ABF8AAD.CC53FE67-ON0025867E.00776245-8525867E.0077F86F@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0191170232612908159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yeah you'll only see one executable. Make install installs symlinks to that=
 executable and then by interogating argv[0] we can figure out what tool to=
 run.

make install will take care of that

You can optionally add DESTDIR to throw them into a non-global user path di=
rectory.
DESTDIR=3D'/where/you/want/them'
________________________________
From: Kenneth Goldman <kgoldman(a)us.ibm.com>
Sent: Tuesday, February 16, 2021 3:50 PM
To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] building tpm tools - only built one tool?


https://github.com/tpm2-software/tpm2-tools/blob/master/doc/INSTALL.md

says in part

./tools/tpm2_getrandom 4

The tools directory has .c and .o files, but apparently only one executable=
, called 'tpm2'.

Does tpm2 now wrap the tools? Did something go wrong in the build? Will som=
ething change when I install?

--
Ken Goldman kgoldman(a)us.ibm.com
914-945-2415 (862-2415)




--===============0191170232612908159==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KWWVhaCB5b3UnbGwgb25seSBzZWUgb25lIGV4ZWN1dGFibGUuIE1h
a2UgaW5zdGFsbCBpbnN0YWxscyBzeW1saW5rcyB0byB0aGF0IGV4ZWN1dGFibGUgYW5kIHRoZW4g
YnkgaW50ZXJvZ2F0aW5nIGFyZ3ZbMF0gd2UgY2FuIGZpZ3VyZSBvdXQgd2hhdCB0b29sIHRvIHJ1
bi48L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgo8
YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
Cm1ha2UgaW5zdGFsbCB3aWxsIHRha2UgY2FyZSBvZiB0aGF0PC9kaXY+CjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgpZb3UgY2FuIG9wdGlvbmFsbHkgYWRk
IERFU1RESVIgdG8gdGhyb3cgdGhlbSBpbnRvIGEgbm9uLWdsb2JhbCB1c2VyIHBhdGggZGlyZWN0
b3J5LjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
CkRFU1RESVI9Jy93aGVyZS95b3Uvd2FudC90aGVtJzwvZGl2Pgo8ZGl2IGlkPSJhcHBlbmRvbnNl
bmQiPjwvZGl2Pgo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFi
aW5kZXg9Ii0xIj4KPGRpdiBpZD0iZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9
IkNhbGlicmksIHNhbnMtc2VyaWYiIHN0eWxlPSJmb250LXNpemU6MTFwdCIgY29sb3I9IiMwMDAw
MDAiPjxiPkZyb206PC9iPiBLZW5uZXRoIEdvbGRtYW4gJmx0O2tnb2xkbWFuQHVzLmlibS5jb20m
Z3Q7PGJyPgo8Yj5TZW50OjwvYj4gVHVlc2RheSwgRmVicnVhcnkgMTYsIDIwMjEgMzo1MCBQTTxi
cj4KPGI+VG86PC9iPiB0cG0yQGxpc3RzLjAxLm9yZyAmbHQ7dHBtMkBsaXN0cy4wMS5vcmcmZ3Q7
PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIGJ1aWxkaW5nIHRwbSB0b29scyAtIG9ubHkgYnVp
bHQgb25lIHRvb2w/PC9mb250Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdj4KPHA+PGEg
aHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iL21h
c3Rlci9kb2MvSU5TVEFMTC5tZCI+PGZvbnQgc2l6ZT0iMiI+aHR0cHM6Ly9naXRodWIuY29tL3Rw
bTItc29mdHdhcmUvdHBtMi10b29scy9ibG9iL21hc3Rlci9kb2MvSU5TVEFMTC5tZDwvZm9udD48
L2E+PGJyPgo8YnI+Cjxmb250IHNpemU9IjIiPnNheXMgaW4gcGFydDwvZm9udD48YnI+Cjxicj4K
PGZvbnQgc2l6ZT0iMiI+Li90b29scy90cG0yX2dldHJhbmRvbSA0PC9mb250Pjxicj4KPGJyPgo8
Zm9udCBzaXplPSIyIj5UaGUgdG9vbHMgZGlyZWN0b3J5IGhhcyAuYyBhbmQgLm8gZmlsZXMsIGJ1
dCBhcHBhcmVudGx5IG9ubHkgb25lIGV4ZWN1dGFibGUsIGNhbGxlZCAndHBtMicuPC9mb250Pjxi
cj4KPGJyPgo8Zm9udCBzaXplPSIyIj5Eb2VzIHRwbTIgbm93IHdyYXAgdGhlIHRvb2xzPyBEaWQg
c29tZXRoaW5nIGdvIHdyb25nIGluIHRoZSBidWlsZD8gV2lsbCBzb21ldGhpbmcgY2hhbmdlIHdo
ZW4gSSBpbnN0YWxsPzxicj4KPGJyPgotLTxicj4KS2VuIEdvbGRtYW4ga2dvbGRtYW5AdXMuaWJt
LmNvbSA8YnI+CjkxNC05NDUtMjQxNSAoODYyLTI0MTUpPGJyPgo8L2ZvbnQ+PGJyPgo8YnI+Cjxi
cj4KPC9wPgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============0191170232612908159==--

