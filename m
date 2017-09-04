Content-Type: multipart/mixed; boundary="===============3127599908848276104=="
MIME-Version: 1.0
From: Haydon Cardew <hvcardew at googlemail.com>
Subject: [tpm2] Issue Solved/Trusted Boot
Date: Mon, 04 Sep 2017 10:27:16 +0100
Message-ID: <CAHM15e3xAx4wz+t_X4-SJO9N2JVqF7KHbuFASdJJHjYr2TbaEg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3127599908848276104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,



Following a discussion on 01org/tpm2-tools #444 [https://github.com/01org/
tpm2-tools/issues/444] I wanted to post an update on what the issue was.



For some reason I had =E2=80=98tpm2-resourcemgr=E2=80=99 loaded up on my sy=
stem which
stopped =E2=80=98tpm2-abrmd=E2=80=99 from loading. I also assumed that this=
 previously
loaded module was the process required. However, upon stopping
=E2=80=98tpm2-resourcemgr=E2=80=99 and loading =E2=80=98tpm2-abrmd=E2=80=99=
 I now have a tpm2 passing 25 of
the tests provided with tpm2-tools (I also believe the 2 failed tests are
the already known issues with real-world tpm2).



Wanted to say a massive thanks to those of you who replied/helped me!
Really nice community.



If I could ask one further thing (I believe this is the correct place to
post this?), I=E2=80=99m looking at setting up a trusted boot system on my =
current
setup (Ubuntu 16.04, kernel 4.4) to be used with the now working tpm2. I
have previously done this with tpm1.2 but the process seems rather
different this time, if anyone can point me to any good resources/tutorials
that would be a massive help.



Thanks,


Haydon

