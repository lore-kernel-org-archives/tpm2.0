Content-Type: multipart/mixed; boundary="===============0279145677914929425=="
MIME-Version: 1.0
From: Rajkumar K Sivasamy <rajkumar.k.sivasamy at gmail.com>
Subject: [tpm2] Re: "tpm2_import" Integrity Check issue on a Big Endian 32 Bit
 Platform
Date: Fri, 03 Dec 2021 10:32:53 +0530
Message-ID: <CADu5HqwHtao46dmH0xuZn_15mtS1LtLa=4HiFcXaVPTQYHo=_g@mail.gmail.com>
In-Reply-To: DM6PR11MB3434FA09CDE4375E3E56A9DAB8699@DM6PR11MB3434.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0279145677914929425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-   tpm2-tss 3.1.0 and Tpm2-tools 5.2 2021-09-2 8=3D=3D> tpm2_import fails =
with
error 0x3DF
-   tpm2-tss 3.0.4 and Tpm2-tools 5.2 2021-09-28 =3D=3D> tpm2_import fails =
with
error 0x3DF
-   tpm2-tss 3.0.4 and Tpm2-tools 5.2 =3D=3D> tpm2_import succeeds

Why are you putting dates on some of the tpm2-tools versions but not
tpm2-tss?
[Raj] TPM2 Tools Master has this date code "2021-09-28" at "
https://github.com/tpm2-software/tpm2-tools" for the version, hence I have
used it to indicate the source code version of tpm2-tools which I
downloaded from https://github.com/tpm2-software/tpm2-tools

tpm2-tools 5.2 source was downloaded from link:
https://github.com/tpm2-software/tpm2-tools/releases/download/5.2/tpm2-tool=
s-5.2.tar.gz
tpm2-tss 3.1.0 was downloaded from https://github.com/tpm2-software/tpm2-tss
tpm2-tss 3.0.4 was downloaded from
https://github.com/tpm2-software/tpm2-tss/releases/download/3.0.4/tpm2-tss-=
3.0.4.tar.gz

Let me know if you would need any further information.

Regards
Raj

