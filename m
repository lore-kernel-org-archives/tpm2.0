Content-Type: multipart/mixed; boundary="===============5485453163055204967=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Some Errors
Date: Fri, 10 Jan 2020 12:47:36 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163C47D45@EXCH2010B.sit.fraunhofer.de>
In-Reply-To: trinity-6f76fb4e-d2fe-46e1-b67b-2526b25682ba-1578659809854@3c-app-1and1-bs01
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5485453163055204967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

That seems to not have been updated correctly.

Should probably be:
tpm2_evictcontrol -c ak.ctx 0x81010002
or
tpm2_evictcontrol -C o -c ak.ctx 0x81010002

Maybe you could try this and if it works, make a PR with the update to the =
tools project.

Thanks,
Andreas

________________________________
From: Alexander Lieb [alexander.lieb(a)online.de]
Sent: Friday, January 10, 2020 13:36
To: tpm2(a)lists.01.org
Subject: [tpm2] Some Errors

Hi,

I tried to make my ak persistent, usign the following readme:

https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_createak.1=
.md

The first two commands work fine, the last one results into:

tpm2_evictcontrol -c 0x81010002 -o ak.ctx

WARNING:esys:src/tss2-esys/api/Esys_ReadPublic.c:320:Esys_ReadPublic_Finish=
() Received TPM Error
ERROR:esys:src/tss2-esys/esys_tr.c:231:Esys_TR_FromTPMPublic_Finish() Error=
 ReadPublic ErrorCode (0x0000018b)
ERROR:esys:src/tss2-esys/esys_tr.c:321:Esys_TR_FromTPMPublic() Error TR Fro=
mTPMPublic ErrorCode (0x0000018b)
ERROR: Esys_TR_FromTPMPublic(0x18B) - tpm:handle(1):the handle is not corre=
ct for the use
ERROR:esys:src/tss2-esys/esys_tr.c:357:Esys_TR_Close() Error: Esys handle d=
oes not exist (70018).
ERROR: Esys_TR_Close(0x70018) - esapi:0x18
ERROR: Unable to run tpm2_evictcontrol


I am not sure, whether I need to run any cmd to allocate the handle, or if =
it is necessary to be in a special mode or sth. Can you help me with this i=
ssue? Thanks a lot.

Best regards


