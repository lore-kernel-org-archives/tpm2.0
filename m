Content-Type: multipart/mixed; boundary="===============5538598399099070875=="
MIME-Version: 1.0
From: Rowan Moul <lists at rowan.moul.ca>
Subject: [tpm2] tpm2_createprimary question about unique field
Date: Wed, 12 Feb 2020 18:12:24 -0700
Message-ID: <D7FB7D3D-C65A-438A-9D1D-D3539E92ADDF@rowan.moul.ca>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5538598399099070875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFWhat is the purpose of appending 0x00 0x01 to the beginning of the=
 unique data? I'm sure it's just something obvious that I'm not seeing, but=
 I can't seem to figure it out despite looking over the code and reading th=
rough TCG documents.
All I can determine is that I get a "buffer_size: 4096 with offset: 46 are =
insufficient for object of size 51919" error if I don't have it. The object=
 size reported varies depending on data that I pass in. The amount of data =
is always 32 random bytes in my tests, but randomly generated. The object s=
ize seems far too large, which leads me to believe that something is readin=
g past the end of the file, although I didn't see any obvious issues in the=
 code that reads the files.

It seems like more explanation is needed on the man page about the required=
 format of this file, as the description given doesn't lead to the successf=
ul creation of a primary key unless you understand that you are supposed to=
 add that to the front of the file rather than it just being an example.

Thanks,

Rowan

