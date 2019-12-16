Content-Type: multipart/mixed; boundary="===============6525208582090159861=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Mon, 16 Dec 2019 10:50:42 +0100
Message-ID: <CAJ8N_u_ruFRctmzxErv7WZuNvO5Air8zcN1EkZzuz3scExGb1w@mail.gmail.com>
In-Reply-To: CAJ8N_u8tLptcNEHuzGJb+WQ0jPUs=_pS0Q2M0hYUPdU9pz-eXw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6525208582090159861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

A colleague of mine identified and fixed both the tpm2_certify [1] and the
superfluous byte-size [2] fields in two separate pull-requests.

Turned out that the arguments to tpm2_certify got mixed up. If one changes
the --certifiedkey-context and --signingkey-context signature verification
works.

[1] https://github.com/tpm2-software/tpm2-tools/pull/1874
[2] https://github.com/tpm2-software/tpm2-tools/pull/1873

Den tors 12 dec. 2019 kl 18:21 skrev Niklas Andersson <
niklas.andersson(a)fredenheim.se>:

> In the source it looks like tpm2_certify.c and tpm2_certifycreation.c
> handles signature differently.
>
> OpenSSL is not the issue. I am using version OpenSSL 1.1.1 11 Sep 2018,
> and I tried to unpack the signature using parameter "-raw" (instead of
> -pkcs which is default", and the result was gibberish. I would expect
> somewhat a resemblance to ASN.1.
>
> I opened an issue on Github
> https://github.com/tpm2-software/tpm2-tools/issues/1871
>
> Den tors 12 dec. 2019 kl 10:14 skrev Luke Hinds <lhinds(a)redhat.com>:
>
>> I have not had much time to research what you have tried, but I wonder if
>> it might be the same as the following situation we hit recently. iirc la=
ter
>> versions of OpenSSL (1.1.0 & greater) are less relaxed about padding
>> conventions.
>>
>> https://mta.openssl.org/pipermail/openssl-dev/2016-February/005100.html
>>
>> On Wed, Dec 11, 2019 at 10:46 PM Niklas Andersson <
>> niklas.andersson(a)fredenheim.se> wrote:
>>
>>> Hi William,
>>>
>>> Yes. It actually came to mind that my TPM might be faulty. But I had a
>>> colleague running the script and he got exactly the same error, so it s=
eems
>>> there is a bug in the padding routine.
>>>
>>>
>>> Den ons 11 dec. 2019 kl 16:50 skrev Roberts, William C <
>>> william.c.roberts(a)intel.com>:
>>>
>>>> Sounds like a possible issue in our TPM2 structures to signature format
>>>> routine or the TPM itself:
>>>>
>>>> https://github.com/tpm2-software/tpm2-tools/blob/master/lib/tpm2_conve=
rt.c#L467
>>>>
>>>> Looks like the script has an rsa key, so you should get a signature
>>>> scheme of:
>>>> TPM2_ALG_RSASSA
>>>>
>>>> Which is just a straight memcpy from the TPM.
>>>>
>>>> Perhaps, the TPM is either getting it wrong or we need to call some
>>>> magic OSSL padding routine?
>>>>
>>>>
>>>> > -----Original Message-----
>>>> > From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
>>>> > Sent: Wednesday, December 11, 2019 4:58 AM
>>>> > To: tpm2(a)lists.01.org
>>>> > Subject: [tpm2] Re: tpm2_create signature verification fails due to
>>>> > "RSA_padding_check_PKCS_type1:invalid padding"
>>>> >
>>>> > Here is the test case that explains the issue. Not sure if I am
>>>> missing something. I
>>>> > believe the certify.SIGNATURE is corrupt.
>>>> >
>>>> >
>>>> > #!/bin/bash
>>>> >
>>>> > srk_handle=3D0x81000003
>>>> > ek_handle=3D0x81010001
>>>> >
>>>> > # IDevID
>>>> > tpm2_createak \
>>>> > --ek-context=3D$ek_handle \
>>>> > --ak-context=3DIDevID.ctx \
>>>> > --key-algorithm=3Drsa \
>>>> > --hash-algorithm=3Dsha1 \
>>>> > --public=3DIDevID.pub \
>>>> > --private=3DIDevID.priv
>>>> > # --signing-algorithm=3Dsha1
>>>> >
>>>> > # LDevID
>>>> > tpm2_create \
>>>> > --parent-context=3D$srk_handle \
>>>> > --hash-algorithm=3Dsha1 \
>>>> > --key-algorithm=3Drsa2048 \
>>>> > --public=3DLDevID.pub \
>>>> > --private=3DLDevID.priv \
>>>> > --creation-data=3DLDevID.CREATION_DATA \
>>>> > --creation-hash=3DLDevID.CREATION_HASH \
>>>> > --creation-ticket=3DLDevID.CREATION_TICKET
>>>> >
>>>> > tpm2_load \
>>>> > --parent-context=3D$srk_handle \
>>>> > --public=3DLDevID.pub \
>>>> > --private=3DLDevID.priv \
>>>> > --key-context=3DLDevID.ctx
>>>> >
>>>> > # Certify
>>>> > tpm2_certify \
>>>> > --certifiedkey-context=3DLDevID.ctx \
>>>> > --signingkey-context=3DIDevID.ctx \
>>>> > --hash-algorithm=3Dsha1 \
>>>> > --attestation=3Dcertify.ATTESTATION \
>>>> > --signature=3Dcertify.SIGNATURE \
>>>> > --format=3Dplain
>>>> >
>>>> > # Certify Creation
>>>> > tpm2_certifycreation \
>>>> > --certifiedkey-context=3DLDevID.ctx \
>>>> > --signingkey-context=3DIDevID.ctx \
>>>> > --hash-algorithm=3Dsha1 \
>>>> > --creation-hash=3DLDevID.CREATION_HASH \
>>>> > --ticket=3DLDevID.CREATION_TICKET \
>>>> > --signature=3Dcertifycreation.SIGNATURE \
>>>> > --attestation=3Dcertifycreation.ATTESTATION \ --format=3Dplain
>>>> >
>>>> > # IDevID.der
>>>> > echo 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl base64
>>>> > -a -d > IDevID.header.temp dd if=3DIDevID.pub bs=3D1 skip=3D$(expr $=
(stat --
>>>> > format=3D%s IDevID.pub) - 256) of=3DIDevID.modulus.temp echo -en
>>>> '\x02\x03' >
>>>> > IDevID.mid-header.temp echo -ne '\x01\x00\x01' > IDevID.exponent.temp
>>>> cat
>>>> > IDevID.header.temp IDevID.modulus.temp IDevID.mid-header.temp
>>>> > IDevID.exponent.temp > IDevID.der
>>>> >
>>>> > # Remove first two bytes (byte size of struct) in
>>>> certifycreation.ATTESTATION # in
>>>> > order for hash to comply. Magic Header" must be ff 54 43 47 dd
>>>> > if=3Dcertifycreation.ATTESTATION of=3Dcertifycreation.ATTESTATION_2 =
bs=3D1
>>>> skip=3D2
>>>> >
>>>> > # WORKS: Verify Certify Creation
>>>> > openssl dgst \
>>>> > -verify IDevID.der -keyform der \
>>>> > -sha1 -signature certifycreation.SIGNATURE
>>>> certifycreation.ATTESTATION_2
>>>> >
>>>> > # FAILS: Verify Create
>>>> > openssl dgst \
>>>> > -verify IDevID.der -keyform der \
>>>> > -sha1 -signature certify.SIGNATURE certify.ATTESTATION
>>>> >
>>>> > # WORKS:
>>>> > openssl rsautl \
>>>> > -verify \
>>>> > -pubin -inkey IDevID.der -keyform DER \
>>>> > -in certifycreation.SIGNATURE \
>>>> > -out certifycreation.SIGNATURE.asn1
>>>> >
>>>> > dumpasn1 certifycreation.SIGNATURE.asn1
>>>> >
>>>> > # FAILS:
>>>> > openssl rsautl \
>>>> > -verify \
>>>> > -pubin -inkey IDevID.der -keyform DER \
>>>> > -in certify.SIGNATURE \
>>>> > -out certify.SIGNATURE.asn1
>>>> >
>>>> > Den tis 10 dec. 2019 kl 23:40 skrev Niklas Andersson
>>>> > <niklas.andersson(a)fredenheim.se <mailto:
>>>> niklas.andersson(a)fredenheim.se> >:
>>>> >
>>>> >
>>>> >       openssl can not verify plain signature (256 bytes) from
>>>> tpm2_certify due
>>>> > to bad padding.
>>>> >
>>>> >       This should work (verification of signature from
>>>> tpm2_certifycreation
>>>> > works fine):
>>>> >
>>>> >       openssl dgst -verify ../AIKOpaque.der -keyform der -sha1
>>>> -signature
>>>> > Signature KeyAttest.bin
>>>> >       Verification Failure
>>>> >
>>>> >       ....examine:
>>>> >
>>>> >       openssl rsautl -verify -inkey ../AIKOpaque.der -in Signature
>>>> -pubin -
>>>> > keyform der -pkcs > decrypted.bin
>>>> >       RSA operation error
>>>> >       140654247387584:error:0407008A:rsa
>>>> > routines:RSA_padding_check_PKCS1_type_1:invalid
>>>> > padding:../crypto/rsa/rsa_pk1.c:67:
>>>> >       140654247387584:error:04067072:rsa
>>>> > routines:rsa_ossl_public_decrypt:padding check
>>>> > failed:../crypto/rsa/rsa_ossl.c:582:
>>>> >
>>>> >       ..Same operation on a plain signature from tpm2_certifycreation
>>>> works:
>>>> >
>>>> >
>>>> >       openssl rsautl -verify -inkey ../AIKOpaque.der -in
>>>> > ../IdBinding.EXTRACTED_TPMT_SIGNATURE -pubin -keyform der  >
>>>> > decrypted.bin
>>>> >
>>>> >       dumpasn1 decrypted.bin
>>>> >         0  33: SEQUENCE {
>>>> >         2   9:   SEQUENCE {
>>>> >         4   5:     OBJECT IDENTIFIER sha1 (1 3 14 3 2 26)
>>>> >        11   0:     NULL
>>>> >              :     }
>>>> >        13  20:   OCTET STRING 2D A1 D1 30 3A D2 FD 68 A1 5A 2F 9B 8B
>>>> C1 1E DB
>>>> > 36 A7 7C D4
>>>> >              :   }
>>>> >
>>>> >
>>>> >       So. It looks like a bug in tpm2_certify.
>>>> >
>>>> >       tool=3D"tpm2_certify" version=3D"4.1" tctis=3D"libtss2-tctildr"
>>>> tcti-default=3Dtcti-
>>>> > device
>>>> >       tpm2-tss 2.3.2-rc0
>>>> >
>>>> >       Regards,
>>>> >       Niklas
>>>> >
>>>> >
>>>>
>>>> _______________________________________________
>>> tpm2 mailing list -- tpm2(a)lists.01.org
>>> To unsubscribe send an email to tpm2-leave(a)lists.01.org
>>> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>>
>>
>>
>> --
>> Luke Hinds  | CTO Office | Red Hat
>> e: lhinds(a)redhat.com | irc: lhinds @freenode | t: +44 12 52 36 2483
>>
>

--===============6525208582090159861==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5BIGNvbGxlYWd1ZSBvZiBtaW5lIGlkZW50aWZpZWQgYW5kIGZp
eGVkIGJvdGggdGhlIHRwbTJfY2VydGlmeSBbMV0gYW5kIHRoZSBzdXBlcmZsdW91cyBieXRlLXNp
emUgWzJdIGZpZWxkcyBpbiB0d28gc2VwYXJhdGUgcHVsbC1yZXF1ZXN0cy48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlR1cm5lZCBvdXQgdGhhdCB0aGUgYXJndW1lbnRzIHRvIHRwbTJfY2VydGlm
eSBnb3QgbWl4ZWQgdXAuIElmIG9uZSBjaGFuZ2VzIHRoZSAtLWNlcnRpZmllZGtleS1jb250ZXh0
IGFuZCAtLXNpZ25pbmdrZXktY29udGV4dCBzaWduYXR1cmUgdmVyaWZpY2F0aW9uIHdvcmtzLjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+WzFdIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90
cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvcHVsbC8xODc0Ij5odHRwczovL2dpdGh1Yi5jb20vdHBt
Mi1zb2Z0d2FyZS90cG0yLXRvb2xzL3B1bGwvMTg3NDwvYT48L2Rpdj5bMl0gPGEgaHJlZj0iaHR0
cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9wdWxsLzE4NzMiPmh0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvcHVsbC8xODczPC9hPiA8YnI+
PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0i
Z21haWxfYXR0ciI+RGVuIHRvcnMgMTIgZGVjLiAyMDE5IGtsIDE4OjIxIHNrcmV2IE5pa2xhcyBB
bmRlcnNzb24gJmx0OzxhIGhyZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0u
c2UiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT4mZ3Q7Ojxicj48L2Rpdj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44
ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFl
eCI+PGRpdiBkaXI9Imx0ciI+PGRpdj5JbiB0aGUgc291cmNlIGl0IGxvb2tzIGxpa2UgdHBtMl9j
ZXJ0aWZ5LmMgYW5kIHRwbTJfY2VydGlmeWNyZWF0aW9uLmMgaGFuZGxlcyBzaWduYXR1cmUgZGlm
ZmVyZW50bHkuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5PcGVuU1NMIGlzIG5vdCB0aGUgaXNz
dWUuIEkgYW0gdXNpbmcgdmVyc2lvbiBPcGVuU1NMIDEuMS4xIDExIFNlcCAyMDE4LCBhbmQgSSB0
cmllZCB0byB1bnBhY2sgdGhlIHNpZ25hdHVyZSB1c2luZyBwYXJhbWV0ZXIgJnF1b3Q7LXJhdyZx
dW90OyAoaW5zdGVhZCBvZiAtcGtjcyB3aGljaCBpcyBkZWZhdWx0JnF1b3Q7LCBhbmQgdGhlIHJl
c3VsdCB3YXMgZ2liYmVyaXNoLiBJIHdvdWxkIGV4cGVjdCBzb21ld2hhdCBhIHJlc2VtYmxhbmNl
IHRvIEFTTi4xLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBvcGVuZWQgYW4gaXNzdWUgb24g
R2l0aHViIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9v
bHMvaXNzdWVzLzE4NzEiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1z
b2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy8xODcxPC9hPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPkRlbiB0
b3JzIDEyIGRlYy4gMjAxOSBrbCAxMDoxNCBza3JldiBMdWtlIEhpbmRzICZsdDs8YSBocmVmPSJt
YWlsdG86bGhpbmRzQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5saGluZHNAcmVkaGF0LmNv
bTwvYT4mZ3Q7Ojxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdj5JIGhhdmUgbm90
IGhhZCBtdWNoIHRpbWUgdG8gcmVzZWFyY2ggd2hhdCB5b3UgaGF2ZSB0cmllZCwgYnV0IEkgd29u
ZGVyIGlmIGl0IG1pZ2h0IGJlIHRoZSBzYW1lIGFzIHRoZSBmb2xsb3dpbmcgc2l0dWF0aW9uIHdl
IGhpdCByZWNlbnRseS4gaWlyYyBsYXRlciB2ZXJzaW9ucyBvZiBPcGVuU1NMICgxLjEuMCAmYW1w
OyBncmVhdGVyKSBhcmUgbGVzcyByZWxheGVkIGFib3V0IHBhZGRpbmcgY29udmVudGlvbnMuIDxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vbXRhLm9wZW5zc2wu
b3JnL3BpcGVybWFpbC9vcGVuc3NsLWRldi8yMDE2LUZlYnJ1YXJ5LzAwNTEwMC5odG1sIiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9tdGEub3BlbnNzbC5vcmcvcGlwZXJtYWlsL29wZW5zc2wtZGV2
LzIwMTYtRmVicnVhcnkvMDA1MTAwLmh0bWw8L2E+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBEZWMgMTEs
IDIwMTkgYXQgMTA6NDYgUE0gTmlrbGFzIEFuZGVyc3NvbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOm5p
a2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRl
cnNzb25AZnJlZGVuaGVpbS5zZTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBk
aXI9Imx0ciI+PGRpdj5IaSBXaWxsaWFtLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+WWVzLiBJ
dCBhY3R1YWxseSBjYW1lIHRvIG1pbmQgdGhhdCBteSBUUE0gbWlnaHQgYmUgZmF1bHR5LiBCdXQg
SSBoYWQgYSBjb2xsZWFndWUgcnVubmluZyB0aGUgc2NyaXB0IGFuZCBoZSBnb3QgZXhhY3RseSB0
aGUgc2FtZSBlcnJvciwgc28gaXQgc2VlbXMgdGhlcmUgaXMgYSBidWcgaW4gdGhlIHBhZGRpbmcg
cm91dGluZS48YnI+PC9kaXY+PC9kaXY+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPkRl
biBvbnMgMTEgZGVjLiAyMDE5IGtsIDE2OjUwIHNrcmV2IFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7
PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7Ojxicj48L2Rpdj48YmxvY2tx
dW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+
U291bmRzIGxpa2UgYSBwb3NzaWJsZSBpc3N1ZSBpbiBvdXIgVFBNMiBzdHJ1Y3R1cmVzIHRvIHNp
Z25hdHVyZSBmb3JtYXQgcm91dGluZSBvciB0aGUgVFBNIGl0c2VsZjo8YnI+CjxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbGli
L3RwbTJfY29udmVydC5jI0w0NjciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbGli
L3RwbTJfY29udmVydC5jI0w0Njc8L2E+PGJyPgo8YnI+Ckxvb2tzIGxpa2UgdGhlIHNjcmlwdCBo
YXMgYW4gcnNhIGtleSwgc28geW91IHNob3VsZCBnZXQgYSBzaWduYXR1cmUgc2NoZW1lIG9mOjxi
cj4KVFBNMl9BTEdfUlNBU1NBPGJyPgo8YnI+CldoaWNoIGlzIGp1c3QgYSBzdHJhaWdodCBtZW1j
cHkgZnJvbSB0aGUgVFBNLjxicj4KPGJyPgpQZXJoYXBzLCB0aGUgVFBNIGlzIGVpdGhlciBnZXR0
aW5nIGl0IHdyb25nIG9yIHdlIG5lZWQgdG8gY2FsbCBzb21lIG1hZ2ljIE9TU0wgcGFkZGluZyBy
b3V0aW5lPzxicj4KPGJyPgo8YnI+CiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+
CiZndDsgRnJvbTogTmlrbGFzIEFuZGVyc3NvbiBbbWFpbHRvOjxhIGhyZWY9Im1haWx0bzpuaWts
YXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWtsYXMuYW5kZXJz
c29uQGZyZWRlbmhlaW0uc2U8L2E+XTxicj4KJmd0OyBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVy
IDExLCAyMDE5IDQ6NTggQU08YnI+CiZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3Rz
LjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4KJmd0OyBT
dWJqZWN0OiBbdHBtMl0gUmU6IHRwbTJfY3JlYXRlIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gZmFp
bHMgZHVlIHRvPGJyPgomZ3Q7ICZxdW90O1JTQV9wYWRkaW5nX2NoZWNrX1BLQ1NfdHlwZTE6aW52
YWxpZCBwYWRkaW5nJnF1b3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyBIZXJlIGlzIHRoZSB0ZXN0IGNh
c2UgdGhhdCBleHBsYWlucyB0aGUgaXNzdWUuIE5vdCBzdXJlIGlmIEkgYW0gbWlzc2luZyBzb21l
dGhpbmcuIEk8YnI+CiZndDsgYmVsaWV2ZSB0aGUgY2VydGlmeS5TSUdOQVRVUkUgaXMgY29ycnVw
dC48YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyAjIS9iaW4vYmFzaDxicj4KJmd0OyA8YnI+
CiZndDsgc3JrX2hhbmRsZT0weDgxMDAwMDAzPGJyPgomZ3Q7IGVrX2hhbmRsZT0weDgxMDEwMDAx
PGJyPgomZ3Q7IDxicj4KJmd0OyAjIElEZXZJRDxicj4KJmd0OyB0cG0yX2NyZWF0ZWFrIFw8YnI+
CiZndDsgLS1lay1jb250ZXh0PSRla19oYW5kbGUgXDxicj4KJmd0OyAtLWFrLWNvbnRleHQ9SURl
dklELmN0eCBcPGJyPgomZ3Q7IC0ta2V5LWFsZ29yaXRobT1yc2EgXDxicj4KJmd0OyAtLWhhc2gt
YWxnb3JpdGhtPXNoYTEgXDxicj4KJmd0OyAtLXB1YmxpYz1JRGV2SUQucHViIFw8YnI+CiZndDsg
LS1wcml2YXRlPUlEZXZJRC5wcml2PGJyPgomZ3Q7ICMgLS1zaWduaW5nLWFsZ29yaXRobT1zaGEx
PGJyPgomZ3Q7IDxicj4KJmd0OyAjIExEZXZJRDxicj4KJmd0OyB0cG0yX2NyZWF0ZSBcPGJyPgom
Z3Q7IC0tcGFyZW50LWNvbnRleHQ9JHNya19oYW5kbGUgXDxicj4KJmd0OyAtLWhhc2gtYWxnb3Jp
dGhtPXNoYTEgXDxicj4KJmd0OyAtLWtleS1hbGdvcml0aG09cnNhMjA0OCBcPGJyPgomZ3Q7IC0t
cHVibGljPUxEZXZJRC5wdWIgXDxicj4KJmd0OyAtLXByaXZhdGU9TERldklELnByaXYgXDxicj4K
Jmd0OyAtLWNyZWF0aW9uLWRhdGE9TERldklELkNSRUFUSU9OX0RBVEEgXDxicj4KJmd0OyAtLWNy
ZWF0aW9uLWhhc2g9TERldklELkNSRUFUSU9OX0hBU0ggXDxicj4KJmd0OyAtLWNyZWF0aW9uLXRp
Y2tldD1MRGV2SUQuQ1JFQVRJT05fVElDS0VUPGJyPgomZ3Q7IDxicj4KJmd0OyB0cG0yX2xvYWQg
XDxicj4KJmd0OyAtLXBhcmVudC1jb250ZXh0PSRzcmtfaGFuZGxlIFw8YnI+CiZndDsgLS1wdWJs
aWM9TERldklELnB1YiBcPGJyPgomZ3Q7IC0tcHJpdmF0ZT1MRGV2SUQucHJpdiBcPGJyPgomZ3Q7
IC0ta2V5LWNvbnRleHQ9TERldklELmN0eDxicj4KJmd0OyA8YnI+CiZndDsgIyBDZXJ0aWZ5PGJy
PgomZ3Q7IHRwbTJfY2VydGlmeSBcPGJyPgomZ3Q7IC0tY2VydGlmaWVka2V5LWNvbnRleHQ9TERl
dklELmN0eCBcPGJyPgomZ3Q7IC0tc2lnbmluZ2tleS1jb250ZXh0PUlEZXZJRC5jdHggXDxicj4K
Jmd0OyAtLWhhc2gtYWxnb3JpdGhtPXNoYTEgXDxicj4KJmd0OyAtLWF0dGVzdGF0aW9uPWNlcnRp
ZnkuQVRURVNUQVRJT04gXDxicj4KJmd0OyAtLXNpZ25hdHVyZT1jZXJ0aWZ5LlNJR05BVFVSRSBc
PGJyPgomZ3Q7IC0tZm9ybWF0PXBsYWluPGJyPgomZ3Q7IDxicj4KJmd0OyAjIENlcnRpZnkgQ3Jl
YXRpb248YnI+CiZndDsgdHBtMl9jZXJ0aWZ5Y3JlYXRpb24gXDxicj4KJmd0OyAtLWNlcnRpZmll
ZGtleS1jb250ZXh0PUxEZXZJRC5jdHggXDxicj4KJmd0OyAtLXNpZ25pbmdrZXktY29udGV4dD1J
RGV2SUQuY3R4IFw8YnI+CiZndDsgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+CiZndDsgLS1j
cmVhdGlvbi1oYXNoPUxEZXZJRC5DUkVBVElPTl9IQVNIIFw8YnI+CiZndDsgLS10aWNrZXQ9TERl
dklELkNSRUFUSU9OX1RJQ0tFVCBcPGJyPgomZ3Q7IC0tc2lnbmF0dXJlPWNlcnRpZnljcmVhdGlv
bi5TSUdOQVRVUkUgXDxicj4KJmd0OyAtLWF0dGVzdGF0aW9uPWNlcnRpZnljcmVhdGlvbi5BVFRF
U1RBVElPTiBcIC0tZm9ybWF0PXBsYWluPGJyPgomZ3Q7IDxicj4KJmd0OyAjIElEZXZJRC5kZXI8
YnI+CiZndDsgZWNobyAmIzM5O01JSUJJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBUThBTUlJQkNn
S0NBUUVBJiMzOTsgfCBvcGVuc3NsIGJhc2U2NDxicj4KJmd0OyAtYSAtZCAmZ3Q7IElEZXZJRC5o
ZWFkZXIudGVtcCBkZCBpZj1JRGV2SUQucHViIGJzPTEgc2tpcD0kKGV4cHIgJChzdGF0IC0tPGJy
PgomZ3Q7IGZvcm1hdD0lcyBJRGV2SUQucHViKSAtIDI1Nikgb2Y9SURldklELm1vZHVsdXMudGVt
cCBlY2hvIC1lbiAmIzM5O1x4MDJceDAzJiMzOTsgJmd0Ozxicj4KJmd0OyBJRGV2SUQubWlkLWhl
YWRlci50ZW1wIGVjaG8gLW5lICYjMzk7XHgwMVx4MDBceDAxJiMzOTsgJmd0OyBJRGV2SUQuZXhw
b25lbnQudGVtcCBjYXQ8YnI+CiZndDsgSURldklELmhlYWRlci50ZW1wIElEZXZJRC5tb2R1bHVz
LnRlbXAgSURldklELm1pZC1oZWFkZXIudGVtcDxicj4KJmd0OyBJRGV2SUQuZXhwb25lbnQudGVt
cCAmZ3Q7IElEZXZJRC5kZXI8YnI+CiZndDsgPGJyPgomZ3Q7ICMgUmVtb3ZlIGZpcnN0IHR3byBi
eXRlcyAoYnl0ZSBzaXplIG9mIHN0cnVjdCkgaW4gY2VydGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9O
ICMgaW48YnI+CiZndDsgb3JkZXIgZm9yIGhhc2ggdG8gY29tcGx5LiBNYWdpYyBIZWFkZXImcXVv
dDsgbXVzdCBiZSBmZiA1NCA0MyA0NyBkZDxicj4KJmd0OyBpZj1jZXJ0aWZ5Y3JlYXRpb24uQVRU
RVNUQVRJT04gb2Y9Y2VydGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9OXzIgYnM9MSBza2lwPTI8YnI+
CiZndDsgPGJyPgomZ3Q7ICMgV09SS1M6IFZlcmlmeSBDZXJ0aWZ5IENyZWF0aW9uPGJyPgomZ3Q7
IG9wZW5zc2wgZGdzdCBcPGJyPgomZ3Q7IC12ZXJpZnkgSURldklELmRlciAta2V5Zm9ybSBkZXIg
XDxicj4KJmd0OyAtc2hhMSAtc2lnbmF0dXJlIGNlcnRpZnljcmVhdGlvbi5TSUdOQVRVUkUgY2Vy
dGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9OXzI8YnI+CiZndDsgPGJyPgomZ3Q7ICMgRkFJTFM6IFZl
cmlmeSBDcmVhdGU8YnI+CiZndDsgb3BlbnNzbCBkZ3N0IFw8YnI+CiZndDsgLXZlcmlmeSBJRGV2
SUQuZGVyIC1rZXlmb3JtIGRlciBcPGJyPgomZ3Q7IC1zaGExIC1zaWduYXR1cmUgY2VydGlmeS5T
SUdOQVRVUkUgY2VydGlmeS5BVFRFU1RBVElPTjxicj4KJmd0OyA8YnI+CiZndDsgIyBXT1JLUzo8
YnI+CiZndDsgb3BlbnNzbCByc2F1dGwgXDxicj4KJmd0OyAtdmVyaWZ5IFw8YnI+CiZndDsgLXB1
YmluIC1pbmtleSBJRGV2SUQuZGVyIC1rZXlmb3JtIERFUiBcPGJyPgomZ3Q7IC1pbiBjZXJ0aWZ5
Y3JlYXRpb24uU0lHTkFUVVJFIFw8YnI+CiZndDsgLW91dCBjZXJ0aWZ5Y3JlYXRpb24uU0lHTkFU
VVJFLmFzbjE8YnI+CiZndDsgPGJyPgomZ3Q7IGR1bXBhc24xIGNlcnRpZnljcmVhdGlvbi5TSUdO
QVRVUkUuYXNuMTxicj4KJmd0OyA8YnI+CiZndDsgIyBGQUlMUzo8YnI+CiZndDsgb3BlbnNzbCBy
c2F1dGwgXDxicj4KJmd0OyAtdmVyaWZ5IFw8YnI+CiZndDsgLXB1YmluIC1pbmtleSBJRGV2SUQu
ZGVyIC1rZXlmb3JtIERFUiBcPGJyPgomZ3Q7IC1pbiBjZXJ0aWZ5LlNJR05BVFVSRSBcPGJyPgom
Z3Q7IC1vdXQgY2VydGlmeS5TSUdOQVRVUkUuYXNuMTxicj4KJmd0OyA8YnI+CiZndDsgRGVuIHRp
cyAxMCBkZWMuIDIwMTkga2wgMjM6NDAgc2tyZXYgTmlrbGFzIEFuZGVyc3Nvbjxicj4KJmd0OyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0
PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT4gJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9i
bGFuayI+bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPiZndDsgJmd0Ozo8YnI+CiZn
dDsgPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgb3BlbnNzbCBjYW4gbm90IHZlcmlmeSBw
bGFpbiBzaWduYXR1cmUgKDI1NiBieXRlcykgZnJvbSB0cG0yX2NlcnRpZnkgZHVlPGJyPgomZ3Q7
IHRvIGJhZCBwYWRkaW5nLjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoFRoaXMgc2hvdWxk
IHdvcmsgKHZlcmlmaWNhdGlvbiBvZiBzaWduYXR1cmUgZnJvbSB0cG0yX2NlcnRpZnljcmVhdGlv
bjxicj4KJmd0OyB3b3JrcyBmaW5lKTo8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBvcGVu
c3NsIGRnc3QgLXZlcmlmeSAuLi9BSUtPcGFxdWUuZGVyIC1rZXlmb3JtIGRlciAtc2hhMSAtc2ln
bmF0dXJlPGJyPgomZ3Q7IFNpZ25hdHVyZSBLZXlBdHRlc3QuYmluPGJyPgomZ3Q7wqAgwqAgwqAg
wqBWZXJpZmljYXRpb24gRmFpbHVyZTxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoC4uLi5l
eGFtaW5lOjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoG9wZW5zc2wgcnNhdXRsIC12ZXJp
ZnkgLWlua2V5IC4uL0FJS09wYXF1ZS5kZXIgLWluIFNpZ25hdHVyZSAtcHViaW4gLTxicj4KJmd0
OyBrZXlmb3JtIGRlciAtcGtjcyAmZ3Q7IGRlY3J5cHRlZC5iaW48YnI+CiZndDvCoCDCoCDCoCDC
oFJTQSBvcGVyYXRpb24gZXJyb3I8YnI+CiZndDvCoCDCoCDCoCDCoDE0MDY1NDI0NzM4NzU4NDpl
cnJvcjowNDA3MDA4QTpyc2E8YnI+CiZndDsgcm91dGluZXM6UlNBX3BhZGRpbmdfY2hlY2tfUEtD
UzFfdHlwZV8xOmludmFsaWQ8YnI+CiZndDsgcGFkZGluZzouLi9jcnlwdG8vcnNhL3JzYV9wazEu
Yzo2Nzo8YnI+CiZndDvCoCDCoCDCoCDCoDE0MDY1NDI0NzM4NzU4NDplcnJvcjowNDA2NzA3Mjpy
c2E8YnI+CiZndDsgcm91dGluZXM6cnNhX29zc2xfcHVibGljX2RlY3J5cHQ6cGFkZGluZyBjaGVj
azxicj4KJmd0OyBmYWlsZWQ6Li4vY3J5cHRvL3JzYS9yc2Ffb3NzbC5jOjU4Mjo8YnI+CiZndDsg
PGJyPgomZ3Q7wqAgwqAgwqAgwqAuLlNhbWUgb3BlcmF0aW9uIG9uIGEgcGxhaW4gc2lnbmF0dXJl
IGZyb20gdHBtMl9jZXJ0aWZ5Y3JlYXRpb24gd29ya3M6PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+
CiZndDvCoCDCoCDCoCDCoG9wZW5zc2wgcnNhdXRsIC12ZXJpZnkgLWlua2V5IC4uL0FJS09wYXF1
ZS5kZXIgLWluPGJyPgomZ3Q7IC4uL0lkQmluZGluZy5FWFRSQUNURURfVFBNVF9TSUdOQVRVUkUg
LXB1YmluIC1rZXlmb3JtIGRlcsKgICZndDs8YnI+CiZndDsgZGVjcnlwdGVkLmJpbjxicj4KJmd0
OyA8YnI+CiZndDvCoCDCoCDCoCDCoGR1bXBhc24xIGRlY3J5cHRlZC5iaW48YnI+CiZndDvCoCDC
oCDCoCDCoCDCoDDCoCAzMzogU0VRVUVOQ0Ugezxicj4KJmd0O8KgIMKgIMKgIMKgIMKgMsKgIMKg
OTrCoCDCoFNFUVVFTkNFIHs8YnI+CiZndDvCoCDCoCDCoCDCoCDCoDTCoCDCoDU6wqAgwqAgwqBP
QkpFQ1QgSURFTlRJRklFUiBzaGExICgxIDMgMTQgMyAyIDI2KTxicj4KJmd0O8KgIMKgIMKgIMKg
IDExwqAgwqAwOsKgIMKgIMKgTlVMTDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIDrCoCDC
oCDCoH08YnI+CiZndDvCoCDCoCDCoCDCoCAxM8KgIDIwOsKgIMKgT0NURVQgU1RSSU5HIDJEIEEx
IEQxIDMwIDNBIEQyIEZEIDY4IEExIDVBIDJGIDlCIDhCIEMxIDFFIERCPGJyPgomZ3Q7IDM2IEE3
IDdDIEQ0PGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgOsKgIMKgfTxicj4KJmd0OyA8YnI+
CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqBTby4gSXQgbG9va3MgbGlrZSBhIGJ1ZyBpbiB0cG0y
X2NlcnRpZnkuPGJyPgomZ3Q7IDxicj4KJmd0O8KgIMKgIMKgIMKgdG9vbD0mcXVvdDt0cG0yX2Nl
cnRpZnkmcXVvdDsgdmVyc2lvbj0mcXVvdDs0LjEmcXVvdDsgdGN0aXM9JnF1b3Q7bGlidHNzMi10
Y3RpbGRyJnF1b3Q7IHRjdGktZGVmYXVsdD10Y3RpLTxicj4KJmd0OyBkZXZpY2U8YnI+CiZndDvC
oCDCoCDCoCDCoHRwbTItdHNzIDIuMy4yLXJjMDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDC
oFJlZ2FyZHMsPGJyPgomZ3Q7wqAgwqAgwqAgwqBOaWtsYXM8YnI+CiZndDsgPGJyPgomZ3Q7IDxi
cj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBocmVmPSJtYWls
dG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwv
YT48YnI+ClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRw
bTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4w
MS5vcmc8L2E+PGJyPgolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVy
bmFsX25hbWUpczwvYmxvY2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxicj48
ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRp
diBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjhweCI+THVrZSBIaW5kc8KgIHwgQ1RPIE9mZmljZSB8IFJlZCBIYXQ8L3NwYW4+PGJyIHN0eWxl
PSJmb250LXNpemU6MTIuOHB4Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+ZTrCoDwv
c3Bhbj48YSBocmVmPSJtYWlsdG86bGhpbmRzQHJlZGhhdC5jb20iIHN0eWxlPSJjb2xvcjpyZ2Io
MTcsODUsMjA0KTtmb250LXNpemU6MTIuOHB4IiB0YXJnZXQ9Il9ibGFuayI+bGhpbmRzQHJlZGhh
dC5jb208L2E+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPsKgfCBpcmM6IGxoaW5kcyBA
ZnJlZW5vZGUgfDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjhweCI+IHQ6wqA8L3Nw
YW4+KzQ0IDEyIDUyIDM2IDI0ODM8YnIgc3R5bGU9ImZvbnQtc2l6ZToxMi44cHgiPjwvZGl2Pjwv
ZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo8L2Jsb2NrcXVv
dGU+PC9kaXY+CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============6525208582090159861==--

