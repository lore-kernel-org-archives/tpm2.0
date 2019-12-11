Content-Type: multipart/mixed; boundary="===============2553113124346993806=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Wed, 11 Dec 2019 23:46:21 +0100
Message-ID: <CAJ8N_u94xJn4CkagD-r1eOavxDL=ahP7D3UcecNkBDy9h7umyQ@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E599B3@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2553113124346993806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi William,

Yes. It actually came to mind that my TPM might be faulty. But I had a
colleague running the script and he got exactly the same error, so it seems
there is a bug in the padding routine.


Den ons 11 dec. 2019 kl 16:50 skrev Roberts, William C <
william.c.roberts(a)intel.com>:

> Sounds like a possible issue in our TPM2 structures to signature format
> routine or the TPM itself:
>
> https://github.com/tpm2-software/tpm2-tools/blob/master/lib/tpm2_convert.=
c#L467
>
> Looks like the script has an rsa key, so you should get a signature scheme
> of:
> TPM2_ALG_RSASSA
>
> Which is just a straight memcpy from the TPM.
>
> Perhaps, the TPM is either getting it wrong or we need to call some magic
> OSSL padding routine?
>
>
> > -----Original Message-----
> > From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
> > Sent: Wednesday, December 11, 2019 4:58 AM
> > To: tpm2(a)lists.01.org
> > Subject: [tpm2] Re: tpm2_create signature verification fails due to
> > "RSA_padding_check_PKCS_type1:invalid padding"
> >
> > Here is the test case that explains the issue. Not sure if I am missing
> something. I
> > believe the certify.SIGNATURE is corrupt.
> >
> >
> > #!/bin/bash
> >
> > srk_handle=3D0x81000003
> > ek_handle=3D0x81010001
> >
> > # IDevID
> > tpm2_createak \
> > --ek-context=3D$ek_handle \
> > --ak-context=3DIDevID.ctx \
> > --key-algorithm=3Drsa \
> > --hash-algorithm=3Dsha1 \
> > --public=3DIDevID.pub \
> > --private=3DIDevID.priv
> > # --signing-algorithm=3Dsha1
> >
> > # LDevID
> > tpm2_create \
> > --parent-context=3D$srk_handle \
> > --hash-algorithm=3Dsha1 \
> > --key-algorithm=3Drsa2048 \
> > --public=3DLDevID.pub \
> > --private=3DLDevID.priv \
> > --creation-data=3DLDevID.CREATION_DATA \
> > --creation-hash=3DLDevID.CREATION_HASH \
> > --creation-ticket=3DLDevID.CREATION_TICKET
> >
> > tpm2_load \
> > --parent-context=3D$srk_handle \
> > --public=3DLDevID.pub \
> > --private=3DLDevID.priv \
> > --key-context=3DLDevID.ctx
> >
> > # Certify
> > tpm2_certify \
> > --certifiedkey-context=3DLDevID.ctx \
> > --signingkey-context=3DIDevID.ctx \
> > --hash-algorithm=3Dsha1 \
> > --attestation=3Dcertify.ATTESTATION \
> > --signature=3Dcertify.SIGNATURE \
> > --format=3Dplain
> >
> > # Certify Creation
> > tpm2_certifycreation \
> > --certifiedkey-context=3DLDevID.ctx \
> > --signingkey-context=3DIDevID.ctx \
> > --hash-algorithm=3Dsha1 \
> > --creation-hash=3DLDevID.CREATION_HASH \
> > --ticket=3DLDevID.CREATION_TICKET \
> > --signature=3Dcertifycreation.SIGNATURE \
> > --attestation=3Dcertifycreation.ATTESTATION \ --format=3Dplain
> >
> > # IDevID.der
> > echo 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl base64
> > -a -d > IDevID.header.temp dd if=3DIDevID.pub bs=3D1 skip=3D$(expr $(st=
at --
> > format=3D%s IDevID.pub) - 256) of=3DIDevID.modulus.temp echo -en '\x02\=
x03' >
> > IDevID.mid-header.temp echo -ne '\x01\x00\x01' > IDevID.exponent.temp c=
at
> > IDevID.header.temp IDevID.modulus.temp IDevID.mid-header.temp
> > IDevID.exponent.temp > IDevID.der
> >
> > # Remove first two bytes (byte size of struct) in
> certifycreation.ATTESTATION # in
> > order for hash to comply. Magic Header" must be ff 54 43 47 dd
> > if=3Dcertifycreation.ATTESTATION of=3Dcertifycreation.ATTESTATION_2 bs=
=3D1
> skip=3D2
> >
> > # WORKS: Verify Certify Creation
> > openssl dgst \
> > -verify IDevID.der -keyform der \
> > -sha1 -signature certifycreation.SIGNATURE certifycreation.ATTESTATION_2
> >
> > # FAILS: Verify Create
> > openssl dgst \
> > -verify IDevID.der -keyform der \
> > -sha1 -signature certify.SIGNATURE certify.ATTESTATION
> >
> > # WORKS:
> > openssl rsautl \
> > -verify \
> > -pubin -inkey IDevID.der -keyform DER \
> > -in certifycreation.SIGNATURE \
> > -out certifycreation.SIGNATURE.asn1
> >
> > dumpasn1 certifycreation.SIGNATURE.asn1
> >
> > # FAILS:
> > openssl rsautl \
> > -verify \
> > -pubin -inkey IDevID.der -keyform DER \
> > -in certify.SIGNATURE \
> > -out certify.SIGNATURE.asn1
> >
> > Den tis 10 dec. 2019 kl 23:40 skrev Niklas Andersson
> > <niklas.andersson(a)fredenheim.se <mailto:niklas.andersson(a)fredenheim=
.se>
> >:
> >
> >
> >       openssl can not verify plain signature (256 bytes) from
> tpm2_certify due
> > to bad padding.
> >
> >       This should work (verification of signature from
> tpm2_certifycreation
> > works fine):
> >
> >       openssl dgst -verify ../AIKOpaque.der -keyform der -sha1 -signatu=
re
> > Signature KeyAttest.bin
> >       Verification Failure
> >
> >       ....examine:
> >
> >       openssl rsautl -verify -inkey ../AIKOpaque.der -in Signature
> -pubin -
> > keyform der -pkcs > decrypted.bin
> >       RSA operation error
> >       140654247387584:error:0407008A:rsa
> > routines:RSA_padding_check_PKCS1_type_1:invalid
> > padding:../crypto/rsa/rsa_pk1.c:67:
> >       140654247387584:error:04067072:rsa
> > routines:rsa_ossl_public_decrypt:padding check
> > failed:../crypto/rsa/rsa_ossl.c:582:
> >
> >       ..Same operation on a plain signature from tpm2_certifycreation
> works:
> >
> >
> >       openssl rsautl -verify -inkey ../AIKOpaque.der -in
> > ../IdBinding.EXTRACTED_TPMT_SIGNATURE -pubin -keyform der  >
> > decrypted.bin
> >
> >       dumpasn1 decrypted.bin
> >         0  33: SEQUENCE {
> >         2   9:   SEQUENCE {
> >         4   5:     OBJECT IDENTIFIER sha1 (1 3 14 3 2 26)
> >        11   0:     NULL
> >              :     }
> >        13  20:   OCTET STRING 2D A1 D1 30 3A D2 FD 68 A1 5A 2F 9B 8B C1
> 1E DB
> > 36 A7 7C D4
> >              :   }
> >
> >
> >       So. It looks like a bug in tpm2_certify.
> >
> >       tool=3D"tpm2_certify" version=3D"4.1" tctis=3D"libtss2-tctildr"
> tcti-default=3Dtcti-
> > device
> >       tpm2-tss 2.3.2-rc0
> >
> >       Regards,
> >       Niklas
> >
> >
>
>

