Content-Type: multipart/mixed; boundary="===============3610715952200246039=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] Re: abrmd crashing - how to debug? - dbus logs?
Date: Tue, 16 Mar 2021 10:41:59 -0500
Message-ID: <OF919BF68A.8F376E7D-ON0025869A.0055CAA8-8525869A.00563DE3@notes.na.collabserv.com>
In-Reply-To: 755f9025-b569-864f-c2c4-a33c13991b83@gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3610715952200246039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


This fixes the startup problem, where abrmd expected one handle and
receives two.

It does not fix the crash.

On a loop of pcrread, it fails after 695, 324, 951, and 26 passes.  This
looks random to me, not some hard limit.

--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)




From:	Tadeusz Struk <tstruk(a)gmail.com>
To:	Kenneth Goldman <kgoldman(a)us.ibm.com>
Cc:	tpm2(a)lists.01.org
Date:	03/15/2021 10:15 PM
Subject:	[EXTERNAL] Re: [tpm2] Re: abrmd crashing - how to debug? - dbus
            logs?



On 3/12/21 6:25 AM, Kenneth Goldman wrote:
>> CRITICAL **: 10:43:39.780: CreateConnection expected to return 1
>> handles, received 2
>>
>> what might happen is that for whatever reason it leaks one of this dbus
>> proxy objects on every pcr_read and finally runs out of them.
>> It might be that it is very WSL specific.
>
> I don't think it's a hard limit. =C2=A0As I said, it runs longer after
> debug is turned on and longer with a sleep. =C2=A0The actual failure
> count varies a lot from run to run.

Ken,
Could you try if this patch fixes the problem for you:
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__patch-2Ddiff.githubu=
sercontent.com_raw_tpm2-2Dsoftware_tpm2-2Dabrmd_pull_770.patch&d=3DDwID-g&c=
=3Djf_iaSHvJObTbx-siA1ZOg&r=3DDZCVG43VcL8GTneMZb8k8lEwb-O1GZktFfre1-mlmiA&m=
=3DNrt6cxuFCHXflg-6IA0GtxS67OeMf3npnorQvzu2PoE&s=3DjyIln4AEW6cPuvpeUmCLxuOq=
199pc--dVTj9AZYwcds&e=3D


Thanks,
Tadeusz