On Fri, Dec 3, 2021 at 3:55 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> > From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com>
> > Sent: Thursday, December 2, 2021 2:41 PM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>; Desai, Imran <
> imran.desai(a)intel.com>
> > Subject: Re: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian
> 32 Bit Platform
>
> > Hello William
>
> > I am using below versions:
> > tpm2-tss 3.1.0
> > tpm2-tools 5.2 2021-09-28
>
> > To further narrow down, I replaced tpm2-tss 3.1.0 with tpm2-tss 3.0.4
> and tpm2_import still failed with 0x3DF.
>
> > Now along with tpm2-tss- 3.0.4 I used tpm2-tools 5.2 and tpm2_import
> succeeds; seems to be a problem with tpm2-tools t.2 2021-09-28.
>
> I'm confused. I read both these lines as I used tpm2-tss 3.0.4 and
> tpm2-tools 5.2 and it succeeds and fails. Why are you putting dates on so=
me
> of
> the tpm2-tools versions but not tpm2-tss?
>
>
> > Regards
> > Raj
>
> >  On Thu, Dec 2, 2021 at 8:44 PM Roberts, William C <
> william.c.roberts(a)intel.com> wrote:
> > + Imran
>
> > What version of tools and tss are you running?
>
> > I just noticed that the tools CI doesn't have the multi-arch images
> enabled. Let me investigate adding this and see if I can reproduce.
>
> > From: Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com>
> > Sent: Wednesday, December 1, 2021 11:40 PM
> > To: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> > Subject: [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 32
> Bit Platform
>
> > Hello Team
>
> > I am trying to use tpm2_import on a Big Endian 32 Bit platform and
> running into following error:
>
> >
> -------------------------------------------------------------------------=
-------------------------------------------------------
>
> > Command:
> > openssl genrsa -out private.pem 2048
> > tpm2_import -C 0x81000001 -G rsa -i private.pem -u key.pub -r key.priv
>
> > Error:
> > ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish
> ErrorCode (0x000003df)
> > ERROR: Esys_HMAC(0x3DF) - tpm:parameter(3):integrity check failed
> > ERROR: Unable to run tpm2_import
> >
> -------------------------------------------------------------------------=
-------------------------------------------------------
>
>
> > Need pointers to debug this issue.
> > Have any of you come across this error with tpm2_import on Big Endian 32
> Bit Platform? Do we have a fix Or can you provide inputs on the source
> where I can look > at for further debugging?
>
> > Thanks
> > Raj

--===============0279145677914929425==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj4tIMKgCgoKCgoKCgoKCgoKCgoKCgo8c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj50
cG0yLXRzcyAzLjEuMDwvc3Bhbj4gYW5kIAoKCgoKCgoKCgoKCgoKCgoKPHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+
VHBtMi10b29scyA1LjIgMjAyMS0wOS0yIDg8L3NwYW4+PT0mZ3Q7IHRwbTJfaW1wb3J0IGZhaWxz
IHdpdGggZXJyb3IgMHgzREY8YnI+PC9kaXY+PGRpdj4tIArCoCB0cG0yLXRzcyA8c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmIj4zLjAuNDwvc3Bhbj4gYW5kIAoKCgoKCgoKCgoKCgoKCgoKCjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTFwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPlRw
bTItdG9vbHMgNS4yIDIwMjEtMDktMjggPC9zcGFuPj09Jmd0OyB0cG0yX2ltcG9ydCBmYWlscyB3
aXRoIGVycm9yIDB4M0RGCgo8L2Rpdj48ZGl2PgotIArCoCB0cG0yLXRzcyA8c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlm
Ij4zLjAuNDwvc3Bhbj4gYW5kIAoKCgoKCgoKCgoKCgoKCgoKCjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTFwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPlRwbTIt
dG9vbHMgNS4yIDwvc3Bhbj49PSZndDsgdHBtMl9pbXBvcnQgc3VjY2VlZHM8L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PldoeSBhcmUgeW91IHB1dHRpbmcgZGF0ZXMgb24gc29tZSBvZiB0aGUgdHBt
Mi10b29scyB2ZXJzaW9ucyBidXQgbm90IHRwbTItdHNzPzxzcGFuIGNsYXNzPSJnbWFpbC1pbSBn
bWFpbC1IT0VuWmIiPjxicj48L3NwYW4+Cgo8L2Rpdj48ZGl2PltSYWpdIFRQTTIgVG9vbHMgTWFz
dGVyIGhhcyB0aGlzIGRhdGUgY29kZSAmcXVvdDsyMDIxLTA5LTI4JnF1b3Q7IGF0ICZxdW90Ozxh
IGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMiPmh0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHM8L2E+JnF1b3Q7IGZvciB0aGUg
dmVyc2lvbiwgaGVuY2UgSSBoYXZlIHVzZWQgaXQgdG8gaW5kaWNhdGUgdGhlIHNvdXJjZSBjb2Rl
IHZlcnNpb24gb2YgdHBtMi10b29scyB3aGljaCBJIGRvd25sb2FkZWQgZnJvbSA8YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzIj5odHRwczovL2dpdGh1
Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzPC9hPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+dHBtMi10b29scyA1LjIgc291cmNlIHdhcyBkb3dubG9hZGVkIGZyb20gbGluazogPGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9yZWxlYXNlcy9k
b3dubG9hZC81LjIvdHBtMi10b29scy01LjIudGFyLmd6Ij5odHRwczovL2dpdGh1Yi5jb20vdHBt
Mi1zb2Z0d2FyZS90cG0yLXRvb2xzL3JlbGVhc2VzL2Rvd25sb2FkLzUuMi90cG0yLXRvb2xzLTUu
Mi50YXIuZ3o8L2E+PC9kaXY+PGRpdj50cG0yLXRzcyAzLjEuMCB3YXMgZG93bmxvYWRlZCBmcm9t
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdHNzIj5odHRw
czovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzczwvYT48L2Rpdj48ZGl2PnRwbTIt
dHNzIDMuMC40IHdhcyBkb3dubG9hZGVkIGZyb20gPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29t
L3RwbTItc29mdHdhcmUvdHBtMi10c3MvcmVsZWFzZXMvZG93bmxvYWQvMy4wLjQvdHBtMi10c3Mt
My4wLjQudGFyLmd6Ij5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy9y
ZWxlYXNlcy9kb3dubG9hZC8zLjAuNC90cG0yLXRzcy0zLjAuNC50YXIuZ3o8L2E+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5MZXQgbWUga25vdyBpZiB5b3Ugd291bGQgbmVlZCBhbnkgZnVydGhl
ciBpbmZvcm1hdGlvbi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJlZ2FyZHM8YnI+PC9kaXY+
PGRpdj5SYWo8YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2
IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gRnJpLCBEZWMgMywgMjAyMSBhdCAzOjU1
IEFNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2Jl
cnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6
PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
cHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtw
YWRkaW5nLWxlZnQ6MWV4Ij4mZ3Q7IEZyb206IFJhamt1bWFyIEsgU2l2YXNhbXkgJmx0OzxhIGhy
ZWY9Im1haWx0bzpyYWprdW1hci5rLnNpdmFzYW15QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PnJhamt1bWFyLmsuc2l2YXNhbXlAZ21haWwuY29tPC9hPiZndDs8YnI+CiZndDsgU2VudDogVGh1
cnNkYXksIERlY2VtYmVyIDIsIDIwMjEgMjo0MSBQTTxicj4KJmd0OyBUbzogUm9iZXJ0cywgV2ls
bGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZn
dDsgQ2M6IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0OzsgRGVzYWksIElt
cmFuICZsdDs8YSBocmVmPSJtYWlsdG86aW1yYW4uZGVzYWlAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+aW1yYW4uZGVzYWlAaW50ZWwuY29tPC9hPiZndDs8YnI+CiZndDsgU3ViamVjdDogUmU6
IFt0cG0yXSAmcXVvdDt0cG0yX2ltcG9ydCZxdW90OyBJbnRlZ3JpdHkgQ2hlY2sgaXNzdWUgb24g
YSBCaWcgRW5kaWFuIDMyIEJpdCBQbGF0Zm9ybSA8YnI+CsKgPGJyPgomZ3Q7IEhlbGxvIFdpbGxp
YW08YnI+Cjxicj4KJmd0OyBJIGFtIHVzaW5nIGJlbG93IHZlcnNpb25zOjxicj4KJmd0OyB0cG0y
LXRzcyAzLjEuMDxicj4KJmd0OyB0cG0yLXRvb2xzIDUuMiAyMDIxLTA5LTI4PGJyPgo8YnI+CiZn
dDsgVG8gZnVydGhlciBuYXJyb3cgZG93biwgSSByZXBsYWNlZCB0cG0yLXRzcyAzLjEuMCB3aXRo
IHRwbTItdHNzIDMuMC40IGFuZCB0cG0yX2ltcG9ydCBzdGlsbCBmYWlsZWQgd2l0aCAweDNERi48
YnI+Cjxicj4KJmd0OyBOb3cgYWxvbmcgd2l0aCB0cG0yLXRzcy0gMy4wLjQgSSB1c2VkIHRwbTIt
dG9vbHMgNS4yIGFuZCB0cG0yX2ltcG9ydCBzdWNjZWVkczsgc2VlbXMgdG8gYmUgYSBwcm9ibGVt
IHdpdGggdHBtMi10b29scyB0LjIgMjAyMS0wOS0yOC48YnI+Cjxicj4KSSYjMzk7bSBjb25mdXNl
ZC4gSSByZWFkIGJvdGggdGhlc2UgbGluZXMgYXMgSSB1c2VkIHRwbTItdHNzIDMuMC40IGFuZCB0
cG0yLXRvb2xzIDUuMiBhbmQgaXQgc3VjY2VlZHMgYW5kIGZhaWxzLiBXaHkgYXJlIHlvdSBwdXR0
aW5nIGRhdGVzIG9uIHNvbWUgb2Y8YnI+CnRoZSB0cG0yLXRvb2xzIHZlcnNpb25zIGJ1dCBub3Qg
dHBtMi10c3M/PGJyPgo8YnI+Cjxicj4KJmd0OyBSZWdhcmRzPGJyPgomZ3Q7IFJhajxicj4KPGJy
PgomZ3Q7wqAgT24gVGh1LCBEZWMgMiwgMjAyMSBhdCA4OjQ0IFBNIFJvYmVydHMsIFdpbGxpYW0g
QyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4K
Jmd0OyArIEltcmFuPGJyPgo8YnI+CiZndDsgV2hhdCB2ZXJzaW9uIG9mIHRvb2xzIGFuZCB0c3Mg
YXJlIHlvdSBydW5uaW5nPzxicj4KPGJyPgomZ3Q7IEkganVzdCBub3RpY2VkIHRoYXQgdGhlIHRv
b2xzIENJIGRvZXNuJiMzOTt0IGhhdmUgdGhlIG11bHRpLWFyY2ggaW1hZ2VzIGVuYWJsZWQuIExl
dCBtZSBpbnZlc3RpZ2F0ZSBhZGRpbmcgdGhpcyBhbmQgc2VlIGlmIEkgY2FuIHJlcHJvZHVjZS48
YnI+Cjxicj4KJmd0OyBGcm9tOiBSYWprdW1hciBLIFNpdmFzYW15ICZsdDs8YSBocmVmPSJtYWls
dG86cmFqa3VtYXIuay5zaXZhc2FteUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5yYWprdW1h
ci5rLnNpdmFzYW15QGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgomZ3Q7IFNlbnQ6IFdlZG5lc2RheSwg
RGVjZW1iZXIgMSwgMjAyMSAxMTo0MCBQTTxicj4KJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRw
bTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZs
dDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0y
QGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSAmcXVvdDt0cG0y
X2ltcG9ydCZxdW90OyBJbnRlZ3JpdHkgQ2hlY2sgaXNzdWUgb24gYSBCaWcgRW5kaWFuIDMyIEJp
dCBQbGF0Zm9ybSA8YnI+CsKgwqA8YnI+CiZndDsgSGVsbG8gVGVhbTxicj4KPGJyPgomZ3Q7IEkg
YW0gdHJ5aW5nIHRvIHVzZSB0cG0yX2ltcG9ydCBvbiBhIEJpZyBFbmRpYW4gMzIgQml0IHBsYXRm
b3JtIGFuZCBydW5uaW5nIGludG8gZm9sbG93aW5nIGVycm9yOjxicj4KPGJyPgomZ3Q7IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tPGJyPgo8YnI+CiZndDsgQ29tbWFuZDogPGJyPgomZ3Q7IG9wZW5zc2wgZ2VucnNh
IC1vdXQgcHJpdmF0ZS5wZW0gMjA0ODxicj4KJmd0OyB0cG0yX2ltcG9ydCAtQyAweDgxMDAwMDAx
IC1HIHJzYSAtaSBwcml2YXRlLnBlbSAtdSBrZXkucHViIC1yIGtleS5wcml2PGJyPgo8YnI+CiZn
dDsgRXJyb3I6PGJyPgomZ3Q7IEVSUk9SOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19JbXBv
cnQuYzoxMTA6RXN5c19JbXBvcnQoKSBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDAzZGYp
PGJyPgomZ3Q7IEVSUk9SOiBFc3lzX0hNQUMoMHgzREYpIC0gdHBtOnBhcmFtZXRlcigzKTppbnRl
Z3JpdHkgY2hlY2sgZmFpbGVkPGJyPgomZ3Q7IEVSUk9SOiBVbmFibGUgdG8gcnVuIHRwbTJfaW1w
b3J0PGJyPgomZ3Q7IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIDxicj4KPGJyPgomZ3Q7IE5lZWQgcG9pbnRlcnMg
dG8gZGVidWcgdGhpcyBpc3N1ZS48YnI+CiZndDsgSGF2ZSBhbnkgb2YgeW91IGNvbWUgYWNyb3Nz
IHRoaXMgZXJyb3Igd2l0aCB0cG0yX2ltcG9ydCBvbiBCaWcgRW5kaWFuIDMyIEJpdCBQbGF0Zm9y
bT8gRG8gd2UgaGF2ZSBhIGZpeCBPciBjYW4geW91IHByb3ZpZGUgaW5wdXRzIG9uIHRoZSBzb3Vy
Y2Ugd2hlcmUgSSBjYW4gbG9vayAmZ3Q7IGF0IGZvciBmdXJ0aGVyIGRlYnVnZ2luZz88YnI+Cjxi
cj4KJmd0OyBUaGFua3M8YnI+CiZndDsgUmFqPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============0279145677914929425==--

