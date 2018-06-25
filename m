Content-Type: multipart/mixed; boundary="===============3114714982689437422=="
MIME-Version: 1.0
From: Tianyu Qi <tqi100 at syr.edu>
Subject: [tpm2] What is the exact meaning of "parameters" in cpHash?
Date: Mon, 25 Jun 2018 17:06:30 +0000
Message-ID: <BLUPR01MB227607224352A2C8DCC23DE854A0@BLUPR01MB227.prod.exchangelabs.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3114714982689437422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,


I am writing implementation of TPM2_Load. When writing cpHash in computing =
HMAC, I saw cpHash description in TPM-Rev-2.0-Part-1-Architecture-01.38 men=
tioned there is a "parameters" parameter at last, which represents remainin=
g command parameters. Since the cpHash will use commandCode as the first pa=
rameter, does this "parameters" means every parameter in the command? For e=
xample, in TPM2_Load, I need to add tag, commandSize, parentHandle, inPubli=
c and inPrivate? If so, should I add the authorization structure after pare=
ntHandle?


Regards and thanks,


Tianyu Qi

(+1) 315 278-2725

EECS Department, Syracuse University

--===============3114714982689437422==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD1pc28tODg1OS0xIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIiBzdHls
ZT0iZGlzcGxheTpub25lOyI+PCEtLSBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30g
LS0+PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgaWQ9ImRpdnRhZ2RlZmF1
bHR3cmFwcGVyIiBzdHlsZT0iZm9udC1zaXplOjEycHQ7Y29sb3I6IzAwMDAwMDtmb250LWZhbWls
eTpDYWxpYnJpLEhlbHZldGljYSxzYW5zLXNlcmlmOyIgZGlyPSJsdHIiPgo8cCBzdHlsZT0ibWFy
Z2luLXRvcDowO21hcmdpbi1ib3R0b206MCI+SGksJm5ic3A7PC9wPgo8cCBzdHlsZT0ibWFyZ2lu
LXRvcDowO21hcmdpbi1ib3R0b206MCI+PGJyPgo8L3A+CjxwIHN0eWxlPSJtYXJnaW4tdG9wOjA7
bWFyZ2luLWJvdHRvbTowIj5JIGFtIHdyaXRpbmcgaW1wbGVtZW50YXRpb24gb2YgVFBNMl9Mb2Fk
LiZuYnNwO1doZW4gd3JpdGluZyBjcEhhc2gmbmJzcDtpbiBjb21wdXRpbmcgSE1BQywmbmJzcDtJ
IHNhdyBjcEhhc2ggZGVzY3JpcHRpb24gaW4mbmJzcDs8c3Bhbj5UUE0tUmV2LTIuMC1QYXJ0LTEt
QXJjaGl0ZWN0dXJlLTAxLjM4IG1lbnRpb25lZCZuYnNwO3RoZXJlIGlzIGEgJnF1b3Q7cGFyYW1l
dGVycyZxdW90OyBwYXJhbWV0ZXIgYXQgbGFzdCwgd2hpY2ggcmVwcmVzZW50cwogcmVtYWluaW5n
IGNvbW1hbmQgcGFyYW1ldGVycy4gU2luY2UgdGhlIGNwSGFzaCB3aWxsIHVzZSBjb21tYW5kQ29k
ZSBhcyB0aGUgZmlyc3QgcGFyYW1ldGVyLCBkb2VzIHRoaXMgJnF1b3Q7cGFyYW1ldGVycyZxdW90
OyBtZWFucyBldmVyeSBwYXJhbWV0ZXIgaW4gdGhlIGNvbW1hbmQ/IEZvciBleGFtcGxlLCBpbiBU
UE0yX0xvYWQsIEkgbmVlZCB0byBhZGQgdGFnLCBjb21tYW5kU2l6ZSwgcGFyZW50SGFuZGxlLCBp
blB1YmxpYyZuYnNwO2FuZCBpblByaXZhdGU/IElmIHNvLAogc2hvdWxkIEkgYWRkIHRoZSBhdXRo
b3JpemF0aW9uIHN0cnVjdHVyZSBhZnRlciBwYXJlbnRIYW5kbGU/PC9zcGFuPjwvcD4KPHAgc3R5
bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjAiPjxzcGFuPjxicj4KPC9zcGFuPjwvcD4K
PHAgc3R5bGU9Im1hcmdpbi10b3A6MDttYXJnaW4tYm90dG9tOjAiPjxzcGFuPlJlZ2FyZHMgYW5k
IHRoYW5rcywmbmJzcDs8L3NwYW4+PC9wPgo8cCBzdHlsZT0ibWFyZ2luLXRvcDowO21hcmdpbi1i
b3R0b206MCI+PGJyPgo8L3A+CjxkaXYgaWQ9IlNpZ25hdHVyZSI+CjxkaXYgaWQ9ImRpdnRhZ2Rl
ZmF1bHR3cmFwcGVyIiBkaXI9Imx0ciIgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJn
YigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZiwg
RW1vamlGb250LCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkg
RW1vamkmcXVvdDssIE5vdG9Db2xvckVtb2ppLCAmcXVvdDtTZWdvZSBVSSBTeW1ib2wmcXVvdDss
ICZxdW90O0FuZHJvaWQgRW1vamkmcXVvdDssIEVtb2ppU3ltYm9sczsiPgo8cD5UaWFueXUgUWk8
L3A+CjxwPigmIzQzOzEpIDMxNSAyNzgtMjcyNTwvcD4KPHA+RUVDUyBEZXBhcnRtZW50LCBTeXJh
Y3VzZSBVbml2ZXJzaXR5PC9wPgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4K

--===============3114714982689437422==--

