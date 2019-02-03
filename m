Content-Type: multipart/mixed; boundary="===============5272949648406417324=="
MIME-Version: 1.0
From: =?utf-8?q?Ant=C3=B3nio_Ribeiro_=3Cantonio=2Eribeiro94_at_gmail=2Ecom=3E?=
Subject: Re: [tpm2] Compiling/linking tpm2 application - undefined reference
 to Esys function
Date: Sun, 03 Feb 2019 15:23:08 +0000
Message-ID: <CAHW3fvnm1Yy6tj+cGhDt+dEekW7bTVYNqZx7YJ1+6R=dMehWwA@mail.gmail.com>
In-Reply-To: 9F48E1A823B03B4790B7E6E69430724D014B504EE1@exch2010c.sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5272949648406417324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you very much it indeed worked!

Is there any special reason for it to have to come after the source files?
I thought that the linker would create the symbols table and add any
"symbol" it finds out so that whenever they are needed they would be
substituted. (in this case, my program would add the "Esys_GetRandom" to
the table and then the linker would check the flag and get the
implementation for that function). I see it doesn't quite work like that,
any special reason or is just my misunderstanding?

Anyway, just to give the whole explanation the complete info of this
problem (if anyone has the same problem)

My gcc command for linking was

"g++ -Wall -g -pthread -std=3Dc++11  -ltss2-esys -L/usr/local/lib/  -o
../../../bin/Developer Developer.o"

When i switched it to

"g++ -Wall -g -pthread -std=3Dc++11 -o ../../../bin/Developer Developer.o
-ltss2-esys -L/usr/local/lib/"

It linked correctly.

Again thank you very much!

Fuchs, Andreas <andreas.fuchs(a)sit.fraunhofer.de> escreveu no dia domingo,
3/02/2019 =C3=A0(s) 07:23:

