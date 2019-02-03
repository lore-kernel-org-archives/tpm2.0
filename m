Content-Type: multipart/mixed; boundary="===============5375079013983693250=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Compiling/linking tpm2 application - undefined reference
 to Esys function
Date: Sun, 03 Feb 2019 07:22:59 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D014B504EE1@exch2010c.sit.fraunhofer.de>
In-Reply-To: CAHW3fvmCe15PfD_w+c9SC_+ex5=FHDqVzTrLOxFSGwfeM22Bng@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5375079013983693250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Antonio,

I think we would need to see the complete gcc command.

But maybe a first hint: The -ltss2-esys must come AFTER the source file on =
commandline.

Cheers,
Andreas

________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Ant=C3=B3nio Ribeiro =
[antonio.ribeiro94(a)gmail.com]
Sent: Sunday, February 03, 2019 03:06
To: tpm2(a)lists.01.org
Subject: [tpm2] Compiling/linking tpm2 application - undefined reference to=
 Esys function

Hello everyone,

First of all, i am sorry to be bothering this mailing list with a doubt i t=
hink it should be quite obvious unfortunately, i am not being able to find =
out a solution to it. Also, i am not sure if this should go here or in the =
issues of the repositories. If this is not the right place i will gladly po=
st it on github.

I installed everything as said in github repos (tpm2-tss, tpm2-abrmd and tp=
m2-tools). I am trying to create an application (just a proof of concept) w=
ith tpm2 and the first thing i am trying to do is call a function from the =
library Esys (tss2/tss2_esys.h) to print a random number. Unfortunately, wh=
en i try to compile and link the application files the compiler/linker (gcc=
) says:

(if it is needed i can copy/paste the whole text)
"undefined reference to `Esys_GetRandom'"

