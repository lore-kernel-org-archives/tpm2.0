Content-Type: multipart/mixed; boundary="===============4641976400435900919=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] tpm2_quote - unexpected TPM commands - from where?
Date: Wed, 12 May 2021 18:20:14 -0400
Message-ID: <OF00EF9886.41B16198-ON002586D3.00792A71-852586D3.007AB406@notes.na.collabserv.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4641976400435900919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



The application is running a quote with this (python wrapped) command:

['tpm2_quote', '-c', '/var/lib/keylime/secure/tmpptoera_c', '-l',
'sha256:15,16,22', '-q', '645442426a4c3456786a4b767465424432357659', '-m',
'/tmp/tmprc17whih', '-s', '/tmp/tmp9vlpv1k2', '-o', '/tmp/tmpd3tl0nxn',
'-g', 'sha256', '-p', 'T5dKvXj1wGIFbp5brLUz']

Even with the implicit HMAC session, I would expect

startauthsession 02000000
loadcontext 80000000 (the quote key)
quote with session 02000000 and key 80000000
flushcontext 80000000
flushcontext 02000000

I see this.  Is there something wrong with the call, is there a lot more
implicit in the quote tool, or is abrmd doing a lot of extra calls?

1 - It keeps loading and flushing the key and the session.
2 - It contextsave the key a few times, but it was already context saved
before the command started
3 - There's an unexpected getcapability, and a really unexpected readpublic
4 - A PCR read at the end

StartAuthSession: 02000000			OK
ContextSave: 02000000				???
ContextLoad: 80000000				OK
ContextSave: 80000000				???
FlushContext: 80000000				really unexpected
GetCapability: 00000005				unexpected
ContextLoad: 80000000				??? because of the flushcontext
ReadPublic: objectHandle 80000000		really unexpected
ContextSave: 80000000				???
FlushContext: 80000000				really unexpected
ContextLoad: 80000000				??? because of the flushcontext
ContextLoad: 02000000				??? because of the save
Quote with Session 0 handle 02000000		OK
	signHandle 80000000
ContextSave: 02000000				???
ContextSave: 80000000				???
FlushContext: 80000000				OK
PCR_Read:					unexpected
FlushContext: 02000000				OK

--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)

