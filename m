Content-Type: multipart/mixed; boundary="===============9166150743028925916=="
MIME-Version: 1.0
From: Ian Oliver <ian.justin.oliver at gmail.com>
Subject: [tpm2] tpm2_rsaencrypt hanging
Date: Tue, 28 Nov 2017 21:53:51 +0200
Message-ID: <CAAxBZJtD3ru4aO5KCM8byx1pSRLhtK5qUMyK2CDcz-Ed-Tafbg@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9166150743028925916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tpm2_rsaencrypt hangs....here's the full scenario:

Lenovo X1, TPM2.0, Ubuntu 17.04, tboot 1.9.6, SINIT ACM, measure boot
working, TXT working, tpm2_pcrlist working etc
tss 3.0-rc1, abrmd 1.2.0-rc1, tss 1.3.0-rc2

TPM was initially cleared, ownership taken. For testing purposes the owner,
endorsement, lockout and all other passwords are the same.   Working from
https://github.com/intel/tpm2-tools/wiki/How-to-use-tpm2-tools

$tpm2_createprimary -H e -K abc123 -g sha256 -G rsa -C
endorsementPrimary.ctx -P abc123
$tpm2_create -c endorsementPrimary.ctx -K abc123 -P abc123 -g sha256 -G rsa
-u k.pub -r k.priv

$tpm2_load -c endorsementPrimary.ctx -P abc123 -u k.pub -r k.priv -n k.name
-C k.ctx
$ls -l secret
-rw-r--r-- 1 www www 25 marra 28 19:06 secret

$cat secret
This is a secret message
$tpm2_sign -c k.ctx -P ttibsachab -g sha256 -m secret -s secret.sig
$tpm2_verifysignature -c k.ctx -g sha256 -m secret -s secret.sig -t secret.t
47 98 5b 79 59 3f 1d f4 03 1e 33 3b c1 d1 f8 39 06 d9 ff 54 93 ec e9 54 9e
50 20 b2 66 42 e4 6b

(ie, all the above works)

$tpm2_rsaencrypt -c k.ctx -o secret.encrypted.l secret -V

and the process hangs

I thought it then might be the attributes as it appears that encryption is
not by default, and I hope I've made the calculation correctly:

$tpm2_create -c endorsementPrimary.ctx -K abc123 -P abc123 -g sha256 -G rsa
-u l.pub -r l.priv -A 0x60432
ObjectAttribute: 0x00060432

Create Object Succeed !
$tpm2_load -c endorsementPrimary.ctx -P abc123 -u l.pub -r l.priv -n l.name
-C l.ctx

Load succ.
LoadedHandle: 0x80000100

$tpm2_rsaencrypt -c l.ctx -o secret.encrypted.l secret -V

again hangs and so does using the handle:

$tpm2_rsaencrypt -k 0x80000100 -o secret.encrypted secret -V

If the -P option (as specified in the man page) is given   (same for --pwdk)

$tpm2_rsaencrypt -c k.ctx -P abc123 -o secret.encrypted -V secret
tpm2_rsaencrypt: invalid option -- 'P'
ERROR: Unknown Argument: P

Line 143 of tpm2_rsaencrypt.c only accept k,c and o:

opts =3D tpm2_options_new("k:o:c:", ARRAY_LEN(topts), topts, on_option,
on_args);


Nothing appears in the journalctl -xe log related to abrmd (and I assume
that the above commands run against that).

Unrelated, but you never know: There is a bug on the Lenovo X1 5th Gen (and
others) relating to the TPM being deactivated after hibernation or sleep,
however all of the above were run on a freshly booted machine.



t.

Ian




-- =

*Dr. Ian Oliver*
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
Blog:  * ijosblog.blogspot.com <http://ijosblog.blogspot.com/>*
Book: * www.privacyengineeringbook.net
<http://www.privacyengineeringbook.net> *    (via Amazon
<http://www.amazon.co.uk/dp/1497569710>)
Consultancy:
*www.cysyniad.com <http://www.cysyniad.com>Twitter: @i_j_oliver*

