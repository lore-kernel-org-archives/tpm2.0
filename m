Content-Type: multipart/mixed; boundary="===============7396598384666670812=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: building tpm tools
Date: Tue, 23 Feb 2021 20:17:41 +0000
Message-ID: <SN6PR11MB34377CFDF1C45AA3B9C83B5CB8809@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: OF2E6A37E0.E33BD89F-ON0025867E.00772D83-8525867E.00775D2F@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7396598384666670812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

enable unit doesn't take an argument. It requires tpm2-abrmd, but will use =
swtpm or the tpm_server.
________________________________
From: Kenneth Goldman <kgoldman(a)us.ibm.com>
Sent: Tuesday, February 16, 2021 3:43 PM
Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: [tpm2] building tpm tools


When I try the (recommended)

./configure --enable-unit=3Dmssim

I get

configure: error: Required executable tpm2_abrmd not found, try setting PATH

I thought abrmd was optional. I did not build it, since I expect to use the=
 SW TPM.

--
Ken Goldman kgoldman(a)us.ibm.com
914-945-2415 (862-2415)




--===============7396598384666670812==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KZW5hYmxlIHVuaXQgZG9lc24ndCB0YWtlIGFuIGFyZ3VtZW50LiBJ
dCByZXF1aXJlcyB0cG0yLWFicm1kLCBidXQgd2lsbCB1c2Ugc3d0cG0gb3IgdGhlIHRwbV9zZXJ2
ZXIuPC9kaXY+CjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+CjxociBzdHlsZT0iZGlzcGxh
eTppbmxpbmUtYmxvY2s7d2lkdGg6OTglIiB0YWJpbmRleD0iLTEiPgo8ZGl2IGlkPSJkaXZScGx5
RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9
ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IEtlbm5ldGggR29s
ZG1hbiAmbHQ7a2dvbGRtYW5AdXMuaWJtLmNvbSZndDs8YnI+CjxiPlNlbnQ6PC9iPiBUdWVzZGF5
LCBGZWJydWFyeSAxNiwgMjAyMSAzOjQzIFBNPGJyPgo8Yj5DYzo8L2I+IHRwbTJAbGlzdHMuMDEu
b3JnICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8YnI+CjxiPlN1YmplY3Q6PC9iPiBbdHBtMl0g
YnVpbGRpbmcgdHBtIHRvb2xzPC9mb250Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdj4K
PHA+PGZvbnQgc2l6ZT0iMiI+V2hlbiBJIHRyeSB0aGUgKHJlY29tbWVuZGVkKSA8L2ZvbnQ+PGJy
Pgo8YnI+Cjxmb250IHNpemU9IjIiPi4vY29uZmlndXJlIC0tZW5hYmxlLXVuaXQ9bXNzaW08L2Zv
bnQ+PGJyPgo8YnI+Cjxmb250IHNpemU9IjIiPkkgZ2V0IDwvZm9udD48YnI+Cjxicj4KPGZvbnQg
c2l6ZT0iMiI+Y29uZmlndXJlOiBlcnJvcjogUmVxdWlyZWQgZXhlY3V0YWJsZSB0cG0yX2Ficm1k
IG5vdCBmb3VuZCwgdHJ5IHNldHRpbmcgUEFUSDwvZm9udD48YnI+Cjxicj4KPGZvbnQgc2l6ZT0i
MiI+SSB0aG91Z2h0IGFicm1kIHdhcyBvcHRpb25hbC4gSSBkaWQgbm90IGJ1aWxkIGl0LCBzaW5j
ZSBJIGV4cGVjdCB0byB1c2UgdGhlIFNXIFRQTS48YnI+Cjxicj4KLS08YnI+CktlbiBHb2xkbWFu
IGtnb2xkbWFuQHVzLmlibS5jb20gPGJyPgo5MTQtOTQ1LTI0MTUgKDg2Mi0yNDE1KTxicj4KPC9m
b250Pjxicj4KPGJyPgo8YnI+CjwvcD4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============7396598384666670812==--

