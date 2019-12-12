Content-Type: multipart/mixed; boundary="===============3636573465306458162=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Thu, 12 Dec 2019 18:21:41 +0100
Message-ID: <CAJ8N_u8tLptcNEHuzGJb+WQ0jPUs=_pS0Q2M0hYUPdU9pz-eXw@mail.gmail.com>
In-Reply-To: CAKrSGQR_8v8mWQ+WXY=Hu5861ckqN6v+ZV+9a2F2UbsD01Lhkg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3636573465306458162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In the source it looks like tpm2_certify.c and tpm2_certifycreation.c
handles signature differently.

OpenSSL is not the issue. I am using version OpenSSL 1.1.1 11 Sep 2018, and
I tried to unpack the signature using parameter "-raw" (instead of -pkcs
which is default", and the result was gibberish. I would expect somewhat a
resemblance to ASN.1.

I opened an issue on Github
https://github.com/tpm2-software/tpm2-tools/issues/1871

Den tors 12 dec. 2019 kl 10:14 skrev Luke Hinds <lhinds(a)redhat.com>:

> I have not had much time to research what you have tried, but I wonder if
> it might be the same as the following situation we hit recently. iirc lat=
er
> versions of OpenSSL (1.1.0 & greater) are less relaxed about padding
> conventions.
>
> https://mta.openssl.org/pipermail/openssl-dev/2016-February/005100.html
>
> On Wed, Dec 11, 2019 at 10:46 PM Niklas Andersson <
> niklas.andersson(a)fredenheim.se> wrote:
>
>> Hi William,
>>
>> Yes. It actually came to mind that my TPM might be faulty. But I had a
>> colleague running the script and he got exactly the same error, so it se=
ems
>> there is a bug in the padding routine.
>>
>>
>> Den ons 11 dec. 2019 kl 16:50 skrev Roberts, William C <
>> william.c.roberts(a)intel.com>:
>>
>>> Sounds like a possible issue in our TPM2 structures to signature format
>>> routine or the TPM itself:
>>>
>>> https://github.com/tpm2-software/tpm2-tools/blob/master/lib/tpm2_conver=
t.c#L467
>>>
>>> Looks like the script has an rsa key, so you should get a signature
>>> scheme of:
>>> TPM2_ALG_RSASSA
>>>
>>> Which is just a straight memcpy from the TPM.
>>>
>>> Perhaps, the TPM is either getting it wrong or we need to call some
>>> magic OSSL padding routine?
>>>
>>>
>>> > -----Original Message-----
>>> > From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
>>> > Sent: Wednesday, December 11, 2019 4:58 AM
>>> > To: tpm2(a)lists.01.org
>>> > Subject: [tpm2] Re: tpm2_create signature verification fails due to
>>> > "RSA_padding_check_PKCS_type1:invalid padding"
>>> >
>>> > Here is the test case that explains the issue. Not sure if I am
>>> missing something. I
>>> > believe the certify.SIGNATURE is corrupt.
>>> >
>>> >
>>> > #!/bin/bash
>>> >
>>> > srk_handle=3D0x81000003
>>> > ek_handle=3D0x81010001
>>> >
>>> > # IDevID
>>> > tpm2_createak \
>>> > --ek-context=3D$ek_handle \
>>> > --ak-context=3DIDevID.ctx \
>>> > --key-algorithm=3Drsa \
>>> > --hash-algorithm=3Dsha1 \
>>> > --public=3DIDevID.pub \
>>> > --private=3DIDevID.priv
>>> > # --signing-algorithm=3Dsha1
>>> >
>>> > # LDevID
>>> > tpm2_create \
>>> > --parent-context=3D$srk_handle \
>>> > --hash-algorithm=3Dsha1 \
>>> > --key-algorithm=3Drsa2048 \
>>> > --public=3DLDevID.pub \
>>> > --private=3DLDevID.priv \
>>> > --creation-data=3DLDevID.CREATION_DATA \
>>> > --creation-hash=3DLDevID.CREATION_HASH \
>>> > --creation-ticket=3DLDevID.CREATION_TICKET
>>> >
>>> > tpm2_load \
>>> > --parent-context=3D$srk_handle \
>>> > --public=3DLDevID.pub \
>>> > --private=3DLDevID.priv \
>>> > --key-context=3DLDevID.ctx
>>> >
>>> > # Certify
>>> > tpm2_certify \
>>> > --certifiedkey-context=3DLDevID.ctx \
>>> > --signingkey-context=3DIDevID.ctx \
>>> > --hash-algorithm=3Dsha1 \
>>> > --attestation=3Dcertify.ATTESTATION \
>>> > --signature=3Dcertify.SIGNATURE \
>>> > --format=3Dplain
>>> >
>>> > # Certify Creation
>>> > tpm2_certifycreation \
>>> > --certifiedkey-context=3DLDevID.ctx \
>>> > --signingkey-context=3DIDevID.ctx \
>>> > --hash-algorithm=3Dsha1 \
>>> > --creation-hash=3DLDevID.CREATION_HASH \
>>> > --ticket=3DLDevID.CREATION_TICKET \
>>> > --signature=3Dcertifycreation.SIGNATURE \
>>> > --attestation=3Dcertifycreation.ATTESTATION \ --format=3Dplain
>>> >
>>> > # IDevID.der
>>> > echo 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl base64
>>> > -a -d > IDevID.header.temp dd if=3DIDevID.pub bs=3D1 skip=3D$(expr $(=
stat --
>>> > format=3D%s IDevID.pub) - 256) of=3DIDevID.modulus.temp echo -en
>>> '\x02\x03' >
>>> > IDevID.mid-header.temp echo -ne '\x01\x00\x01' > IDevID.exponent.temp
>>> cat
>>> > IDevID.header.temp IDevID.modulus.temp IDevID.mid-header.temp
>>> > IDevID.exponent.temp > IDevID.der
>>> >
>>> > # Remove first two bytes (byte size of struct) in
>>> certifycreation.ATTESTATION # in
>>> > order for hash to comply. Magic Header" must be ff 54 43 47 dd
>>> > if=3Dcertifycreation.ATTESTATION of=3Dcertifycreation.ATTESTATION_2 b=
s=3D1
>>> skip=3D2
>>> >
>>> > # WORKS: Verify Certify Creation
>>> > openssl dgst \
>>> > -verify IDevID.der -keyform der \
>>> > -sha1 -signature certifycreation.SIGNATURE
>>> certifycreation.ATTESTATION_2
>>> >
>>> > # FAILS: Verify Create
>>> > openssl dgst \
>>> > -verify IDevID.der -keyform der \
>>> > -sha1 -signature certify.SIGNATURE certify.ATTESTATION
>>> >
>>> > # WORKS:
>>> > openssl rsautl \
>>> > -verify \
>>> > -pubin -inkey IDevID.der -keyform DER \
>>> > -in certifycreation.SIGNATURE \
>>> > -out certifycreation.SIGNATURE.asn1
>>> >
>>> > dumpasn1 certifycreation.SIGNATURE.asn1
>>> >
>>> > # FAILS:
>>> > openssl rsautl \
>>> > -verify \
>>> > -pubin -inkey IDevID.der -keyform DER \
>>> > -in certify.SIGNATURE \
>>> > -out certify.SIGNATURE.asn1
>>> >
>>> > Den tis 10 dec. 2019 kl 23:40 skrev Niklas Andersson
>>> > <niklas.andersson(a)fredenheim.se <mailto:niklas.andersson(a)fredenhe=
im.se>
>>> >:
>>> >
>>> >
>>> >       openssl can not verify plain signature (256 bytes) from
>>> tpm2_certify due
>>> > to bad padding.
>>> >
>>> >       This should work (verification of signature from
>>> tpm2_certifycreation
>>> > works fine):
>>> >
>>> >       openssl dgst -verify ../AIKOpaque.der -keyform der -sha1
>>> -signature
>>> > Signature KeyAttest.bin
>>> >       Verification Failure
>>> >
>>> >       ....examine:
>>> >
>>> >       openssl rsautl -verify -inkey ../AIKOpaque.der -in Signature
>>> -pubin -
>>> > keyform der -pkcs > decrypted.bin
>>> >       RSA operation error
>>> >       140654247387584:error:0407008A:rsa
>>> > routines:RSA_padding_check_PKCS1_type_1:invalid
>>> > padding:../crypto/rsa/rsa_pk1.c:67:
>>> >       140654247387584:error:04067072:rsa
>>> > routines:rsa_ossl_public_decrypt:padding check
>>> > failed:../crypto/rsa/rsa_ossl.c:582:
>>> >
>>> >       ..Same operation on a plain signature from tpm2_certifycreation
>>> works:
>>> >
>>> >
>>> >       openssl rsautl -verify -inkey ../AIKOpaque.der -in
>>> > ../IdBinding.EXTRACTED_TPMT_SIGNATURE -pubin -keyform der  >
>>> > decrypted.bin
>>> >
>>> >       dumpasn1 decrypted.bin
>>> >         0  33: SEQUENCE {
>>> >         2   9:   SEQUENCE {
>>> >         4   5:     OBJECT IDENTIFIER sha1 (1 3 14 3 2 26)
>>> >        11   0:     NULL
>>> >              :     }
>>> >        13  20:   OCTET STRING 2D A1 D1 30 3A D2 FD 68 A1 5A 2F 9B 8B
>>> C1 1E DB
>>> > 36 A7 7C D4
>>> >              :   }
>>> >
>>> >
>>> >       So. It looks like a bug in tpm2_certify.
>>> >
>>> >       tool=3D"tpm2_certify" version=3D"4.1" tctis=3D"libtss2-tctildr"
>>> tcti-default=3Dtcti-
>>> > device
>>> >       tpm2-tss 2.3.2-rc0
>>> >
>>> >       Regards,
>>> >       Niklas
>>> >
>>> >
>>>
>>> _______________________________________________
>> tpm2 mailing list -- tpm2(a)lists.01.org
>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
>
> --
> Luke Hinds  | CTO Office | Red Hat
> e: lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36 2483
>

--===============3636573465306458162==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5JbiB0aGUgc291cmNlIGl0IGxvb2tzIGxpa2UgdHBtMl9jZXJ0
aWZ5LmMgYW5kIHRwbTJfY2VydGlmeWNyZWF0aW9uLmMgaGFuZGxlcyBzaWduYXR1cmUgZGlmZmVy
ZW50bHkuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5PcGVuU1NMIGlzIG5vdCB0aGUgaXNzdWUu
IEkgYW0gdXNpbmcgdmVyc2lvbiBPcGVuU1NMIDEuMS4xIDExIFNlcCAyMDE4LCBhbmQgSSB0cmll
ZCB0byB1bnBhY2sgdGhlIHNpZ25hdHVyZSB1c2luZyBwYXJhbWV0ZXIgJnF1b3Q7LXJhdyZxdW90
OyAoaW5zdGVhZCBvZiAtcGtjcyB3aGljaCBpcyBkZWZhdWx0JnF1b3Q7LCBhbmQgdGhlIHJlc3Vs
dCB3YXMgZ2liYmVyaXNoLiBJIHdvdWxkIGV4cGVjdCBzb21ld2hhdCBhIHJlc2VtYmxhbmNlIHRv
IEFTTi4xLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBvcGVuZWQgYW4gaXNzdWUgb24gR2l0
aHViIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMv
aXNzdWVzLzE4NzEiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMv
aXNzdWVzLzE4NzE8L2E+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48
ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+RGVuIHRvcnMgMTIgZGVjLiAyMDE5IGts
IDEwOjE0IHNrcmV2IEx1a2UgSGluZHMgJmx0OzxhIGhyZWY9Im1haWx0bzpsaGluZHNAcmVkaGF0
LmNvbSI+bGhpbmRzQHJlZGhhdC5jb208L2E+Jmd0Ozo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xh
c3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1s
ZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGly
PSJsdHIiPjxkaXY+SSBoYXZlIG5vdCBoYWQgbXVjaCB0aW1lIHRvIHJlc2VhcmNoIHdoYXQgeW91
IGhhdmUgdHJpZWQsIGJ1dCBJIHdvbmRlciBpZiBpdCBtaWdodCBiZSB0aGUgc2FtZSBhcyB0aGUg
Zm9sbG93aW5nIHNpdHVhdGlvbiB3ZSBoaXQgcmVjZW50bHkuIGlpcmMgbGF0ZXIgdmVyc2lvbnMg
b2YgT3BlblNTTCAoMS4xLjAgJmFtcDsgZ3JlYXRlcikgYXJlIGxlc3MgcmVsYXhlZCBhYm91dCBw
YWRkaW5nIGNvbnZlbnRpb25zLiA8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBocmVm
PSJodHRwczovL210YS5vcGVuc3NsLm9yZy9waXBlcm1haWwvb3BlbnNzbC1kZXYvMjAxNi1GZWJy
dWFyeS8wMDUxMDAuaHRtbCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbXRhLm9wZW5zc2wub3Jn
L3BpcGVybWFpbC9vcGVuc3NsLWRldi8yMDE2LUZlYnJ1YXJ5LzAwNTEwMC5odG1sPC9hPjwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPk9uIFdlZCwgRGVjIDExLCAyMDE5IGF0IDEwOjQ2IFBNIE5pa2xhcyBBbmRlcnNzb24g
Jmx0OzxhIGhyZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdl
dD0iX2JsYW5rIj5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+SGkgV2lsbGlhbSw8L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2Plllcy4gSXQgYWN0dWFsbHkgY2FtZSB0byBtaW5kIHRoYXQgbXkgVFBN
IG1pZ2h0IGJlIGZhdWx0eS4gQnV0IEkgaGFkIGEgY29sbGVhZ3VlIHJ1bm5pbmcgdGhlIHNjcmlw
dCBhbmQgaGUgZ290IGV4YWN0bHkgdGhlIHNhbWUgZXJyb3IsIHNvIGl0IHNlZW1zIHRoZXJlIGlz
IGEgYnVnIGluIHRoZSBwYWRkaW5nIHJvdXRpbmUuPGJyPjwvZGl2PjwvZGl2PjxkaXYgZGlyPSJs
dHIiPjxicj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9hdHRyIj5EZW4gb25zIDExIGRlYy4gMjAxOSBrbCAxNjo1MCBza3JldiBS
b2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0Bp
bnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+
Jmd0Ozo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPlNvdW5kcyBsaWtlIGEgcG9zc2libGUgaXNzdWUgaW4gb3Vy
IFRQTTIgc3RydWN0dXJlcyB0byBzaWduYXR1cmUgZm9ybWF0IHJvdXRpbmUgb3IgdGhlIFRQTSBp
dHNlbGY6PGJyPgo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LXRvb2xzL2Jsb2IvbWFzdGVyL2xpYi90cG0yX2NvbnZlcnQuYyNMNDY3IiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LXRvb2xzL2Jsb2IvbWFzdGVyL2xpYi90cG0yX2NvbnZlcnQuYyNMNDY3PC9hPjxicj4KPGJyPgpM
b29rcyBsaWtlIHRoZSBzY3JpcHQgaGFzIGFuIHJzYSBrZXksIHNvIHlvdSBzaG91bGQgZ2V0IGEg
c2lnbmF0dXJlIHNjaGVtZSBvZjo8YnI+ClRQTTJfQUxHX1JTQVNTQTxicj4KPGJyPgpXaGljaCBp
cyBqdXN0IGEgc3RyYWlnaHQgbWVtY3B5IGZyb20gdGhlIFRQTS48YnI+Cjxicj4KUGVyaGFwcywg
dGhlIFRQTSBpcyBlaXRoZXIgZ2V0dGluZyBpdCB3cm9uZyBvciB3ZSBuZWVkIHRvIGNhbGwgc29t
ZSBtYWdpYyBPU1NMIHBhZGRpbmcgcm91dGluZT88YnI+Cjxicj4KPGJyPgomZ3Q7IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tPGJyPgomZ3Q7IEZyb206IE5pa2xhcyBBbmRlcnNzb24gW21haWx0
bzo8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9
Il9ibGFuayI+bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPl08YnI+CiZndDsgU2Vu
dDogV2VkbmVzZGF5LCBEZWNlbWJlciAxMSwgMjAxOSA0OjU4IEFNPGJyPgomZ3Q7IFRvOiA8YSBo
cmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3Rz
LjAxLm9yZzwvYT48YnI+CiZndDsgU3ViamVjdDogW3RwbTJdIFJlOiB0cG0yX2NyZWF0ZSBzaWdu
YXR1cmUgdmVyaWZpY2F0aW9uIGZhaWxzIGR1ZSB0bzxicj4KJmd0OyAmcXVvdDtSU0FfcGFkZGlu
Z19jaGVja19QS0NTX3R5cGUxOmludmFsaWQgcGFkZGluZyZxdW90Ozxicj4KJmd0OyA8YnI+CiZn
dDsgSGVyZSBpcyB0aGUgdGVzdCBjYXNlIHRoYXQgZXhwbGFpbnMgdGhlIGlzc3VlLiBOb3Qgc3Vy
ZSBpZiBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLiBJPGJyPgomZ3Q7IGJlbGlldmUgdGhlIGNlcnRp
ZnkuU0lHTkFUVVJFIGlzIGNvcnJ1cHQuPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgIyEv
YmluL2Jhc2g8YnI+CiZndDsgPGJyPgomZ3Q7IHNya19oYW5kbGU9MHg4MTAwMDAwMzxicj4KJmd0
OyBla19oYW5kbGU9MHg4MTAxMDAwMTxicj4KJmd0OyA8YnI+CiZndDsgIyBJRGV2SUQ8YnI+CiZn
dDsgdHBtMl9jcmVhdGVhayBcPGJyPgomZ3Q7IC0tZWstY29udGV4dD0kZWtfaGFuZGxlIFw8YnI+
CiZndDsgLS1hay1jb250ZXh0PUlEZXZJRC5jdHggXDxicj4KJmd0OyAtLWtleS1hbGdvcml0aG09
cnNhIFw8YnI+CiZndDsgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+CiZndDsgLS1wdWJsaWM9
SURldklELnB1YiBcPGJyPgomZ3Q7IC0tcHJpdmF0ZT1JRGV2SUQucHJpdjxicj4KJmd0OyAjIC0t
c2lnbmluZy1hbGdvcml0aG09c2hhMTxicj4KJmd0OyA8YnI+CiZndDsgIyBMRGV2SUQ8YnI+CiZn
dDsgdHBtMl9jcmVhdGUgXDxicj4KJmd0OyAtLXBhcmVudC1jb250ZXh0PSRzcmtfaGFuZGxlIFw8
YnI+CiZndDsgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+CiZndDsgLS1rZXktYWxnb3JpdGht
PXJzYTIwNDggXDxicj4KJmd0OyAtLXB1YmxpYz1MRGV2SUQucHViIFw8YnI+CiZndDsgLS1wcml2
YXRlPUxEZXZJRC5wcml2IFw8YnI+CiZndDsgLS1jcmVhdGlvbi1kYXRhPUxEZXZJRC5DUkVBVElP
Tl9EQVRBIFw8YnI+CiZndDsgLS1jcmVhdGlvbi1oYXNoPUxEZXZJRC5DUkVBVElPTl9IQVNIIFw8
YnI+CiZndDsgLS1jcmVhdGlvbi10aWNrZXQ9TERldklELkNSRUFUSU9OX1RJQ0tFVDxicj4KJmd0
OyA8YnI+CiZndDsgdHBtMl9sb2FkIFw8YnI+CiZndDsgLS1wYXJlbnQtY29udGV4dD0kc3JrX2hh
bmRsZSBcPGJyPgomZ3Q7IC0tcHVibGljPUxEZXZJRC5wdWIgXDxicj4KJmd0OyAtLXByaXZhdGU9
TERldklELnByaXYgXDxicj4KJmd0OyAtLWtleS1jb250ZXh0PUxEZXZJRC5jdHg8YnI+CiZndDsg
PGJyPgomZ3Q7ICMgQ2VydGlmeTxicj4KJmd0OyB0cG0yX2NlcnRpZnkgXDxicj4KJmd0OyAtLWNl
cnRpZmllZGtleS1jb250ZXh0PUxEZXZJRC5jdHggXDxicj4KJmd0OyAtLXNpZ25pbmdrZXktY29u
dGV4dD1JRGV2SUQuY3R4IFw8YnI+CiZndDsgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+CiZn
dDsgLS1hdHRlc3RhdGlvbj1jZXJ0aWZ5LkFUVEVTVEFUSU9OIFw8YnI+CiZndDsgLS1zaWduYXR1
cmU9Y2VydGlmeS5TSUdOQVRVUkUgXDxicj4KJmd0OyAtLWZvcm1hdD1wbGFpbjxicj4KJmd0OyA8
YnI+CiZndDsgIyBDZXJ0aWZ5IENyZWF0aW9uPGJyPgomZ3Q7IHRwbTJfY2VydGlmeWNyZWF0aW9u
IFw8YnI+CiZndDsgLS1jZXJ0aWZpZWRrZXktY29udGV4dD1MRGV2SUQuY3R4IFw8YnI+CiZndDsg
LS1zaWduaW5na2V5LWNvbnRleHQ9SURldklELmN0eCBcPGJyPgomZ3Q7IC0taGFzaC1hbGdvcml0
aG09c2hhMSBcPGJyPgomZ3Q7IC0tY3JlYXRpb24taGFzaD1MRGV2SUQuQ1JFQVRJT05fSEFTSCBc
PGJyPgomZ3Q7IC0tdGlja2V0PUxEZXZJRC5DUkVBVElPTl9USUNLRVQgXDxicj4KJmd0OyAtLXNp
Z25hdHVyZT1jZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFIFw8YnI+CiZndDsgLS1hdHRlc3RhdGlv
bj1jZXJ0aWZ5Y3JlYXRpb24uQVRURVNUQVRJT04gXCAtLWZvcm1hdD1wbGFpbjxicj4KJmd0OyA8
YnI+CiZndDsgIyBJRGV2SUQuZGVyPGJyPgomZ3Q7IGVjaG8gJiMzOTtNSUlCSWpBTkJna3Foa2lH
OXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQSYjMzk7IHwgb3BlbnNzbCBiYXNlNjQ8YnI+CiZn
dDsgLWEgLWQgJmd0OyBJRGV2SUQuaGVhZGVyLnRlbXAgZGQgaWY9SURldklELnB1YiBicz0xIHNr
aXA9JChleHByICQoc3RhdCAtLTxicj4KJmd0OyBmb3JtYXQ9JXMgSURldklELnB1YikgLSAyNTYp
IG9mPUlEZXZJRC5tb2R1bHVzLnRlbXAgZWNobyAtZW4gJiMzOTtceDAyXHgwMyYjMzk7ICZndDs8
YnI+CiZndDsgSURldklELm1pZC1oZWFkZXIudGVtcCBlY2hvIC1uZSAmIzM5O1x4MDFceDAwXHgw
MSYjMzk7ICZndDsgSURldklELmV4cG9uZW50LnRlbXAgY2F0PGJyPgomZ3Q7IElEZXZJRC5oZWFk
ZXIudGVtcCBJRGV2SUQubW9kdWx1cy50ZW1wIElEZXZJRC5taWQtaGVhZGVyLnRlbXA8YnI+CiZn
dDsgSURldklELmV4cG9uZW50LnRlbXAgJmd0OyBJRGV2SUQuZGVyPGJyPgomZ3Q7IDxicj4KJmd0
OyAjIFJlbW92ZSBmaXJzdCB0d28gYnl0ZXMgKGJ5dGUgc2l6ZSBvZiBzdHJ1Y3QpIGluIGNlcnRp
ZnljcmVhdGlvbi5BVFRFU1RBVElPTiAjIGluPGJyPgomZ3Q7IG9yZGVyIGZvciBoYXNoIHRvIGNv
bXBseS4gTWFnaWMgSGVhZGVyJnF1b3Q7IG11c3QgYmUgZmYgNTQgNDMgNDcgZGQ8YnI+CiZndDsg
aWY9Y2VydGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9OIG9mPWNlcnRpZnljcmVhdGlvbi5BVFRFU1RB
VElPTl8yIGJzPTEgc2tpcD0yPGJyPgomZ3Q7IDxicj4KJmd0OyAjIFdPUktTOiBWZXJpZnkgQ2Vy
dGlmeSBDcmVhdGlvbjxicj4KJmd0OyBvcGVuc3NsIGRnc3QgXDxicj4KJmd0OyAtdmVyaWZ5IElE
ZXZJRC5kZXIgLWtleWZvcm0gZGVyIFw8YnI+CiZndDsgLXNoYTEgLXNpZ25hdHVyZSBjZXJ0aWZ5
Y3JlYXRpb24uU0lHTkFUVVJFIGNlcnRpZnljcmVhdGlvbi5BVFRFU1RBVElPTl8yPGJyPgomZ3Q7
IDxicj4KJmd0OyAjIEZBSUxTOiBWZXJpZnkgQ3JlYXRlPGJyPgomZ3Q7IG9wZW5zc2wgZGdzdCBc
PGJyPgomZ3Q7IC12ZXJpZnkgSURldklELmRlciAta2V5Zm9ybSBkZXIgXDxicj4KJmd0OyAtc2hh
MSAtc2lnbmF0dXJlIGNlcnRpZnkuU0lHTkFUVVJFIGNlcnRpZnkuQVRURVNUQVRJT048YnI+CiZn
dDsgPGJyPgomZ3Q7ICMgV09SS1M6PGJyPgomZ3Q7IG9wZW5zc2wgcnNhdXRsIFw8YnI+CiZndDsg
LXZlcmlmeSBcPGJyPgomZ3Q7IC1wdWJpbiAtaW5rZXkgSURldklELmRlciAta2V5Zm9ybSBERVIg
XDxicj4KJmd0OyAtaW4gY2VydGlmeWNyZWF0aW9uLlNJR05BVFVSRSBcPGJyPgomZ3Q7IC1vdXQg
Y2VydGlmeWNyZWF0aW9uLlNJR05BVFVSRS5hc24xPGJyPgomZ3Q7IDxicj4KJmd0OyBkdW1wYXNu
MSBjZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFLmFzbjE8YnI+CiZndDsgPGJyPgomZ3Q7ICMgRkFJ
TFM6PGJyPgomZ3Q7IG9wZW5zc2wgcnNhdXRsIFw8YnI+CiZndDsgLXZlcmlmeSBcPGJyPgomZ3Q7
IC1wdWJpbiAtaW5rZXkgSURldklELmRlciAta2V5Zm9ybSBERVIgXDxicj4KJmd0OyAtaW4gY2Vy
dGlmeS5TSUdOQVRVUkUgXDxicj4KJmd0OyAtb3V0IGNlcnRpZnkuU0lHTkFUVVJFLmFzbjE8YnI+
CiZndDsgPGJyPgomZ3Q7IERlbiB0aXMgMTAgZGVjLiAyMDE5IGtsIDIzOjQwIHNrcmV2IE5pa2xh
cyBBbmRlcnNzb248YnI+CiZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJzc29u
QGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhl
aW0uc2U8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJl
ZGVuaGVpbS5zZSIgdGFyZ2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5z
ZTwvYT4mZ3Q7ICZndDs6PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoG9w
ZW5zc2wgY2FuIG5vdCB2ZXJpZnkgcGxhaW4gc2lnbmF0dXJlICgyNTYgYnl0ZXMpIGZyb20gdHBt
Ml9jZXJ0aWZ5IGR1ZTxicj4KJmd0OyB0byBiYWQgcGFkZGluZy48YnI+CiZndDsgPGJyPgomZ3Q7
wqAgwqAgwqAgwqBUaGlzIHNob3VsZCB3b3JrICh2ZXJpZmljYXRpb24gb2Ygc2lnbmF0dXJlIGZy
b20gdHBtMl9jZXJ0aWZ5Y3JlYXRpb248YnI+CiZndDsgd29ya3MgZmluZSk6PGJyPgomZ3Q7IDxi
cj4KJmd0O8KgIMKgIMKgIMKgb3BlbnNzbCBkZ3N0IC12ZXJpZnkgLi4vQUlLT3BhcXVlLmRlciAt
a2V5Zm9ybSBkZXIgLXNoYTEgLXNpZ25hdHVyZTxicj4KJmd0OyBTaWduYXR1cmUgS2V5QXR0ZXN0
LmJpbjxicj4KJmd0O8KgIMKgIMKgIMKgVmVyaWZpY2F0aW9uIEZhaWx1cmU8YnI+CiZndDsgPGJy
PgomZ3Q7wqAgwqAgwqAgwqAuLi4uZXhhbWluZTo8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAg
wqBvcGVuc3NsIHJzYXV0bCAtdmVyaWZ5IC1pbmtleSAuLi9BSUtPcGFxdWUuZGVyIC1pbiBTaWdu
YXR1cmUgLXB1YmluIC08YnI+CiZndDsga2V5Zm9ybSBkZXIgLXBrY3MgJmd0OyBkZWNyeXB0ZWQu
YmluPGJyPgomZ3Q7wqAgwqAgwqAgwqBSU0Egb3BlcmF0aW9uIGVycm9yPGJyPgomZ3Q7wqAgwqAg
wqAgwqAxNDA2NTQyNDczODc1ODQ6ZXJyb3I6MDQwNzAwOEE6cnNhPGJyPgomZ3Q7IHJvdXRpbmVz
OlJTQV9wYWRkaW5nX2NoZWNrX1BLQ1MxX3R5cGVfMTppbnZhbGlkPGJyPgomZ3Q7IHBhZGRpbmc6
Li4vY3J5cHRvL3JzYS9yc2FfcGsxLmM6Njc6PGJyPgomZ3Q7wqAgwqAgwqAgwqAxNDA2NTQyNDcz
ODc1ODQ6ZXJyb3I6MDQwNjcwNzI6cnNhPGJyPgomZ3Q7IHJvdXRpbmVzOnJzYV9vc3NsX3B1Ymxp
Y19kZWNyeXB0OnBhZGRpbmcgY2hlY2s8YnI+CiZndDsgZmFpbGVkOi4uL2NyeXB0by9yc2EvcnNh
X29zc2wuYzo1ODI6PGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgLi5TYW1lIG9wZXJhdGlv
biBvbiBhIHBsYWluIHNpZ25hdHVyZSBmcm9tIHRwbTJfY2VydGlmeWNyZWF0aW9uIHdvcmtzOjxi
cj4KJmd0OyA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBvcGVuc3NsIHJzYXV0bCAtdmVy
aWZ5IC1pbmtleSAuLi9BSUtPcGFxdWUuZGVyIC1pbjxicj4KJmd0OyAuLi9JZEJpbmRpbmcuRVhU
UkFDVEVEX1RQTVRfU0lHTkFUVVJFIC1wdWJpbiAta2V5Zm9ybSBkZXLCoCAmZ3Q7PGJyPgomZ3Q7
IGRlY3J5cHRlZC5iaW48YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBkdW1wYXNuMSBkZWNy
eXB0ZWQuYmluPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAwwqAgMzM6IFNFUVVFTkNFIHs8YnI+CiZn
dDvCoCDCoCDCoCDCoCDCoDLCoCDCoDk6wqAgwqBTRVFVRU5DRSB7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAgwqA0wqAgwqA1OsKgIMKgIMKgT0JKRUNUIElERU5USUZJRVIgc2hhMSAoMSAzIDE0IDMgMiAy
Nik8YnI+CiZndDvCoCDCoCDCoCDCoCAxMcKgIMKgMDrCoCDCoCDCoE5VTEw8YnI+CiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCA6wqAgwqAgwqB9PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMTPCoCAyMDrC
oCDCoE9DVEVUIFNUUklORyAyRCBBMSBEMSAzMCAzQSBEMiBGRCA2OCBBMSA1QSAyRiA5QiA4QiBD
MSAxRSBEQjxicj4KJmd0OyAzNiBBNyA3QyBENDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IDrCoCDCoH08YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgU28uIEl0IGxv
b2tzIGxpa2UgYSBidWcgaW4gdHBtMl9jZXJ0aWZ5Ljxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDC
oCDCoHRvb2w9JnF1b3Q7dHBtMl9jZXJ0aWZ5JnF1b3Q7IHZlcnNpb249JnF1b3Q7NC4xJnF1b3Q7
IHRjdGlzPSZxdW90O2xpYnRzczItdGN0aWxkciZxdW90OyB0Y3RpLWRlZmF1bHQ9dGN0aS08YnI+
CiZndDsgZGV2aWNlPGJyPgomZ3Q7wqAgwqAgwqAgwqB0cG0yLXRzcyAyLjMuMi1yYzA8YnI+CiZn
dDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBSZWdhcmRzLDxicj4KJmd0O8KgIMKgIMKgIMKgTmlrbGFz
PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+Cjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2PgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxicj4KdHBtMiBtYWlsaW5n
IGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4KJSh3ZWJfcGFnZV91cmwpc2xpc3Rp
bmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyIGNs
ZWFyPSJhbGwiPjxicj4tLSA8YnI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj48
ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRpdiBkaXI9Imx0ciI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPkx1a2UgSGluZHPCoCB8IENUTyBPZmZpY2UgfCBS
ZWQgSGF0PC9zcGFuPjxiciBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMi44cHgiPmU6wqA8L3NwYW4+PGEgaHJlZj0ibWFpbHRvOmxoaW5kc0ByZWRoYXQu
Y29tIiBzdHlsZT0iY29sb3I6cmdiKDE3LDg1LDIwNCk7Zm9udC1zaXplOjEyLjhweCIgdGFyZ2V0
PSJfYmxhbmsiPmxoaW5kc0ByZWRoYXQuY29tPC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIu
OHB4Ij7CoHwgaXJjOiBsaGluZHMgQGZyZWVub2RlIHw8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMi44cHgiPiB0OsKgPC9zcGFuPis0NCAxMiA1MiAzNiAyNDgzPGJyIHN0eWxlPSJmb250
LXNpemU6MTIuOHB4Ij48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48
L2Rpdj48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============3636573465306458162==--