--===============5538598399099070875==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPjxkaXYgZGlyPSJs
dHIiPjxmb250IGZhY2U9IkhlbHZldGljYSI+PHNwYW4gc3R5bGU9ImZvbnQtc3R5bGU6IG5vcm1h
bDsiPu+7vzxzcGFuIHN0eWxlPSItd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1dG87IGNvbG9y
OiByZ2IoMzYsIDQxLCA0Nik7Ij5XaGF0IGlzIHRoZSBwdXJwb3NlIG9mIGFwcGVuZGluZyAweDAw
IDB4MDEgdG8gdGhlJm5ic3A7PC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL3RwbTJfY3JlYXRlcHJpbWFyeS4x
Lm1kI2NyZWF0ZS1hLXByaW1hcnktb2JqZWN0LXRoYXQtZm9sbG93cy10aGUtZ3VpZGFuY2Utb2Yt
dGNnLXByb3Zpc2lvbmluZy1ndWlkZSIgc3R5bGU9Ii13ZWJraXQtdGV4dC1zaXplLWFkanVzdDog
YXV0bzsgY29sb3I6IHJnYig1LCA5OSwgMTkzKTsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDMs
IDEwMiwgMjE0KTsiPmJlZ2lubmluZyBvZiB0aGUgdW5pcXVlIGRhdGE8L3NwYW4+PC9hPjxzcGFu
IHN0eWxlPSItd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1dG87IGNvbG9yOiByZ2IoMzYsIDQx
LCA0Nik7Ij4/IEknbSBzdXJlIGl0J3MganVzdCBzb21ldGhpbmcgb2J2aW91cyB0aGF0IEknbSBu
b3Qgc2VlaW5nLCBidXQgSSBjYW4ndCBzZWVtIHRvIGZpZ3VyZSBpdCBvdXQgZGVzcGl0ZSBsb29r
aW5nIG92ZXIgdGhlIGNvZGUgYW5kIHJlYWRpbmcgdGhyb3VnaCBUQ0cgZG9jdW1lbnRzLjwvc3Bh
bj48L3NwYW4+PC9mb250PjxkaXYgZGlyPSJsdHIiPjxwIHN0eWxlPSItd2Via2l0LXRleHQtc2l6
ZS1hZGp1c3Q6IGF1dG87IG1hcmdpbi1ib3R0b206IDEycHQ7IGJhY2tncm91bmQtY29sb3I6IHdo
aXRlOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtc3R5bGU6IG5v
cm1hbDsiPjxmb250IGZhY2U9IkhlbHZldGljYSI+QWxsIEkmbmJzcDtjYW4mbmJzcDtkZXRlcm1p
bmUgaXMgdGhhdCBJIGdldCBhICJidWZmZXJfc2l6ZTogNDA5NiB3aXRoIG9mZnNldDogNDYgYXJl
IGluc3VmZmljaWVudCBmb3Igb2JqZWN0IG9mIHNpemUgNTE5MTkiIGVycm9yIGlmIEkgZG9uJ3Qg
aGF2ZSBpdC4gVGhlIG9iamVjdCBzaXplIHJlcG9ydGVkIHZhcmllcyBkZXBlbmRpbmcgb24gZGF0
YSB0aGF0IEkgcGFzcyBpbi4gVGhlIGFtb3VudCBvZiBkYXRhIGlzIGFsd2F5cyAzMiByYW5kb20g
Ynl0ZXMgaW4gbXkgdGVzdHMsIGJ1dCByYW5kb21seSBnZW5lcmF0ZWQuIFRoZSBvYmplY3Qgc2l6
ZSBzZWVtcyBmYXIgdG9vIGxhcmdlLCB3aGljaCBsZWFkcyBtZSB0byBiZWxpZXZlIHRoYXQgc29t
ZXRoaW5nIGlzIHJlYWRpbmcgcGFzdCB0aGUgZW5kIG9mIHRoZSBmaWxlLCBhbHRob3VnaCBJIGRp
ZG4ndCBzZWUgYW55IG9idmlvdXMgaXNzdWVzIGluIHRoZSBjb2RlIHRoYXQgcmVhZHMgdGhlIGZp
bGVzLjxvOnA+PC9vOnA+PC9mb250Pjwvc3Bhbj48L3A+PHAgc3R5bGU9Ii13ZWJraXQtdGV4dC1z
aXplLWFkanVzdDogYXV0bzsgbWFyZ2luLXJpZ2h0OiAwY207IG1hcmdpbi1ib3R0b206IDEycHQ7
IG1hcmdpbi1sZWZ0OiAwY207IGJhY2tncm91bmQtY29sb3I6IHdoaXRlOyBib3gtc2l6aW5nOiBi
b3JkZXItYm94OyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBub3JtYWw7IG9ycGhhbnM6IDI7IHdp
ZG93czogMjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDM2LCA0MSwgNDYpOyBmb250LXN0eWxl
OiBub3JtYWw7Ij48Zm9udCBmYWNlPSJIZWx2ZXRpY2EiPkl0IHNlZW1zIGxpa2UgbW9yZSBleHBs
YW5hdGlvbiBpcyBuZWVkZWQgb24gdGhlIG1hbiBwYWdlIGFib3V0IHRoZSByZXF1aXJlZCBmb3Jt
YXQgb2YgdGhpcyBmaWxlLCBhcyB0aGUgZGVzY3JpcHRpb24gZ2l2ZW4gZG9lc24ndCBsZWFkIHRv
IHRoZSBzdWNjZXNzZnVsIGNyZWF0aW9uIG9mIGEgcHJpbWFyeSBrZXkgdW5sZXNzIHlvdSB1bmRl
cnN0YW5kIHRoYXQgeW91IGFyZSBzdXBwb3NlZCB0byBhZGQgdGhhdCB0byB0aGUgZnJvbnQgb2Yg
dGhlIGZpbGUgcmF0aGVyIHRoYW4gaXQganVzdCBiZWluZyBhbiBleGFtcGxlLjwvZm9udD48L3Nw
YW4+PC9wPjxwIHN0eWxlPSItd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1dG87IG1hcmdpbi1i
b3R0b206IDEycHQ7IGJhY2tncm91bmQtY29sb3I6IHdoaXRlOyI+PGZvbnQgZmFjZT0iSGVsdmV0
aWNhIj48c3BhbiBzdHlsZT0iZm9udC1zdHlsZTogbm9ybWFsOyI+VGhhbmtzLDwvc3Bhbj48L2Zv
bnQ+PC9wPjxmb250IGZhY2U9IkhlbHZldGljYSI+PHNwYW4gc3R5bGU9ImZvbnQtc3R5bGU6IG5v
cm1hbDsiPlJvd2FuPC9zcGFuPjwvZm9udD48L2Rpdj48L2Rpdj48L2JvZHk+PC9odG1sPg==
--===============5538598399099070875==--

