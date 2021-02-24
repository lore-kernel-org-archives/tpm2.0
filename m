Content-Type: multipart/mixed; boundary="===============3862037395224301137=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: Error on service tpm2-abrmd start - WARNING **:
 16:41:13.089: tcti_conf before: "(null)"
Date: Wed, 24 Feb 2021 16:15:01 -0500
Message-ID: <OF25443825.9823765F-ON00258686.0074602C-85258686.0074BB58@notes.na.collabserv.com>
In-Reply-To: SN6PR11MB3437854834FE46BC9F6FD8D9B89F9@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3862037395224301137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




From:	"Roberts, William C" <william.c.roberts(a)intel.com>
To:	Kenneth Goldman <kgoldman(a)us.ibm.com>
Cc:	"tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
Date:	02/24/2021 08:44 AM
Subject:	[EXTERNAL] [tpm2] Re: Error on service tpm2-abrmd start



QRYFpfptBannerEnd
      1. Yes you can start tpme-abrmd like so:
      tpm2-abrmd --tcti=3Dmssim

      mssim will connect to the ibmtpm simulator, or you can use swtpm to
      connect to stefanberger's swtpm.

      When I try this, I get:

      # tpm2-abrmd --tcti=3Dmssim --allow-root

** (process:2552): WARNING **: 16:41:13.089: tcti_conf before: "(null)"

** (tpm2-abrmd:2552): WARNING **: 16:41:13.090: tcti_conf after: "mssim"

I don't know where tcti_conf is. Perhaps I didn't install it. Advice?

[Bill] =E2=80=8BI get the same warnings; I think the logging is just overly=
 pedantic
and can probably be silenced.

Thanks.  That's sort of a bug.  A warning in all caps pointing to a
mysterious file lacking a path.  No obvious way to fix it.



