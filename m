Content-Type: multipart/mixed; boundary="===============8372309128303246609=="
MIME-Version: 1.0
From: =?utf-8?q?Iratxe_Gonz=C3=A1lez_Garrido_=3Ciratxe=2Eggarrido_at_gmail=2Eco?=
 =?utf-8?q?m=3E?=
Subject: Re: [tpm2] [tpm2-tools] tools error while compiling
Date: Tue, 27 Aug 2019 13:07:00 +0200
Message-ID: <CAPSVqM2sWjdUwiG7uKoSVUEeuG+x6Lc0ebSDVGUB0RcLyNGXpQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DEED12@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8372309128303246609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I download everything from scratch, so TSS must be the newer version. But I
think your are right in the sense that the is building against old headers,
that is why I am trying to remove all the files the old version installed,
but till now I had no luck.

Thanks for your help

El lun., 26 ago. 2019 a las 22:51, Roberts, William C (<
william.c.roberts(a)intel.com>) escribi=C3=B3:

> You must not be on TSS 2.3 or greater.
>
> That commit came in 45c9c79 which is on tag 2.3.0:
> $ git tag --contains 45c9c790273f1ea6d5e51bac86fbcf2983f035f2
> 2.3.0
>
> On the tools is ca me in as 0d88935be88e9:
>
> $ git tag --contains 0d88935be88e9
> 4.0-rc0
> 4.0-rc1
> As well as being on master...
>
> The configure script should be verifying that
> ESYS is version 2.3.0 or higher:
> PKG_CHECK_MODULES([TSS2_ESYS], [tss2-esys >=3D 2.3.0])
>
> Is the version your building against the one you built. Did you install
> The newer TSS before configuring?
>
> Seems like it's getting passed configure but building against old headers.
>
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Iratxe
> Gonz=C3=A1lez
> > Garrido
> > Sent: Monday, August 26, 2019 12:39 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] [tpm2-tools] tools error while compiling
> >
> > Hello:
> >
> > I am trying to update my tpm2-tools to version 4 but I get this error
> message:
> >
> > pi(a)iotacar:~/tpm2-tools $ make -j5
> >   CC       lib/lib_libcommon_a-files.o
> >   CC       lib/lib_libcommon_a-log.o
> >   CC       lib/lib_libcommon_a-object.o
> >   CC       lib/lib_libcommon_a-pcr.o
> >   CC       lib/lib_libcommon_a-tpm2.o
> >   CC       lib/lib_libcommon_a-tpm2_alg_util.o
> >   CC       lib/lib_libcommon_a-tpm2_attr_util.o
> > lib/tpm2_alg_util.c: In function =E2=80=98tpm2_alg_util_for_each_alg=E2=
=80=99:
> > lib/tpm2_alg_util.c:66:33: error: =E2=80=98TPM2_ALG_CMAC=E2=80=99 undec=
lared (first use
> in this
> > function)
> >          { .name =3D "cmac", .id =3D TPM2_ALG_CMAC, .flags =3D
> tpm2_alg_util_flags_sig },
> >                                  ^~~~~~~~~~~~~
> > lib/tpm2_alg_util.c:66:33: note: each undeclared identifier is reported
> only once
> > for each function it appears in
> > Makefile:2618: recipe for target 'lib/lib_libcommon_a-tpm2_alg_util.o'
> failed
> > make: *** [lib/lib_libcommon_a-tpm2_alg_util.o] Error 1
> > make: *** Waiting for unfinished jobs....
> >
> >
> > I've tried uninstalling and reinstalling everything but I get the same
> error. I
> > installed it yesterday in another raspberry pi from scratch and it works
> without
> > problems, therefore I think I have some legacy files from the previous
> > installation, but I don't know what to delete. I have not encountered a=
ny
> > problems while installing tpms2-tss, tom2-abrmd or the TPM simulator,
> just with
> > tpm2-tools
> >
> > Can anyone help me?
> >
> > Thanks in advance
>
>

