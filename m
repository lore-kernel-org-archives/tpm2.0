Content-Type: multipart/mixed; boundary="===============0050079540665546973=="
MIME-Version: 1.0
From: Trey Weaver <treyweaver at fastmail.net>
Subject: [tpm2] Persistance Not working
Date: Fri, 18 Oct 2019 17:17:05 -0400
Message-ID: <67ae3571-0e90-459a-9172-47cd298874c9@www.fastmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0050079540665546973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I hate to ask two questions in one day, but I thought I had this working un=
til the latest version.

So to make a persistent key in the TPM2 module I do the following:

**tpm2_createprimary -H o -g sha256 -G ecc -C primary.ctx****
**
**tpm2_create -V -c primary.ctx -g sha256 -G rsa -u key.pub -r key.priv****
**
**tpm2_load -c primary.ctx -u key.pub -r key.priv -C jpskey.ctx****
**
**tpm2_evictcontrol -A o -c jpskey.ctx -S 0x81000004****
**

To encrypt a file I do the following:

**tpm2_rsaencrypt -k 0x81000004 -o msg.enc msg.in.txt****
**

And to decrypt I do the following:

**tpm2_rsadecrypt -k 0x81000004 -o msg.out.txt -I msg.enc****
**

I can rerun the rsadecrypt line a 1000 times and it works fine. But if I re=
boot my system and run it I get this error:

**ps(a)jpsadmin-TB116C-AN:~/Temp$ tpm2_rsadecrypt -V -k 0x81000004 -o msg.o=
ut2.txt -I msg.enc****
**
**ERROR on line: "82" in file: "tools/tpm2_rsadecrypt.c": rsaDecrypt failed=
, error code: 0x84****
**
**ERROR on line: "168" in file: "tools/tpm2_tool.c": Unable to run tpm2_rsa=
decrypt****
**

What good is persistence if it does not work over a power cycle?

What am I doing wrong?

--===============0050079540665546973==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PCFET0NUWVBFIGh0bWw+PGh0bWw+PGhlYWQ+PHRpdGxlPjwvdGl0bGU+PHN0eWxlIHR5cGU9InRl
eHQvY3NzIj5wLk1zb05vcm1hbCxwLk1zb05vU3BhY2luZ3ttYXJnaW46MH08L3N0eWxlPjwvaGVh
ZD48Ym9keT48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPkkgaGF0ZSB0byBhc2sgdHdv
IHF1ZXN0aW9ucyBpbiBvbmUgZGF5LCBidXQgSSB0aG91Z2h0IEkgaGFkIHRoaXMgd29ya2luZyB1
bnRpbCB0aGUgbGF0ZXN0IHZlcnNpb24uPGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OkFyaWFsOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+U28gdG8g
bWFrZSBhIHBlcnNpc3RlbnQga2V5IGluIHRoZSBUUE0yIG1vZHVsZSBJIGRvIHRoZSBmb2xsb3dp
bmc6PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2Pjxk
aXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+PGI+PGk+dHBtMl9jcmVhdGVwcmltYXJ5IC1I
IG8gLWcgc2hhMjU2IC1HIGVjYyAtQyBwcmltYXJ5LmN0eDwvaT48L2I+PGI+PGk+PGJyPjwvaT48
L2I+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48Yj48aT50cG0yX2NyZWF0
ZSAtViAtYyBwcmltYXJ5LmN0eCAtZyBzaGEyNTYgLUcgcnNhIC11IGtleS5wdWIgLXIga2V5LnBy
aXY8L2k+PC9iPjxiPjxpPjxicj48L2k+PC9iPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OkFyaWFsOyI+PGI+PGk+dHBtMl9sb2FkIC1jIHByaW1hcnkuY3R4IC11IGtleS5wdWIgLXIga2V5
LnByaXYgLUMganBza2V5LmN0eDwvaT48L2I+PGI+PGk+PGJyPjwvaT48L2I+PC9kaXY+PGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48Yj48aT50cG0yX2V2aWN0Y29udHJvbCAtQSBvIC1j
IGpwc2tleS5jdHggLVMgMHg4MTAwMDAwNDwvaT48L2I+PGI+PGk+PGJyPjwvaT48L2I+PC9kaXY+
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6QXJpYWw7Ij5UbyBlbmNyeXB0IGEgZmlsZSBJIGRvIHRoZSBmb2xsb3dpbmc6PGJy
PjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2PjxkaXYgc3R5
bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+PGI+PGk+dHBtMl9yc2FlbmNyeXB0IC1rIDB4ODEwMDAw
MDQgLW8gbXNnLmVuYyBtc2cuaW4udHh0PC9pPjwvYj48Yj48aT48YnI+PC9pPjwvYj48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250
LWZhbWlseTpBcmlhbDsiPkFuZCB0byBkZWNyeXB0IEkgZG8gdGhlIGZvbGxvd2luZzo8YnI+PC9k
aXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0i
Zm9udC1mYW1pbHk6QXJpYWw7Ij48Yj48aT50cG0yX3JzYWRlY3J5cHQgLWsgMHg4MTAwMDAwNCAt
byBtc2cub3V0LnR4dCAtSSBtc2cuZW5jPC9pPjwvYj48Yj48aT48YnI+PC9pPjwvYj48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250
LWZhbWlseTpBcmlhbDsiPkkgY2FuIHJlcnVuIHRoZSByc2FkZWNyeXB0IGxpbmUgYSAxMDAwIHRp
bWVzIGFuZCBpdCB3b3JrcyBmaW5lLiZuYnNwOyBCdXQgaWYgSSByZWJvb3QgbXkgc3lzdGVtIGFu
ZCBydW4gaXQgSSBnZXQgdGhpcyBlcnJvcjo8YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1p
bHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48Yj48
aT5wc0BqcHNhZG1pbi1UQjExNkMtQU46fi9UZW1wJCB0cG0yX3JzYWRlY3J5cHQgLVYgLWsgMHg4
MTAwMDAwNCAtbyBtc2cub3V0Mi50eHQgLUkgbXNnLmVuYzwvaT48L2I+PGI+PGk+PGJyPjwvaT48
L2I+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48Yj48aT5FUlJPUiBvbiBs
aW5lOiAiODIiIGluIGZpbGU6ICJ0b29scy90cG0yX3JzYWRlY3J5cHQuYyI6IHJzYURlY3J5cHQg
ZmFpbGVkLCBlcnJvciBjb2RlOiAweDg0PC9pPjwvYj48Yj48aT48YnI+PC9pPjwvYj48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPjxiPjxpPkVSUk9SIG9uIGxpbmU6ICIxNjgi
IGluIGZpbGU6ICJ0b29scy90cG0yX3Rvb2wuYyI6IFVuYWJsZSB0byBydW4gdHBtMl9yc2FkZWNy
eXB0PC9pPjwvYj48Yj48aT48YnI+PC9pPjwvYj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWls
eTpBcmlhbDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPldoYXQg
Z29vZCBpcyBwZXJzaXN0ZW5jZSBpZiBpdCBkb2VzIG5vdCB3b3JrIG92ZXIgYSBwb3dlciBjeWNs
ZT88YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij5XaGF0IGFtIEkgZG9pbmcgd3Jvbmc/PGJyPjwv
ZGl2PjwvYm9keT48L2h0bWw+
--===============0050079540665546973==--

