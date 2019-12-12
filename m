Content-Type: multipart/mixed; boundary="===============5703757234976841701=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Thu, 12 Dec 2019 09:19:27 +0000
Message-ID: <CAKrSGQR_8v8mWQ+WXY=Hu5861ckqN6v+ZV+9a2F2UbsD01Lhkg@mail.gmail.com>
In-Reply-To: CAJ8N_u94xJn4CkagD-r1eOavxDL=ahP7D3UcecNkBDy9h7umyQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5703757234976841701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have not had much time to research what you have tried, but I wonder if
it might be the same as the following situation we hit recently. iirc later
versions of OpenSSL (1.1.0 & greater) are less relaxed about padding
conventions.

https://mta.openssl.org/pipermail/openssl-dev/2016-February/005100.html

On Wed, Dec 11, 2019 at 10:46 PM Niklas Andersson <
niklas.andersson(a)fredenheim.se> wrote:

> Hi William,
>
> Yes. It actually came to mind that my TPM might be faulty. But I had a
> colleague running the script and he got exactly the same error, so it see=
ms
> there is a bug in the padding routine.
>
>
> Den ons 11 dec. 2019 kl 16:50 skrev Roberts, William C <
> william.c.roberts(a)intel.com>:
>
>> Sounds like a possible issue in our TPM2 structures to signature format
>> routine or the TPM itself:
>>
>> https://github.com/tpm2-software/tpm2-tools/blob/master/lib/tpm2_convert=
.c#L467
>>
>> Looks like the script has an rsa key, so you should get a signature
>> scheme of:
>> TPM2_ALG_RSASSA
>>
>> Which is just a straight memcpy from the TPM.
>>
>> Perhaps, the TPM is either getting it wrong or we need to call some magic
>> OSSL padding routine?
>>
>>
>> > -----Original Message-----
>> > From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
>> > Sent: Wednesday, December 11, 2019 4:58 AM
>> > To: tpm2(a)lists.01.org
>> > Subject: [tpm2] Re: tpm2_create signature verification fails due to
>> > "RSA_padding_check_PKCS_type1:invalid padding"
>> >
>> > Here is the test case that explains the issue. Not sure if I am missing
>> something. I
>> > believe the certify.SIGNATURE is corrupt.
>> >
>> >
>> > #!/bin/bash
>> >
>> > srk_handle=3D0x81000003
>> > ek_handle=3D0x81010001
>> >
>> > # IDevID
>> > tpm2_createak \
>> > --ek-context=3D$ek_handle \
>> > --ak-context=3DIDevID.ctx \
>> > --key-algorithm=3Drsa \
>> > --hash-algorithm=3Dsha1 \
>> > --public=3DIDevID.pub \
>> > --private=3DIDevID.priv
>> > # --signing-algorithm=3Dsha1
>> >
>> > # LDevID
>> > tpm2_create \
>> > --parent-context=3D$srk_handle \
>> > --hash-algorithm=3Dsha1 \
>> > --key-algorithm=3Drsa2048 \
>> > --public=3DLDevID.pub \
>> > --private=3DLDevID.priv \
>> > --creation-data=3DLDevID.CREATION_DATA \
>> > --creation-hash=3DLDevID.CREATION_HASH \
>> > --creation-ticket=3DLDevID.CREATION_TICKET
>> >
>> > tpm2_load \
>> > --parent-context=3D$srk_handle \
>> > --public=3DLDevID.pub \
>> > --private=3DLDevID.priv \
>> > --key-context=3DLDevID.ctx
>> >
>> > # Certify
>> > tpm2_certify \
>> > --certifiedkey-context=3DLDevID.ctx \
>> > --signingkey-context=3DIDevID.ctx \
>> > --hash-algorithm=3Dsha1 \
>> > --attestation=3Dcertify.ATTESTATION \
>> > --signature=3Dcertify.SIGNATURE \
>> > --format=3Dplain
>> >
>> > # Certify Creation
>> > tpm2_certifycreation \
>> > --certifiedkey-context=3DLDevID.ctx \
>> > --signingkey-context=3DIDevID.ctx \
>> > --hash-algorithm=3Dsha1 \
>> > --creation-hash=3DLDevID.CREATION_HASH \
>> > --ticket=3DLDevID.CREATION_TICKET \
>> > --signature=3Dcertifycreation.SIGNATURE \
>> > --attestation=3Dcertifycreation.ATTESTATION \ --format=3Dplain
>> >
>> > # IDevID.der
>> > echo 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl base64
>> > -a -d > IDevID.header.temp dd if=3DIDevID.pub bs=3D1 skip=3D$(expr $(s=
tat --
>> > format=3D%s IDevID.pub) - 256) of=3DIDevID.modulus.temp echo -en '\x02=
\x03'
>> >
>> > IDevID.mid-header.temp echo -ne '\x01\x00\x01' > IDevID.exponent.temp
>> cat
>> > IDevID.header.temp IDevID.modulus.temp IDevID.mid-header.temp
>> > IDevID.exponent.temp > IDevID.der
>> >
>> > # Remove first two bytes (byte size of struct) in
>> certifycreation.ATTESTATION # in
>> > order for hash to comply. Magic Header" must be ff 54 43 47 dd
>> > if=3Dcertifycreation.ATTESTATION of=3Dcertifycreation.ATTESTATION_2 bs=
=3D1
>> skip=3D2
>> >
>> > # WORKS: Verify Certify Creation
>> > openssl dgst \
>> > -verify IDevID.der -keyform der \
>> > -sha1 -signature certifycreation.SIGNATURE certifycreation.ATTESTATION=
_2
>> >
>> > # FAILS: Verify Create
>> > openssl dgst \
>> > -verify IDevID.der -keyform der \
>> > -sha1 -signature certify.SIGNATURE certify.ATTESTATION
>> >
>> > # WORKS:
>> > openssl rsautl \
>> > -verify \
>> > -pubin -inkey IDevID.der -keyform DER \
>> > -in certifycreation.SIGNATURE \
>> > -out certifycreation.SIGNATURE.asn1
>> >
>> > dumpasn1 certifycreation.SIGNATURE.asn1
>> >
>> > # FAILS:
>> > openssl rsautl \
>> > -verify \
>> > -pubin -inkey IDevID.der -keyform DER \
>> > -in certify.SIGNATURE \
>> > -out certify.SIGNATURE.asn1
>> >
>> > Den tis 10 dec. 2019 kl 23:40 skrev Niklas Andersson
>> > <niklas.andersson(a)fredenheim.se <mailto:niklas.andersson(a)fredenhei=
m.se>
>> >:
>> >
>> >
>> >       openssl can not verify plain signature (256 bytes) from
>> tpm2_certify due
>> > to bad padding.
>> >
>> >       This should work (verification of signature from
>> tpm2_certifycreation
>> > works fine):
>> >
>> >       openssl dgst -verify ../AIKOpaque.der -keyform der -sha1
>> -signature
>> > Signature KeyAttest.bin
>> >       Verification Failure
>> >
>> >       ....examine:
>> >
>> >       openssl rsautl -verify -inkey ../AIKOpaque.der -in Signature
>> -pubin -
>> > keyform der -pkcs > decrypted.bin
>> >       RSA operation error
>> >       140654247387584:error:0407008A:rsa
>> > routines:RSA_padding_check_PKCS1_type_1:invalid
>> > padding:../crypto/rsa/rsa_pk1.c:67:
>> >       140654247387584:error:04067072:rsa
>> > routines:rsa_ossl_public_decrypt:padding check
>> > failed:../crypto/rsa/rsa_ossl.c:582:
>> >
>> >       ..Same operation on a plain signature from tpm2_certifycreation
>> works:
>> >
>> >
>> >       openssl rsautl -verify -inkey ../AIKOpaque.der -in
>> > ../IdBinding.EXTRACTED_TPMT_SIGNATURE -pubin -keyform der  >
>> > decrypted.bin
>> >
>> >       dumpasn1 decrypted.bin
>> >         0  33: SEQUENCE {
>> >         2   9:   SEQUENCE {
>> >         4   5:     OBJECT IDENTIFIER sha1 (1 3 14 3 2 26)
>> >        11   0:     NULL
>> >              :     }
>> >        13  20:   OCTET STRING 2D A1 D1 30 3A D2 FD 68 A1 5A 2F 9B 8B C1
>> 1E DB
>> > 36 A7 7C D4
>> >              :   }
>> >
>> >
>> >       So. It looks like a bug in tpm2_certify.
>> >
>> >       tool=3D"tpm2_certify" version=3D"4.1" tctis=3D"libtss2-tctildr"
>> tcti-default=3Dtcti-
>> > device
>> >       tpm2-tss 2.3.2-rc0
>> >
>> >       Regards,
>> >       Niklas
>> >
>> >
>>
>> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s



