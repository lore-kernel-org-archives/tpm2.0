Content-Type: multipart/mixed; boundary="===============9052151475667992440=="
MIME-Version: 1.0
From: Trey Weaver <treyweaver at fastmail.net>
Subject: [tpm2] Error on TPM2 and Ubuntu 19.04
Date: Tue, 15 Oct 2019 14:56:11 -0400
Message-ID: <e7667319-4b47-4e22-8efd-4280c1ff7725@www.fastmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9052151475667992440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Here is final goal is to have a compatible version of tpm2_tools and clevis=
 on my Linux machine. The use clevis to automatically unlock my hard drive =
on boot.

So I download the latest copy of ubuntu 19.04 installed all of the tpm2_too=
ls on it and all the latest clevis tools using apt. Ran sudo tpm2-abrmd -o =
and then ran the simple command to test clevis and I get this error:

**root(a)jps-TB116C-AN:~# echo foo | clevis encrypt tpm2 '{}' > text.enc****
**
**ERROR:****
**
**CreatePrimary Failed ! ErrorCode: 0x9a2****
**
**
**
**ERROR: Unable to run tpm2_createprimary****
**
**Creating TPM2 primary key failed!**

So then I go to tpm-tools and run this command and I get this error:

**tpm2_createprimary -V -H o -g sha256 -G ecc -C primary2.ctx****
**
**ObjectAttribute: 0x00030072****
**
**ERROR on line: "182" in file: "tools/tpm2_createprimary.c":****
**
**CreatePrimary Failed ! ErrorCode: 0x9a2**

This command is from the example in the man "tpm2_createprimary" manual pag=
e!

So at this point I could download the latest from GitHub and compile/instal=
l the latest tools, but then I would get the error from clevis saying the v=
ersion number of the tools is wrong. Downloading the clevis does not solve =
this problem. I spent a couple of days doing this.

I am sure I have TPM2 setup correctly because things like tpm2_getrandom wo=
rk fine.

tpm2_createprimary is version 3.1.3

What can I do? =

Is there another tool beside clevis to auto unlock my drive that works bett=
er?
Is there such a thing as a matched pair of tpm2-tool and clevis that I can =
get a package for? =


You would think if I got the latest packages from Ubuntu they would work to=
gether.