> Hi Antonio,
>
> I think we would need to see the complete gcc command.
>
> But maybe a first hint: The -ltss2-esys must come AFTER the source file on
> commandline.
>
> Cheers,
> Andreas
>
> ------------------------------
> *From:* tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Ant=C3=B3nio Ribe=
iro [
> antonio.ribeiro94(a)gmail.com]
> *Sent:* Sunday, February 03, 2019 03:06
> *To:* tpm2(a)lists.01.org
> *Subject:* [tpm2] Compiling/linking tpm2 application - undefined
> reference to Esys function
>
> Hello everyone,
>
> First of all, i am sorry to be bothering this mailing list with a doubt i
> think it should be quite obvious unfortunately, i am not being able to fi=
nd
> out a solution to it. Also, i am not sure if this should go here or in the
> issues of the repositories. If this is not the right place i will gladly
> post it on github.
>
> I installed everything as said in github repos (tpm2-tss, tpm2-abrmd and
> tpm2-tools). I am trying to create an application (just a proof of concep=
t)
> with tpm2 and the first thing i am trying to do is call a function from t=
he
> library Esys (tss2/tss2_esys.h) to print a random number. Unfortunately,
> when i try to compile and link the application files the compiler/linker
> (gcc) says:
>
> *(if it is needed i can copy/paste the whole text)*
> *"undefined reference to `Esys_GetRandom'"*
>
> On the code, i am trying to make the same call that is made on tpm2-tools
> getrandom, so i dont think there is a problem with that call (and also it
> compiles correctly but doesn't link).
>
> I am using the flags i suppose are needed "-I/usr/local/include" for
> compilation (just to be sure) and "-L/usr/local/lib -ltss2-mu
> -ltss2-tcti-device -ltss2-sys -ltss2-esys" for the linking part (i also
> tried with the flags "-ltpm2sapi" which i found in another github repo. I
> was able to compile and use all the tools on the tpm2-tools repo, which
> makes me believe the problem is not in the libraries themselves but  any
> flags may be missing in my linking. Unfortunately, i tried with the flags=
 i
> could get from the Makefile it has on tpm2-tools but same result.
>
> Can anyone tell me what am i doing wrong? Or at least point me in the
> right direction?
> The OS is Ubuntu 18.04.1 LTS (in VMWare Workstation if it makes any
> difference).
>
> Thank you very much;
>
> --
> Ant=C3=B3nio Ribeiro
> +351 916045500 | antonio.ribeiro94(a)gmail.com
> Masters in Computer Science & Engineering
> New University of Lisbon - Faculty of Science and Technology
>


-- =

Ant=C3=B3nio Ribeiro
+351 916045500 | antonio.ribeiro94(a)gmail.com
Masters in Computer Science & Engineering
New University of Lisbon - Faculty of Science and Technology

--===============5272949648406417324==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+VGhhbmsgeW91IHZl
cnkgbXVjaCBpdCBpbmRlZWQgd29ya2VkIcKgPGRpdj48YnI+PC9kaXY+PGRpdj5JcyB0aGVyZSBh
bnkgc3BlY2lhbCByZWFzb24gZm9yIGl0IHRvIGhhdmUgdG8gY29tZSBhZnRlciB0aGUgc291cmNl
IGZpbGVzPyBJIHRob3VnaHQgdGhhdCB0aGUgbGlua2VyIHdvdWxkIGNyZWF0ZSB0aGUgc3ltYm9s
cyB0YWJsZSBhbmQgYWRkIGFueSAmcXVvdDtzeW1ib2wmcXVvdDsgaXQgZmluZHMgb3V0IHNvIHRo
YXQgd2hlbmV2ZXIgdGhleSBhcmUgbmVlZGVkIHRoZXkgd291bGQgYmUgc3Vic3RpdHV0ZWQuIChp
biB0aGlzIGNhc2UsIG15IHByb2dyYW0gd291bGQgYWRkIHRoZSAmcXVvdDtFc3lzX0dldFJhbmRv
bSZxdW90OyB0byB0aGUgdGFibGUgYW5kIHRoZW4gdGhlIGxpbmtlciB3b3VsZCBjaGVjayB0aGUg
ZmxhZyBhbmQgZ2V0IHRoZSBpbXBsZW1lbnRhdGlvbiBmb3IgdGhhdCBmdW5jdGlvbikuIEkgc2Vl
IGl0IGRvZXNuJiMzOTt0IHF1aXRlIHdvcmsgbGlrZSB0aGF0LCBhbnkgc3BlY2lhbCByZWFzb24g
b3IgaXMganVzdCBteSBtaXN1bmRlcnN0YW5kaW5nPzwvZGl2PjxkaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5Bbnl3YXksIGp1c3QgdG8gZ2l2ZSB0aGUgd2hvbGUgZXhwbGFuYXRpb24gdGhlIGNvbXBs
ZXRlIGluZm8gb2YgdGhpcyBwcm9ibGVtIChpZiBhbnlvbmUgaGFzIHRoZSBzYW1lIHByb2JsZW0p
PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5NeSBnY2MgY29tbWFuZCBmb3IgbGlua2lu
ZyB3YXPCoDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+JnF1b3Q7ZysrIC1XYWxsIC1nIC1wdGhy
ZWFkIC1zdGQ9YysrMTHCoCAtbHRzczItZXN5cyAtTC91c3IvbG9jYWwvbGliL8KgIC1vIC4uLy4u
Ly4uL2Jpbi9EZXZlbG9wZXIgRGV2ZWxvcGVyLm8mcXVvdDs8L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PldoZW4gaSBzd2l0Y2hlZCBpdCB0b8KgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4mcXVv
dDtnKysgLVdhbGwgLWcgLXB0aHJlYWQgLXN0ZD1jKysxMSAtbyAuLi8uLi8uLi9iaW4vRGV2ZWxv
cGVyIERldmVsb3Blci5vIC1sdHNzMi1lc3lzIC1ML3Vzci9sb2NhbC9saWIvJnF1b3Q7PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5JdCBsaW5rZWQgY29ycmVjdGx5LjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+QWdhaW4gdGhhbmsgeW91IHZlcnkgbXVjaCE8L2Rpdj48L2Rpdj48L2Rpdj48L2Rp
dj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFp
bF9hdHRyIj5GdWNocywgQW5kcmVhcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFuZHJlYXMuZnVjaHNA
c2l0LmZyYXVuaG9mZXIuZGUiPmFuZHJlYXMuZnVjaHNAc2l0LmZyYXVuaG9mZXIuZGU8L2E+Jmd0
OyBlc2NyZXZldSBubyBkaWEgZG9taW5nbywgMy8wMi8yMDE5IMOgKHMpIDA3OjIzOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+CgoKCgo8ZGl2Pgo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246bHRyO2ZvbnQtZmFtaWx5
OlRhaG9tYTtjb2xvcjpyZ2IoMCwwLDApO2ZvbnQtc2l6ZToxMHB0Ij4KPGRpdj5IaSBBbnRvbmlv
LDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSB0aGluayB3ZSB3b3VsZCBuZWVkIHRvIHNl
ZSB0aGUgY29tcGxldGUgZ2NjIGNvbW1hbmQuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5C
dXQgbWF5YmUgYSBmaXJzdCBoaW50OiBUaGUgLWx0c3MyLWVzeXMgbXVzdCBjb21lIEFGVEVSIHRo
ZSBzb3VyY2UgZmlsZSBvbiBjb21tYW5kbGluZS48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2
PkNoZWVycyw8L2Rpdj4KPGRpdj5BbmRyZWFzPGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Y29sb3I6
cmdiKDAsMCwwKTtmb250LXNpemU6MTZweCI+Cjxocj4KPGRpdiBpZD0iZ21haWwtbV8yNTAwOTE2
MDY5MDQ3ODE0MDY0ZGl2UnBGMTQ3NjQwIiBzdHlsZT0iZGlyZWN0aW9uOmx0ciI+PGZvbnQgc2l6
ZT0iMiIgZmFjZT0iVGFob21hIiBjb2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IHRwbTIgWzxh
IGhyZWY9Im1haWx0bzp0cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZzwvYT5dIG9uIGJlaGFsZiBvZiBBbnTDs25pbyBSaWJl
aXJvIFs8YSBocmVmPSJtYWlsdG86YW50b25pby5yaWJlaXJvOTRAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+YW50b25pby5yaWJlaXJvOTRAZ21haWwuY29tPC9hPl08YnI+CjxiPlNlbnQ6PC9i
PiBTdW5kYXksIEZlYnJ1YXJ5IDAzLCAyMDE5IDAzOjA2PGJyPgo8Yj5Ubzo8L2I+IDxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPjxicj4KPGI+U3ViamVjdDo8L2I+IFt0cG0yXSBDb21waWxpbmcvbGlua2luZyB0cG0y
IGFwcGxpY2F0aW9uIC0gdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBFc3lzIGZ1bmN0aW9uPGJyPgo8
L2ZvbnQ+PGJyPgo8L2Rpdj4KPGRpdj48L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+CjxkaXYg
ZGlyPSJsdHIiPgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+CjxkaXYgZGlyPSJsdHIi
Pgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2IGRp
cj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2PkhlbGxvIGV2ZXJ5
b25lLDwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+Rmlyc3Qgb2YgYWxsLCBpIGFtIHNvcnJ5
IHRvIGJlIGJvdGhlcmluZyB0aGlzIG1haWxpbmcgbGlzdCB3aXRoIGEgZG91YnQgaSB0aGluayBp
dCBzaG91bGQgYmUgcXVpdGUgb2J2aW91cyB1bmZvcnR1bmF0ZWx5LCBpIGFtIG5vdCBiZWluZyBh
YmxlIHRvIGZpbmQgb3V0IGEgc29sdXRpb24gdG8gaXQuIEFsc28sIGkgYW0gbm90IHN1cmUgaWYg
dGhpcyBzaG91bGQgZ28gaGVyZSBvciBpbiB0aGUgaXNzdWVzIG9mIHRoZSByZXBvc2l0b3JpZXMu
CiBJZiB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgcGxhY2UgaSB3aWxsIGdsYWRseSBwb3N0IGl0IG9u
IGdpdGh1Yi48L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2PkkgaW5zdGFsbGVkIGV2ZXJ5dGhp
bmcgYXMgc2FpZCBpbiBnaXRodWIgcmVwb3MgKHRwbTItdHNzLCB0cG0yLWFicm1kIGFuZCB0cG0y
LXRvb2xzKS7CoEkgYW0gdHJ5aW5nIHRvIGNyZWF0ZSBhbiBhcHBsaWNhdGlvbiAoanVzdCBhIHBy
b29mIG9mIGNvbmNlcHQpIHdpdGggdHBtMiBhbmQgdGhlIGZpcnN0IHRoaW5nIGkgYW0gdHJ5aW5n
IHRvIGRvIGlzIGNhbGwgYSBmdW5jdGlvbiBmcm9tIHRoZSBsaWJyYXJ5IEVzeXMgKHRzczIvdHNz
Ml9lc3lzLmgpCiB0byBwcmludCBhIHJhbmRvbSBudW1iZXIuIFVuZm9ydHVuYXRlbHksIHdoZW4g
aSB0cnkgdG8gY29tcGlsZSBhbmQgbGluayB0aGUgYXBwbGljYXRpb24gZmlsZXMgdGhlIGNvbXBp
bGVyL2xpbmtlciAoZ2NjKSBzYXlzOjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+PGk+KGlm
IGl0IGlzIG5lZWRlZCBpIGNhbiBjb3B5L3Bhc3RlIHRoZSB3aG9sZSB0ZXh0KTwvaT48L2Rpdj4K
PGRpdj4KPGRpdj48aT4mcXVvdDt1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBFc3lzX0dldFJhbmRv
bSYjMzk7JnF1b3Q7PC9pPjwvZGl2Pgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pk9uIHRo
ZSBjb2RlLCBpIGFtIHRyeWluZyB0byBtYWtlIHRoZSBzYW1lIGNhbGwgdGhhdCBpcyBtYWRlIG9u
IHRwbTItdG9vbHMgZ2V0cmFuZG9tLCBzbyBpIGRvbnQgdGhpbmsgdGhlcmUgaXMgYSBwcm9ibGVt
IHdpdGggdGhhdCBjYWxsIChhbmQgYWxzbyBpdCBjb21waWxlcyBjb3JyZWN0bHkgYnV0IGRvZXNu
JiMzOTt0IGxpbmspLjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSBhbSB1c2luZyB0aGUg
ZmxhZ3MgaSBzdXBwb3NlIGFyZSBuZWVkZWQgJnF1b3Q7LUkvdXNyL2xvY2FsL2luY2x1ZGUmcXVv
dDsgZm9yIGNvbXBpbGF0aW9uIChqdXN0IHRvIGJlIHN1cmUpIGFuZCAmcXVvdDstTC91c3IvbG9j
YWwvbGliIC1sdHNzMi1tdSAtbHRzczItdGN0aS1kZXZpY2UgLWx0c3MyLXN5cyAtbHRzczItZXN5
cyZxdW90OyBmb3IgdGhlIGxpbmtpbmcgcGFydCAoaSBhbHNvIHRyaWVkIHdpdGggdGhlIGZsYWdz
ICZxdW90Oy1sdHBtMnNhcGkmcXVvdDsgd2hpY2ggaSBmb3VuZCBpbgogYW5vdGhlciBnaXRodWIg
cmVwby4gSSB3YXMgYWJsZSB0byBjb21waWxlIGFuZCB1c2UgYWxsIHRoZSB0b29scyBvbiB0aGUg
dHBtMi10b29scyByZXBvLCB3aGljaCBtYWtlcyBtZSBiZWxpZXZlIHRoZSBwcm9ibGVtIGlzIG5v
dCBpbiB0aGUgbGlicmFyaWVzIHRoZW1zZWx2ZXMgYnV0wqAgYW55IGZsYWdzwqBtYXkgYmUgbWlz
c2luZyBpbiBteSBsaW5raW5nLiBVbmZvcnR1bmF0ZWx5LCBpIHRyaWVkIHdpdGggdGhlIGZsYWdz
IGkgY291bGQgZ2V0IGZyb20KIHRoZSBNYWtlZmlsZSBpdCBoYXMgb24gdHBtMi10b29scyBidXQg
c2FtZSByZXN1bHQuPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5DYW4gYW55b25lIHRlbGwg
bWUgd2hhdCBhbSBpIGRvaW5nIHdyb25nPyBPciBhdCBsZWFzdCBwb2ludCBtZSBpbiB0aGUgcmln
aHQgZGlyZWN0aW9uPzwvZGl2Pgo8ZGl2PlRoZSBPUyBpc8KgVWJ1bnR1IDE4LjA0LjEgTFRTIChp
biBWTVdhcmUgV29ya3N0YXRpb24gaWYgaXQgbWFrZXMgYW55IGRpZmZlcmVuY2UpLjwvZGl2Pgo8
ZGl2Pjxicj4KPC9kaXY+CjxkaXY+VGhhbmsgeW91IHZlcnkgbXVjaDs8L2Rpdj4KPGRpdj48YnI+
CjwvZGl2Pgo8ZGl2Pi0twqA8YnI+CjwvZGl2Pgo8ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWwt
bV8yNTAwOTE2MDY5MDQ3ODE0MDY0Z21haWwtbV85NzkxNjc5NzMyNzYyNTczMzVnbWFpbF9zaWdu
YXR1cmUiPgo8ZGl2IGRpcj0ibHRyIj4KPGRpdiBkaXI9Imx0ciI+QW50w7NuaW8gUmliZWlybzwv
ZGl2Pgo8ZGl2IGRpcj0ibHRyIj48Zm9udCBzaXplPSIxIiBjb2xvcj0iIzQ0NDQ0NCI+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLGhlbHZldGljYSxzYW5zLXNlcmlmIj4rMzUxIDkxNjA0
NTUwMMKgPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxoZWx2ZXRpY2Esc2Fu
cy1zZXJpZiI+fMKgPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTphcmlhbCxoZWx2ZXRp
Y2Esc2Fucy1zZXJpZiI+PGEgaHJlZj0ibWFpbHRvOmFudG9uaW8ucmliZWlybzk0QGdtYWlsLmNv
bSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+YW50b25pby5yaWJl
aXJvOTRAZ21haWwuY29tPC9hPjwvc3Bhbj48L2ZvbnQ+PC9kaXY+CjxkaXYgZGlyPSJsdHIiPjxm
b250IHN0eWxlPSJmb250LXNpemU6MTIuOHB4IiBjb2xvcj0iIzQ0NDQ0NCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZTp4LXNtYWxsIj5NYXN0ZXJzIGluIENvbXB1dGVyIFNjaWVuY2UgJmFtcDsgRW5n
aW5lZXJpbmfCoDwvc3Bhbj48L2ZvbnQ+PC9kaXY+CjxkaXYgZGlyPSJsdHIiPjxmb250IHNpemU9
IjEiIGNvbG9yPSIjNDQ0NDQ0Ij5OZXcgVW5pdmVyc2l0eSBvZiBMaXNib248L2ZvbnQ+PHNwYW4g
c3R5bGU9ImNvbG9yOnJnYig2OCw2OCw2OCk7Zm9udC1zaXplOngtc21hbGwiPsKgLSBGYWN1bHR5
IG9mIFNjaWVuY2UgYW5kIFRlY2hub2xvZ3k8L3NwYW4+PC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9k
aXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rp
dj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KCjwvYmxvY2txdW90
ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYgZGlyPSJs
dHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJsdHIi
PkFudMOzbmlvIFJpYmVpcm88L2Rpdj48ZGl2IGRpcj0ibHRyIj48Zm9udCBzaXplPSIxIiBjb2xv
cj0iIzQ0NDQ0NCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsLGhlbHZldGljYSxzYW5z
LXNlcmlmIj4rMzUxIDkxNjA0NTUwMMKgPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTph
cmlhbCxoZWx2ZXRpY2Esc2Fucy1zZXJpZiI+fMKgPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZh
bWlseTphcmlhbCxoZWx2ZXRpY2Esc2Fucy1zZXJpZiI+PGEgaHJlZj0ibWFpbHRvOmFudG9uaW8u
cmliZWlybzk0QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFudG9uaW8ucmliZWlybzk0QGdt
YWlsLmNvbTwvYT48L3NwYW4+PC9mb250PjwvZGl2PjxkaXYgZGlyPSJsdHIiPjxmb250IGNvbG9y
PSIjNDQ0NDQ0IiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZTp4LXNtYWxsIj5NYXN0ZXJzIGluIENvbXB1dGVyIFNjaWVuY2UgJmFtcDsgRW5naW5lZXJpbmfC
oDwvc3Bhbj48L2ZvbnQ+PC9kaXY+PGRpdiBkaXI9Imx0ciI+PGZvbnQgY29sb3I9IiM0NDQ0NDQi
IHNpemU9IjEiPk5ldyBVbml2ZXJzaXR5IG9mIExpc2JvbjwvZm9udD48c3BhbiBzdHlsZT0iY29s
b3I6cmdiKDY4LDY4LDY4KTtmb250LXNpemU6eC1zbWFsbCI+wqAtIEZhY3VsdHkgb2YgU2NpZW5j
ZSBhbmQgVGVjaG5vbG9neTwvc3Bhbj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============5272949648406417324==--