--===============2553113124346993806==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBXaWxsaWFtLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
WWVzLiBJdCBhY3R1YWxseSBjYW1lIHRvIG1pbmQgdGhhdCBteSBUUE0gbWlnaHQgYmUgZmF1bHR5
LiBCdXQgSSBoYWQgYSBjb2xsZWFndWUgcnVubmluZyB0aGUgc2NyaXB0IGFuZCBoZSBnb3QgZXhh
Y3RseSB0aGUgc2FtZSBlcnJvciwgc28gaXQgc2VlbXMgdGhlcmUgaXMgYSBidWcgaW4gdGhlIHBh
ZGRpbmcgcm91dGluZS48YnI+PC9kaXY+PC9kaXY+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxi
cj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0
dHIiPkRlbiBvbnMgMTEgZGVjLiAyMDE5IGtsIDE2OjUwIHNrcmV2IFJvYmVydHMsIFdpbGxpYW0g
QyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7Ojxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+U291bmRzIGxpa2UgYSBwb3NzaWJsZSBpc3N1ZSBpbiBvdXIgVFBNMiBzdHJ1Y3R1cmVz
IHRvIHNpZ25hdHVyZSBmb3JtYXQgcm91dGluZSBvciB0aGUgVFBNIGl0c2VsZjo8YnI+CjxhIGhy
ZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0
ZXIvbGliL3RwbTJfY29udmVydC5jI0w0NjciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0
ZXIvbGliL3RwbTJfY29udmVydC5jI0w0Njc8L2E+PGJyPgo8YnI+Ckxvb2tzIGxpa2UgdGhlIHNj
cmlwdCBoYXMgYW4gcnNhIGtleSwgc28geW91IHNob3VsZCBnZXQgYSBzaWduYXR1cmUgc2NoZW1l
IG9mOjxicj4KVFBNMl9BTEdfUlNBU1NBPGJyPgo8YnI+CldoaWNoIGlzIGp1c3QgYSBzdHJhaWdo
dCBtZW1jcHkgZnJvbSB0aGUgVFBNLjxicj4KPGJyPgpQZXJoYXBzLCB0aGUgVFBNIGlzIGVpdGhl
ciBnZXR0aW5nIGl0IHdyb25nIG9yIHdlIG5lZWQgdG8gY2FsbCBzb21lIG1hZ2ljIE9TU0wgcGFk
ZGluZyByb3V0aW5lPzxicj4KPGJyPgo8YnI+CiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS08YnI+CiZndDsgRnJvbTogTmlrbGFzIEFuZGVyc3NvbiBbbWFpbHRvOjxhIGhyZWY9Im1haWx0
bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWtsYXMu
YW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+XTxicj4KJmd0OyBTZW50OiBXZWRuZXNkYXksIERl
Y2VtYmVyIDExLCAyMDE5IDQ6NTggQU08YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4K
Jmd0OyBTdWJqZWN0OiBbdHBtMl0gUmU6IHRwbTJfY3JlYXRlIHNpZ25hdHVyZSB2ZXJpZmljYXRp
b24gZmFpbHMgZHVlIHRvPGJyPgomZ3Q7ICZxdW90O1JTQV9wYWRkaW5nX2NoZWNrX1BLQ1NfdHlw
ZTE6aW52YWxpZCBwYWRkaW5nJnF1b3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyBIZXJlIGlzIHRoZSB0
ZXN0IGNhc2UgdGhhdCBleHBsYWlucyB0aGUgaXNzdWUuIE5vdCBzdXJlIGlmIEkgYW0gbWlzc2lu
ZyBzb21ldGhpbmcuIEk8YnI+CiZndDsgYmVsaWV2ZSB0aGUgY2VydGlmeS5TSUdOQVRVUkUgaXMg
Y29ycnVwdC48YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAjIS9iaW4vYmFzaDxicj4KJmd0
OyA8YnI+CiZndDsgc3JrX2hhbmRsZT0weDgxMDAwMDAzPGJyPgomZ3Q7IGVrX2hhbmRsZT0weDgx
MDEwMDAxPGJyPgomZ3Q7IDxicj4KJmd0OyAjIElEZXZJRDxicj4KJmd0OyB0cG0yX2NyZWF0ZWFr
IFw8YnI+CiZndDsgLS1lay1jb250ZXh0PSRla19oYW5kbGUgXDxicj4KJmd0OyAtLWFrLWNvbnRl
eHQ9SURldklELmN0eCBcPGJyPgomZ3Q7IC0ta2V5LWFsZ29yaXRobT1yc2EgXDxicj4KJmd0OyAt
LWhhc2gtYWxnb3JpdGhtPXNoYTEgXDxicj4KJmd0OyAtLXB1YmxpYz1JRGV2SUQucHViIFw8YnI+
CiZndDsgLS1wcml2YXRlPUlEZXZJRC5wcml2PGJyPgomZ3Q7ICMgLS1zaWduaW5nLWFsZ29yaXRo
bT1zaGExPGJyPgomZ3Q7IDxicj4KJmd0OyAjIExEZXZJRDxicj4KJmd0OyB0cG0yX2NyZWF0ZSBc
PGJyPgomZ3Q7IC0tcGFyZW50LWNvbnRleHQ9JHNya19oYW5kbGUgXDxicj4KJmd0OyAtLWhhc2gt
YWxnb3JpdGhtPXNoYTEgXDxicj4KJmd0OyAtLWtleS1hbGdvcml0aG09cnNhMjA0OCBcPGJyPgom
Z3Q7IC0tcHVibGljPUxEZXZJRC5wdWIgXDxicj4KJmd0OyAtLXByaXZhdGU9TERldklELnByaXYg
XDxicj4KJmd0OyAtLWNyZWF0aW9uLWRhdGE9TERldklELkNSRUFUSU9OX0RBVEEgXDxicj4KJmd0
OyAtLWNyZWF0aW9uLWhhc2g9TERldklELkNSRUFUSU9OX0hBU0ggXDxicj4KJmd0OyAtLWNyZWF0
aW9uLXRpY2tldD1MRGV2SUQuQ1JFQVRJT05fVElDS0VUPGJyPgomZ3Q7IDxicj4KJmd0OyB0cG0y
X2xvYWQgXDxicj4KJmd0OyAtLXBhcmVudC1jb250ZXh0PSRzcmtfaGFuZGxlIFw8YnI+CiZndDsg
LS1wdWJsaWM9TERldklELnB1YiBcPGJyPgomZ3Q7IC0tcHJpdmF0ZT1MRGV2SUQucHJpdiBcPGJy
PgomZ3Q7IC0ta2V5LWNvbnRleHQ9TERldklELmN0eDxicj4KJmd0OyA8YnI+CiZndDsgIyBDZXJ0
aWZ5PGJyPgomZ3Q7IHRwbTJfY2VydGlmeSBcPGJyPgomZ3Q7IC0tY2VydGlmaWVka2V5LWNvbnRl
eHQ9TERldklELmN0eCBcPGJyPgomZ3Q7IC0tc2lnbmluZ2tleS1jb250ZXh0PUlEZXZJRC5jdHgg
XDxicj4KJmd0OyAtLWhhc2gtYWxnb3JpdGhtPXNoYTEgXDxicj4KJmd0OyAtLWF0dGVzdGF0aW9u
PWNlcnRpZnkuQVRURVNUQVRJT04gXDxicj4KJmd0OyAtLXNpZ25hdHVyZT1jZXJ0aWZ5LlNJR05B
VFVSRSBcPGJyPgomZ3Q7IC0tZm9ybWF0PXBsYWluPGJyPgomZ3Q7IDxicj4KJmd0OyAjIENlcnRp
ZnkgQ3JlYXRpb248YnI+CiZndDsgdHBtMl9jZXJ0aWZ5Y3JlYXRpb24gXDxicj4KJmd0OyAtLWNl
cnRpZmllZGtleS1jb250ZXh0PUxEZXZJRC5jdHggXDxicj4KJmd0OyAtLXNpZ25pbmdrZXktY29u
dGV4dD1JRGV2SUQuY3R4IFw8YnI+CiZndDsgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+CiZn
dDsgLS1jcmVhdGlvbi1oYXNoPUxEZXZJRC5DUkVBVElPTl9IQVNIIFw8YnI+CiZndDsgLS10aWNr
ZXQ9TERldklELkNSRUFUSU9OX1RJQ0tFVCBcPGJyPgomZ3Q7IC0tc2lnbmF0dXJlPWNlcnRpZnlj
cmVhdGlvbi5TSUdOQVRVUkUgXDxicj4KJmd0OyAtLWF0dGVzdGF0aW9uPWNlcnRpZnljcmVhdGlv
bi5BVFRFU1RBVElPTiBcIC0tZm9ybWF0PXBsYWluPGJyPgomZ3Q7IDxicj4KJmd0OyAjIElEZXZJ
RC5kZXI8YnI+CiZndDsgZWNobyAmIzM5O01JSUJJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBUThB
TUlJQkNnS0NBUUVBJiMzOTsgfCBvcGVuc3NsIGJhc2U2NDxicj4KJmd0OyAtYSAtZCAmZ3Q7IElE
ZXZJRC5oZWFkZXIudGVtcCBkZCBpZj1JRGV2SUQucHViIGJzPTEgc2tpcD0kKGV4cHIgJChzdGF0
IC0tPGJyPgomZ3Q7IGZvcm1hdD0lcyBJRGV2SUQucHViKSAtIDI1Nikgb2Y9SURldklELm1vZHVs
dXMudGVtcCBlY2hvIC1lbiAmIzM5O1x4MDJceDAzJiMzOTsgJmd0Ozxicj4KJmd0OyBJRGV2SUQu
bWlkLWhlYWRlci50ZW1wIGVjaG8gLW5lICYjMzk7XHgwMVx4MDBceDAxJiMzOTsgJmd0OyBJRGV2
SUQuZXhwb25lbnQudGVtcCBjYXQ8YnI+CiZndDsgSURldklELmhlYWRlci50ZW1wIElEZXZJRC5t
b2R1bHVzLnRlbXAgSURldklELm1pZC1oZWFkZXIudGVtcDxicj4KJmd0OyBJRGV2SUQuZXhwb25l
bnQudGVtcCAmZ3Q7IElEZXZJRC5kZXI8YnI+CiZndDsgPGJyPgomZ3Q7ICMgUmVtb3ZlIGZpcnN0
IHR3byBieXRlcyAoYnl0ZSBzaXplIG9mIHN0cnVjdCkgaW4gY2VydGlmeWNyZWF0aW9uLkFUVEVT
VEFUSU9OICMgaW48YnI+CiZndDsgb3JkZXIgZm9yIGhhc2ggdG8gY29tcGx5LiBNYWdpYyBIZWFk
ZXImcXVvdDsgbXVzdCBiZSBmZiA1NCA0MyA0NyBkZDxicj4KJmd0OyBpZj1jZXJ0aWZ5Y3JlYXRp
b24uQVRURVNUQVRJT04gb2Y9Y2VydGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9OXzIgYnM9MSBza2lw
PTI8YnI+CiZndDsgPGJyPgomZ3Q7ICMgV09SS1M6IFZlcmlmeSBDZXJ0aWZ5IENyZWF0aW9uPGJy
PgomZ3Q7IG9wZW5zc2wgZGdzdCBcPGJyPgomZ3Q7IC12ZXJpZnkgSURldklELmRlciAta2V5Zm9y
bSBkZXIgXDxicj4KJmd0OyAtc2hhMSAtc2lnbmF0dXJlIGNlcnRpZnljcmVhdGlvbi5TSUdOQVRV
UkUgY2VydGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9OXzI8YnI+CiZndDsgPGJyPgomZ3Q7ICMgRkFJ
TFM6IFZlcmlmeSBDcmVhdGU8YnI+CiZndDsgb3BlbnNzbCBkZ3N0IFw8YnI+CiZndDsgLXZlcmlm
eSBJRGV2SUQuZGVyIC1rZXlmb3JtIGRlciBcPGJyPgomZ3Q7IC1zaGExIC1zaWduYXR1cmUgY2Vy
dGlmeS5TSUdOQVRVUkUgY2VydGlmeS5BVFRFU1RBVElPTjxicj4KJmd0OyA8YnI+CiZndDsgIyBX
T1JLUzo8YnI+CiZndDsgb3BlbnNzbCByc2F1dGwgXDxicj4KJmd0OyAtdmVyaWZ5IFw8YnI+CiZn
dDsgLXB1YmluIC1pbmtleSBJRGV2SUQuZGVyIC1rZXlmb3JtIERFUiBcPGJyPgomZ3Q7IC1pbiBj
ZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFIFw8YnI+CiZndDsgLW91dCBjZXJ0aWZ5Y3JlYXRpb24u
U0lHTkFUVVJFLmFzbjE8YnI+CiZndDsgPGJyPgomZ3Q7IGR1bXBhc24xIGNlcnRpZnljcmVhdGlv
bi5TSUdOQVRVUkUuYXNuMTxicj4KJmd0OyA8YnI+CiZndDsgIyBGQUlMUzo8YnI+CiZndDsgb3Bl
bnNzbCByc2F1dGwgXDxicj4KJmd0OyAtdmVyaWZ5IFw8YnI+CiZndDsgLXB1YmluIC1pbmtleSBJ
RGV2SUQuZGVyIC1rZXlmb3JtIERFUiBcPGJyPgomZ3Q7IC1pbiBjZXJ0aWZ5LlNJR05BVFVSRSBc
PGJyPgomZ3Q7IC1vdXQgY2VydGlmeS5TSUdOQVRVUkUuYXNuMTxicj4KJmd0OyA8YnI+CiZndDsg
RGVuIHRpcyAxMCBkZWMuIDIwMTkga2wgMjM6NDAgc2tyZXYgTmlrbGFzIEFuZGVyc3Nvbjxicj4K
Jmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIg
dGFyZ2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT4gJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJn
ZXQ9Il9ibGFuayI+bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPiZndDsgJmd0Ozo8
YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgb3BlbnNzbCBjYW4gbm90IHZl
cmlmeSBwbGFpbiBzaWduYXR1cmUgKDI1NiBieXRlcykgZnJvbSB0cG0yX2NlcnRpZnkgZHVlPGJy
PgomZ3Q7IHRvIGJhZCBwYWRkaW5nLjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoFRoaXMg
c2hvdWxkIHdvcmsgKHZlcmlmaWNhdGlvbiBvZiBzaWduYXR1cmUgZnJvbSB0cG0yX2NlcnRpZnlj
cmVhdGlvbjxicj4KJmd0OyB3b3JrcyBmaW5lKTo8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAg
wqBvcGVuc3NsIGRnc3QgLXZlcmlmeSAuLi9BSUtPcGFxdWUuZGVyIC1rZXlmb3JtIGRlciAtc2hh
MSAtc2lnbmF0dXJlPGJyPgomZ3Q7IFNpZ25hdHVyZSBLZXlBdHRlc3QuYmluPGJyPgomZ3Q7wqAg
wqAgwqAgwqBWZXJpZmljYXRpb24gRmFpbHVyZTxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDC
oC4uLi5leGFtaW5lOjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoG9wZW5zc2wgcnNhdXRs
IC12ZXJpZnkgLWlua2V5IC4uL0FJS09wYXF1ZS5kZXIgLWluIFNpZ25hdHVyZSAtcHViaW4gLTxi
cj4KJmd0OyBrZXlmb3JtIGRlciAtcGtjcyAmZ3Q7IGRlY3J5cHRlZC5iaW48YnI+CiZndDvCoCDC
oCDCoCDCoFJTQSBvcGVyYXRpb24gZXJyb3I8YnI+CiZndDvCoCDCoCDCoCDCoDE0MDY1NDI0NzM4
NzU4NDplcnJvcjowNDA3MDA4QTpyc2E8YnI+CiZndDsgcm91dGluZXM6UlNBX3BhZGRpbmdfY2hl
Y2tfUEtDUzFfdHlwZV8xOmludmFsaWQ8YnI+CiZndDsgcGFkZGluZzouLi9jcnlwdG8vcnNhL3Jz
YV9wazEuYzo2Nzo8YnI+CiZndDvCoCDCoCDCoCDCoDE0MDY1NDI0NzM4NzU4NDplcnJvcjowNDA2
NzA3Mjpyc2E8YnI+CiZndDsgcm91dGluZXM6cnNhX29zc2xfcHVibGljX2RlY3J5cHQ6cGFkZGlu
ZyBjaGVjazxicj4KJmd0OyBmYWlsZWQ6Li4vY3J5cHRvL3JzYS9yc2Ffb3NzbC5jOjU4Mjo8YnI+
CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAuLlNhbWUgb3BlcmF0aW9uIG9uIGEgcGxhaW4gc2ln
bmF0dXJlIGZyb20gdHBtMl9jZXJ0aWZ5Y3JlYXRpb24gd29ya3M6PGJyPgomZ3Q7IDxicj4KJmd0
OyA8YnI+CiZndDvCoCDCoCDCoCDCoG9wZW5zc2wgcnNhdXRsIC12ZXJpZnkgLWlua2V5IC4uL0FJ
S09wYXF1ZS5kZXIgLWluPGJyPgomZ3Q7IC4uL0lkQmluZGluZy5FWFRSQUNURURfVFBNVF9TSUdO
QVRVUkUgLXB1YmluIC1rZXlmb3JtIGRlcsKgICZndDs8YnI+CiZndDsgZGVjcnlwdGVkLmJpbjxi
cj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoGR1bXBhc24xIGRlY3J5cHRlZC5iaW48YnI+CiZn
dDvCoCDCoCDCoCDCoCDCoDDCoCAzMzogU0VRVUVOQ0Ugezxicj4KJmd0O8KgIMKgIMKgIMKgIMKg
MsKgIMKgOTrCoCDCoFNFUVVFTkNFIHs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoDTCoCDCoDU6wqAg
wqAgwqBPQkpFQ1QgSURFTlRJRklFUiBzaGExICgxIDMgMTQgMyAyIDI2KTxicj4KJmd0O8KgIMKg
IMKgIMKgIDExwqAgwqAwOsKgIMKgIMKgTlVMTDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IDrCoCDCoCDCoH08YnI+CiZndDvCoCDCoCDCoCDCoCAxM8KgIDIwOsKgIMKgT0NURVQgU1RSSU5H
IDJEIEExIEQxIDMwIDNBIEQyIEZEIDY4IEExIDVBIDJGIDlCIDhCIEMxIDFFIERCPGJyPgomZ3Q7
IDM2IEE3IDdDIEQ0PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgOsKgIMKgfTxicj4KJmd0
OyA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBTby4gSXQgbG9va3MgbGlrZSBhIGJ1ZyBp
biB0cG0yX2NlcnRpZnkuPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgdG9vbD0mcXVvdDt0
cG0yX2NlcnRpZnkmcXVvdDsgdmVyc2lvbj0mcXVvdDs0LjEmcXVvdDsgdGN0aXM9JnF1b3Q7bGli
dHNzMi10Y3RpbGRyJnF1b3Q7IHRjdGktZGVmYXVsdD10Y3RpLTxicj4KJmd0OyBkZXZpY2U8YnI+
CiZndDvCoCDCoCDCoCDCoHRwbTItdHNzIDIuMy4yLXJjMDxicj4KJmd0OyA8YnI+CiZndDvCoCDC
oCDCoCDCoFJlZ2FyZHMsPGJyPgomZ3Q7wqAgwqAgwqAgwqBOaWtsYXM8YnI+CiZndDsgPGJyPgom
Z3Q7IDxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============2553113124346993806==--

