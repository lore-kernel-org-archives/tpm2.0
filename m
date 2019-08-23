Content-Type: multipart/mixed; boundary="===============1531319383066653274=="
MIME-Version: 1.0
From: Rahul Hardikar <rahulhardikar at gmail.com>
Subject: Re: [tpm2] OpenSSL Compatibility in tpm2_MakeCredential
Date: Fri, 23 Aug 2019 11:11:31 -0700
Message-ID: <CAP3jAwT=BUfDHGMqaVvLD2BE+ZN5QGOdCnomjpGMvD87LtK=ag@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DEE4B9@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1531319383066653274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the response.
Yes, after searching around I made 2 mistakes:
1. Didn't use the tpm2_openssl.c functions
2. I need to place the ssl library after the -o option and before crypto
lib, otherwise i would get linker issues.
 Now, it compiles, but i need to see if it works :)  I'm guessing it should
since tpm2_makecredential -T none ... works

On Fri, Aug 23, 2019 at 10:07 AM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> The current master and 4.0 release can use >=3D 1.0.2g. However, there is=
 a
> compat layer
> In lib/tpm2_openssl.c and it's respective header file as well.
>
> > -----Original Message-----
> > From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Rahul
> Hardikar
> > Sent: Friday, August 16, 2019 4:04 PM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] OpenSSL Compatibility in tpm2_MakeCredential
> >
> > Hello Experts,
> >
> > What is OpenSSL version being used to implement the TPM_MakeCredential
> off
> > the TPM chip? (i'm talking about the tpm2_makecredential.c code in
> > tpm2_tools/, that has 2 implementations, one using TPM chip and one usi=
ng
> > OpenSSL)
> >
> > I copied the code on my server but it seems that mine supports 1.0.2n
> and my
> > manager said that they will not upgrade to newer versions until next
> year.
> >
> > How can I compile this ? How do I make it compatible with 1.0.2n are
> there ways
> > to copy code present in  the  OpenSSL version used in tpm2_tools?
> >  This is a snippet of the compiler errors I get in my local file:
> > tpm2_common.c: In function =E2=80=98encrypt_seed_with_rsa_public_key=E2=
=80=99:
> > tpm2_common.c:894:5: warning: implicit declaration of function
> > =E2=80=98RSA_padding_add_PKCS1_OAEP_mgf1=E2=80=99 [-Wimplicit-function-=
declaration]
> >      int return_code =3D RSA_padding_add_PKCS1_OAEP_mgf1(encoded,
> >      ^
> > tpm2_common.c: In function =E2=80=98aes_encrypt_buffers=E2=80=99:
> > tpm2_common.c:1194:5: warning: implicit declaration of function
> > =E2=80=98tpm_alg_to_ossl=E2=80=99 [-Wimplicit-function-declaration]
> >      const EVP_CIPHER *cipher =3D tpm_alg_to_ossl(sym); ...
> > tpm2_common.c:1441:5: error: incompatible type for argument 1 of
> > =E2=80=98EVP_DigestUpdate=E2=80=99
> >      return EVP_DigestUpdate(ctx->md_ctx, data, len);
> >      ^
> > In file included from tpm2_common.c:11:0:
> > /usr/include/node/openssl/evp.h:573:5: note: expected =E2=80=98struct E=
VP_MD_CTX
> *=E2=80=99
> > but argument is of type =E2=80=98EVP_MD_CTX=E2=80=99
> >  int EVP_DigestUpdate(EVP_MD_CTX *ctx, const void *d, size_t cnt);
> >      ^
> > tpm2_common.c: In function =E2=80=98HMAC_Final=E2=80=99:
> > tpm2_common.c:1452:5: error: incompatible type for argument 1 of
> > =E2=80=98EVP_DigestFinal_ex=E2=80=99
> >      if (!EVP_DigestFinal_ex(ctx->md_ctx, buf, &i))
> >
> > 1.0.2 does not seem to have it or arguments are different!
> >
> > Thanks,
> > Rahul
> >      ^
>
>

--===============1531319383066653274==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzIGZvciB0aGUgcmVzcG9uc2UuPGRpdj5ZZXMsIGFmdGVyIHNl
YXJjaGluZyBhcm91bmQgSSBtYWRlIDIgbWlzdGFrZXM6wqA8L2Rpdj48ZGl2PjEuIERpZG4mIzM5
O3QgdXNlIHRoZSB0cG0yX29wZW5zc2wuYyBmdW5jdGlvbnM8L2Rpdj48ZGl2PjIuIEkgbmVlZCB0
byBwbGFjZSB0aGUgc3NsIGxpYnJhcnkgYWZ0ZXIgdGhlIC1vIG9wdGlvbiBhbmQgYmVmb3JlIGNy
eXB0byBsaWIsIG90aGVyd2lzZSBpIHdvdWxkIGdldCBsaW5rZXIgaXNzdWVzLjwvZGl2PjxkaXY+
wqBOb3csIGl0IGNvbXBpbGVzLCBidXQgaSBuZWVkIHRvIHNlZSBpZiBpdCB3b3JrcyA6KSDCoEkm
IzM5O20gZ3Vlc3NpbmcgaXQgc2hvdWxkIHNpbmNlIHRwbTJfbWFrZWNyZWRlbnRpYWwgLVQgbm9u
ZSAuLi4gd29ya3M8L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAxMDow
NyBBTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9i
ZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3Rl
Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O2JvcmRlci1sZWZ0LXN0eWxl
OnNvbGlkO2JvcmRlci1sZWZ0LWNvbG9yOnJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFl
eCI+VGhlIGN1cnJlbnQgbWFzdGVyIGFuZCA0LjAgcmVsZWFzZSBjYW4gdXNlICZndDs9IDEuMC4y
Zy4gSG93ZXZlciwgdGhlcmUgaXMgYSBjb21wYXQgbGF5ZXI8YnI+CkluIGxpYi90cG0yX29wZW5z
c2wuYyBhbmQgaXQmIzM5O3MgcmVzcGVjdGl2ZSBoZWFkZXIgZmlsZSBhcyB3ZWxsLjxicj4KPGJy
PgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206IHRwbTIgW21h
aWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1ib3VuY2VzQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTItYm91bmNlc0BsaXN0cy4wMS5vcmc8L2E+XSBPbiBCZWhhbGYgT2YgUmFodWwg
SGFyZGlrYXI8YnI+CiZndDsgU2VudDogRnJpZGF5LCBBdWd1c3QgMTYsIDIwMTkgNDowNCBQTTxi
cj4KJmd0OyBUbzogPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFN1YmplY3Q6IFt0cG0yXSBPcGVu
U1NMIENvbXBhdGliaWxpdHkgaW4gdHBtMl9NYWtlQ3JlZGVudGlhbDxicj4KJmd0OyA8YnI+CiZn
dDsgSGVsbG8gRXhwZXJ0cyw8YnI+CiZndDsgPGJyPgomZ3Q7IFdoYXQgaXMgT3BlblNTTCB2ZXJz
aW9uIGJlaW5nIHVzZWQgdG8gaW1wbGVtZW50IHRoZSBUUE1fTWFrZUNyZWRlbnRpYWwgb2ZmPGJy
PgomZ3Q7IHRoZSBUUE0gY2hpcD8gKGkmIzM5O20gdGFsa2luZyBhYm91dCB0aGUgdHBtMl9tYWtl
Y3JlZGVudGlhbC5jIGNvZGUgaW48YnI+CiZndDsgdHBtMl90b29scy8sIHRoYXQgaGFzIDIgaW1w
bGVtZW50YXRpb25zLCBvbmUgdXNpbmcgVFBNIGNoaXAgYW5kIG9uZSB1c2luZzxicj4KJmd0OyBP
cGVuU1NMKTxicj4KJmd0OyA8YnI+CiZndDsgSSBjb3BpZWQgdGhlIGNvZGUgb24gbXkgc2VydmVy
IGJ1dCBpdCBzZWVtcyB0aGF0IG1pbmUgc3VwcG9ydHMgMS4wLjJuIGFuZCBteTxicj4KJmd0OyBt
YW5hZ2VyIHNhaWQgdGhhdCB0aGV5IHdpbGwgbm90IHVwZ3JhZGUgdG8gbmV3ZXIgdmVyc2lvbnMg
dW50aWwgbmV4dCB5ZWFyLjxicj4KJmd0OyA8YnI+CiZndDsgSG93IGNhbiBJIGNvbXBpbGUgdGhp
cyA/IEhvdyBkbyBJIG1ha2UgaXQgY29tcGF0aWJsZSB3aXRoIDEuMC4ybiBhcmUgdGhlcmUgd2F5
czxicj4KJmd0OyB0byBjb3B5IGNvZGUgcHJlc2VudCBpbsKgIHRoZcKgIE9wZW5TU0wgdmVyc2lv
biB1c2VkIGluIHRwbTJfdG9vbHM/PGJyPgomZ3Q7wqAgVGhpcyBpcyBhIHNuaXBwZXQgb2YgdGhl
IGNvbXBpbGVyIGVycm9ycyBJIGdldCBpbiBteSBsb2NhbCBmaWxlOjxicj4KJmd0OyB0cG0yX2Nv
bW1vbi5jOiBJbiBmdW5jdGlvbiDigJhlbmNyeXB0X3NlZWRfd2l0aF9yc2FfcHVibGljX2tleeKA
mTo8YnI+CiZndDsgdHBtMl9jb21tb24uYzo4OTQ6NTogd2FybmluZzogaW1wbGljaXQgZGVjbGFy
YXRpb24gb2YgZnVuY3Rpb248YnI+CiZndDsg4oCYUlNBX3BhZGRpbmdfYWRkX1BLQ1MxX09BRVBf
bWdmMeKAmSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl08YnI+CiZndDvCoCDCoCDC
oCBpbnQgcmV0dXJuX2NvZGUgPSBSU0FfcGFkZGluZ19hZGRfUEtDUzFfT0FFUF9tZ2YxKGVuY29k
ZWQsPGJyPgomZ3Q7wqAgwqAgwqAgXjxicj4KJmd0OyB0cG0yX2NvbW1vbi5jOiBJbiBmdW5jdGlv
biDigJhhZXNfZW5jcnlwdF9idWZmZXJz4oCZOjxicj4KJmd0OyB0cG0yX2NvbW1vbi5jOjExOTQ6
NTogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb248YnI+CiZndDsg4oCY
dHBtX2FsZ190b19vc3Ns4oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXTxicj4K
Jmd0O8KgIMKgIMKgIGNvbnN0IEVWUF9DSVBIRVIgKmNpcGhlciA9IHRwbV9hbGdfdG9fb3NzbChz
eW0pOyAuLi48YnI+CiZndDsgdHBtMl9jb21tb24uYzoxNDQxOjU6IGVycm9yOiBpbmNvbXBhdGli
bGUgdHlwZSBmb3IgYXJndW1lbnQgMSBvZjxicj4KJmd0OyDigJhFVlBfRGlnZXN0VXBkYXRl4oCZ
PGJyPgomZ3Q7wqAgwqAgwqAgcmV0dXJuIEVWUF9EaWdlc3RVcGRhdGUoY3R4LSZndDttZF9jdHgs
IGRhdGEsIGxlbik7PGJyPgomZ3Q7wqAgwqAgwqAgXjxicj4KJmd0OyBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gdHBtMl9jb21tb24uYzoxMTowOjxicj4KJmd0OyAvdXNyL2luY2x1ZGUvbm9kZS9vcGVu
c3NsL2V2cC5oOjU3Mzo1OiBub3RlOiBleHBlY3RlZCDigJhzdHJ1Y3QgRVZQX01EX0NUWCAq4oCZ
PGJyPgomZ3Q7IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKAmEVWUF9NRF9DVFjigJk8YnI+CiZn
dDvCoCBpbnQgRVZQX0RpZ2VzdFVwZGF0ZShFVlBfTURfQ1RYICpjdHgsIGNvbnN0IHZvaWQgKmQs
IHNpemVfdCBjbnQpOzxicj4KJmd0O8KgIMKgIMKgIF48YnI+CiZndDsgdHBtMl9jb21tb24uYzog
SW4gZnVuY3Rpb24g4oCYSE1BQ19GaW5hbOKAmTo8YnI+CiZndDsgdHBtMl9jb21tb24uYzoxNDUy
OjU6IGVycm9yOiBpbmNvbXBhdGlibGUgdHlwZSBmb3IgYXJndW1lbnQgMSBvZjxicj4KJmd0OyDi
gJhFVlBfRGlnZXN0RmluYWxfZXjigJk8YnI+CiZndDvCoCDCoCDCoCBpZiAoIUVWUF9EaWdlc3RG
aW5hbF9leChjdHgtJmd0O21kX2N0eCwgYnVmLCAmYW1wO2kpKTxicj4KJmd0OyA8YnI+CiZndDsg
MS4wLjIgZG9lcyBub3Qgc2VlbSB0byBoYXZlIGl0IG9yIGFyZ3VtZW50cyBhcmUgZGlmZmVyZW50
ITxicj4KJmd0OyA8YnI+CiZndDsgVGhhbmtzLDxicj4KJmd0OyBSYWh1bDxicj4KJmd0O8KgIMKg
IMKgIF48YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============1531319383066653274==--

