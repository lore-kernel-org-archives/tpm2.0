Content-Type: multipart/mixed; boundary="===============6689379874496005512=="
MIME-Version: 1.0
From: Rajkumar K Sivasamy <rajkumar.k.sivasamy at gmail.com>
Subject: [tpm2] Re: "tpm2_import" Integrity Check issue on a Big Endian 32 Bit
 Platform
Date: Fri, 03 Dec 2021 02:11:22 +0530
Message-ID: <CADu5HqxAtjB6z-_0JX+GAauNL7v7jb1w_ogNecf=zy6VPhK36A@mail.gmail.com>
In-Reply-To: DM6PR11MB3434E92D56A7B032A597ED59B8699@DM6PR11MB3434.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6689379874496005512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello William

I am using below versions:

   1. tpm2-tss 3.1.0
   2. tpm2-tools 5.2 2021-09-28


To further narrow down, I replaced tpm2-tss 3.1.0 with tpm2-tss 3.0.4 and
tpm2_import still failed with 0x3DF.

Now along with tpm2-tss- 3.0.4 I used tpm2-tools 5.2 and tpm2_import
succeeds; seems to be a problem with tpm2-tools t.2 2021-09-28.

Regards
Raj

On Thu, Dec 2, 2021 at 8:44 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> + Imran
>
> What version of tools and tss are you running?
>
> I just noticed that the tools CI doesn't have the multi-arch images
> enabled. Let me investigate adding this and see if I can reproduce.
> ------------------------------
> *From:* Rajkumar K Sivasamy <rajkumar.k.sivasamy(a)gmail.com>
> *Sent:* Wednesday, December 1, 2021 11:40 PM
> *To:* tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> *Subject:* [tpm2] "tpm2_import" Integrity Check issue on a Big Endian 32
> Bit Platform
>
> Hello Team
>
> I am trying to use tpm2_import on a Big Endian 32 Bit platform and running
> into following error:
>
>
> -------------------------------------------------------------------------=
-------------------------------------------------------
>
> *Command: *
>
>    1.
>
>    openssl genrsa -out private.pem 2048
>    2. tpm2_import -C 0x81000001 -G rsa -i private.pem -u key.pub -r
>    key.priv
>
>
> *Error:*
> ERROR:esys:src/tss2-esys/api/Esys_Import.c:110:Esys_Import() Esys Finish
> ErrorCode (0x000003df)
> ERROR: Esys_HMAC(0x3DF) - tpm:parameter(3):integrity check failed
> ERROR: Unable to run tpm2_import
> -------------------------------------------------------------------------=
-------------------------------------------------------
>
>
> Need pointers to debug this issue.
> Have any of you come across this error with tpm2_import on Big Endian 32
> Bit Platform? Do we have a fix Or can you provide inputs on the source
> where I can look at for further debugging?
>
> Thanks
> Raj
>