--===============9166150743028925916==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMnB0IiBpZD0iZ21haWwtZGl2
dGFnZGVmYXVsdHdyYXBwZXIiPjxkaXYgc3R5bGU9Im1hcmdpbi10b3A6MHB4O21hcmdpbi1ib3R0
b206MHB4Ij50cG0yX3JzYWVuY3J5cHQgaGFuZ3MuLi4uaGVyZSYjMzk7cyB0aGUgZnVsbCBzY2Vu
YXJpbzo8L2Rpdj4KPGRpdiBzdHlsZT0ibWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTowcHgi
Pjxicj4KCjwvZGl2Pgo8ZGl2IHN0eWxlPSJtYXJnaW4tdG9wOjBweDttYXJnaW4tYm90dG9tOjBw
eCI+TGVub3ZvIFgxLCBUUE0yLjAsIFVidW50dSAxNy4wNCwgdGJvb3QgMS45LjYsIFNJTklUIEFD
TSwgbWVhc3VyZSBib290IHdvcmtpbmcsIFRYVCB3b3JraW5nLCB0cG0yX3Bjcmxpc3Qgd29ya2lu
ZyBldGM8L2Rpdj4KPGRpdiBzdHlsZT0ibWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTowcHgi
PnRzcyAzLjAtcmMxLCBhYnJtZCAxLjIuMC1yYzEsIHRzcyAxLjMuMC1yYzI8L2Rpdj4KPGRpdiBz
dHlsZT0ibWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTowcHgiPjxicj4KCjwvZGl2Pgo8ZGl2
IHN0eWxlPSJtYXJnaW4tdG9wOjBweDttYXJnaW4tYm90dG9tOjBweCI+VFBNIHdhcyBpbml0aWFs
bHkgY2xlYXJlZCwgCm93bmVyc2hpcCB0YWtlbi4gRm9yIHRlc3RpbmcgcHVycG9zZXMgdGhlIG93
bmVyLCBlbmRvcnNlbWVudCwgbG9ja291dCAKYW5kIGFsbCBvdGhlciBwYXNzd29yZHMgYXJlIHRo
ZSBzYW1lLiDCoCBXb3JraW5nIGZyb23CoDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9pbnRl
bC90cG0yLXRvb2xzL3dpa2kvSG93LXRvLXVzZS10cG0yLXRvb2xzIiB0YXJnZXQ9Il9ibGFuayIg
cmVsPSJub29wZW5lciBub3JlZmVycmVyIiBpZD0iZ21haWwtTFBsbms4MTA4NDciPjxzcGFuIGlk
PSJnbWFpbC1MUGxuazgxMDg0NyI+aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL3RwbTItdG9vbHMv
d2lraS9Ib3ctdG8tdXNlLXRwbTItdG9vbHM8L3NwYW4+PC9hPjwvZGl2Pgo8ZGl2IHN0eWxlPSJt
YXJnaW4tdG9wOjBweDttYXJnaW4tYm90dG9tOjBweCI+PGJyPgoKPC9kaXY+CjxkaXYgc3R5bGU9
Im1hcmdpbi10b3A6MHB4O21hcmdpbi1ib3R0b206MHB4Ij4kdHBtMl9jcmVhdGVwcmltYXJ5IC1I
IGUgLUsgYWJjMTIzIC1nIHNoYTI1NiAtRyByc2EgLUMgZW5kb3JzZW1lbnRQcmltYXJ5LmN0eCAt
UCBhYmMxMjM8L2Rpdj4KPGRpdiBzdHlsZT0ibWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTow
cHgiPiR0cG0yX2NyZWF0ZSAtYyBlbmRvcnNlbWVudFByaW1hcnkuY3R4IC1LIGFiYzEyMyAtUCBh
YmMxMjMgLWcgc2hhMjU2IC1HIHJzYSAtdSBrLnB1YiAtciBrLnByaXY8L2Rpdj4KPGRpdiBzdHls
ZT0ibWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTowcHgiPsKgPC9kaXY+CjxkaXY+JHRwbTJf
bG9hZCAtYyBlbmRvcnNlbWVudFByaW1hcnkuY3R4IC1QIGFiYzEyMyAtdSBrLnB1YiAtciBrLnBy
aXYgLW4gPGEgaHJlZj0iaHR0cDovL2submFtZSI+ay5uYW1lPC9hPiAtQyBrLmN0eDwvZGl2Pgo8
ZGl2Pgo8ZGl2PiRscyAtbCBzZWNyZXQ8YnI+Cgotcnctci0tci0tIDEgd3d3IHd3dyAyNSBtYXJy
YSAyOCAxOTowNiBzZWNyZXQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqDCoCA8YnI+Cgo8L2Rpdj4KPGRpdj4KPGRpdj4kY2F0IHNlY3JldDxi
cj4KClRoaXMgaXMgYSBzZWNyZXQgbWVzc2FnZTxicj4KCjwvZGl2Pgo8L2Rpdj4KPGRpdj4kdHBt
Ml9zaWduIC1jIGsuY3R4IC1QIHR0aWJzYWNoYWIgLWcgc2hhMjU2IC1tIHNlY3JldCAtcyBzZWNy
ZXQuc2lnIDxicj4KCiR0cG0yX3ZlcmlmeXNpZ25hdHVyZSAtYyBrLmN0eCAtZyBzaGEyNTYgLW0g
c2VjcmV0IC1zIHNlY3JldC5zaWcgLXQgc2VjcmV0LnQ8YnI+Cgo8ZGl2Pgo8ZGl2PjQ3IDk4IDVi
IDc5IDU5IDNmIDFkIGY0IDAzIDFlIDMzIDNiIGMxIGQxIGY4IDM5IDA2IGQ5IGZmIDU0IDkzIGVj
IGU5IDU0IDllIDUwIDIwIGIyIDY2IDQyIGU0IDZiIDxicj4KCjxicj4KCjwvZGl2PgooaWUsIGFs
bCB0aGUgYWJvdmUgd29ya3MpPC9kaXY+CjxkaXY+PGJyPgoKPC9kaXY+CjxkaXY+CjxkaXY+JHRw
bTJfcnNhZW5jcnlwdCAtYyBrLmN0eCAtbyBzZWNyZXQuZW5jcnlwdGVkLmwgc2VjcmV0IC1WIMKg
IMKgIMKgIMKgIMKgwqAgPGJyPgoKPC9kaXY+CjxkaXY+PGJyPgoKPC9kaXY+CjxkaXY+YW5kIHRo
ZSBwcm9jZXNzIGhhbmdzPC9kaXY+CjxkaXY+PGJyPgoKPC9kaXY+CjxkaXY+SSB0aG91Z2h0IGl0
IHRoZW4gbWlnaHQgYmUgdGhlIGF0dHJpYnV0ZXMgYXMgaXQgYXBwZWFycyB0aGF0IAplbmNyeXB0
aW9uIGlzIG5vdCBieSBkZWZhdWx0LCBhbmQgSSBob3BlIEkmIzM5O3ZlIG1hZGUgdGhlIGNhbGN1
bGF0aW9uIApjb3JyZWN0bHk6PC9kaXY+CjxkaXY+PGJyPgoKPC9kaXY+CjxkaXY+JHRwbTJfY3Jl
YXRlIC1jIGVuZG9yc2VtZW50UHJpbWFyeS5jdHggLUsgYWJjMTIzIC1QIGFiYzEyMyAtZyBzaGEy
NTYgLUcgcnNhIC11IGwucHViIC1yIGwucHJpdiAtQSAweDYwNDMyPC9kaXY+CjxkaXY+CjxkaXY+
T2JqZWN0QXR0cmlidXRlOiAweDAwMDYwNDMyPGJyPgoKPGJyPgoKQ3JlYXRlIE9iamVjdCBTdWNj
ZWVkICE8L2Rpdj4KPC9kaXY+CjxkaXY+JHRwbTJfbG9hZCAtYyBlbmRvcnNlbWVudFByaW1hcnku
Y3R4IC1QIGFiYzEyMyAtdSBsLnB1YiAtciBsLnByaXYgLW4gPGEgaHJlZj0iaHR0cDovL2wubmFt
ZSI+bC5uYW1lPC9hPiAtQyBsLmN0eDwvZGl2Pgo8ZGl2Pgo8ZGl2Pgo8ZGl2Pjxicj4KCkxvYWQg
c3VjYy48YnI+CgpMb2FkZWRIYW5kbGU6IDB4ODAwMDAxMDA8L2Rpdj4KPGJyPgoKPC9kaXY+Cjxk
aXY+JHRwbTJfcnNhZW5jcnlwdCAtYyBsLmN0eCAtbyBzZWNyZXQuZW5jcnlwdGVkLmwgc2VjcmV0
IC1WIDxicj4KCjwvZGl2Pgo8ZGl2Pjxicj4KCjwvZGl2Pgo8ZGl2PmFnYWluIGhhbmdzIGFuZCBz
byBkb2VzIHVzaW5nIHRoZSBoYW5kbGU6PGJyPgoKPC9kaXY+CjxkaXY+PGJyPgoKPC9kaXY+Cjxk
aXY+JHRwbTJfcnNhZW5jcnlwdCAtayAweDgwMDAwMTAwIC1vIHNlY3JldC5lbmNyeXB0ZWQgc2Vj
cmV0IC1WPGJyPgoKPC9kaXY+CjxkaXY+PGJyPgoKPC9kaXY+CjxkaXY+SWYgdGhlIC1QIG9wdGlv
biAoYXMgc3BlY2lmaWVkIGluIHRoZSBtYW4gcGFnZSkgaXMgZ2l2ZW4gwqAgKHNhbWUgZm9yIC0t
cHdkayk8L2Rpdj4KPGRpdj48YnI+Cgo8L2Rpdj4KPGRpdj4KPGRpdj4kdHBtMl9yc2FlbmNyeXB0
IC1jIGsuY3R4IC1QIGFiYzEyMyAtbyBzZWNyZXQuZW5jcnlwdGVkIC1WIHNlY3JldDxicj4KCnRw
bTJfcnNhZW5jcnlwdDogaW52YWxpZCBvcHRpb24gLS0gJiMzOTtQJiMzOTs8YnI+CgpFUlJPUjog
VW5rbm93biBBcmd1bWVudDogUDxicj4KCjwvZGl2Pgo8ZGl2Pjxicj4KCjwvZGl2Pgo8ZGl2Pkxp
bmUgMTQzIG9mIHRwbTJfcnNhZW5jcnlwdC5jIG9ubHkgYWNjZXB0IGssYyBhbmQgbzo8L2Rpdj4K
PGRpdj48YnI+Cgo8L2Rpdj4KPGRpdj4KPGRpdj5vcHRzID0gdHBtMl9vcHRpb25zX25ldygmcXVv
dDtrOm86YzomcXVvdDssIEFSUkFZX0xFTih0b3B0cyksIHRvcHRzLCBvbl9vcHRpb24sIG9uX2Fy
Z3MpOzwvZGl2Pgo8YnI+Cgo8L2Rpdj4KPGJyPgoKPC9kaXY+Ck5vdGhpbmcgYXBwZWFycyBpbiB0
aGUgam91cm5hbGN0bCAteGUgbG9nIHJlbGF0ZWQgdG8gYWJybWQgKGFuZCBJIGFzc3VtZSB0aGF0
IHRoZSBhYm92ZSBjb21tYW5kcyBydW4gYWdhaW5zdCB0aGF0KS48L2Rpdj4KPGRpdj48YnI+Cgo8
L2Rpdj4KPGRpdj5VbnJlbGF0ZWQsIGJ1dCB5b3UgbmV2ZXIga25vdzogVGhlcmUgaXMgYSBidWcg
b24gdGhlIExlbm92byBYMSA1dGggCkdlbiAoYW5kIG90aGVycykgcmVsYXRpbmcgdG8gdGhlIFRQ
TSBiZWluZyBkZWFjdGl2YXRlZCBhZnRlciBoaWJlcm5hdGlvbgogb3Igc2xlZXAsIGhvd2V2ZXIg
YWxsIG9mIHRoZSBhYm92ZSB3ZXJlIHJ1biBvbiBhIGZyZXNobHkgYm9vdGVkIAptYWNoaW5lLjwv
ZGl2Pgo8ZGl2Pjxicj4KCjwvZGl2Pgo8ZGl2Pjxicj4KCjwvZGl2Pgo8ZGl2Pjxicj4KCjwvZGl2
Pgo8ZGl2PnQuPC9kaXY+CjxkaXY+PGJyPgoKPC9kaXY+CjxkaXY+SWFuPGJyPgoKPC9kaXY+Cjxi
cj4KCjwvZGl2Pgo8YnI+Cgo8L2Rpdj4KPC9kaXY+PC9zcGFuPjxiciBjbGVhcj0iYWxsIj48YnI+
LS0gPGJyPjxkaXYgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRpdj48
ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OmFyaWFsO2ZvbnQtc2l6ZTpzbWFsbCI+PGI+RHIuIElhbiBPbGl2ZXI8L2I+PGJyPj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT08YnI+QmxvZzogwqA8Yj7CoDxhIGhyZWY9Imh0dHA6Ly9p
am9zYmxvZy5ibG9nc3BvdC5jb20vIiBzdHlsZT0iY29sb3I6cmdiKDE3LDg1LDIwNCkiIHRhcmdl
dD0iX2JsYW5rIj5pam9zYmxvZy5ibG9nc3BvdC5jb208L2E+PC9iPjwvZGl2PjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OmFyaWFsO2ZvbnQtc2l6ZTpzbWFsbCI+Qm9vazogPGI+wqA8YSBocmVmPSJo
dHRwOi8vd3d3LnByaXZhY3llbmdpbmVlcmluZ2Jvb2submV0IiB0YXJnZXQ9Il9ibGFuayI+d3d3
LnByaXZhY3llbmdpbmVlcmluZ2Jvb2submV0PC9hPsKgPC9iPiDCoMKgPHNwYW4gc3R5bGU9ImNv
bG9yOnJnYigxNywxNywxNyk7Zm9udC1mYW1pbHk6QXJpYWwsc2Fucy1zZXJpZjtmb250LXNpemU6
MTNweDtsaW5lLWhlaWdodDoxOXB4Ij7CoCg8YSBocmVmPSJodHRwOi8vd3d3LmFtYXpvbi5jby51
ay9kcC8xNDk3NTY5NzEwIiB0YXJnZXQ9Il9ibGFuayI+dmlhIEFtYXpvbjwvYT4pPC9zcGFuPjwv
ZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OmFyaWFsO2ZvbnQtc2l6ZTpzbWFsbCI+Q29uc3Vs
dGFuY3k6IDxiPjxhIGhyZWY9Imh0dHA6Ly93d3cuY3lzeW5pYWQuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+d3d3LmN5c3luaWFkLmNvbTwvYT48YnI+VHdpdHRlcjogQGlfal9vbGl2ZXI8L2I+PC9kaXY+
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+CjwvZGl2Pgo=

--===============9166150743028925916==--

