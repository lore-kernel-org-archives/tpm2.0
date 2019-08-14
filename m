Content-Type: multipart/mixed; boundary="===============8592443778276475628=="
MIME-Version: 1.0
From: Gallagher, James <james.gallagher at uky.edu>
Subject: [tpm2] Question about SPI encryption
Date: Wed, 14 Aug 2019 18:56:11 +0000
Message-ID: <BN7PR03MB44985D6CE2F94FA02831B9B0E6AD0@BN7PR03MB4498.namprd03.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8592443778276475628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
Supposing I was using a TPM that is connected to its host device via the SP=
I bus, would it be possible to encrypt all communication over that bus. I r=
ecently read the TPMgeany papers, linked here: https://github.com/nccgroup/=
TPMGenie in which a man-in-the-middle attack could be used to spoof packets=
 to and from the TPM.
I was curious if The ESAPI, SAPI or something else could be used to encrypt=
 communication over the SPI bus to mitigate these vulnerabilities.

Thank you for your time,
James Gallagher

--===============8592443778276475628==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+IFAge21hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjA7fSA8L3N0
eWxlPgo8L2hlYWQ+Cjxib2R5IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENh
bGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29s
b3I6IHJnYigwLCAwLCAwKTsiPgpIZWxsbyw8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPgpTdXBwb3NpbmcgSSB3YXMgdXNpbmcgYSBUUE0gdGhhdCBp
cyBjb25uZWN0ZWQgdG8gaXRzIGhvc3QgZGV2aWNlIHZpYSB0aGUgU1BJIGJ1cywgd291bGQgaXQg
YmUgcG9zc2libGUgdG8gZW5jcnlwdCBhbGwgY29tbXVuaWNhdGlvbiBvdmVyIHRoYXQgYnVzLiBJ
IHJlY2VudGx5IHJlYWQgdGhlIFRQTWdlYW55IHBhcGVycywgbGlua2VkIGhlcmU6Jm5ic3A7PGEg
aHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL25jY2dyb3VwL1RQTUdlbmllIj5odHRwczovL2dpdGh1
Yi5jb20vbmNjZ3JvdXAvVFBNR2VuaWU8L2E+Jm5ic3A7aW4KIHdoaWNoIGEgbWFuLWluLXRoZS1t
aWRkbGUgYXR0YWNrIGNvdWxkIGJlIHVzZWQgdG8gc3Bvb2YgcGFja2V0cyB0byBhbmQgZnJvbSB0
aGUgVFBNLjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhl
bHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+Ckkgd2FzIGN1cmlvdXMgaWYgVGhlIEVTQVBJLCBTQVBJIG9yIHNvbWV0aGluZyBlbHNlIGNv
dWxkIGJlIHVzZWQgdG8gZW5jcnlwdCBjb21tdW5pY2F0aW9uIG92ZXIgdGhlIFNQSSBidXMgdG8g
bWl0aWdhdGUgdGhlc2UgdnVsbmVyYWJpbGl0aWVzLiZuYnNwOzwvZGl2Pgo8ZGl2IHN0eWxlPSJm
b250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+Cjxicj4KPC9kaXY+CjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KVGhhbmsgeW91IGZvciB5b3VyIHRp
bWUsPC9kaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0
aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4K
SmFtZXMgR2FsbGFnaGVyPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============8592443778276475628==--