--===============6689379874496005512==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IZWxsbyBXaWxsaWFtPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JIGFtIHVzaW5nIGJlbG93IHZlcnNpb25zOjwvZGl2PjxkaXY+CgoKCgoKCgoKCgoKCgoKCgoK
CjxvbCBzdHlsZT0ibWFyZ2luLXRvcDowaW47bWFyZ2luLWJvdHRvbTowaW4iIHR5cGU9ImEiIHN0
YXJ0PSIxIj48bGkgY2xhc3M9ImdtYWlsLU1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW46
MGluO2ZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1z
ZXJpZiI+PHNwYW4+dHBtMi10c3MKICAgICAzLjEuMDxzcGFuPjwvc3Bhbj48L3NwYW4+PC9saT48
bGkgY2xhc3M9ImdtYWlsLU1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW46MGluO2ZvbnQt
c2l6ZToxMXB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+PHNw
YW4+dHBtMi10b29scyA1LjIgMjAyMS0wOS0yODwvc3Bhbj48L2xpPjwvb2w+PGRpdj48YnI+PC9k
aXY+PGRpdj5UbyBmdXJ0aGVyIG5hcnJvdyBkb3duLCBJIHJlcGxhY2VkIHRwbTItdHNzIDMuMS4w
IHdpdGg8c3BhbiBsYW5nPSJFTi1TRyI+IHRwbTItdHNzCiAgICAgMy4wLjQ8c3Bhbj48L3NwYW4+
PC9zcGFuPiBhbmQgdHBtMl9pbXBvcnQgc3RpbGwgZmFpbGVkIHdpdGggMHgzREYuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5Ob3cgYWxvbmcgd2l0aCB0cG0yLXRzcy0gMy4wLjQgSSB1c2VkIHRw
bTItdG9vbHMgNS4yIGFuZCB0cG0yX2ltcG9ydCBzdWNjZWVkczsgc2VlbXMgdG8gYmUgYSBwcm9i
bGVtIHdpdGggdHBtMi10b29scyB0LjIgMjAyMS0wOS0yOC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PlJlZ2FyZHM8L2Rpdj48ZGl2PlJhajxicj48L2Rpdj4KCgoKCgo8L2Rpdj48L2Rpdj48YnI+
PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRy
Ij5PbiBUaHUsIERlYyAyLCAyMDIxIGF0IDg6NDQgUE0gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8
YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0
OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPgoKCgoKPGRpdiBk
aXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNh
LHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+CisgSW1yYW48L2Rp
dj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1z
ZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPGJyPgo8L2Rpdj4KPGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250
LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KV2hhdCB2ZXJzaW9uIG9mIHRvb2xzIGFuZCB0
c3MgYXJlIHlvdSBydW5uaW5nPzwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJp
LEFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAs
MCkiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhl
bHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgpJIGp1
c3Qgbm90aWNlZCB0aGF0IHRoZSB0b29scyBDSSBkb2VzbiYjMzk7dCBoYXZlIHRoZSBtdWx0aS1h
cmNoIGltYWdlcyBlbmFibGVkLiBMZXQgbWUgaW52ZXN0aWdhdGUgYWRkaW5nIHRoaXMgYW5kIHNl
ZSBpZiBJIGNhbiByZXByb2R1Y2UuPC9kaXY+CjxkaXYgaWQ9ImdtYWlsLW1fMTk4OTMzNTI2MTIx
NTMzNDAyMmFwcGVuZG9uc2VuZCI+PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTppbmxpbmUtYmxv
Y2s7d2lkdGg6OTglIj4KPGRpdiBpZD0iZ21haWwtbV8xOTg5MzM1MjYxMjE1MzM0MDIyZGl2UnBs
eUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IHN0eWxlPSJmb250LXNpemU6MTFwdCIgZmFjZT0iQ2Fs
aWJyaSwgc2Fucy1zZXJpZiIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBSYWprdW1hciBL
IFNpdmFzYW15ICZsdDs8YSBocmVmPSJtYWlsdG86cmFqa3VtYXIuay5zaXZhc2FteUBnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIj5yYWprdW1hci5rLnNpdmFzYW15QGdtYWlsLmNvbTwvYT4mZ3Q7
PGJyPgo8Yj5TZW50OjwvYj4gV2VkbmVzZGF5LCBEZWNlbWJlciAxLCAyMDIxIDExOjQwIFBNPGJy
Pgo8Yj5Ubzo8L2I+IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4K
PGI+U3ViamVjdDo8L2I+IFt0cG0yXSAmcXVvdDt0cG0yX2ltcG9ydCZxdW90OyBJbnRlZ3JpdHkg
Q2hlY2sgaXNzdWUgb24gYSBCaWcgRW5kaWFuIDMyIEJpdCBQbGF0Zm9ybTwvZm9udD4KPGRpdj7C
oDwvZGl2Pgo8L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+CjxkaXY+SGVsbG8gVGVhbTwvZGl2
Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSBhbSB0cnlpbmcgdG8gdXNlIHRwbTJfaW1wb3J0IG9u
IGEgQmlnIEVuZGlhbiAzMiBCaXQgcGxhdGZvcm0gYW5kIHJ1bm5pbmcgaW50byBmb2xsb3dpbmcg
ZXJyb3I6PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KPC9k
aXY+CjxkaXY+PGI+PGJyPgo8L2I+PC9kaXY+CjxkaXY+PGI+Q29tbWFuZDogPC9iPjxicj4KPC9k
aXY+CjxkaXY+CjxvbD4KPGxpPgo8cCBzdHlsZT0ibWFyZ2luOjBpbjtmb250LWZhbWlseTpDYWxp
YnJpO2ZvbnQtc2l6ZToxMXB0Ij5vcGVuc3NsIGdlbnJzYSAtb3V0IHByaXZhdGUucGVtIDIwNDg8
L3A+CjwvbGk+PGxpPnRwbTJfaW1wb3J0IC1DIDB4ODEwMDAwMDEgLUcgcnNhIC1pIHByaXZhdGUu
cGVtIC11IGtleS5wdWIgLXIga2V5LnByaXY8L2xpPjwvb2w+CjwvZGl2Pgo8ZGl2PjxiPjxicj4K
PC9iPjwvZGl2Pgo8ZGl2PjxiPkVycm9yOjwvYj48YnI+CjwvZGl2Pgo8ZGl2PjwvZGl2Pgo8ZGl2
PkVSUk9SOmVzeXM6c3JjL3RzczItZXN5cy9hcGkvRXN5c19JbXBvcnQuYzoxMTA6RXN5c19JbXBv
cnQoKSBFc3lzIEZpbmlzaCBFcnJvckNvZGUgKDB4MDAwMDAzZGYpPGJyPgpFUlJPUjogRXN5c19I
TUFDKDB4M0RGKSAtIHRwbTpwYXJhbWV0ZXIoMyk6aW50ZWdyaXR5IGNoZWNrIGZhaWxlZDxicj4K
RVJST1I6IFVuYWJsZSB0byBydW4gdHBtMl9pbXBvcnQ8YnI+CjwvZGl2Pgo8ZGl2Pi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCjxicj4KPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj5OZWVkIHBvaW50ZXJzIHRv
IGRlYnVnIHRoaXMgaXNzdWUuPC9kaXY+CjxkaXY+SGF2ZSBhbnkgb2YgeW91IGNvbWUgYWNyb3Nz
IHRoaXMgZXJyb3Igd2l0aCB0cG0yX2ltcG9ydCBvbiBCaWcgRW5kaWFuIDMyIEJpdCBQbGF0Zm9y
bT8gRG8gd2UgaGF2ZSBhIGZpeCBPciBjYW4geW91IHByb3ZpZGUgaW5wdXRzIG9uIHRoZSBzb3Vy
Y2Ugd2hlcmUgSSBjYW4gbG9vayBhdCBmb3IgZnVydGhlciBkZWJ1Z2dpbmc/PGJyPgo8L2Rpdj4K
PGRpdj48YnI+CjwvZGl2Pgo8ZGl2PlRoYW5rczwvZGl2Pgo8ZGl2PlJhajxicj4KPC9kaXY+Cjwv
ZGl2Pgo8L2Rpdj4KPC9kaXY+Cgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============6689379874496005512==--