--===============3862037395224301137==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGltZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHNyYz0iY2lkOjFfXz04
RkJCMEMxNURGRTdFNkJDOGY5ZThhOTNkZjkzODY5MDkxOGM4RkJAIiBib3JkZXI9IjAiIGFsdD0i
SW5hY3RpdmUgaGlkZSBkZXRhaWxzIGZvciAmcXVvdDtSb2JlcnRzLCBXaWxsaWFtIEMmcXVvdDsg
LS0tMDIvMjQvMjAyMSAwODo0NDo0NCBBTS0tLU9XQSBzdWNrcyBhdCBpbmxpbmUgcmVwbGllcywg
YnV0IEknbGwgZ2l2ZSBpdCBteSBiZXMiPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNDI0MjgyIj4m
cXVvdDtSb2JlcnRzLCBXaWxsaWFtIEMmcXVvdDsgLS0tMDIvMjQvMjAyMSAwODo0NDo0NCBBTS0t
LU9XQSBzdWNrcyBhdCBpbmxpbmUgcmVwbGllcywgYnV0IEknbGwgZ2l2ZSBpdCBteSBiZXN0IHNo
b3QuLi4gWmpRY21RUllGcGZwdEJhbm5lckVuZDwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIi
IGNvbG9yPSIjNUY1RjVGIj5Gcm9tOiAgICAgICAgPC9mb250Pjxmb250IHNpemU9IjIiPiZxdW90
O1JvYmVydHMsIFdpbGxpYW0gQyZxdW90OyAmbHQ7d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
Jmd0OzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPlRvOiAgICAgICAg
PC9mb250Pjxmb250IHNpemU9IjIiPktlbm5ldGggR29sZG1hbiAmbHQ7a2dvbGRtYW5AdXMuaWJt
LmNvbSZndDs8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNUY1RjVGIj5DYzogICAg
ICAgIDwvZm9udD48Zm9udCBzaXplPSIyIj4mcXVvdDt0cG0yQGxpc3RzLjAxLm9yZyZxdW90OyAm
bHQ7dHBtMkBsaXN0cy4wMS5vcmcmZ3Q7PC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0i
IzVGNUY1RiI+RGF0ZTogICAgICAgIDwvZm9udD48Zm9udCBzaXplPSIyIj4wMi8yNC8yMDIxIDA4
OjQ0IEFNPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+U3ViamVjdDog
ICAgICAgIDwvZm9udD48Zm9udCBzaXplPSIyIj5bRVhURVJOQUxdIFt0cG0yXSBSZTogRXJyb3Ig
b24gc2VydmljZSB0cG0yLWFicm1kIHN0YXJ0PC9mb250Pjxicj48aHIgd2lkdGg9IjEwMCUiIHNp
emU9IjIiIGFsaWduPSJsZWZ0IiBub3NoYWRlIHN0eWxlPSJjb2xvcjojODA5MUE1OyAiPjxicj48
YnI+PGJyPjxmb250IHNpemU9IjEiIGNvbG9yPSIjRkZGRkZGIj5RUllGcGZwdEJhbm5lckVuZDwv
Zm9udD48dWw+PHVsPjxmb250IHNpemU9IjIiPjEuIDwvZm9udD48Zm9udCBmYWNlPSJDYWxpYnJp
Ij5ZZXMgeW91IGNhbiBzdGFydCB0cG1lLWFicm1kIGxpa2Ugc286PGJyPnRwbTItYWJybWQgLS10
Y3RpPW1zc2ltPGJyPjxicj5tc3NpbSB3aWxsIGNvbm5lY3QgdG8gdGhlIGlibXRwbSBzaW11bGF0
b3IsIG9yIHlvdSBjYW4gdXNlIHN3dHBtIHRvIGNvbm5lY3QgdG8gc3RlZmFuYmVyZ2VyJ3Mgc3d0
cG0uPC9mb250Pjxicj48Yj48Zm9udCBjb2xvcj0iIzAwOUY4MiI+PGJyPldoZW4gSSB0cnkgdGhp
cywgSSBnZXQ6PC9mb250PjwvYj48YnI+PGI+PGZvbnQgY29sb3I9IiMwMDlGODIiPjxicj4jPC9m
b250PjwvYj48Yj48Zm9udCBjb2xvcj0iIzNGODAzRiIgZmFjZT0iQ2FsaWJyaSI+IHRwbTItYWJy
bWQgLS10Y3RpPW1zc2ltIC0tYWxsb3ctcm9vdDwvZm9udD48L2I+PC91bD48L3VsPjxiPjxmb250
IGNvbG9yPSIjM0Y4MDNGIiBmYWNlPSJDYWxpYnJpIj48YnI+KiogKHByb2Nlc3M6MjU1Mik6IFdB
Uk5JTkcgKio6IDE2OjQxOjEzLjA4OTogdGN0aV9jb25mIGJlZm9yZTogJnF1b3Q7KG51bGwpJnF1
b3Q7PC9mb250PjwvYj48YnI+PGI+PGZvbnQgY29sb3I9IiMzRjgwM0YiIGZhY2U9IkNhbGlicmki
Pjxicj4qKiAodHBtMi1hYnJtZDoyNTUyKTogV0FSTklORyAqKjogMTY6NDE6MTMuMDkwOiB0Y3Rp
X2NvbmYgYWZ0ZXI6ICZxdW90O21zc2ltJnF1b3Q7PC9mb250PjwvYj48YnI+PGI+PGZvbnQgY29s
b3I9IiMwMDlGODIiPjxicj5JIGRvbid0IGtub3cgd2hlcmUgdGN0aV9jb25mIGlzLiBQZXJoYXBz
IEkgZGlkbid0IGluc3RhbGwgaXQuIEFkdmljZT88L2ZvbnQ+PC9iPjxmb250IGZhY2U9IkNhbGli
cmkiPjxicj48L2ZvbnQ+PGZvbnQgY29sb3I9IiNDODI2MTMiIGZhY2U9IkNhbGlicmkiPjxicj5b
QmlsbF0g4oCLSSBnZXQgdGhlIHNhbWUgd2FybmluZ3M7IEkgdGhpbmsgdGhlIGxvZ2dpbmcgaXMg
anVzdCBvdmVybHkgcGVkYW50aWMgYW5kIGNhbiBwcm9iYWJseSBiZSBzaWxlbmNlZC4gPC9mb250
Pjxicj48YnI+PGI+PGZvbnQgY29sb3I9IiMwMDlGODIiPlRoYW5rcy4gIFRoYXQncyBzb3J0IG9m
IGEgYnVnLiAgQSB3YXJuaW5nIGluIGFsbCBjYXBzIHBvaW50aW5nIHRvIGEgbXlzdGVyaW91cyA8
L2ZvbnQ+PC9iPjxiPjxmb250IGNvbG9yPSIjMDA5RjgyIj5maWxlIGxhY2tpbmcgYSBwYXRoLiAg
Tm8gb2J2aW91cyB3YXkgdG8gZml4IGl0LjwvZm9udD48L2I+PGZvbnQgZmFjZT0iQ2FsaWJyaSI+
PGJyPjxicj48L2ZvbnQ+PGJyPjxCUj4NCjwvYm9keT48L2h0bWw+DQo=

--===============3862037395224301137==
Content-Type: image/gif
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="graycol.gif"

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--===============3862037395224301137==--