--===============3127599908848276104==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9ImZvbnQtc2l6ZToxMi44
cHgiPkhpLDwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+
wqA8L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPkZvbGxv
d2luZyBhIGRpc2N1c3Npb24gb24gMDFvcmcvdHBtMi10b29scyAjNDQ0IFs8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vMDFvcmcvdHBtMi10b29scy9pc3N1ZXMvNDQ0IiB0YXJnZXQ9Il9ibGFu
ayI+aHR0cHM6Ly9naXRodWIuY29tLzAxb3JnLzx3YnI+dHBtMi10b29scy9pc3N1ZXMvNDQ0PC9h
Pl0gSSB3YW50ZWQgdG8gcG9zdCBhbiB1cGRhdGUgb24gd2hhdCB0aGUgaXNzdWUgd2FzLjwvcD48
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+wqA8L3A+PHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPjxzcGFuIGxhbmc9IkVOLUdC
IiBzdHlsZT0iZm9udC1zaXplOjEwcHQ7Zm9udC1mYW1pbHk6QXJpYWwsc2Fucy1zZXJpZiI+Rm9y
IHNvbWUgcmVhc29uIEkgaGFkIOKAmHRwbTItcmVzb3VyY2VtZ3LigJkgbG9hZGVkIHVwIG9uIG15
IHN5c3RlbSB3aGljaCBzdG9wcGVkIOKAmHRwbTItYWJybWTigJkgZnJvbSBsb2FkaW5nLiBJIGFs
c28gYXNzdW1lZCB0aGF0IHRoaXMgcHJldmlvdXNseSBsb2FkZWQgbW9kdWxlIHdhcyB0aGUgcHJv
Y2VzcyByZXF1aXJlZC4gSG93ZXZlciwgdXBvbiBzdG9wcGluZyDigJh0cG0yLXJlc291cmNlbWdy
4oCZIGFuZCBsb2FkaW5nIOKAmHRwbTItYWJybWTigJkgSSBub3cgaGF2ZSBhIHRwbTIgcGFzc2lu
ZyAyNSBvZiB0aGUgdGVzdHMgcHJvdmlkZWQgd2l0aCB0cG0yLXRvb2xzIChJIGFsc28gYmVsaWV2
ZSB0aGUgMiBmYWlsZWQgdGVzdHMgYXJlIHRoZSBhbHJlYWR5IGtub3duIGlzc3VlcyB3aXRoIHJl
YWwtd29ybGQgdHBtMikuPC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0iZm9u
dC1zaXplOjEyLjhweCI+PHNwYW4gbGFuZz0iRU4tR0IiIHN0eWxlPSJmb250LXNpemU6MTBwdDtm
b250LWZhbWlseTpBcmlhbCxzYW5zLXNlcmlmIj7CoDwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05v
cm1hbCIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPjxzcGFuIGxhbmc9IkVOLUdCIiBzdHlsZT0i
Zm9udC1zaXplOjEwcHQ7Zm9udC1mYW1pbHk6QXJpYWwsc2Fucy1zZXJpZiI+V2FudGVkIHRvIHNh
eSBhIG1hc3NpdmUgdGhhbmtzIHRvIHRob3NlIG9mIHlvdSB3aG8gcmVwbGllZC9oZWxwZWQgbWUh
IFJlYWxseSBuaWNlIGNvbW11bml0eS48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0
eWxlPSJmb250LXNpemU6MTIuOHB4Ij48c3BhbiBsYW5nPSJFTi1HQiIgc3R5bGU9ImZvbnQtc2l6
ZToxMHB0O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2VyaWYiPsKgPC9zcGFuPjwvcD48cCBjbGFz
cz0iTXNvTm9ybWFsIiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+PHNwYW4gbGFuZz0iRU4tR0Ii
IHN0eWxlPSJmb250LXNpemU6MTBwdDtmb250LWZhbWlseTpBcmlhbCxzYW5zLXNlcmlmIj5JZiBJ
IGNvdWxkIGFzayBvbmUgZnVydGhlciB0aGluZyAoSSBiZWxpZXZlIHRoaXMgaXMgdGhlIGNvcnJl
Y3QgcGxhY2UgdG8gcG9zdCB0aGlzPyksIEnigJltIGxvb2tpbmcgYXQgc2V0dGluZyB1cCBhIHRy
dXN0ZWQgYm9vdCBzeXN0ZW0gb24gbXkgY3VycmVudCBzZXR1cCAoVWJ1bnR1IDE2LjA0LCBrZXJu
ZWwgNC40KSB0byBiZSB1c2VkIHdpdGggdGhlIG5vdyB3b3JraW5nIHRwbTIuIEkgaGF2ZSBwcmV2
aW91c2x5IGRvbmUgdGhpcyB3aXRoIHRwbTEuMiBidXQgdGhlIHByb2Nlc3Mgc2VlbXMgcmF0aGVy
IGRpZmZlcmVudCB0aGlzIHRpbWUsIGlmIGFueW9uZSBjYW4gcG9pbnQgbWUgdG8gYW55IGdvb2Qg
cmVzb3VyY2VzL3R1dG9yaWFscyB0aGF0IHdvdWxkIGJlIGEgbWFzc2l2ZSBoZWxwLjwvc3Bhbj48
L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPjxzcGFuIGxh
bmc9IkVOLUdCIiBzdHlsZT0iZm9udC1zaXplOjEwcHQ7Zm9udC1mYW1pbHk6QXJpYWwsc2Fucy1z
ZXJpZiI+wqA8L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJmb250LXNpemU6
MTIuOHB4Ij48c3BhbiBsYW5nPSJFTi1HQiIgc3R5bGU9ImZvbnQtc2l6ZToxMHB0O2ZvbnQtZmFt
aWx5OkFyaWFsLHNhbnMtc2VyaWYiPlRoYW5rcyw8L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48c3BhbiBsYW5nPSJFTi1HQiIgc3R5bGU9ImZv
bnQtc2l6ZToxMHB0O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2VyaWYiPjxicj48L3NwYW4+PC9w
PjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJmb250LXNpemU6MTIuOHB4Ij48c3BhbiBsYW5n
PSJFTi1HQiIgc3R5bGU9ImZvbnQtc2l6ZToxMHB0O2ZvbnQtZmFtaWx5OkFyaWFsLHNhbnMtc2Vy
aWYiPkhheWRvbjwvc3Bhbj48L3A+PC9kaXY+Cg==

--===============3127599908848276104==--

