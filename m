Content-Type: multipart/mixed; boundary="===============0025404636327864664=="
MIME-Version: 1.0
From: arjun kashyap <arjun21k at gmail.com>
Subject: Re: [tpm2] tpm2 Digest, Vol 21, Issue 2
Date: Thu, 07 Mar 2019 13:41:32 -0600
Message-ID: <CA+tUB7DBmVzXwDsHjk4ud5rkspbBGjY-=Cw1pG2oBJu9k36x1Q@mail.gmail.com>
In-Reply-To: 71B2FF90-DEFD-441F-B734-D86739D855AF@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0025404636327864664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks William and Imran for your inputs. My use case is that once my
system boots up (with tpm) I should be able to send encrypted data to it
over the network. I thought I could use the EK as each tpm has a unique and
built-in one. My thought process was to try to use the EK public portion to
encrypt the data and send it over the network to the tpm and then decrypt
it using EK private portion. As both of you pointed out that I should set
appropriate attributes while creating the key and prefer using
tpm2_createprimary instead of tpm2_createek. But I have another concern
with this approach. With tpm2_createek I could extract the public key
portion of the EK which gets created. But if I use tpm2_createprimary I do
not have that option. So could you suggest some workaround? Also, please
feel free to suggest another approach for this use case. Kindly correct me
if I am wrong as I am new to tpms.

Thanks again,
Arjun

On Tue, Mar 5, 2019 at 3:27 PM Desai, Imran <imran.desai(a)intel.com> wrote:

> For what you want to do, try this.
>
> tpm2_createprimary -a e -G rsa -A
> "fixedtpm|fixedparent|sensitivedataorigin|userwithauth|adminwithpolicy|de=
crypt"
> -o key.ctx
> tpm2_evictcontrol -a o -c key.ctx -p 0x81010002
> tpm2_rsaencrypt -c 0x81010002 -o enc.out plain.txt
> tpm2_rsadecrypt -c 0x81010002 -o dec.out -I enc.out
>
> PS: I would not use such a key if I cared about privacy.
>
> =EF=BB=BFOn 3/5/19, 1:50 PM, "Desai, Imran" <imran.desai(a)intel.com> wro=
te:
>
>     +1 to what Bill said. If you must do this I'd suggest you use
> createprimary to create the key under endorsement hierarchy. I understand
> that is exactly what tpm2_createek does but there is a caveat. For what y=
ou
> intend to do it requires userwith attribute set to 1. The reason it is not
> set to 1 in createek tool is because it would create an endorsement key o=
ff
> a non standard template per TCK EK credential profile spec. The alternati=
ve
> is to satisfy policysecret of the endorsement hierarchy and that will
> require a change in the tool.
>
>     On 3/5/19, 1:00 PM, "tpm2 on behalf of tpm2-request(a)lists.01.org" <
> tpm2-bounces(a)lists.01.org on behalf of tpm2-request(a)lists.01.org> wro=
te:
>
>         Send tpm2 mailing list submissions to
>                 tpm2(a)lists.01.org
>
>         To subscribe or unsubscribe via the World Wide Web, visit
>                 https://lists.01.org/mailman/listinfo/tpm2
>         or, via email, send a message with subject or body 'help' to
>                 tpm2-request(a)lists.01.org
>
>         You can reach the person managing the list at
>                 tpm2-owner(a)lists.01.org
>
>         When replying, please edit your Subject line so it is more specif=
ic
>         than "Re: Contents of tpm2 digest..."
>
>
>         Today's Topics:
>
>            1. Re: Use endorsement key for encryption and decryption
>               (Roberts, William C)
>
>
>
> ----------------------------------------------------------------------
>
>         Message: 1
>         Date: Tue, 5 Mar 2019 17:29:10 +0000
>         From: "Roberts, William C" <william.c.roberts(a)intel.com>
>         To: arjun kashyap <arjun21k(a)gmail.com>, "tpm2(a)lists.01.org"
>                 <tpm2(a)lists.01.org>
>         Subject: Re: [tpm2] Use endorsement key for encryption and
> decryption
>         Message-ID:
>                 <
> 476DC76E7D1DF2438D32BFADF679FC5649CFA6CA(a)ORSMSX101.amr.corp.intel.com>
>
>         Content-Type: text/plain; charset=3D"utf-8"
>
>
>
>         > -----Original Message-----
>         > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of
> arjun kashyap
>         > Sent: Sunday, March 3, 2019 12:58 PM
>         > To: tpm2(a)lists.01.org
>         > Subject: [tpm2] Use endorsement key for encryption and decrypti=
on
>         >
>         > Hello all,
>         >
>         > I am using the IBM tpm2.0 simulator. My use case is that I would
> like to encrypt
>         > data and send to tpm and then decrypt this at the tpm side. I
> would want to use
>         > the endorsement key (EK) for this purpose. Hence, I would like
> to encrypt data
>         > using EK's public key and decrypt using EK's private key. I
> tried creating EK using
>         > tpm2_createek -G rsa -f pem -c - -p ek.pem. Now, I have the
> ek.pem( public
>         > portion of EK) to encrypt the data. When I load this key into
> the tpm and invoke
>         > tpm2_rsadecrypt I get an error. I also tried using
> tpm2_createprimary to create
>         > an EK but failed in the above attempt. Could anyone please help
> me out so that I
>         > can use EK to encrypt/decrypt data.
>         >
>         > Please let me know if more information is needed.
>
>         What's the error code? You probably can't perform an rsadecrypt,
>         Do to object attributes. I would bet sign would work. Endorsement
>         usually means signing.
>
>         >
>         > Thanks in advance.
>         >
>         >  <https://www.avast.com/sig-
>         > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
>         > email&utm_content=3Dwebmail&utm_term=3Dicon>       Virus-free.
>         > www.avast.com <https://www.avast.com/sig-
>         > email?utm_medium=3Demail&utm_source=3Dlink&utm_campaign=3Dsig-
>         > email&utm_content=3Dwebmail&utm_term=3Dlink>
>
>
>         ------------------------------
>
>         Subject: Digest Footer
>
>         _______________________________________________
>         tpm2 mailing list
>         tpm2(a)lists.01.org
>         https://lists.01.org/mailman/listinfo/tpm2
>
>
>         ------------------------------
>
>         End of tpm2 Digest, Vol 21, Issue 2
>         ***********************************
>
>
>
>
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>