On the code, i am trying to make the same call that is made on tpm2-tools g=
etrandom, so i dont think there is a problem with that call (and also it co=
mpiles correctly but doesn't link).

I am using the flags i suppose are needed "-I/usr/local/include" for compil=
ation (just to be sure) and "-L/usr/local/lib -ltss2-mu -ltss2-tcti-device =
-ltss2-sys -ltss2-esys" for the linking part (i also tried with the flags "=
-ltpm2sapi" which i found in another github repo. I was able to compile and=
 use all the tools on the tpm2-tools repo, which makes me believe the probl=
em is not in the libraries themselves but  any flags may be missing in my l=
inking. Unfortunately, i tried with the flags i could get from the Makefile=
 it has on tpm2-tools but same result.

Can anyone tell me what am i doing wrong? Or at least point me in the right=
 direction?
The OS is Ubuntu 18.04.1 LTS (in VMWare Workstation if it makes any differe=
nce).

Thank you very much;

--
Ant=C3=B3nio Ribeiro
+351 916045500 | antonio.ribeiro94(a)gmail.com<mailto:antonio.ribeiro94(a)g=
mail.com>
Masters in Computer Science & Engineering
New University of Lisbon - Faculty of Science and Technology

--===============5375079013983693250==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWwgZGlyPSJsdHIiPgo8aGVhZD4KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBj
b250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMSI+CjxzdHlsZSB0eXBlPSJ0ZXh0
L2NzcyIgaWQ9Im93YVBhcmFTdHlsZSI+UCB7bWFyZ2luLXRvcDowO21hcmdpbi1ib3R0b206MDt9
PC9zdHlsZT4KPC9oZWFkPgo8Ym9keSBmcHN0eWxlPSIxIiBvY3NpPSIwIj4KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7Zm9udC1mYW1pbHk6IFRhaG9tYTtjb2xvcjogIzAwMDAwMDtmb250LXNp
emU6IDEwcHQ7Ij4KPGRpdj5IaSBBbnRvbmlvLDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+
SSB0aGluayB3ZSB3b3VsZCBuZWVkIHRvIHNlZSB0aGUgY29tcGxldGUgZ2NjIGNvbW1hbmQuPC9k
aXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5CdXQgbWF5YmUgYSBmaXJzdCBoaW50OiBUaGUgLWx0
c3MyLWVzeXMgbXVzdCBjb21lIEFGVEVSIHRoZSBzb3VyY2UgZmlsZSBvbiBjb21tYW5kbGluZS48
L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PkNoZWVycyw8L2Rpdj4KPGRpdj5BbmRyZWFzPGJy
Pgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogVGltZXMg
TmV3IFJvbWFuOyBjb2xvcjogIzAwMDAwMDsgZm9udC1zaXplOiAxNnB4Ij4KPGhyIHRhYmluZGV4
PSItMSI+CjxkaXYgaWQ9ImRpdlJwRjE0NzY0MCIgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyI+PGZv
bnQgc2l6ZT0iMiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IHRw
bTIgW3RwbTItYm91bmNlc0BsaXN0cy4wMS5vcmddIG9uIGJlaGFsZiBvZiBBbnTzbmlvIFJpYmVp
cm8gW2FudG9uaW8ucmliZWlybzk0QGdtYWlsLmNvbV08YnI+CjxiPlNlbnQ6PC9iPiBTdW5kYXks
IEZlYnJ1YXJ5IDAzLCAyMDE5IDAzOjA2PGJyPgo8Yj5Ubzo8L2I+IHRwbTJAbGlzdHMuMDEub3Jn
PGJyPgo8Yj5TdWJqZWN0OjwvYj4gW3RwbTJdIENvbXBpbGluZy9saW5raW5nIHRwbTIgYXBwbGlj
YXRpb24gLSB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIEVzeXMgZnVuY3Rpb248YnI+CjwvZm9udD48
YnI+CjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8ZGl2Pgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0
ciI+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+CjxkaXYg
ZGlyPSJsdHIiPgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+CjxkaXYgZGlyPSJsdHIi
Pgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+CjxkaXY+SGVsbG8gZXZlcnlvbmUsPC9k
aXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5GaXJzdCBvZiBhbGwsIGkgYW0gc29ycnkgdG8gYmUg
Ym90aGVyaW5nIHRoaXMgbWFpbGluZyBsaXN0IHdpdGggYSBkb3VidCBpIHRoaW5rIGl0IHNob3Vs
ZCBiZSBxdWl0ZSBvYnZpb3VzIHVuZm9ydHVuYXRlbHksIGkgYW0gbm90IGJlaW5nIGFibGUgdG8g
ZmluZCBvdXQgYSBzb2x1dGlvbiB0byBpdC4gQWxzbywgaSBhbSBub3Qgc3VyZSBpZiB0aGlzIHNo
b3VsZCBnbyBoZXJlIG9yIGluIHRoZSBpc3N1ZXMgb2YgdGhlIHJlcG9zaXRvcmllcy4KIElmIHRo
aXMgaXMgbm90IHRoZSByaWdodCBwbGFjZSBpIHdpbGwgZ2xhZGx5IHBvc3QgaXQgb24gZ2l0aHVi
LjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSBpbnN0YWxsZWQgZXZlcnl0aGluZyBhcyBz
YWlkIGluIGdpdGh1YiByZXBvcyAodHBtMi10c3MsIHRwbTItYWJybWQgYW5kIHRwbTItdG9vbHMp
LiZuYnNwO0kgYW0gdHJ5aW5nIHRvIGNyZWF0ZSBhbiBhcHBsaWNhdGlvbiAoanVzdCBhIHByb29m
IG9mIGNvbmNlcHQpIHdpdGggdHBtMiBhbmQgdGhlIGZpcnN0IHRoaW5nIGkgYW0gdHJ5aW5nIHRv
IGRvIGlzIGNhbGwgYSBmdW5jdGlvbiBmcm9tIHRoZSBsaWJyYXJ5IEVzeXMgKHRzczIvdHNzMl9l
c3lzLmgpCiB0byBwcmludCBhIHJhbmRvbSBudW1iZXIuIFVuZm9ydHVuYXRlbHksIHdoZW4gaSB0
cnkgdG8gY29tcGlsZSBhbmQgbGluayB0aGUgYXBwbGljYXRpb24gZmlsZXMgdGhlIGNvbXBpbGVy
L2xpbmtlciAoZ2NjKSBzYXlzOjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+PGk+KGlmIGl0
IGlzIG5lZWRlZCBpIGNhbiBjb3B5L3Bhc3RlIHRoZSB3aG9sZSB0ZXh0KTwvaT48L2Rpdj4KPGRp
dj4KPGRpdj48aT4mcXVvdDt1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBFc3lzX0dldFJhbmRvbScm
cXVvdDs8L2k+PC9kaXY+CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+T24gdGhlIGNvZGUs
IGkgYW0gdHJ5aW5nIHRvIG1ha2UgdGhlIHNhbWUgY2FsbCB0aGF0IGlzIG1hZGUgb24gdHBtMi10
b29scyBnZXRyYW5kb20sIHNvIGkgZG9udCB0aGluayB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0
aGF0IGNhbGwgKGFuZCBhbHNvIGl0IGNvbXBpbGVzIGNvcnJlY3RseSBidXQgZG9lc24ndCBsaW5r
KS48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PkkgYW0gdXNpbmcgdGhlIGZsYWdzIGkgc3Vw
cG9zZSBhcmUgbmVlZGVkICZxdW90Oy1JL3Vzci9sb2NhbC9pbmNsdWRlJnF1b3Q7IGZvciBjb21w
aWxhdGlvbiAoanVzdCB0byBiZSBzdXJlKSBhbmQgJnF1b3Q7LUwvdXNyL2xvY2FsL2xpYiAtbHRz
czItbXUgLWx0c3MyLXRjdGktZGV2aWNlIC1sdHNzMi1zeXMgLWx0c3MyLWVzeXMmcXVvdDsgZm9y
IHRoZSBsaW5raW5nIHBhcnQgKGkgYWxzbyB0cmllZCB3aXRoIHRoZSBmbGFncyAmcXVvdDstbHRw
bTJzYXBpJnF1b3Q7IHdoaWNoIGkgZm91bmQgaW4KIGFub3RoZXIgZ2l0aHViIHJlcG8uIEkgd2Fz
IGFibGUgdG8gY29tcGlsZSBhbmQgdXNlIGFsbCB0aGUgdG9vbHMgb24gdGhlIHRwbTItdG9vbHMg
cmVwbywgd2hpY2ggbWFrZXMgbWUgYmVsaWV2ZSB0aGUgcHJvYmxlbSBpcyBub3QgaW4gdGhlIGxp
YnJhcmllcyB0aGVtc2VsdmVzIGJ1dCZuYnNwOyBhbnkgZmxhZ3MmbmJzcDttYXkgYmUgbWlzc2lu
ZyBpbiBteSBsaW5raW5nLiBVbmZvcnR1bmF0ZWx5LCBpIHRyaWVkIHdpdGggdGhlIGZsYWdzIGkg
Y291bGQgZ2V0IGZyb20KIHRoZSBNYWtlZmlsZSBpdCBoYXMgb24gdHBtMi10b29scyBidXQgc2Ft
ZSByZXN1bHQuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5DYW4gYW55b25lIHRlbGwgbWUg
d2hhdCBhbSBpIGRvaW5nIHdyb25nPyBPciBhdCBsZWFzdCBwb2ludCBtZSBpbiB0aGUgcmlnaHQg
ZGlyZWN0aW9uPzwvZGl2Pgo8ZGl2PlRoZSBPUyBpcyZuYnNwO1VidW50dSAxOC4wNC4xIExUUyAo
aW4gVk1XYXJlIFdvcmtzdGF0aW9uIGlmIGl0IG1ha2VzIGFueSBkaWZmZXJlbmNlKS48L2Rpdj4K
PGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlRoYW5rIHlvdSB2ZXJ5IG11Y2g7PC9kaXY+CjxkaXY+PGJy
Pgo8L2Rpdj4KPGRpdj4tLSZuYnNwOzxicj4KPC9kaXY+CjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJn
bWFpbC1tXzk3OTE2Nzk3MzI3NjI1NzMzNWdtYWlsX3NpZ25hdHVyZSI+CjxkaXYgZGlyPSJsdHIi
Pgo8ZGl2IGRpcj0ibHRyIj5BbnTzbmlvIFJpYmVpcm88L2Rpdj4KPGRpdiBkaXI9Imx0ciI+PGZv
bnQgc2l6ZT0iMSIgY29sb3I9IiM0NDQ0NDQiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlh
bCxoZWx2ZXRpY2Esc2Fucy1zZXJpZiI+JiM0MzszNTEgOTE2MDQ1NTAwJm5ic3A7PC9zcGFuPjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxoZWx2ZXRpY2Esc2Fucy1zZXJpZiI+fCZuYnNw
Ozwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6YXJpYWwsaGVsdmV0aWNhLHNhbnMtc2Vy
aWYiPjxhIGhyZWY9Im1haWx0bzphbnRvbmlvLnJpYmVpcm85NEBnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPmFudG9uaW8ucmliZWlybzk0QGdtYWls
LmNvbTwvYT48L3NwYW4+PC9mb250PjwvZGl2Pgo8ZGl2IGRpcj0ibHRyIj48Zm9udCBzdHlsZT0i
Zm9udC1zaXplOjEyLjhweCIgY29sb3I9IiM0NDQ0NDQiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
eC1zbWFsbCI+TWFzdGVycyBpbiBDb21wdXRlciBTY2llbmNlICZhbXA7IEVuZ2luZWVyaW5nJm5i
c3A7PC9zcGFuPjwvZm9udD48L2Rpdj4KPGRpdiBkaXI9Imx0ciI+PGZvbnQgc2l6ZT0iMSIgY29s
b3I9IiM0NDQ0NDQiPk5ldyBVbml2ZXJzaXR5IG9mIExpc2JvbjwvZm9udD48c3BhbiBzdHlsZT0i
Y29sb3I6cmdiKDY4LDY4LDY4KTsgZm9udC1zaXplOngtc21hbGwiPiZuYnNwOy0gRmFjdWx0eSBv
ZiBTY2llbmNlIGFuZCBUZWNobm9sb2d5PC9zcGFuPjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2
Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+
CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+Cg==

--===============5375079013983693250==--

