Content-Type: multipart/mixed; boundary="===============1422992038881142996=="
MIME-Version: 1.0
From: =?utf-8?q?Ant=C3=B3nio_Ribeiro_=3Cantonio=2Eribeiro94_at_gmail=2Ecom=3E?=
Subject: [tpm2] Compiling/linking tpm2 application - undefined reference to
 Esys function
Date: Sun, 03 Feb 2019 02:06:06 +0000
Message-ID: <CAHW3fvmCe15PfD_w+c9SC_+ex5=FHDqVzTrLOxFSGwfeM22Bng@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1422992038881142996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello everyone,

First of all, i am sorry to be bothering this mailing list with a doubt i
think it should be quite obvious unfortunately, i am not being able to find
out a solution to it. Also, i am not sure if this should go here or in the
issues of the repositories. If this is not the right place i will gladly
post it on github.

I installed everything as said in github repos (tpm2-tss, tpm2-abrmd and
tpm2-tools). I am trying to create an application (just a proof of concept)
with tpm2 and the first thing i am trying to do is call a function from the
library Esys (tss2/tss2_esys.h) to print a random number. Unfortunately,
when i try to compile and link the application files the compiler/linker
(gcc) says:

*(if it is needed i can copy/paste the whole text)*
*"undefined reference to `Esys_GetRandom'"*