-- =

Luke Hinds  | CTO Office | Red Hat
e: lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36 2483

--===============5703757234976841701==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5JIGhhdmUgbm90IGhhZCBtdWNoIHRpbWUgdG8gcmVzZWFyY2gg
d2hhdCB5b3UgaGF2ZSB0cmllZCwgYnV0IEkgd29uZGVyIGlmIGl0IG1pZ2h0IGJlIHRoZSBzYW1l
IGFzIHRoZSBmb2xsb3dpbmcgc2l0dWF0aW9uIHdlIGhpdCByZWNlbnRseS4gaWlyYyBsYXRlciB2
ZXJzaW9ucyBvZiBPcGVuU1NMICgxLjEuMCAmYW1wOyBncmVhdGVyKSBhcmUgbGVzcyByZWxheGVk
IGFib3V0IHBhZGRpbmcgY29udmVudGlvbnMuIDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PjxhIGhyZWY9Imh0dHBzOi8vbXRhLm9wZW5zc2wub3JnL3BpcGVybWFpbC9vcGVuc3NsLWRldi8y
MDE2LUZlYnJ1YXJ5LzAwNTEwMC5odG1sIj5odHRwczovL210YS5vcGVuc3NsLm9yZy9waXBlcm1h
aWwvb3BlbnNzbC1kZXYvMjAxNi1GZWJydWFyeS8wMDUxMDAuaHRtbDwvYT48L2Rpdj48YnI+PGRp
diBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5P
biBXZWQsIERlYyAxMSwgMjAxOSBhdCAxMDo0NiBQTSBOaWtsYXMgQW5kZXJzc29uICZsdDs8YSBo
cmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIj5uaWtsYXMuYW5kZXJz
c29uQGZyZWRlbmhlaW0uc2U8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xh
c3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1s
ZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGly
PSJsdHIiPjxkaXY+SGkgV2lsbGlhbSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Plllcy4gSXQg
YWN0dWFsbHkgY2FtZSB0byBtaW5kIHRoYXQgbXkgVFBNIG1pZ2h0IGJlIGZhdWx0eS4gQnV0IEkg
aGFkIGEgY29sbGVhZ3VlIHJ1bm5pbmcgdGhlIHNjcmlwdCBhbmQgaGUgZ290IGV4YWN0bHkgdGhl
IHNhbWUgZXJyb3IsIHNvIGl0IHNlZW1zIHRoZXJlIGlzIGEgYnVnIGluIHRoZSBwYWRkaW5nIHJv
dXRpbmUuPGJyPjwvZGl2PjwvZGl2PjxkaXYgZGlyPSJsdHIiPjxicj48L2Rpdj48YnI+PGRpdiBj
bGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5EZW4g
b25zIDExIGRlYy4gMjAxOSBrbCAxNjo1MCBza3JldiBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0Ozxh
IGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5r
Ij53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0Ozo8YnI+PC9kaXY+PGJsb2NrcXVv
dGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2Jv
cmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPlNv
dW5kcyBsaWtlIGEgcG9zc2libGUgaXNzdWUgaW4gb3VyIFRQTTIgc3RydWN0dXJlcyB0byBzaWdu
YXR1cmUgZm9ybWF0IHJvdXRpbmUgb3IgdGhlIFRQTSBpdHNlbGY6PGJyPgo8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvbWFzdGVyL2xpYi90
cG0yX2NvbnZlcnQuYyNMNDY3IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2Jsb2IvbWFzdGVyL2xpYi90
cG0yX2NvbnZlcnQuYyNMNDY3PC9hPjxicj4KPGJyPgpMb29rcyBsaWtlIHRoZSBzY3JpcHQgaGFz
IGFuIHJzYSBrZXksIHNvIHlvdSBzaG91bGQgZ2V0IGEgc2lnbmF0dXJlIHNjaGVtZSBvZjo8YnI+
ClRQTTJfQUxHX1JTQVNTQTxicj4KPGJyPgpXaGljaCBpcyBqdXN0IGEgc3RyYWlnaHQgbWVtY3B5
IGZyb20gdGhlIFRQTS48YnI+Cjxicj4KUGVyaGFwcywgdGhlIFRQTSBpcyBlaXRoZXIgZ2V0dGlu
ZyBpdCB3cm9uZyBvciB3ZSBuZWVkIHRvIGNhbGwgc29tZSBtYWdpYyBPU1NMIHBhZGRpbmcgcm91
dGluZT88YnI+Cjxicj4KPGJyPgomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPgom
Z3Q7IEZyb206IE5pa2xhcyBBbmRlcnNzb24gW21haWx0bzo8YSBocmVmPSJtYWlsdG86bmlrbGFz
LmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFuayI+bmlrbGFzLmFuZGVyc3Nv
bkBmcmVkZW5oZWltLnNlPC9hPl08YnI+CiZndDsgU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAx
MSwgMjAxOSA0OjU4IEFNPGJyPgomZ3Q7IFRvOiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDsgU3Vi
amVjdDogW3RwbTJdIFJlOiB0cG0yX2NyZWF0ZSBzaWduYXR1cmUgdmVyaWZpY2F0aW9uIGZhaWxz
IGR1ZSB0bzxicj4KJmd0OyAmcXVvdDtSU0FfcGFkZGluZ19jaGVja19QS0NTX3R5cGUxOmludmFs
aWQgcGFkZGluZyZxdW90Ozxicj4KJmd0OyA8YnI+CiZndDsgSGVyZSBpcyB0aGUgdGVzdCBjYXNl
IHRoYXQgZXhwbGFpbnMgdGhlIGlzc3VlLiBOb3Qgc3VyZSBpZiBJIGFtIG1pc3Npbmcgc29tZXRo
aW5nLiBJPGJyPgomZ3Q7IGJlbGlldmUgdGhlIGNlcnRpZnkuU0lHTkFUVVJFIGlzIGNvcnJ1cHQu
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgIyEvYmluL2Jhc2g8YnI+CiZndDsgPGJyPgom
Z3Q7IHNya19oYW5kbGU9MHg4MTAwMDAwMzxicj4KJmd0OyBla19oYW5kbGU9MHg4MTAxMDAwMTxi
cj4KJmd0OyA8YnI+CiZndDsgIyBJRGV2SUQ8YnI+CiZndDsgdHBtMl9jcmVhdGVhayBcPGJyPgom
Z3Q7IC0tZWstY29udGV4dD0kZWtfaGFuZGxlIFw8YnI+CiZndDsgLS1hay1jb250ZXh0PUlEZXZJ
RC5jdHggXDxicj4KJmd0OyAtLWtleS1hbGdvcml0aG09cnNhIFw8YnI+CiZndDsgLS1oYXNoLWFs
Z29yaXRobT1zaGExIFw8YnI+CiZndDsgLS1wdWJsaWM9SURldklELnB1YiBcPGJyPgomZ3Q7IC0t
cHJpdmF0ZT1JRGV2SUQucHJpdjxicj4KJmd0OyAjIC0tc2lnbmluZy1hbGdvcml0aG09c2hhMTxi
cj4KJmd0OyA8YnI+CiZndDsgIyBMRGV2SUQ8YnI+CiZndDsgdHBtMl9jcmVhdGUgXDxicj4KJmd0
OyAtLXBhcmVudC1jb250ZXh0PSRzcmtfaGFuZGxlIFw8YnI+CiZndDsgLS1oYXNoLWFsZ29yaXRo
bT1zaGExIFw8YnI+CiZndDsgLS1rZXktYWxnb3JpdGhtPXJzYTIwNDggXDxicj4KJmd0OyAtLXB1
YmxpYz1MRGV2SUQucHViIFw8YnI+CiZndDsgLS1wcml2YXRlPUxEZXZJRC5wcml2IFw8YnI+CiZn
dDsgLS1jcmVhdGlvbi1kYXRhPUxEZXZJRC5DUkVBVElPTl9EQVRBIFw8YnI+CiZndDsgLS1jcmVh
dGlvbi1oYXNoPUxEZXZJRC5DUkVBVElPTl9IQVNIIFw8YnI+CiZndDsgLS1jcmVhdGlvbi10aWNr
ZXQ9TERldklELkNSRUFUSU9OX1RJQ0tFVDxicj4KJmd0OyA8YnI+CiZndDsgdHBtMl9sb2FkIFw8
YnI+CiZndDsgLS1wYXJlbnQtY29udGV4dD0kc3JrX2hhbmRsZSBcPGJyPgomZ3Q7IC0tcHVibGlj
PUxEZXZJRC5wdWIgXDxicj4KJmd0OyAtLXByaXZhdGU9TERldklELnByaXYgXDxicj4KJmd0OyAt
LWtleS1jb250ZXh0PUxEZXZJRC5jdHg8YnI+CiZndDsgPGJyPgomZ3Q7ICMgQ2VydGlmeTxicj4K
Jmd0OyB0cG0yX2NlcnRpZnkgXDxicj4KJmd0OyAtLWNlcnRpZmllZGtleS1jb250ZXh0PUxEZXZJ
RC5jdHggXDxicj4KJmd0OyAtLXNpZ25pbmdrZXktY29udGV4dD1JRGV2SUQuY3R4IFw8YnI+CiZn
dDsgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+CiZndDsgLS1hdHRlc3RhdGlvbj1jZXJ0aWZ5
LkFUVEVTVEFUSU9OIFw8YnI+CiZndDsgLS1zaWduYXR1cmU9Y2VydGlmeS5TSUdOQVRVUkUgXDxi
cj4KJmd0OyAtLWZvcm1hdD1wbGFpbjxicj4KJmd0OyA8YnI+CiZndDsgIyBDZXJ0aWZ5IENyZWF0
aW9uPGJyPgomZ3Q7IHRwbTJfY2VydGlmeWNyZWF0aW9uIFw8YnI+CiZndDsgLS1jZXJ0aWZpZWRr
ZXktY29udGV4dD1MRGV2SUQuY3R4IFw8YnI+CiZndDsgLS1zaWduaW5na2V5LWNvbnRleHQ9SURl
dklELmN0eCBcPGJyPgomZ3Q7IC0taGFzaC1hbGdvcml0aG09c2hhMSBcPGJyPgomZ3Q7IC0tY3Jl
YXRpb24taGFzaD1MRGV2SUQuQ1JFQVRJT05fSEFTSCBcPGJyPgomZ3Q7IC0tdGlja2V0PUxEZXZJ
RC5DUkVBVElPTl9USUNLRVQgXDxicj4KJmd0OyAtLXNpZ25hdHVyZT1jZXJ0aWZ5Y3JlYXRpb24u
U0lHTkFUVVJFIFw8YnI+CiZndDsgLS1hdHRlc3RhdGlvbj1jZXJ0aWZ5Y3JlYXRpb24uQVRURVNU
QVRJT04gXCAtLWZvcm1hdD1wbGFpbjxicj4KJmd0OyA8YnI+CiZndDsgIyBJRGV2SUQuZGVyPGJy
PgomZ3Q7IGVjaG8gJiMzOTtNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tD
QVFFQSYjMzk7IHwgb3BlbnNzbCBiYXNlNjQ8YnI+CiZndDsgLWEgLWQgJmd0OyBJRGV2SUQuaGVh
ZGVyLnRlbXAgZGQgaWY9SURldklELnB1YiBicz0xIHNraXA9JChleHByICQoc3RhdCAtLTxicj4K
Jmd0OyBmb3JtYXQ9JXMgSURldklELnB1YikgLSAyNTYpIG9mPUlEZXZJRC5tb2R1bHVzLnRlbXAg
ZWNobyAtZW4gJiMzOTtceDAyXHgwMyYjMzk7ICZndDs8YnI+CiZndDsgSURldklELm1pZC1oZWFk
ZXIudGVtcCBlY2hvIC1uZSAmIzM5O1x4MDFceDAwXHgwMSYjMzk7ICZndDsgSURldklELmV4cG9u
ZW50LnRlbXAgY2F0PGJyPgomZ3Q7IElEZXZJRC5oZWFkZXIudGVtcCBJRGV2SUQubW9kdWx1cy50
ZW1wIElEZXZJRC5taWQtaGVhZGVyLnRlbXA8YnI+CiZndDsgSURldklELmV4cG9uZW50LnRlbXAg
Jmd0OyBJRGV2SUQuZGVyPGJyPgomZ3Q7IDxicj4KJmd0OyAjIFJlbW92ZSBmaXJzdCB0d28gYnl0
ZXMgKGJ5dGUgc2l6ZSBvZiBzdHJ1Y3QpIGluIGNlcnRpZnljcmVhdGlvbi5BVFRFU1RBVElPTiAj
IGluPGJyPgomZ3Q7IG9yZGVyIGZvciBoYXNoIHRvIGNvbXBseS4gTWFnaWMgSGVhZGVyJnF1b3Q7
IG11c3QgYmUgZmYgNTQgNDMgNDcgZGQ8YnI+CiZndDsgaWY9Y2VydGlmeWNyZWF0aW9uLkFUVEVT
VEFUSU9OIG9mPWNlcnRpZnljcmVhdGlvbi5BVFRFU1RBVElPTl8yIGJzPTEgc2tpcD0yPGJyPgom
Z3Q7IDxicj4KJmd0OyAjIFdPUktTOiBWZXJpZnkgQ2VydGlmeSBDcmVhdGlvbjxicj4KJmd0OyBv
cGVuc3NsIGRnc3QgXDxicj4KJmd0OyAtdmVyaWZ5IElEZXZJRC5kZXIgLWtleWZvcm0gZGVyIFw8
YnI+CiZndDsgLXNoYTEgLXNpZ25hdHVyZSBjZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFIGNlcnRp
ZnljcmVhdGlvbi5BVFRFU1RBVElPTl8yPGJyPgomZ3Q7IDxicj4KJmd0OyAjIEZBSUxTOiBWZXJp
ZnkgQ3JlYXRlPGJyPgomZ3Q7IG9wZW5zc2wgZGdzdCBcPGJyPgomZ3Q7IC12ZXJpZnkgSURldklE
LmRlciAta2V5Zm9ybSBkZXIgXDxicj4KJmd0OyAtc2hhMSAtc2lnbmF0dXJlIGNlcnRpZnkuU0lH
TkFUVVJFIGNlcnRpZnkuQVRURVNUQVRJT048YnI+CiZndDsgPGJyPgomZ3Q7ICMgV09SS1M6PGJy
PgomZ3Q7IG9wZW5zc2wgcnNhdXRsIFw8YnI+CiZndDsgLXZlcmlmeSBcPGJyPgomZ3Q7IC1wdWJp
biAtaW5rZXkgSURldklELmRlciAta2V5Zm9ybSBERVIgXDxicj4KJmd0OyAtaW4gY2VydGlmeWNy
ZWF0aW9uLlNJR05BVFVSRSBcPGJyPgomZ3Q7IC1vdXQgY2VydGlmeWNyZWF0aW9uLlNJR05BVFVS
RS5hc24xPGJyPgomZ3Q7IDxicj4KJmd0OyBkdW1wYXNuMSBjZXJ0aWZ5Y3JlYXRpb24uU0lHTkFU
VVJFLmFzbjE8YnI+CiZndDsgPGJyPgomZ3Q7ICMgRkFJTFM6PGJyPgomZ3Q7IG9wZW5zc2wgcnNh
dXRsIFw8YnI+CiZndDsgLXZlcmlmeSBcPGJyPgomZ3Q7IC1wdWJpbiAtaW5rZXkgSURldklELmRl
ciAta2V5Zm9ybSBERVIgXDxicj4KJmd0OyAtaW4gY2VydGlmeS5TSUdOQVRVUkUgXDxicj4KJmd0
OyAtb3V0IGNlcnRpZnkuU0lHTkFUVVJFLmFzbjE8YnI+CiZndDsgPGJyPgomZ3Q7IERlbiB0aXMg
MTAgZGVjLiAyMDE5IGtsIDIzOjQwIHNrcmV2IE5pa2xhcyBBbmRlcnNzb248YnI+CiZndDsgJmx0
OzxhIGhyZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0i
X2JsYW5rIj5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+ICZsdDttYWlsdG86PGEg
aHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0PSJfYmxh
bmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT4mZ3Q7ICZndDs6PGJyPgomZ3Q7
IDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoG9wZW5zc2wgY2FuIG5vdCB2ZXJpZnkgcGxh
aW4gc2lnbmF0dXJlICgyNTYgYnl0ZXMpIGZyb20gdHBtMl9jZXJ0aWZ5IGR1ZTxicj4KJmd0OyB0
byBiYWQgcGFkZGluZy48YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBUaGlzIHNob3VsZCB3
b3JrICh2ZXJpZmljYXRpb24gb2Ygc2lnbmF0dXJlIGZyb20gdHBtMl9jZXJ0aWZ5Y3JlYXRpb248
YnI+CiZndDsgd29ya3MgZmluZSk6PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgb3BlbnNz
bCBkZ3N0IC12ZXJpZnkgLi4vQUlLT3BhcXVlLmRlciAta2V5Zm9ybSBkZXIgLXNoYTEgLXNpZ25h
dHVyZTxicj4KJmd0OyBTaWduYXR1cmUgS2V5QXR0ZXN0LmJpbjxicj4KJmd0O8KgIMKgIMKgIMKg
VmVyaWZpY2F0aW9uIEZhaWx1cmU8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAuLi4uZXhh
bWluZTo8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBvcGVuc3NsIHJzYXV0bCAtdmVyaWZ5
IC1pbmtleSAuLi9BSUtPcGFxdWUuZGVyIC1pbiBTaWduYXR1cmUgLXB1YmluIC08YnI+CiZndDsg
a2V5Zm9ybSBkZXIgLXBrY3MgJmd0OyBkZWNyeXB0ZWQuYmluPGJyPgomZ3Q7wqAgwqAgwqAgwqBS
U0Egb3BlcmF0aW9uIGVycm9yPGJyPgomZ3Q7wqAgwqAgwqAgwqAxNDA2NTQyNDczODc1ODQ6ZXJy
b3I6MDQwNzAwOEE6cnNhPGJyPgomZ3Q7IHJvdXRpbmVzOlJTQV9wYWRkaW5nX2NoZWNrX1BLQ1Mx
X3R5cGVfMTppbnZhbGlkPGJyPgomZ3Q7IHBhZGRpbmc6Li4vY3J5cHRvL3JzYS9yc2FfcGsxLmM6
Njc6PGJyPgomZ3Q7wqAgwqAgwqAgwqAxNDA2NTQyNDczODc1ODQ6ZXJyb3I6MDQwNjcwNzI6cnNh
PGJyPgomZ3Q7IHJvdXRpbmVzOnJzYV9vc3NsX3B1YmxpY19kZWNyeXB0OnBhZGRpbmcgY2hlY2s8
YnI+CiZndDsgZmFpbGVkOi4uL2NyeXB0by9yc2EvcnNhX29zc2wuYzo1ODI6PGJyPgomZ3Q7IDxi
cj4KJmd0O8KgIMKgIMKgIMKgLi5TYW1lIG9wZXJhdGlvbiBvbiBhIHBsYWluIHNpZ25hdHVyZSBm
cm9tIHRwbTJfY2VydGlmeWNyZWF0aW9uIHdvcmtzOjxicj4KJmd0OyA8YnI+CiZndDsgPGJyPgom
Z3Q7wqAgwqAgwqAgwqBvcGVuc3NsIHJzYXV0bCAtdmVyaWZ5IC1pbmtleSAuLi9BSUtPcGFxdWUu
ZGVyIC1pbjxicj4KJmd0OyAuLi9JZEJpbmRpbmcuRVhUUkFDVEVEX1RQTVRfU0lHTkFUVVJFIC1w
dWJpbiAta2V5Zm9ybSBkZXLCoCAmZ3Q7PGJyPgomZ3Q7IGRlY3J5cHRlZC5iaW48YnI+CiZndDsg
PGJyPgomZ3Q7wqAgwqAgwqAgwqBkdW1wYXNuMSBkZWNyeXB0ZWQuYmluPGJyPgomZ3Q7wqAgwqAg
wqAgwqAgwqAwwqAgMzM6IFNFUVVFTkNFIHs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoDLCoCDCoDk6
wqAgwqBTRVFVRU5DRSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqA0wqAgwqA1OsKgIMKgIMKgT0JK
RUNUIElERU5USUZJRVIgc2hhMSAoMSAzIDE0IDMgMiAyNik8YnI+CiZndDvCoCDCoCDCoCDCoCAx
McKgIMKgMDrCoCDCoCDCoE5VTEw8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCA6wqAgwqAg
wqB9PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMTPCoCAyMDrCoCDCoE9DVEVUIFNUUklORyAyRCBBMSBE
MSAzMCAzQSBEMiBGRCA2OCBBMSA1QSAyRiA5QiA4QiBDMSAxRSBEQjxicj4KJmd0OyAzNiBBNyA3
QyBENDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIDrCoCDCoH08YnI+CiZndDsgPGJyPgom
Z3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgU28uIEl0IGxvb2tzIGxpa2UgYSBidWcgaW4gdHBtMl9j
ZXJ0aWZ5Ljxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoHRvb2w9JnF1b3Q7dHBtMl9jZXJ0
aWZ5JnF1b3Q7IHZlcnNpb249JnF1b3Q7NC4xJnF1b3Q7IHRjdGlzPSZxdW90O2xpYnRzczItdGN0
aWxkciZxdW90OyB0Y3RpLWRlZmF1bHQ9dGN0aS08YnI+CiZndDsgZGV2aWNlPGJyPgomZ3Q7wqAg
wqAgwqAgwqB0cG0yLXRzcyAyLjMuMi1yYzA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBS
ZWdhcmRzLDxicj4KJmd0O8KgIMKgIMKgIMKgTmlrbGFzPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+
Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRv
OnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+
PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0y
LWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEu
b3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5h
bF9uYW1lKXM8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNsZWFyPSJhbGwiPjxicj4tLSA8YnI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGRpdj48
ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPkx1a2UgSGluZHPCoCB8IENUTyBPZmZpY2UgfCBS
ZWQgSGF0PC9zcGFuPjxiciBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMi44cHgiPmU6wqA8L3NwYW4+PGEgaHJlZj0ibWFpbHRvOmxoaW5kc0ByZWRoYXQu
Y29tIiBzdHlsZT0iY29sb3I6cmdiKDE3LDg1LDIwNCk7Zm9udC1zaXplOjEyLjhweCIgdGFyZ2V0
PSJfYmxhbmsiPmxoaW5kc0ByZWRoYXQuY29tPC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIu
OHB4Ij7CoHwgaXJjOiBsaGluZHMgQGZyZWVub2RlIHw8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMi44cHgiPiB0OsKgPC9zcGFuPis0NCAxMiA1MiAzNiAyNDgzPGJyIHN0eWxlPSJmb250
LXNpemU6MTIuOHB4Ij48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj4K

--===============5703757234976841701==--