--===============8372309128303246609==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5JIGRvd25sb2FkIGV2ZXJ5dGhp
bmcgZnJvbSBzY3JhdGNoLCBzbyBUU1MgbXVzdCBiZSB0aGUgbmV3ZXIgdmVyc2lvbi4gQnV0IEkg
dGhpbmsgeW91ciBhcmUgcmlnaHQgaW4gdGhlIHNlbnNlIHRoYXQgdGhlIGlzIGJ1aWxkaW5nIGFn
YWluc3Qgb2xkIGhlYWRlcnMsIHRoYXQgaXMgd2h5IEkgYW0gdHJ5aW5nIHRvIHJlbW92ZSBhbGwg
dGhlIGZpbGVzIHRoZSBvbGQgdmVyc2lvbiBpbnN0YWxsZWQsIGJ1dCB0aWxsIG5vdyBJIGhhZCBu
byBsdWNrLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzIGZvciB5b3VyIGhlbHA8L2Rp
dj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNz
PSJnbWFpbF9hdHRyIj5FbCBsdW4uLCAyNiBhZ28uIDIwMTkgYSBsYXMgMjI6NTEsIFJvYmVydHMs
IFdpbGxpYW0gQyAoJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7KSBlc2NyaWJpw7M6PGJyPjwv
ZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4
IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5n
LWxlZnQ6MWV4Ij5Zb3UgbXVzdCBub3QgYmUgb24gVFNTIDIuMyBvciBncmVhdGVyLjxicj4KPGJy
PgpUaGF0IGNvbW1pdCBjYW1lIGluIDQ1YzljNzkgd2hpY2ggaXMgb24gdGFnIDIuMy4wOjxicj4K
JCBnaXQgdGFnIC0tY29udGFpbnMgNDVjOWM3OTAyNzNmMWVhNmQ1ZTUxYmFjODZmYmNmMjk4M2Yw
MzVmMjxicj4KMi4zLjA8YnI+Cjxicj4KT24gdGhlIHRvb2xzIGlzIGNhIG1lIGluIGFzIDBkODg5
MzViZTg4ZTk6PGJyPgo8YnI+CiQgZ2l0IHRhZyAtLWNvbnRhaW5zIDBkODg5MzViZTg4ZTk8YnI+
CjQuMC1yYzA8YnI+CjQuMC1yYzE8YnI+CkFzIHdlbGwgYXMgYmVpbmcgb24gbWFzdGVyLi4uPGJy
Pgo8YnI+ClRoZSBjb25maWd1cmUgc2NyaXB0IHNob3VsZCBiZSB2ZXJpZnlpbmcgdGhhdDxicj4K
RVNZUyBpcyB2ZXJzaW9uIDIuMy4wIG9yIGhpZ2hlcjo8YnI+ClBLR19DSEVDS19NT0RVTEVTKFtU
U1MyX0VTWVNdLCBbdHNzMi1lc3lzICZndDs9IDIuMy4wXSk8YnI+Cjxicj4KSXMgdGhlIHZlcnNp
b24geW91ciBidWlsZGluZyBhZ2FpbnN0IHRoZSBvbmUgeW91IGJ1aWx0LiBEaWQgeW91IGluc3Rh
bGw8YnI+ClRoZSBuZXdlciBUU1MgYmVmb3JlIGNvbmZpZ3VyaW5nPzxicj4KPGJyPgpTZWVtcyBs
aWtlIGl0JiMzOTtzIGdldHRpbmcgcGFzc2VkIGNvbmZpZ3VyZSBidXQgYnVpbGRpbmcgYWdhaW5z
dCBvbGQgaGVhZGVycy48YnI+Cjxicj4KPGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tPGJyPgomZ3Q7IEZyb206IHRwbTIgW21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1ib3Vu
Y2VzQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItYm91bmNlc0BsaXN0cy4wMS5v
cmc8L2E+XSBPbiBCZWhhbGYgT2YgSXJhdHhlIEdvbnrDoWxlejxicj4KJmd0OyBHYXJyaWRvPGJy
PgomZ3Q7IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI2LCAyMDE5IDEyOjM5IFBNPGJyPgomZ3Q7IFRv
OiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3ViamVjdDogW3RwbTJdIFt0cG0yLXRvb2xzXSB0
b29scyBlcnJvciB3aGlsZSBjb21waWxpbmc8YnI+CiZndDsgPGJyPgomZ3Q7IEhlbGxvOjxicj4K
Jmd0OyA8YnI+CiZndDsgSSBhbSB0cnlpbmcgdG8gdXBkYXRlIG15IHRwbTItdG9vbHMgdG8gdmVy
c2lvbiA0IGJ1dCBJIGdldCB0aGlzIGVycm9yIG1lc3NhZ2U6PGJyPgomZ3Q7IDxicj4KJmd0OyBw
aUBpb3RhY2FyOn4vdHBtMi10b29scyAkIG1ha2UgLWo1PGJyPgomZ3Q7wqAgwqBDQ8KgIMKgIMKg
IMKgbGliL2xpYl9saWJjb21tb25fYS1maWxlcy5vPGJyPgomZ3Q7wqAgwqBDQ8KgIMKgIMKgIMKg
bGliL2xpYl9saWJjb21tb25fYS1sb2cubzxicj4KJmd0O8KgIMKgQ0PCoCDCoCDCoCDCoGxpYi9s
aWJfbGliY29tbW9uX2Etb2JqZWN0Lm88YnI+CiZndDvCoCDCoENDwqAgwqAgwqAgwqBsaWIvbGli
X2xpYmNvbW1vbl9hLXBjci5vPGJyPgomZ3Q7wqAgwqBDQ8KgIMKgIMKgIMKgbGliL2xpYl9saWJj
b21tb25fYS10cG0yLm88YnI+CiZndDvCoCDCoENDwqAgwqAgwqAgwqBsaWIvbGliX2xpYmNvbW1v
bl9hLXRwbTJfYWxnX3V0aWwubzxicj4KJmd0O8KgIMKgQ0PCoCDCoCDCoCDCoGxpYi9saWJfbGli
Y29tbW9uX2EtdHBtMl9hdHRyX3V0aWwubzxicj4KJmd0OyBsaWIvdHBtMl9hbGdfdXRpbC5jOiBJ
biBmdW5jdGlvbiDigJh0cG0yX2FsZ191dGlsX2Zvcl9lYWNoX2FsZ+KAmTo8YnI+CiZndDsgbGli
L3RwbTJfYWxnX3V0aWwuYzo2NjozMzogZXJyb3I6IOKAmFRQTTJfQUxHX0NNQUPigJkgdW5kZWNs
YXJlZCAoZmlyc3QgdXNlIGluIHRoaXM8YnI+CiZndDsgZnVuY3Rpb24pPGJyPgomZ3Q7wqAgwqAg
wqAgwqAgwqAgeyAubmFtZSA9ICZxdW90O2NtYWMmcXVvdDssIC5pZCA9IFRQTTJfQUxHX0NNQUMs
IC5mbGFncyA9IHRwbTJfYWxnX3V0aWxfZmxhZ3Nfc2lnIH0sPGJyPgomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXn5+fn5+fn5+fn5+fjxicj4K
Jmd0OyBsaWIvdHBtMl9hbGdfdXRpbC5jOjY2OjMzOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRl
bnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2U8YnI+CiZndDsgZm9yIGVhY2ggZnVuY3Rpb24g
aXQgYXBwZWFycyBpbjxicj4KJmd0OyBNYWtlZmlsZToyNjE4OiByZWNpcGUgZm9yIHRhcmdldCAm
IzM5O2xpYi9saWJfbGliY29tbW9uX2EtdHBtMl9hbGdfdXRpbC5vJiMzOTsgZmFpbGVkPGJyPgom
Z3Q7IG1ha2U6ICoqKiBbbGliL2xpYl9saWJjb21tb25fYS10cG0yX2FsZ191dGlsLm9dIEVycm9y
IDE8YnI+CiZndDsgbWFrZTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi48YnI+
CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBJJiMzOTt2ZSB0cmllZCB1bmluc3RhbGxpbmcgYW5k
IHJlaW5zdGFsbGluZyBldmVyeXRoaW5nIGJ1dCBJIGdldCB0aGUgc2FtZSBlcnJvci4gSTxicj4K
Jmd0OyBpbnN0YWxsZWQgaXQgeWVzdGVyZGF5IGluIGFub3RoZXIgcmFzcGJlcnJ5IHBpIGZyb20g
c2NyYXRjaCBhbmQgaXQgd29ya3Mgd2l0aG91dDxicj4KJmd0OyBwcm9ibGVtcywgdGhlcmVmb3Jl
IEkgdGhpbmsgSSBoYXZlIHNvbWUgbGVnYWN5IGZpbGVzIGZyb20gdGhlIHByZXZpb3VzPGJyPgom
Z3Q7IGluc3RhbGxhdGlvbiwgYnV0IEkgZG9uJiMzOTt0IGtub3cgd2hhdCB0byBkZWxldGUuIEkg
aGF2ZSBub3QgZW5jb3VudGVyZWQgYW55PGJyPgomZ3Q7IHByb2JsZW1zIHdoaWxlIGluc3RhbGxp
bmcgdHBtczItdHNzLCB0b20yLWFicm1kIG9yIHRoZSBUUE0gc2ltdWxhdG9yLCBqdXN0IHdpdGg8
YnI+CiZndDsgdHBtMi10b29sczxicj4KJmd0OyA8YnI+CiZndDsgQ2FuIGFueW9uZSBoZWxwIG1l
Pzxicj4KJmd0OyA8YnI+CiZndDsgVGhhbmtzIGluIGFkdmFuY2U8YnI+Cjxicj4KPC9ibG9ja3F1
b3RlPjwvZGl2Pgo=

--===============8372309128303246609==--

