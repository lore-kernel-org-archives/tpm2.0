Content-Type: multipart/mixed; boundary="===============6013662183552529809=="
MIME-Version: 1.0
From: Arun Sudhir <arunsudhir19 at gmail.com>
Subject: [tpm2] Re: tpm2-tools port to windows
Date: Thu, 10 Oct 2019 14:06:48 -0700
Message-ID: <CAJLNp_WyKuKGbuM=AstEL1x=Gqnw9TrDWaYCkwq69zOnknVZ2Q@mail.gmail.com>
In-Reply-To: CAMCD9Mv6pq7KtV5JcX+tUvbLaOHmjQ0akey-9DgjezQBPZvwMA@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6013662183552529809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sounds good. Right now, I have it building in 2019 community. Will
definitely put it in GitHub replete with the sln and vcxproj so that things
just work out of the box.

On Thu, Oct 10, 2019, 1:36 PM Roberto Carvalho <
roberto.nogueira.rc(a)gmail.com> wrote:

> Hi, I'm very interested in running tpm2-tools on windows, it would be nice
> to upload github and also the step by step to compile in visual studio 20=
17.
>
>
>
> Em qui, 10 de out de 2019 =C3=A0s 17:31, Arun Sudhir <arunsudhir19(a)gmai=
l.com>
> escreveu:
>
>> I have been workig on porting tpm2-tools to build on windows and have got
>> it to build successfully and run commands like tpm2_startup,
>> tpm2_getrandom, tpm2_createprimary , tpm2_create, tpm2_evictcontrol ,
>> tpm2_makecredential etc. Is there any interest in this windows port ? I =
can
>> publish it on github if there is. I presume it would be useful... Though=
ts?
>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>

--===============6013662183552529809==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPlNvdW5kcyBnb29kLiBSaWdodCBub3csIEkgaGF2ZSBpdCBidWlsZGlu
ZyBpbiAyMDE5IGNvbW11bml0eS4gV2lsbCBkZWZpbml0ZWx5IHB1dCBpdCBpbiBHaXRIdWIgcmVw
bGV0ZSB3aXRoIHRoZSBzbG4gYW5kIHZjeHByb2ogc28gdGhhdCB0aGluZ3MganVzdCB3b3JrIG91
dCBvZiB0aGUgYm94LjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9
Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFRodSwgT2N0IDEwLCAyMDE5LCAxOjM2IFBNIFJv
YmVydG8gQ2FydmFsaG8gJmx0OzxhIGhyZWY9Im1haWx0bzpyb2JlcnRvLm5vZ3VlaXJhLnJjQGdt
YWlsLmNvbSI+cm9iZXJ0by5ub2d1ZWlyYS5yY0BnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+
PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAw
IC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBk
aXI9Imx0ciI+SGksIEkmIzM5O20gdmVyeSBpbnRlcmVzdGVkIGluIHJ1bm5pbmcgdHBtMi10b29s
cyBvbiB3aW5kb3dzLCBpdCB3b3VsZCBiZSBuaWNlIHRvIHVwbG9hZCBnaXRodWIgYW5kIGFsc28g
dGhlIHN0ZXAgYnkgc3RlcCB0byBjb21waWxlIGluIHZpc3VhbCBzdHVkaW8gMjAxNy48YnI+PGRp
dj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1
b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+RW0gcXVpLCAxMCBkZSBvdXQg
ZGUgMjAxOSDDoHMgMTc6MzEsIEFydW4gU3VkaGlyICZsdDs8YSBocmVmPSJtYWlsdG86YXJ1bnN1
ZGhpcjE5QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+YXJ1bnN1
ZGhpcjE5QGdtYWlsLmNvbTwvYT4mZ3Q7IGVzY3JldmV1Ojxicj48L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBk
aXI9Imx0ciI+SSBoYXZlIGJlZW4gd29ya2lnIG9uIHBvcnRpbmcgdHBtMi10b29scyB0byBidWls
ZCBvbiB3aW5kb3dzIGFuZCBoYXZlIGdvdCBpdCB0byBidWlsZCBzdWNjZXNzZnVsbHkgYW5kIHJ1
biBjb21tYW5kcyBsaWtlIHRwbTJfc3RhcnR1cCwgdHBtMl9nZXRyYW5kb20sIHRwbTJfY3JlYXRl
cHJpbWFyeSAsIHRwbTJfY3JlYXRlLCB0cG0yX2V2aWN0Y29udHJvbCAsIHRwbTJfbWFrZWNyZWRl
bnRpYWwgZXRjLiBJcyB0aGVyZSBhbnkgaW50ZXJlc3QgaW4gdGhpcyB3aW5kb3dzIHBvcnQgPyBJ
IGNhbiBwdWJsaXNoIGl0IG9uIGdpdGh1YiBpZiB0aGVyZSBpcy4gSSBwcmVzdW1lIGl0IHdvdWxk
IGJlIHVzZWZ1bC4uLiBUaG91Z2h0cz88L2Rpdj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX188YnI+CnRwbTIgbWFpbGluZyBsaXN0IC0tIDxhIGhyZWY9Im1h
aWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+
dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
IHJlbD0ibm9yZWZlcnJlciI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgolKHdlYl9w
YWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpczwvYmxvY2txdW90
ZT48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============6013662183552529809==--