--===============9052151475667992440==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PCFET0NUWVBFIGh0bWw+PGh0bWw+PGhlYWQ+PHRpdGxlPjwvdGl0bGU+PHN0eWxlIHR5cGU9InRl
eHQvY3NzIj5wLk1zb05vcm1hbCxwLk1zb05vU3BhY2luZ3ttYXJnaW46MH08L3N0eWxlPjwvaGVh
ZD48Ym9keT48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPkhlcmUgaXMgZmluYWwgZ29h
bCBpcyB0byBoYXZlIGEgY29tcGF0aWJsZSB2ZXJzaW9uIG9mIHRwbTJfdG9vbHMgYW5kIGNsZXZp
cyBvbiBteSBMaW51eCBtYWNoaW5lLiZuYnNwOyBUaGUgdXNlIGNsZXZpcyB0byBhdXRvbWF0aWNh
bGx5IHVubG9jayBteSBoYXJkIGRyaXZlIG9uIGJvb3QuPGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFs
OyI+U28gSSBkb3dubG9hZCB0aGUgbGF0ZXN0IGNvcHkgb2YgdWJ1bnR1IDE5LjA0IGluc3RhbGxl
ZCBhbGwgb2YgdGhlIHRwbTJfdG9vbHMgb24gaXQgYW5kIGFsbCB0aGUgbGF0ZXN0IGNsZXZpcyB0
b29scyB1c2luZyBhcHQuJm5ic3A7IFJhbiBzdWRvIHRwbTItYWJybWQgLW8gYW5kIHRoZW4gcmFu
IHRoZSBzaW1wbGUgY29tbWFuZCB0byB0ZXN0IGNsZXZpcyBhbmQgSSBnZXQgdGhpcyBlcnJvcjo8
YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48aT48Yj5yb290QGpwcy1UQjExNkMtQU46fiMgZWNo
byBmb28gfCBjbGV2aXMgZW5jcnlwdCB0cG0yICd7fScgJmd0OyB0ZXh0LmVuYzwvYj48L2k+PGk+
PGI+PGJyPjwvYj48L2k+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48aT48
Yj5FUlJPUjo8L2I+PC9pPjxpPjxiPjxicj48L2I+PC9pPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQt
ZmFtaWx5OkFyaWFsOyI+PGk+PGI+Q3JlYXRlUHJpbWFyeSBGYWlsZWQgISBFcnJvckNvZGU6IDB4
OWEyPC9iPjwvaT48aT48Yj48YnI+PC9iPjwvaT48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWls
eTpBcmlhbDsiPjxpPjxiPjxicj48L2I+PC9pPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OkFyaWFsOyI+PGk+PGI+RVJST1I6IFVuYWJsZSB0byBydW4gdHBtMl9jcmVhdGVwcmltYXJ5PC9i
PjwvaT48aT48Yj48YnI+PC9iPjwvaT48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlh
bDsiPjxpPjxiPkNyZWF0aW5nIFRQTTIgcHJpbWFyeSBrZXkgZmFpbGVkITwvYj48L2k+PGJyPjwv
ZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OkFyaWFsOyI+U28gdGhlbiBJIGdvIHRvIHRwbS10b29scyBhbmQgcnVuIHRo
aXMgY29tbWFuZCBhbmQgSSBnZXQgdGhpcyBlcnJvcjo8YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7
Ij48aT48Yj50cG0yX2NyZWF0ZXByaW1hcnkgLVYgLUggbyAtZyBzaGEyNTYgLUcgZWNjIC1DIHBy
aW1hcnkyLmN0eDwvYj48L2k+PGk+PGI+PGJyPjwvYj48L2k+PC9kaXY+PGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6QXJpYWw7Ij48aT48Yj5PYmplY3RBdHRyaWJ1dGU6IDB4MDAwMzAwNzI8L2I+PC9p
PjxpPjxiPjxicj48L2I+PC9pPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+
PGk+PGI+RVJST1Igb24gbGluZTogIjE4MiIgaW4gZmlsZTogInRvb2xzL3RwbTJfY3JlYXRlcHJp
bWFyeS5jIjo8L2I+PC9pPjxpPjxiPjxicj48L2I+PC9pPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQt
ZmFtaWx5OkFyaWFsOyI+PGk+PGI+Q3JlYXRlUHJpbWFyeSBGYWlsZWQgISBFcnJvckNvZGU6IDB4
OWEyPC9iPjwvaT48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48YnI+
PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij5UaGlzIGNvbW1hbmQgaXMgZnJv
bSB0aGUgZXhhbXBsZSBpbiB0aGUgbWFuICJ0cG0yX2NyZWF0ZXByaW1hcnkiIG1hbnVhbCBwYWdl
ITxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPjxicj48L2Rpdj48ZGl2
IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsiPlNvIGF0IHRoaXMgcG9pbnQgSSBjb3VsZCBkb3du
bG9hZCB0aGUgbGF0ZXN0IGZyb20gR2l0SHViIGFuZCBjb21waWxlL2luc3RhbGwgdGhlIGxhdGVz
dCB0b29scywgYnV0IHRoZW4gSSB3b3VsZCBnZXQgdGhlIGVycm9yIGZyb20gY2xldmlzIHNheWlu
ZyB0aGUgdmVyc2lvbiBudW1iZXIgb2YgdGhlIHRvb2xzIGlzIHdyb25nLiZuYnNwOyBEb3dubG9h
ZGluZyB0aGUgY2xldmlzIGRvZXMgbm90IHNvbHZlIHRoaXMgcHJvYmxlbS4mbmJzcDsgSSBzcGVu
dCBhIGNvdXBsZSBvZiBkYXlzIGRvaW5nIHRoaXMuPGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQt
ZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+
SSBhbSBzdXJlIEkgaGF2ZSBUUE0yIHNldHVwIGNvcnJlY3RseSBiZWNhdXNlIHRoaW5ncyBsaWtl
IHRwbTJfZ2V0cmFuZG9tIHdvcmsgZmluZS48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1p
bHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij50cG0y
X2NyZWF0ZXByaW1hcnkgaXMgdmVyc2lvbiAzLjEuMzxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250
LWZhbWlseTpBcmlhbDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpBcmlhbDsi
PldoYXQgY2FuIEkgZG8/Jm5ic3A7IDxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTpB
cmlhbDsiPklzIHRoZXJlIGFub3RoZXIgdG9vbCBiZXNpZGUgY2xldmlzIHRvIGF1dG8gdW5sb2Nr
IG15IGRyaXZlIHRoYXQgd29ya3MgYmV0dGVyPzxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZh
bWlseTpBcmlhbDsiPklzIHRoZXJlIHN1Y2ggYSB0aGluZyBhcyBhIG1hdGNoZWQgcGFpciBvZiB0
cG0yLXRvb2wgYW5kIGNsZXZpcyB0aGF0IEkgY2FuIGdldCBhIHBhY2thZ2UgZm9yPyZuYnNwOyA8
YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij48YnI+PC9kaXY+PGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6QXJpYWw7Ij5Zb3Ugd291bGQgdGhpbmsgaWYgSSBnb3QgdGhlIGxh
dGVzdCBwYWNrYWdlcyBmcm9tIFVidW50dSB0aGV5IHdvdWxkIHdvcmsgdG9nZXRoZXIuPGJyPjwv
ZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OkFyaWFsOyI+PGJyPjwvZGl2PjwvYm9keT48L2h0bWw+
--===============9052151475667992440==--