--===============4641976400435900919==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+VGhlIGFwcGxpY2F0aW9uIGlzIHJ1bm5pbmcg
YSBxdW90ZSB3aXRoIHRoaXMgKHB5dGhvbiB3cmFwcGVkKSBjb21tYW5kOjwvZm9udD48YnI+PGJy
Pjxmb250IHNpemU9IjIiPlsndHBtMl9xdW90ZScsICctYycsICcvdmFyL2xpYi9rZXlsaW1lL3Nl
Y3VyZS90bXBwdG9lcmFfYycsICctbCcsICdzaGEyNTY6MTUsMTYsMjInLCAnLXEnLCAnNjQ1NDQy
NDI2YTRjMzQ1Njc4NmE0Yjc2NzQ2NTQyNDQzMjM1NzY1OScsICctbScsICcvdG1wL3RtcHJjMTd3
aGloJywgJy1zJywgJy90bXAvdG1wOXZscHYxazInLCAnLW8nLCAnL3RtcC90bXBkM3RsMG54bics
ICctZycsICdzaGEyNTYnLCAnLXAnLCAnVDVkS3ZYajF3R0lGYnA1YnJMVXonXTwvZm9udD48YnI+
PGJyPjxmb250IHNpemU9IjIiPkV2ZW4gd2l0aCB0aGUgaW1wbGljaXQgSE1BQyBzZXNzaW9uLCBJ
IHdvdWxkIGV4cGVjdDwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIiPnN0YXJ0YXV0aHNlc3Np
b24gMDIwMDAwMDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPmxvYWRjb250ZXh0IDgwMDAwMDAw
ICh0aGUgcXVvdGUga2V5KTwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+cXVvdGUgd2l0aCBzZXNz
aW9uIDAyMDAwMDAwIGFuZCBrZXkgODAwMDAwMDA8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPmZs
dXNoY29udGV4dCA4MDAwMDAwMDwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+Zmx1c2hjb250ZXh0
IDAyMDAwMDAwPC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiI+SSBzZWUgdGhpcy4gIElzIHRo
ZXJlIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBjYWxsLCBpcyB0aGVyZSBhIGxvdCBtb3JlIGlt
cGxpY2l0IGluIHRoZSBxdW90ZSB0b29sLCBvciBpcyBhYnJtZCBkb2luZyBhIGxvdCBvZiBleHRy
YSBjYWxscz88L2ZvbnQ+PGJyPjxicj48Zm9udCBzaXplPSIyIj4xIC0gSXQga2VlcHMgbG9hZGlu
ZyBhbmQgZmx1c2hpbmcgdGhlIGtleSBhbmQgdGhlIHNlc3Npb24uPC9mb250Pjxicj48Zm9udCBz
aXplPSIyIj4yIC0gSXQgY29udGV4dHNhdmUgdGhlIGtleSBhIGZldyB0aW1lcywgYnV0IGl0IHdh
cyBhbHJlYWR5IGNvbnRleHQgc2F2ZWQgYmVmb3JlIHRoZSBjb21tYW5kIHN0YXJ0ZWQ8L2ZvbnQ+
PGJyPjxmb250IHNpemU9IjIiPjMgLSBUaGVyZSdzIGFuIHVuZXhwZWN0ZWQgZ2V0Y2FwYWJpbGl0
eSwgYW5kIGEgcmVhbGx5IHVuZXhwZWN0ZWQgcmVhZHB1YmxpYzwvZm9udD48YnI+PGZvbnQgc2l6
ZT0iMiI+NCAtIEEgUENSIHJlYWQgYXQgdGhlIGVuZDwvZm9udD48YnI+PGJyPjxmb250IHNpemU9
IjIiPlN0YXJ0QXV0aFNlc3Npb246IDAyMDAwMDAwICAgICAgICAgICAgICAgICAgICAgICAgT0s8
L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPkNvbnRleHRTYXZlOiAwMjAwMDAwMCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPz8/PC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5Db250ZXh0
TG9hZDogODAwMDAwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9LPC9mb250Pjxi
cj48Zm9udCBzaXplPSIyIj5Db250ZXh0U2F2ZTogODAwMDAwMDAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgID8/PzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+Rmx1c2hDb250ZXh0OiA4
MDAwMDAwMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVhbGx5IHVuZXhwZWN0ZWQ8
L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPkdldENhcGFiaWxpdHk6IDAwMDAwMDA1ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bmV4cGVjdGVkPC9mb250Pjxicj48Zm9udCBzaXplPSIy
Ij5Db250ZXh0TG9hZDogODAwMDAwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8/
PyBiZWNhdXNlIG9mIHRoZSBmbHVzaGNvbnRleHQ8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPlJl
YWRQdWJsaWM6IG9iamVjdEhhbmRsZSA4MDAwMDAwMCAgICAgICAgICAgICAgICByZWFsbHkgdW5l
eHBlY3RlZDwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+Q29udGV4dFNhdmU6IDgwMDAwMDAwICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA/Pz88L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIi
PkZsdXNoQ29udGV4dDogODAwMDAwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
YWxseSB1bmV4cGVjdGVkPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5Db250ZXh0TG9hZDogODAw
MDAwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8/PyBiZWNhdXNlIG9mIHRoZSBm
bHVzaGNvbnRleHQ8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPkNvbnRleHRMb2FkOiAwMjAwMDAw
MCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPz8/IGJlY2F1c2Ugb2YgdGhlIHNhdmU8
L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPlF1b3RlIHdpdGggU2Vzc2lvbiAwIGhhbmRsZSAwMjAw
MDAwMCAgICAgICAgICAgICAgICBPSzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+ICAgICAgICBz
aWduSGFuZGxlIDgwMDAwMDAwPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5Db250ZXh0U2F2ZTog
MDIwMDAwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8/PyAgICAgICAgICAgICAg
ICAgICAgICAgIDwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+Q29udGV4dFNhdmU6IDgwMDAwMDAw
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA/Pz88L2ZvbnQ+PGJyPjxmb250IHNpemU9
IjIiPkZsdXNoQ29udGV4dDogODAwMDAwMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE9LPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5QQ1JfUmVhZDogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5leHBlY3RlZDwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+
Rmx1c2hDb250ZXh0OiAwMjAwMDAwMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgT0s8
YnI+PGJyPi0tPGJyPktlbiBHb2xkbWFuICAga2dvbGRtYW5AdXMuaWJtLmNvbSAgIDxicj45MTQt
OTQ1LTI0MTUgKDg2Mi0yNDE1KTxicj48L2ZvbnQ+PEJSPgo8L2JvZHk+PC9odG1sPgo=

--===============4641976400435900919==--