--===============3610715952200246039==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+VGhpcyBmaXhlcyB0aGUgc3RhcnR1cCBwcm9i
bGVtLCB3aGVyZSBhYnJtZCBleHBlY3RlZCBvbmUgaGFuZGxlIGFuZCByZWNlaXZlcyB0d28uPC9m
b250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiI+SXQgZG9lcyBub3QgZml4IHRoZSBjcmFzaC48L2Zv
bnQ+PGJyPjxicj48Zm9udCBzaXplPSIyIj5PbiBhIGxvb3Agb2YgcGNycmVhZCwgaXQgZmFpbHMg
YWZ0ZXIgNjk1LCAzMjQsIDk1MSwgYW5kIDI2IHBhc3Nlcy4gIFRoaXMgbG9va3MgcmFuZG9tIHRv
IG1lLCBub3Qgc29tZSBoYXJkIGxpbWl0LjwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+PGJyPi0t
PGJyPktlbiBHb2xkbWFuICAga2dvbGRtYW5AdXMuaWJtLmNvbSAgIDxicj45MTQtOTQ1LTI0MTUg
KDg2Mi0yNDE1KTxicj48L2ZvbnQ+PGJyPjxicj48aW1nIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIg
c3JjPSJjaWQ6MV9fPThGQkIwQzA5REZDNjRDMzg4ZjllOGE5M2RmOTM4NjkwOTE4YzhGQkAiIGJv
cmRlcj0iMCIgYWx0PSJJbmFjdGl2ZSBoaWRlIGRldGFpbHMgZm9yIFRhZGV1c3ogU3RydWsgLS0t
MDMvMTUvMjAyMSAxMDoxNTo0MiBQTS0tLU9uIDMvMTIvMjEgNjoyNSBBTSwgS2VubmV0aCBHb2xk
bWFuIHdyb3RlOiAmZ3Q7Jmd0OyBDUklUSUNBTCAqKjogIj48Zm9udCBzaXplPSIyIiBjb2xvcj0i
IzQyNDI4MiI+VGFkZXVzeiBTdHJ1ayAtLS0wMy8xNS8yMDIxIDEwOjE1OjQyIFBNLS0tT24gMy8x
Mi8yMSA2OjI1IEFNLCBLZW5uZXRoIEdvbGRtYW4gd3JvdGU6ICZndDsmZ3Q7IENSSVRJQ0FMICoq
OiAxMDo0MzozOS43ODA6IENyZWF0ZUNvbm5lY3Rpb24gZXhwZWN0ZWQgdDwvZm9udD48YnI+PGJy
Pjxmb250IHNpemU9IjIiIGNvbG9yPSIjNUY1RjVGIj5Gcm9tOiAgICAgICAgPC9mb250Pjxmb250
IHNpemU9IjIiPlRhZGV1c3ogU3RydWsgJmx0O3RzdHJ1a0BnbWFpbC5jb20mZ3Q7PC9mb250Pjxi
cj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+VG86ICAgICAgICA8L2ZvbnQ+PGZvbnQg
c2l6ZT0iMiI+S2VubmV0aCBHb2xkbWFuICZsdDtrZ29sZG1hbkB1cy5pYm0uY29tJmd0OzwvZm9u
dD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPkNjOiAgICAgICAgPC9mb250Pjxm
b250IHNpemU9IjIiPnRwbTJAbGlzdHMuMDEub3JnPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBj
b2xvcj0iIzVGNUY1RiI+RGF0ZTogICAgICAgIDwvZm9udD48Zm9udCBzaXplPSIyIj4wMy8xNS8y
MDIxIDEwOjE1IFBNPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+U3Vi
amVjdDogICAgICAgIDwvZm9udD48Zm9udCBzaXplPSIyIj5bRVhURVJOQUxdIFJlOiBbdHBtMl0g
UmU6IGFicm1kIGNyYXNoaW5nIC0gaG93IHRvIGRlYnVnPyAtIGRidXMgbG9ncz88L2ZvbnQ+PGJy
PjxociB3aWR0aD0iMTAwJSIgc2l6ZT0iMiIgYWxpZ249ImxlZnQiIG5vc2hhZGUgc3R5bGU9ImNv
bG9yOiM4MDkxQTU7ICI+PGJyPjxicj48YnI+PHR0Pjxmb250IHNpemU9IjIiPk9uIDMvMTIvMjEg
NjoyNSBBTSwgS2VubmV0aCBHb2xkbWFuIHdyb3RlOjxicj4mZ3Q7Jmd0OyBDUklUSUNBTCAqKjog
MTA6NDM6MzkuNzgwOiBDcmVhdGVDb25uZWN0aW9uIGV4cGVjdGVkIHRvIHJldHVybiAxPGJyPiZn
dDsmZ3Q7IGhhbmRsZXMsIHJlY2VpdmVkIDI8YnI+Jmd0OyZndDs8YnI+Jmd0OyZndDsgd2hhdCBt
aWdodCBoYXBwZW4gaXMgdGhhdCBmb3Igd2hhdGV2ZXIgcmVhc29uIGl0IGxlYWtzIG9uZSBvZiB0
aGlzIGRidXM8YnI+Jmd0OyZndDsgcHJveHkgb2JqZWN0cyBvbiBldmVyeSBwY3JfcmVhZCBhbmQg
ZmluYWxseSBydW5zIG91dCBvZiB0aGVtLjxicj4mZ3Q7Jmd0OyBJdCBtaWdodCBiZSB0aGF0IGl0
IGlzIHZlcnkgV1NMIHNwZWNpZmljLjxicj4mZ3Q7IDxicj4mZ3Q7IEkgZG9uJ3QgdGhpbmsgaXQn
cyBhIGhhcmQgbGltaXQuIKBBcyBJIHNhaWQsIGl0IHJ1bnMgbG9uZ2VyIGFmdGVyPGJyPiZndDsg
ZGVidWcgaXMgdHVybmVkIG9uIGFuZCBsb25nZXIgd2l0aCBhIHNsZWVwLiCgVGhlIGFjdHVhbCBm
YWlsdXJlPGJyPiZndDsgY291bnQgdmFyaWVzIGEgbG90IGZyb20gcnVuIHRvIHJ1bi48YnI+PGJy
Pktlbiw8YnI+Q291bGQgeW91IHRyeSBpZiB0aGlzIHBhdGNoIGZpeGVzIHRoZSBwcm9ibGVtIGZv
ciB5b3U6PGJyPjwvZm9udD48L3R0Pjx0dD48Zm9udCBzaXplPSIyIj48YSBocmVmPSJodHRwczov
L3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX3BhdGNoLTJEZGlm
Zi5naXRodWJ1c2VyY29udGVudC5jb21fcmF3X3RwbTItMkRzb2Z0d2FyZV90cG0yLTJEYWJybWRf
cHVsbF83NzAucGF0Y2gmZD1Ed0lELWcmYz1qZl9pYVNIdkpPYlRieC1zaUExWk9nJnI9RFpDVkc0
M1ZjTDhHVG5lTVpiOGs4bEV3Yi1PMUdaa3RGZnJlMS1tbG1pQSZtPU5ydDZjeHVGQ0hYZmxnLTZJ
QTBHdHhTNjdPZU1mM25wbm9yUXZ6dTJQb0Umcz1qeUlsbjRBRVc2Y1B1dnBlVW1DTHh1T3ExOTlw
Yy0tZFZUajlBWll3Y2RzJmU9Ij5odHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIv
dXJsP3U9aHR0cHMtM0FfX3BhdGNoLTJEZGlmZi5naXRodWJ1c2VyY29udGVudC5jb21fcmF3X3Rw
bTItMkRzb2Z0d2FyZV90cG0yLTJEYWJybWRfcHVsbF83NzAucGF0Y2gmYW1wO2Q9RHdJRC1nJmFt
cDtjPWpmX2lhU0h2Sk9iVGJ4LXNpQTFaT2cmYW1wO3I9RFpDVkc0M1ZjTDhHVG5lTVpiOGs4bEV3
Yi1PMUdaa3RGZnJlMS1tbG1pQSZhbXA7bT1OcnQ2Y3h1RkNIWGZsZy02SUEwR3R4UzY3T2VNZjNu
cG5vclF2enUyUG9FJmFtcDtzPWp5SWxuNEFFVzZjUHV2cGVVbUNMeHVPcTE5OXBjLS1kVlRqOUFa
WXdjZHMmYW1wO2U9PC9hPjwvZm9udD48L3R0Pjx0dD48Zm9udCBzaXplPSIyIj4mbmJzcDs8YnI+
PGJyPlRoYW5rcyw8YnI+VGFkZXVzejxicj48YnI+PC9mb250PjwvdHQ+PGJyPjxicj48QlI+Cjwv
Ym9keT48L2h0bWw+Cg==

--===============3610715952200246039==
Content-Type: image/gif
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="graycol.gif"

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7
--===============3610715952200246039==--