--===============5485453163055204967==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIx
IiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9t
YTtjb2xvcjogIzAwMDAwMDtmb250LXNpemU6IDEwcHQ7Ij4KPGRpdj5UaGF0IHNlZW1zIHRvIG5v
dCBoYXZlIGJlZW4gdXBkYXRlZCBjb3JyZWN0bHkuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRp
dj5TaG91bGQgcHJvYmFibHkgYmU6PC9kaXY+CjxkaXY+dHBtMl9ldmljdGNvbnRyb2wgLWMgYWsu
Y3R4IDB4ODEwMTAwMDI8L2Rpdj4KPGRpdj5vcjxicj4KPC9kaXY+CjxkaXY+CjxkaXY+dHBtMl9l
dmljdGNvbnRyb2wgLUMgbyAtYyBhay5jdHggMHg4MTAxMDAwMjwvZGl2Pgo8ZGl2Pjxicj4KPC9k
aXY+CjxkaXY+TWF5YmUgeW91IGNvdWxkIHRyeSB0aGlzIGFuZCBpZiBpdCB3b3JrcywgbWFrZSBh
IFBSIHdpdGggdGhlIHVwZGF0ZSB0byB0aGUgdG9vbHMgcHJvamVjdC48L2Rpdj4KPGRpdj48YnI+
CjwvZGl2Pgo8ZGl2PlRoYW5rcyw8L2Rpdj4KPGRpdj5BbmRyZWFzPGJyPgo8L2Rpdj4KPGRpdj48
YnI+CjwvZGl2Pgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IFRpbWVzIE5ldyBSb21h
bjsgY29sb3I6ICMwMDAwMDA7IGZvbnQtc2l6ZTogMTZweCI+CjxociB0YWJpbmRleD0iLTEiPgo8
ZGl2IGlkPSJkaXZScEYzOTkyMDciIHN0eWxlPSJkaXJlY3Rpb246IGx0cjsiPjxmb250IHNpemU9
IjIiIGZhY2U9IlRhaG9tYSIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBBbGV4YW5kZXIg
TGllYiBbYWxleGFuZGVyLmxpZWJAb25saW5lLmRlXTxicj4KPGI+U2VudDo8L2I+IEZyaWRheSwg
SmFudWFyeSAxMCwgMjAyMCAxMzozNjxicj4KPGI+VG86PC9iPiB0cG0yQGxpc3RzLjAxLm9yZzxi
cj4KPGI+U3ViamVjdDo8L2I+IFt0cG0yXSBTb21lIEVycm9yczxicj4KPC9mb250Pjxicj4KPC9k
aXY+CjxkaXY+PC9kaXY+CjxkaXY+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OlZlcmRhbmE7IGZv
bnQtc2l6ZToxMi4wcHgiPgo8ZGl2PkhpLDwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2Pkkg
dHJpZWQgdG8gbWFrZSBteSBhayBwZXJzaXN0ZW50LCB1c2lnbiB0aGUgZm9sbG93aW5nIHJlYWRt
ZTo8L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvbWFzdGVyL21hbi90cG0yX2NyZWF0ZWFr
LjEubWQiIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPmh0dHBzOi8v
Z2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL3RwbTJf
Y3JlYXRlYWsuMS5tZDwvYT48L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj5UaGUgZmlyc3Qg
dHdvIGNvbW1hbmRzIHdvcmsgZmluZSwgdGhlIGxhc3Qgb25lIHJlc3VsdHMgaW50bzo8L2Rpdj4K
PGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj50cG0yX2V2aWN0Y29udHJvbCAtYyAweDgxMDEwMDAyIC1v
IGFrLmN0eDwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2Pgo8ZGl2Pgo8ZGl2PldBUk5JTkc6
ZXN5czpzcmMvdHNzMi1lc3lzL2FwaS9Fc3lzX1JlYWRQdWJsaWMuYzozMjA6RXN5c19SZWFkUHVi
bGljX0ZpbmlzaCgpIFJlY2VpdmVkIFRQTSBFcnJvcjxicj4KRVJST1I6ZXN5czpzcmMvdHNzMi1l
c3lzL2VzeXNfdHIuYzoyMzE6RXN5c19UUl9Gcm9tVFBNUHVibGljX0ZpbmlzaCgpIEVycm9yIFJl
YWRQdWJsaWMgRXJyb3JDb2RlICgweDAwMDAwMThiKTxicj4KRVJST1I6ZXN5czpzcmMvdHNzMi1l
c3lzL2VzeXNfdHIuYzozMjE6RXN5c19UUl9Gcm9tVFBNUHVibGljKCkgRXJyb3IgVFIgRnJvbVRQ
TVB1YmxpYyBFcnJvckNvZGUgKDB4MDAwMDAxOGIpPGJyPgpFUlJPUjogRXN5c19UUl9Gcm9tVFBN
UHVibGljKDB4MThCKSAtIHRwbTpoYW5kbGUoMSk6dGhlIGhhbmRsZSBpcyBub3QgY29ycmVjdCBm
b3IgdGhlIHVzZTxicj4KRVJST1I6ZXN5czpzcmMvdHNzMi1lc3lzL2VzeXNfdHIuYzozNTc6RXN5
c19UUl9DbG9zZSgpIEVycm9yOiBFc3lzIGhhbmRsZSBkb2VzIG5vdCBleGlzdCAoNzAwMTgpLjxi
cj4KRVJST1I6IEVzeXNfVFJfQ2xvc2UoMHg3MDAxOCkgLSBlc2FwaToweDE4PGJyPgpFUlJPUjog
VW5hYmxlIHRvIHJ1biB0cG0yX2V2aWN0Y29udHJvbDwvZGl2Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8
ZGl2PiZuYnNwOzwvZGl2Pgo8ZGl2PkkgYW0gbm90IHN1cmUsIHdoZXRoZXIgSSBuZWVkIHRvIHJ1
biBhbnkgY21kIHRvIGFsbG9jYXRlIHRoZSBoYW5kbGUsIG9yIGlmIGl0IGlzIG5lY2Vzc2FyeSB0
byBiZSBpbiBhIHNwZWNpYWwgbW9kZSBvciBzdGguIENhbiB5b3UgaGVscCBtZSB3aXRoIHRoaXMg
aXNzdWU/IFRoYW5rcyBhIGxvdC48L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPGRpdj5CZXN0IHJl
Z2FyZHM8L2Rpdj4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+
CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============5485453163055204967==--