<https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_c=
ampaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3Dicon>
Virus-free.
www.avast.com
<https://www.avast.com/sig-email?utm_medium=3Demail&utm_source=3Dlink&utm_c=
ampaign=3Dsig-email&utm_content=3Dwebmail&utm_term=3Dlink>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>

--===============0025404636327864664==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+VGhhbmtzIFdpbGxpYW0gYW5kIEltcmFuIGZv
ciB5b3VyIGlucHV0cy4gTXkgdXNlIGNhc2UgaXMgdGhhdCBvbmNlIG15IHN5c3RlbSBib290c8Kg
dXAgKHdpdGggdHBtKSBJIHNob3VsZCBiZSBhYmxlIHRvIHNlbmQgZW5jcnlwdGVkIGRhdGEgdG8g
aXQgb3ZlciB0aGUgbmV0d29yay4gSSB0aG91Z2h0IEkgY291bGQgdXNlIHRoZSBFSyBhcyBlYWNo
IHRwbcKgaGFzIGEgdW5pcXVlIGFuZCBidWlsdC1pbiBvbmUuIE15IHRob3VnaHQgcHJvY2VzcyB3
YXMgdG8gdHJ5IHRvIHVzZSB0aGUgRUsgcHVibGljIHBvcnRpb24gdG8gZW5jcnlwdCB0aGUgZGF0
YSBhbmQgc2VuZCBpdCBvdmVyIHRoZSBuZXR3b3JrIHRvIHRoZSB0cG3CoGFuZCB0aGVuIGRlY3J5
cHQgaXQgdXNpbmcgRUsgcHJpdmF0ZSBwb3J0aW9uLiBBcyBib3RoIG9mIHlvdSBwb2ludGVkIG91
dCB0aGF0IEkgc2hvdWxkIHNldCBhcHByb3ByaWF0ZSBhdHRyaWJ1dGVzIHdoaWxlIGNyZWF0aW5n
IHRoZSBrZXkgYW5kIHByZWZlciB1c2luZyB0cG0yX2NyZWF0ZXByaW1hcnkgaW5zdGVhZCBvZiB0
cG0yX2NyZWF0ZWVrLiBCdXQgSSBoYXZlIGFub3RoZXIgY29uY2VybiB3aXRoIHRoaXMgYXBwcm9h
Y2guIFdpdGggdHBtMl9jcmVhdGVlayBJIGNvdWxkIGV4dHJhY3QgdGhlIHB1YmxpYyBrZXkgcG9y
dGlvbiBvZiB0aGUgRUsgd2hpY2ggZ2V0cyBjcmVhdGVkLiBCdXQgaWYgSSB1c2UgdHBtMl9jcmVh
dGVwcmltYXJ5IEkgZG8gbm90IGhhdmUgdGhhdCBvcHRpb24uIFNvIGNvdWxkIHlvdSBzdWdnZXN0
IHNvbWUgd29ya2Fyb3VuZD8gQWxzbywgcGxlYXNlIGZlZWwgZnJlZSB0byBzdWdnZXN0IGFub3Ro
ZXIgYXBwcm9hY2ggZm9yIHRoaXMgdXNlIGNhc2UuIEtpbmRseSBjb3JyZWN0wqBtZSBpZiBJIGFt
IHdyb25nIGFzIEkgYW0gbmV3IHRvIHRwbXMuPGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MgYWdh
aW4sPC9kaXY+PGRpdj5Bcmp1bjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgTWFyIDUsIDIwMTkg
YXQgMzoyNyBQTSBEZXNhaSwgSW1yYW4gJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBp
bnRlbC5jb20iPmltcmFuLmRlc2FpQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+Rm9yIHdoYXQgeW91IHdhbnQgdG8gZG8sIHRyeSB0aGlzLjxicj4KPGJyPnRwbTJfY3Jl
YXRlcHJpbWFyeSAtYSBlIC1HIHJzYSAtQSAmcXVvdDtmaXhlZHRwbXxmaXhlZHBhcmVudHxzZW5z
aXRpdmVkYXRhb3JpZ2lufHVzZXJ3aXRoYXV0aHxhZG1pbndpdGhwb2xpY3l8ZGVjcnlwdCZxdW90
OyAtbyBrZXkuY3R4PGJyPnRwbTJfZXZpY3Rjb250cm9sIC1hIG8gLWMga2V5LmN0eCAtcCAweDgx
MDEwMDAyPGJyPnRwbTJfcnNhZW5jcnlwdCAtYyAweDgxMDEwMDAyIC1vIGVuYy5vdXQgcGxhaW4u
dHh0PGJyPnRwbTJfcnNhZGVjcnlwdCAtYyAweDgxMDEwMDAyIC1vIGRlYy5vdXQgLUkgZW5jLm91
dDxicj4KPGJyPlBTOiBJIHdvdWxkIG5vdCB1c2Ugc3VjaCBhIGtleSBpZiBJIGNhcmVkIGFib3V0
IHByaXZhY3kuPGJyPgo8YnI+77u/T24gMy81LzE5LCAxOjUwIFBNLCAmcXVvdDtEZXNhaSwgSW1y
YW4mcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzppbXJhbi5kZXNhaUBpbnRlbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5pbXJhbi5kZXNhaUBpbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+Cjxicj7C
oCDCoCArMSB0byB3aGF0IEJpbGwgc2FpZC4gSWYgeW91IG11c3QgZG8gdGhpcyBJJiMzOTtkIHN1
Z2dlc3QgeW91IHVzZSBjcmVhdGVwcmltYXJ5IHRvIGNyZWF0ZSB0aGUga2V5IHVuZGVyIGVuZG9y
c2VtZW50IGhpZXJhcmNoeS4gSSB1bmRlcnN0YW5kIHRoYXQgaXMgZXhhY3RseSB3aGF0IHRwbTJf
Y3JlYXRlZWsgZG9lcyBidXQgdGhlcmUgaXMgYSBjYXZlYXQuIEZvciB3aGF0IHlvdSBpbnRlbmQg
dG8gZG8gaXQgcmVxdWlyZXMgdXNlcndpdGggYXR0cmlidXRlIHNldCB0byAxLiBUaGUgcmVhc29u
IGl0IGlzIG5vdCBzZXQgdG8gMSBpbiBjcmVhdGVlayB0b29sIGlzIGJlY2F1c2UgaXQgd291bGQg
Y3JlYXRlIGFuIGVuZG9yc2VtZW50IGtleSBvZmYgYSBub24gc3RhbmRhcmQgdGVtcGxhdGUgcGVy
IFRDSyBFSyBjcmVkZW50aWFsIHByb2ZpbGUgc3BlYy4gVGhlIGFsdGVybmF0aXZlIGlzIHRvIHNh
dGlzZnkgcG9saWN5c2VjcmV0IG9mIHRoZSBlbmRvcnNlbWVudCBoaWVyYXJjaHkgYW5kIHRoYXQg
d2lsbCByZXF1aXJlIGEgY2hhbmdlIGluIHRoZSB0b29sLjxicj4KPGJyPsKgIMKgIE9uIDMvNS8x
OSwgMTowMCBQTSwgJnF1b3Q7dHBtMiBvbiBiZWhhbGYgb2YgPGEgaHJlZj0ibWFpbHRvOnRwbTIt
cmVxdWVzdEBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLXJlcXVlc3RAbGlzdHMu
MDEub3JnPC9hPiZxdW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRwbTItYm91bmNlc0BsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yLWJvdW5jZXNAbGlzdHMuMDEub3JnPC9hPiBvbiBi
ZWhhbGYgb2YgPGEgaHJlZj0ibWFpbHRvOnRwbTItcmVxdWVzdEBsaXN0cy4wMS5vcmciIHRhcmdl
dD0iX2JsYW5rIj50cG0yLXJlcXVlc3RAbGlzdHMuMDEub3JnPC9hPiZndDsgd3JvdGU6PGJyPgo8
YnI+wqAgwqAgwqAgwqAgU2VuZCB0cG0yIG1haWxpbmcgbGlzdCBzdWJtaXNzaW9ucyB0bzxicj7C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmci
IHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+Cjxicj7CoCDCoCDCoCDC
oCBUbyBzdWJzY3JpYmUgb3IgdW5zdWJzY3JpYmUgdmlhIHRoZSBXb3JsZCBXaWRlIFdlYiwgdmlz
aXQ8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5v
cmcvbWFpbG1hbi9saXN0aW5mby90cG0yIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3RwbTI8L2E+PGJyPsKgIMKg
IMKgIMKgIG9yLCB2aWEgZW1haWwsIHNlbmQgYSBtZXNzYWdlIHdpdGggc3ViamVjdCBvciBib2R5
ICYjMzk7aGVscCYjMzk7IHRvPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxhIGhyZWY9Im1h
aWx0bzp0cG0yLXJlcXVlc3RAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1yZXF1
ZXN0QGxpc3RzLjAxLm9yZzwvYT48YnI+Cjxicj7CoCDCoCDCoCDCoCBZb3UgY2FuIHJlYWNoIHRo
ZSBwZXJzb24gbWFuYWdpbmcgdGhlIGxpc3QgYXQ8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
PGEgaHJlZj0ibWFpbHRvOnRwbTItb3duZXJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+
dHBtMi1vd25lckBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8YnI+wqAgwqAgwqAgwqAgV2hlbiByZXBs
eWluZywgcGxlYXNlIGVkaXQgeW91ciBTdWJqZWN0IGxpbmUgc28gaXQgaXMgbW9yZSBzcGVjaWZp
Yzxicj7CoCDCoCDCoCDCoCB0aGFuICZxdW90O1JlOiBDb250ZW50cyBvZiB0cG0yIGRpZ2VzdC4u
LiZxdW90Ozxicj4KPGJyPgo8YnI+wqAgwqAgwqAgwqAgVG9kYXkmIzM5O3MgVG9waWNzOjxicj4K
PGJyPsKgIMKgIMKgIMKgIMKgIMKgMS4gUmU6IFVzZSBlbmRvcnNlbWVudCBrZXkgZm9yIGVuY3J5
cHRpb24gYW5kIGRlY3J5cHRpb248YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgKFJvYmVydHMsIFdp
bGxpYW0gQyk8YnI+Cjxicj4KPGJyPsKgIMKgIMKgIMKgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+Cjxicj7C
oCDCoCDCoCDCoCBNZXNzYWdlOiAxPGJyPsKgIMKgIMKgIMKgIERhdGU6IFR1ZSwgNSBNYXIgMjAx
OSAxNzoyOToxMCArMDAwMDxicj7CoCDCoCDCoCDCoCBGcm9tOiAmcXVvdDtSb2JlcnRzLCBXaWxs
aWFtIEMmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5j
b20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0Ozxi
cj7CoCDCoCDCoCDCoCBUbzogYXJqdW4ga2FzaHlhcCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFyanVu
MjFrQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFyanVuMjFrQGdtYWlsLmNvbTwvYT4mZ3Q7
LCAmcXVvdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij50cG0yQGxpc3RzLjAxLm9yZzwvYT4mcXVvdDs8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Jmx0OzxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+wqAgwqAgwqAgwqAgU3ViamVjdDogUmU6IFt0cG0y
XSBVc2UgZW5kb3JzZW1lbnQga2V5IGZvciBlbmNyeXB0aW9uIGFuZCBkZWNyeXB0aW9uPGJyPsKg
IMKgIMKgIMKgIE1lc3NhZ2UtSUQ6PGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDs8YSBo
cmVmPSJtYWlsdG86NDc2REM3NkU3RDFERjI0MzhEMzJCRkFERjY3OUZDNTY0OUNGQTZDQUBPUlNN
U1gxMDEuYW1yLmNvcnAuaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+NDc2REM3NkU3RDFERjI0
MzhEMzJCRkFERjY3OUZDNTY0OUNGQTZDQUBPUlNNU1gxMDEuYW1yLmNvcnAuaW50ZWwuY29tPC9h
PiZndDs8YnI+Cjxicj7CoCDCoCDCoCDCoCBDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9JnF1b3Q7dXRmLTgmcXVvdDs8YnI+Cjxicj4KPGJyPgo8YnI+wqAgwqAgwqAgwqAgJmd0OyAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj7CoCDCoCDCoCDCoCAmZ3Q7IEZyb206IHRwbTIg
W21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmc8L2E+XSBPbiBCZWhhbGYgT2YgYXJq
dW4ga2FzaHlhcDxicj7CoCDCoCDCoCDCoCAmZ3Q7IFNlbnQ6IFN1bmRheSwgTWFyY2ggMywgMjAx
OSAxMjo1OCBQTTxicj7CoCDCoCDCoCDCoCAmZ3Q7IFRvOiA8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+wqAg
wqAgwqAgwqAgJmd0OyBTdWJqZWN0OiBbdHBtMl0gVXNlIGVuZG9yc2VtZW50IGtleSBmb3IgZW5j
cnlwdGlvbiBhbmQgZGVjcnlwdGlvbjxicj7CoCDCoCDCoCDCoCAmZ3Q7IDxicj7CoCDCoCDCoCDC
oCAmZ3Q7IEhlbGxvIGFsbCw8YnI+wqAgwqAgwqAgwqAgJmd0OyA8YnI+wqAgwqAgwqAgwqAgJmd0
OyBJIGFtIHVzaW5nIHRoZSBJQk0gdHBtMi4wIHNpbXVsYXRvci4gTXkgdXNlIGNhc2UgaXMgdGhh
dCBJIHdvdWxkIGxpa2UgdG8gZW5jcnlwdDxicj7CoCDCoCDCoCDCoCAmZ3Q7IGRhdGEgYW5kIHNl
bmQgdG8gdHBtIGFuZCB0aGVuIGRlY3J5cHQgdGhpcyBhdCB0aGUgdHBtIHNpZGUuIEkgd291bGQg
d2FudCB0byB1c2U8YnI+wqAgwqAgwqAgwqAgJmd0OyB0aGUgZW5kb3JzZW1lbnQga2V5IChFSykg
Zm9yIHRoaXMgcHVycG9zZS4gSGVuY2UsIEkgd291bGQgbGlrZSB0byBlbmNyeXB0IGRhdGE8YnI+
wqAgwqAgwqAgwqAgJmd0OyB1c2luZyBFSyYjMzk7cyBwdWJsaWMga2V5IGFuZCBkZWNyeXB0IHVz
aW5nIEVLJiMzOTtzIHByaXZhdGUga2V5LiBJIHRyaWVkIGNyZWF0aW5nIEVLIHVzaW5nPGJyPsKg
IMKgIMKgIMKgICZndDsgdHBtMl9jcmVhdGVlayAtRyByc2EgLWYgcGVtIC1jIC0gLXAgZWsucGVt
LiBOb3csIEkgaGF2ZSB0aGUgZWsucGVtKCBwdWJsaWM8YnI+wqAgwqAgwqAgwqAgJmd0OyBwb3J0
aW9uIG9mIEVLKSB0byBlbmNyeXB0IHRoZSBkYXRhLiBXaGVuIEkgbG9hZCB0aGlzIGtleSBpbnRv
IHRoZSB0cG0gYW5kIGludm9rZTxicj7CoCDCoCDCoCDCoCAmZ3Q7IHRwbTJfcnNhZGVjcnlwdCBJ
IGdldCBhbiBlcnJvci4gSSBhbHNvIHRyaWVkIHVzaW5nIHRwbTJfY3JlYXRlcHJpbWFyeSB0byBj
cmVhdGU8YnI+wqAgwqAgwqAgwqAgJmd0OyBhbiBFSyBidXQgZmFpbGVkIGluIHRoZSBhYm92ZSBh
dHRlbXB0LiBDb3VsZCBhbnlvbmUgcGxlYXNlIGhlbHAgbWUgb3V0IHNvIHRoYXQgSTxicj7CoCDC
oCDCoCDCoCAmZ3Q7IGNhbiB1c2UgRUsgdG8gZW5jcnlwdC9kZWNyeXB0IGRhdGEuPGJyPsKgIMKg
IMKgIMKgICZndDsgPGJyPsKgIMKgIMKgIMKgICZndDsgUGxlYXNlIGxldCBtZSBrbm93IGlmIG1v
cmUgaW5mb3JtYXRpb24gaXMgbmVlZGVkLjxicj4KPGJyPsKgIMKgIMKgIMKgIFdoYXQmIzM5O3Mg
dGhlIGVycm9yIGNvZGU/IFlvdSBwcm9iYWJseSBjYW4mIzM5O3QgcGVyZm9ybSBhbiByc2FkZWNy
eXB0LDxicj7CoCDCoCDCoCDCoCBEbyB0byBvYmplY3QgYXR0cmlidXRlcy4gSSB3b3VsZCBiZXQg
c2lnbiB3b3VsZCB3b3JrLiBFbmRvcnNlbWVudDxicj7CoCDCoCDCoCDCoCB1c3VhbGx5IG1lYW5z
IHNpZ25pbmcuPGJyPgo8YnI+wqAgwqAgwqAgwqAgJmd0OyA8YnI+wqAgwqAgwqAgwqAgJmd0OyBU
aGFua3MgaW4gYWR2YW5jZS48YnI+wqAgwqAgwqAgwqAgJmd0OyA8YnI+wqAgwqAgwqAgwqAgJmd0
O8KgICZsdDs8YSBocmVmPSJodHRwczovL3d3dy5hdmFzdC5jb20vc2lnLSIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cuYXZhc3QuY29tL3NpZy08L2E+PGJyPsKg
IMKgIMKgIMKgICZndDsgZW1haWw/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRtX3NvdXJjZT1saW5r
JmFtcDt1dG1fY2FtcGFpZ249c2lnLTxicj7CoCDCoCDCoCDCoCAmZ3Q7IGVtYWlsJmFtcDt1dG1f
Y29udGVudD13ZWJtYWlsJmFtcDt1dG1fdGVybT1pY29uJmd0O8KgIMKgIMKgIMKgVmlydXMtZnJl
ZS48YnI+wqAgwqAgwqAgwqAgJmd0OyA8YSBocmVmPSJodHRwOi8vd3d3LmF2YXN0LmNvbSIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+d3d3LmF2YXN0LmNvbTwvYT4gJmx0OzxhIGhy
ZWY9Imh0dHBzOi8vd3d3LmF2YXN0LmNvbS9zaWctIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL3d3dy5hdmFzdC5jb20vc2lnLTwvYT48YnI+wqAgwqAgwqAgwqAgJmd0
OyBlbWFpbD91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWxpbmsmYW1wO3V0bV9jYW1w
YWlnbj1zaWctPGJyPsKgIMKgIMKgIMKgICZndDsgZW1haWwmYW1wO3V0bV9jb250ZW50PXdlYm1h
aWwmYW1wO3V0bV90ZXJtPWxpbmsmZ3Q7PGJyPgo8YnI+Cjxicj7CoCDCoCDCoCDCoCAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08YnI+Cjxicj7CoCDCoCDCoCDCoCBTdWJqZWN0OiBEaWdl
c3QgRm9vdGVyPGJyPgo8YnI+wqAgwqAgwqAgwqAgX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX188YnI+wqAgwqAgwqAgwqAgdHBtMiBtYWlsaW5nIGxpc3Q8YnI+
wqAgwqAgwqAgwqAgPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPsKgIMKgIMKgIMKgIDxhIGhyZWY9Imh0dHBz
Oi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMiIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby90cG0y
PC9hPjxicj4KPGJyPgo8YnI+wqAgwqAgwqAgwqAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tPGJyPgo8YnI+wqAgwqAgwqAgwqAgRW5kIG9mIHRwbTIgRGlnZXN0LCBWb2wgMjEsIElzc3Vl
IDI8YnI+wqAgwqAgwqAgwqAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKio8YnI+
Cjxicj4KPGJyPgo8YnI+Cjxicj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXzxicj50cG0yIG1haWxpbmcgbGlzdDxicj4KPGEgaHJlZj0ibWFpbHRvOnRwbTJA
bGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8
YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3RwbTIiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4v
bGlzdGluZm8vdHBtMjwvYT48YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj48ZGl2IGlkPSJE
QUI0RkFEOC0yREQ3LTQwQkItQTFCOC00RTJBQTFGOUZERjIiPjxicj4KPHRhYmxlIHN0eWxlPSJi
b3JkZXItdG9wOjFweCBzb2xpZCAjZDNkNGRlIj4KCTx0cj4KICAgICAgICA8dGQgc3R5bGU9Indp
ZHRoOjU1cHg7cGFkZGluZy10b3A6MTNweCI+PGEgaHJlZj0iaHR0cHM6Ly93d3cuYXZhc3QuY29t
L3NpZy1lbWFpbD91dG1fbWVkaXVtPWVtYWlsJmFtcDt1dG1fc291cmNlPWxpbmsmYW1wO3V0bV9j
YW1wYWlnbj1zaWctZW1haWwmYW1wO3V0bV9jb250ZW50PXdlYm1haWwmYW1wO3V0bV90ZXJtPWlj
b24iIHRhcmdldD0iX2JsYW5rIj48aW1nIHNyYz0iaHR0cHM6Ly9pcG1jZG4uYXZhc3QuY29tL2lt
YWdlcy9pY29ucy9pY29uLWVudmVsb3BlLXRpY2stcm91bmQtb3JhbmdlLWFuaW1hdGVkLW5vLXJl
cGVhdC12MS5naWYiIGFsdD0iIiB3aWR0aD0iNDYiIGhlaWdodD0iMjkiIHN0eWxlPSJ3aWR0aDog
NDZweDsgaGVpZ2h0OiAyOXB4OyI+PC9hPjwvdGQ+CgkJPHRkIHN0eWxlPSJ3aWR0aDo0NzBweDtw
YWRkaW5nLXRvcDoxMnB4O2NvbG9yOiM0MTQyNGU7Zm9udC1zaXplOjEzcHg7Zm9udC1mYW1pbHk6
QXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7bGluZS1oZWlnaHQ6MThweCI+VmlydXMtZnJlZS4g
PGEgaHJlZj0iaHR0cHM6Ly93d3cuYXZhc3QuY29tL3NpZy1lbWFpbD91dG1fbWVkaXVtPWVtYWls
JmFtcDt1dG1fc291cmNlPWxpbmsmYW1wO3V0bV9jYW1wYWlnbj1zaWctZW1haWwmYW1wO3V0bV9j
b250ZW50PXdlYm1haWwmYW1wO3V0bV90ZXJtPWxpbmsiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0i
Y29sb3I6IzQ0NTNlYSI+d3d3LmF2YXN0LmNvbTwvYT4KCQk8L3RkPgoJPC90cj4KPC90YWJsZT48
YSBocmVmPSIjREFCNEZBRDgtMkRENy00MEJCLUExQjgtNEUyQUExRjlGREYyIiB3aWR0aD0iMSIg
aGVpZ2h0PSIxIj48L2E+PC9kaXY+Cg==

--===============0025404636327864664==--