On the code, i am trying to make the same call that is made on tpm2-tools
getrandom, so i dont think there is a problem with that call (and also it
compiles correctly but doesn't link).

I am using the flags i suppose are needed "-I/usr/local/include" for
compilation (just to be sure) and "-L/usr/local/lib -ltss2-mu
-ltss2-tcti-device -ltss2-sys -ltss2-esys" for the linking part (i also
tried with the flags "-ltpm2sapi" which i found in another github repo. I
was able to compile and use all the tools on the tpm2-tools repo, which
makes me believe the problem is not in the libraries themselves but  any
flags may be missing in my linking. Unfortunately, i tried with the flags i
could get from the Makefile it has on tpm2-tools but same result.

Can anyone tell me what am i doing wrong? Or at least point me in the right
direction?
The OS is Ubuntu 18.04.1 LTS (in VMWare Workstation if it makes any
difference).

Thank you very much;

-- =

Ant=C3=B3nio Ribeiro
+351 916045500 | antonio.ribeiro94(a)gmail.com
Masters in Computer Science & Engineering
New University of Lisbon - Faculty of Science and Technology

--===============1422992038881142996==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9
Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5I
ZWxsbyBldmVyeW9uZSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkZpcnN0IG9mIGFsbCwgaSBh
bSBzb3JyeSB0byBiZSBib3RoZXJpbmcgdGhpcyBtYWlsaW5nIGxpc3Qgd2l0aCBhIGRvdWJ0IGkg
dGhpbmsgaXQgc2hvdWxkIGJlIHF1aXRlIG9idmlvdXMgdW5mb3J0dW5hdGVseSwgaSBhbSBub3Qg
YmVpbmcgYWJsZSB0byBmaW5kIG91dCBhIHNvbHV0aW9uIHRvIGl0LiBBbHNvLCBpIGFtIG5vdCBz
dXJlIGlmIHRoaXMgc2hvdWxkIGdvIGhlcmUgb3IgaW4gdGhlIGlzc3VlcyBvZiB0aGUgcmVwb3Np
dG9yaWVzLiBJZiB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgcGxhY2UgaSB3aWxsIGdsYWRseSBwb3N0
IGl0IG9uIGdpdGh1Yi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgaW5zdGFsbGVkIGV2ZXJ5
dGhpbmcgYXMgc2FpZCBpbiBnaXRodWIgcmVwb3MgKHRwbTItdHNzLCB0cG0yLWFicm1kIGFuZCB0
cG0yLXRvb2xzKS7CoEkgYW0gdHJ5aW5nIHRvIGNyZWF0ZSBhbiBhcHBsaWNhdGlvbiAoanVzdCBh
IHByb29mIG9mIGNvbmNlcHQpIHdpdGggdHBtMiBhbmQgdGhlIGZpcnN0IHRoaW5nIGkgYW0gdHJ5
aW5nIHRvIGRvIGlzIGNhbGwgYSBmdW5jdGlvbiBmcm9tIHRoZSBsaWJyYXJ5IEVzeXMgKHRzczIv
dHNzMl9lc3lzLmgpIHRvIHByaW50IGEgcmFuZG9tIG51bWJlci4gVW5mb3J0dW5hdGVseSwgd2hl
biBpIHRyeSB0byBjb21waWxlIGFuZCBsaW5rIHRoZSBhcHBsaWNhdGlvbiBmaWxlcyB0aGUgY29t
cGlsZXIvbGlua2VyIChnY2MpIHNheXM6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48aT4oaWYg
aXQgaXMgbmVlZGVkIGkgY2FuIGNvcHkvcGFzdGUgdGhlIHdob2xlIHRleHQpPC9pPjwvZGl2Pjxk
aXY+PGRpdj48aT4mcXVvdDt1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBFc3lzX0dldFJhbmRvbSYj
Mzk7JnF1b3Q7PC9pPjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+T24gdGhlIGNvZGUs
IGkgYW0gdHJ5aW5nIHRvIG1ha2UgdGhlIHNhbWUgY2FsbCB0aGF0IGlzIG1hZGUgb24gdHBtMi10
b29scyBnZXRyYW5kb20sIHNvIGkgZG9udCB0aGluayB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0
aGF0IGNhbGwgKGFuZCBhbHNvIGl0IGNvbXBpbGVzIGNvcnJlY3RseSBidXQgZG9lc24mIzM5O3Qg
bGluaykuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGFtIHVzaW5nIHRoZSBmbGFncyBpIHN1
cHBvc2UgYXJlIG5lZWRlZCAmcXVvdDstSS91c3IvbG9jYWwvaW5jbHVkZSZxdW90OyBmb3IgY29t
cGlsYXRpb24gKGp1c3QgdG8gYmUgc3VyZSkgYW5kICZxdW90Oy1ML3Vzci9sb2NhbC9saWIgLWx0
c3MyLW11IC1sdHNzMi10Y3RpLWRldmljZSAtbHRzczItc3lzIC1sdHNzMi1lc3lzJnF1b3Q7IGZv
ciB0aGUgbGlua2luZyBwYXJ0IChpIGFsc28gdHJpZWQgd2l0aCB0aGUgZmxhZ3MgJnF1b3Q7LWx0
cG0yc2FwaSZxdW90OyB3aGljaCBpIGZvdW5kIGluIGFub3RoZXIgZ2l0aHViIHJlcG8uIEkgd2Fz
IGFibGUgdG8gY29tcGlsZSBhbmQgdXNlIGFsbCB0aGUgdG9vbHMgb24gdGhlIHRwbTItdG9vbHMg
cmVwbywgd2hpY2ggbWFrZXMgbWUgYmVsaWV2ZSB0aGUgcHJvYmxlbSBpcyBub3QgaW4gdGhlIGxp
YnJhcmllcyB0aGVtc2VsdmVzIGJ1dMKgCgphbnkgZmxhZ3PCoG1heSBiZSBtaXNzaW5nIGluIG15
IGxpbmtpbmcuIFVuZm9ydHVuYXRlbHksIGkgdHJpZWQgd2l0aCB0aGUgZmxhZ3MgaSBjb3VsZCBn
ZXQgZnJvbSB0aGUgTWFrZWZpbGUgaXQgaGFzIG9uIHRwbTItdG9vbHMgYnV0IHNhbWUgcmVzdWx0
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2FuIGFueW9uZSB0ZWxsIG1lIHdoYXQgYW0gaSBk
b2luZyB3cm9uZz8gT3IgYXQgbGVhc3QgcG9pbnQgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbj88
L2Rpdj48ZGl2PlRoZSBPUyBpc8KgVWJ1bnR1IDE4LjA0LjEgTFRTIChpbiBWTVdhcmUgV29ya3N0
YXRpb24gaWYgaXQgbWFrZXMgYW55IGRpZmZlcmVuY2UpLjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+VGhhbmsgeW91IHZlcnkgbXVjaDs8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0twqA8YnI+
PC9kaXY+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsLW1fOTc5MTY3OTczMjc2MjU3MzM1Z21h
aWxfc2lnbmF0dXJlIj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj5BbnTDs25pbyBSaWJl
aXJvPC9kaXY+PGRpdiBkaXI9Imx0ciI+PGZvbnQgc2l6ZT0iMSIgY29sb3I9IiM0NDQ0NDQiPjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxoZWx2ZXRpY2Esc2Fucy1zZXJpZiI+KzM1MSA5
MTYwNDU1MDDCoDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsaGVsdmV0aWNh
LHNhbnMtc2VyaWYiPnzCoDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsaGVs
dmV0aWNhLHNhbnMtc2VyaWYiPjxhIGhyZWY9Im1haWx0bzphbnRvbmlvLnJpYmVpcm85NEBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5hbnRvbmlvLnJpYmVpcm85NEBnbWFpbC5jb208L2E+PC9z
cGFuPjwvZm9udD48L2Rpdj48ZGl2IGRpcj0ibHRyIj48Zm9udCBjb2xvcj0iIzQ0NDQ0NCIgc3R5
bGU9ImZvbnQtc2l6ZToxMi44cHgiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6eC1zbWFsbCI+TWFz
dGVycyBpbiBDb21wdXRlciBTY2llbmNlICZhbXA7IEVuZ2luZWVyaW5nwqA8L3NwYW4+PC9mb250
PjwvZGl2PjxkaXYgZGlyPSJsdHIiPjxmb250IGNvbG9yPSIjNDQ0NDQ0IiBzaXplPSIxIj5OZXcg
VW5pdmVyc2l0eSBvZiBMaXNib248L2ZvbnQ+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYig2OCw2OCw2
OCk7Zm9udC1zaXplOngtc21hbGwiPsKgLSBGYWN1bHR5IG9mIFNjaWVuY2UgYW5kIFRlY2hub2xv
Z3k8L3NwYW4+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+Cg==

--===============1422992038881142996==--

