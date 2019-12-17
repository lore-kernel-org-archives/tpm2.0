Content-Type: multipart/mixed; boundary="===============6247946423446808313=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Tue, 17 Dec 2019 16:18:48 +0100
Message-ID: <CAJ8N_u-aSyWsCpCthy+GwvzPzXdP5zxN+Q35Ph-3zHJ7YhevLg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E60927@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6247946423446808313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yay! Thanks a lot for moving so fast :-)

- Niklas

Den tis 17 dec. 2019 kl 16:16 skrev Roberts, William C <
william.c.roberts(a)intel.com>:

> I pulled all these in, so attestation's on disk format will change. I
> would consider these
> To be of short lifespan so it shouldn't cause much grief.
>
> We were also able to remove some dead code:
> https://github.com/tpm2-software/tpm2-tools/pull/1876
>
> Thanks,
> Bill
>
> > -----Original Message-----
> > From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
> > Sent: Tuesday, December 17, 2019 5:38 AM
> > To: Roberts, William C <william.c.roberts(a)intel.com>
> > Cc: Luke Hinds <lhinds(a)redhat.com>; tpm2(a)lists.01.org
> > Subject: Re: [tpm2] Re: tpm2_create signature verification fails due to
> > "RSA_padding_check_PKCS_type1:invalid padding"
> >
> > +1 for bug :-)
> >
> > On Mon, Dec 16, 2019, 16:04 Roberts, William C <
> william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> > wrote:
> >
> >
> >
> >
> >       > -----Original Message-----
> >       > From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se> ]
> >       > Sent: Monday, December 16, 2019 3:51 AM
> >       > To: Luke Hinds <lhinds(a)redhat.com <mailto:lhinds(a)redhat.com=
> >
> >       > Cc: Roberts, William C <william.c.roberts(a)intel.com
> > <mailto:william.c.roberts(a)intel.com> >; tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >       > Subject: Re: [tpm2] Re: tpm2_create signature verification fails
> due to
> >       > "RSA_padding_check_PKCS_type1:invalid padding"
> >       >
> >       > A colleague of mine identified and fixed both the tpm2_certify
> [1] and
> > the
> >       > superfluous byte-size [2] fields in two separate pull-requests.
> >       >
> >       > Turned out that the arguments to tpm2_certify got mixed up. If
> one
> > changes the
> >       > --certifiedkey-context and --signingkey-context signature
> verification
> > works.
> >       >
> >       > [1] https://github.com/tpm2-software/tpm2-tools/pull/1874
> >       > [2] https://github.com/tpm2-software/tpm2-tools/pull/1873
> >
> >       These look good, thanks. The real question is whether or not we
> view
> >       PR#1873 as a non-backwards compatible change. I view it as a bug,
> > anyone
> >       object to that?
> >
> >       >
> >       >
> >       > Den tors 12 dec. 2019 kl 18:21 skrev Niklas Andersson
> >       > <niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se>
> > <mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se> > >:
> >       >
> >       >
> >       >       In the source it looks like tpm2_certify.c and
> tpm2_certifycreation.c
> >       > handles signature differently.
> >       >
> >       >       OpenSSL is not the issue. I am using version OpenSSL 1.1.1
> 11 Sep
> > 2018,
> >       > and I tried to unpack the signature using parameter "-raw"
> (instead of -
> > pkcs
> >       > which is default", and the result was gibberish. I would expect
> > somewhat a
> >       > resemblance to ASN.1.
> >       >
> >       >       I opened an issue on Github https://github.com/tpm2-
> > software/tpm2-
> >       > tools/issues/1871
> >       >
> >       >       Den tors 12 dec. 2019 kl 10:14 skrev Luke Hinds <
> lhinds(a)redhat.com
> > <mailto:lhinds(a)redhat.com>
> >       > <mailto:lhinds(a)redhat.com <mailto:lhinds(a)redhat.com> > >:
> >       >
> >       >
> >       >               I have not had much time to research what you have
> tried, but I
> >       > wonder if it might be the same as the following situation we hit
> > recently. iirc later
> >       > versions of OpenSSL (1.1.0 & greater) are less relaxed about
> padding
> >       > conventions.
> >       >
> >       >
> >       >
> https://mta.openssl.org/pipermail/openssl-dev/2016-
> >       > February/005100.html
> >       >
> >       >               On Wed, Dec 11, 2019 at 10:46 PM Niklas Andersson
> >       > <niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se>
> > <mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se> > >
> >       > wrote:
> >       >
> >       >
> >       >                       Hi William,
> >       >
> >       >                       Yes. It actually came to mind that my TPM
> might be faulty.
> >       > But I had a colleague running the script and he got exactly the
> same
> > error, so it
> >       > seems there is a bug in the padding routine.
> >       >
> >       >
> >       >
> >       >                       Den ons 11 dec. 2019 kl 16:50 skrev
> Roberts, William C
> >       > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)inte=
l.com
> >
> > <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel=
.com>
> > >:
> >       >
> >       >
> >       >                               Sounds like a possible issue in
> our TPM2
> >       > structures to signature format routine or the TPM itself:
> >       >
> https://github.com/tpm2-software/tpm2-
> >       > tools/blob/master/lib/tpm2_convert.c#L467
> >       >
> >       >                               Looks like the script has an rsa
> key, so you should
> >       > get a signature scheme of:
> >       >                               TPM2_ALG_RSASSA
> >       >
> >       >                               Which is just a straight memcpy
> from the TPM.
> >       >
> >       >                               Perhaps, the TPM is either getting
> it wrong or we
> >       > need to call some magic OSSL padding routine?
> >       >
> >       >
> >       >                               > -----Original Message-----
> >       >                               > From: Niklas Andersson
> >       > [mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se>
> >       > <mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se> > ]
> >       >                               > Sent: Wednesday, December 11,
> 2019 4:58 AM
> >       >                               > To: tpm2(a)lists.01.org <mailto:
> tpm2(a)lists.01.org>
> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >       >                               > Subject: [tpm2] Re: tpm2_create
> signature
> >       > verification fails due to
> >       >                               >
> "RSA_padding_check_PKCS_type1:invalid
> >       > padding"
> >       >                               >
> >       >                               > Here is the test case that
> explains the issue. Not
> >       > sure if I am missing something. I
> >       >                               > believe the certify.SIGNATURE is
> corrupt.
> >       >                               >
> >       >                               >
> >       >                               > #!/bin/bash
> >       >                               >
> >       >                               > srk_handle=3D0x81000003
> >       >                               > ek_handle=3D0x81010001
> >       >                               >
> >       >                               > # IDevID
> >       >                               > tpm2_createak \
> >       >                               > --ek-context=3D$ek_handle \
> >       >                               > --ak-context=3DIDevID.ctx \
> >       >                               > --key-algorithm=3Drsa \
> >       >                               > --hash-algorithm=3Dsha1 \
> >       >                               > --public=3DIDevID.pub \
> >       >                               > --private=3DIDevID.priv
> >       >                               > # --signing-algorithm=3Dsha1
> >       >                               >
> >       >                               > # LDevID
> >       >                               > tpm2_create \
> >       >                               > --parent-context=3D$srk_handle \
> >       >                               > --hash-algorithm=3Dsha1 \
> >       >                               > --key-algorithm=3Drsa2048 \
> >       >                               > --public=3DLDevID.pub \
> >       >                               > --private=3DLDevID.priv \
> >       >                               >
> --creation-data=3DLDevID.CREATION_DATA \
> >       >                               >
> --creation-hash=3DLDevID.CREATION_HASH \
> >       >                               >
> --creation-ticket=3DLDevID.CREATION_TICKET
> >       >                               >
> >       >                               > tpm2_load \
> >       >                               > --parent-context=3D$srk_handle \
> >       >                               > --public=3DLDevID.pub \
> >       >                               > --private=3DLDevID.priv \
> >       >                               > --key-context=3DLDevID.ctx
> >       >                               >
> >       >                               > # Certify
> >       >                               > tpm2_certify \
> >       >                               >
> --certifiedkey-context=3DLDevID.ctx \
> >       >                               > --signingkey-context=3DIDevID.c=
tx \
> >       >                               > --hash-algorithm=3Dsha1 \
> >       >                               >
> --attestation=3Dcertify.ATTESTATION \
> >       >                               > --signature=3Dcertify.SIGNATURE=
 \
> >       >                               > --format=3Dplain
> >       >                               >
> >       >                               > # Certify Creation
> >       >                               > tpm2_certifycreation \
> >       >                               >
> --certifiedkey-context=3DLDevID.ctx \
> >       >                               > --signingkey-context=3DIDevID.c=
tx \
> >       >                               > --hash-algorithm=3Dsha1 \
> >       >                               >
> --creation-hash=3DLDevID.CREATION_HASH \
> >       >                               > --ticket=3DLDevID.CREATION_TICK=
ET \
> >       >                               >
> --signature=3Dcertifycreation.SIGNATURE \
> >       >                               >
> --attestation=3Dcertifycreation.ATTESTATION \ --
> >       > format=3Dplain
> >       >                               >
> >       >                               > # IDevID.der
> >       >                               > echo
> >       > 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl
> > base64
> >       >                               > -a -d > IDevID.header.temp dd
> if=3DIDevID.pub
> >       > bs=3D1 skip=3D$(expr $(stat --
> >       >                               > format=3D%s IDevID.pub) - 256)
> >       > of=3DIDevID.modulus.temp echo -en '\x02\x03' >
> >       >                               > IDevID.mid-header.temp echo -ne
> >       > '\x01\x00\x01' > IDevID.exponent.temp cat
> >       >                               > IDevID.header.temp
> IDevID.modulus.temp
> >       > IDevID.mid-header.temp
> >       >                               > IDevID.exponent.temp > IDevID.d=
er
> >       >                               >
> >       >                               > # Remove first two bytes (byte
> size of struct) in
> >       > certifycreation.ATTESTATION # in
> >       >                               > order for hash to comply. Magic
> Header" must
> >       > be ff 54 43 47 dd
> >       >                               > if=3Dcertifycreation.ATTESTATION
> >       > of=3Dcertifycreation.ATTESTATION_2 bs=3D1 skip=3D2
> >       >                               >
> >       >                               > # WORKS: Verify Certify Creation
> >       >                               > openssl dgst \
> >       >                               > -verify IDevID.der -keyform der=
 \
> >       >                               > -sha1 -signature
> certifycreation.SIGNATURE
> >       > certifycreation.ATTESTATION_2
> >       >                               >
> >       >                               > # FAILS: Verify Create
> >       >                               > openssl dgst \
> >       >                               > -verify IDevID.der -keyform der=
 \
> >       >                               > -sha1 -signature
> certify.SIGNATURE
> >       > certify.ATTESTATION
> >       >                               >
> >       >                               > # WORKS:
> >       >                               > openssl rsautl \
> >       >                               > -verify \
> >       >                               > -pubin -inkey IDevID.der
> -keyform DER \
> >       >                               > -in certifycreation.SIGNATURE \
> >       >                               > -out
> certifycreation.SIGNATURE.asn1
> >       >                               >
> >       >                               > dumpasn1
> certifycreation.SIGNATURE.asn1
> >       >                               >
> >       >                               > # FAILS:
> >       >                               > openssl rsautl \
> >       >                               > -verify \
> >       >                               > -pubin -inkey IDevID.der
> -keyform DER \
> >       >                               > -in certify.SIGNATURE \
> >       >                               > -out certify.SIGNATURE.asn1
> >       >                               >
> >       >                               > Den tis 10 dec. 2019 kl 23:40
> skrev Niklas
> >       > Andersson
> >       >                               > <niklas.andersson(a)fredenheim.=
se
> > <mailto:niklas.andersson(a)fredenheim.se>
> >       > <mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se> >
> >       > <mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se>
> >       > <mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se> > > >:
> >       >                               >
> >       >                               >
> >       >                               >       openssl can not verify
> plain signature (256
> >       > bytes) from tpm2_certify due
> >       >                               > to bad padding.
> >       >                               >
> >       >                               >       This should work
> (verification of signature
> >       > from tpm2_certifycreation
> >       >                               > works fine):
> >       >                               >
> >       >                               >       openssl dgst -verify
> ../AIKOpaque.der -
> >       > keyform der -sha1 -signature
> >       >                               > Signature KeyAttest.bin
> >       >                               >       Verification Failure
> >       >                               >
> >       >                               >       ....examine:
> >       >                               >
> >       >                               >       openssl rsautl -verify
> -inkey
> >       > ../AIKOpaque.der -in Signature -pubin -
> >       >                               > keyform der -pkcs > decrypted.b=
in
> >       >                               >       RSA operation error
> >       >                               >
>  140654247387584:error:0407008A:rsa
> >       >                               >
> >       > routines:RSA_padding_check_PKCS1_type_1:invalid
> >       >                               >
> padding:../crypto/rsa/rsa_pk1.c:67:
> >       >                               >
>  140654247387584:error:04067072:rsa
> >       >                               >
> routines:rsa_ossl_public_decrypt:padding
> >       > check
> >       >                               >
> failed:../crypto/rsa/rsa_ossl.c:582:
> >       >                               >
> >       >                               >       ..Same operation on a
> plain signature from
> >       > tpm2_certifycreation works:
> >       >                               >
> >       >                               >
> >       >                               >       openssl rsautl -verify
> -inkey
> >       > ../AIKOpaque.der -in
> >       >                               >
> ../IdBinding.EXTRACTED_TPMT_SIGNATURE -
> >       > pubin -keyform der  >
> >       >                               > decrypted.bin
> >       >                               >
> >       >                               >       dumpasn1 decrypted.bin
> >       >                               >         0  33: SEQUENCE {
> >       >                               >         2   9:   SEQUENCE {
> >       >                               >         4   5:     OBJECT
> IDENTIFIER sha1 (1 3 14 3 2
> >       > 26)
> >       >                               >        11   0:     NULL
> >       >                               >              :     }
> >       >                               >        13  20:   OCTET STRING 2D
> A1 D1 30 3A D2 FD
> >       > 68 A1 5A 2F 9B 8B C1 1E DB
> >       >                               > 36 A7 7C D4
> >       >                               >              :   }
> >       >                               >
> >       >                               >
> >       >                               >       So. It looks like a bug in
> tpm2_certify.
> >       >                               >
> >       >                               >       tool=3D"tpm2_certify"
> version=3D"4.1"
> >       > tctis=3D"libtss2-tctildr" tcti-default=3Dtcti-
> >       >                               > device
> >       >                               >       tpm2-tss 2.3.2-rc0
> >       >                               >
> >       >                               >       Regards,
> >       >                               >       Niklas
> >       >                               >
> >       >                               >
> >       >
> >       >
> >       >
> >       >
> >       >       _______________________________________________
> >       >                       tpm2 mailing list -- tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >       > <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> >       >                       To unsubscribe send an email to
> tpm2-leave(a)lists.01.org
> > <mailto:tpm2-leave(a)lists.01.org>
> >       > <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01=
.org>
> >
> >       >
>  %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >       >
> >       >
> >       >
> >       >               --
> >       >
> >       >               Luke Hinds  | CTO Office | Red Hat
> >       >               e: lhinds(a)redhat.com <mailto:lhinds(a)redhat.co=
m>
> > <mailto:lhinds(a)redhat.com <mailto:lhinds(a)redhat.com> >  | irc: lhin=
ds
> >       > @freenode | t: +44 12 52 36 2483
> >       >
> >
> >
>
>

--===============6247946423446808313==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdj5ZYXkhIFRoYW5rcyBhIGxvdCBmb3IgbW92aW5nIHNvIGZhc3Qg
Oi0pIDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0gTmlrbGFzPGJyPjwvZGl2PjwvZGl2
Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWls
X2F0dHIiPkRlbiB0aXMgMTcgZGVjLiAyMDE5IGtsIDE2OjE2IHNrcmV2IFJvYmVydHMsIFdpbGxp
YW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSI+d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNs
YXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXIt
bGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5JIHB1bGxl
ZCBhbGwgdGhlc2UgaW4sIHNvIGF0dGVzdGF0aW9uJiMzOTtzIG9uIGRpc2sgZm9ybWF0IHdpbGwg
Y2hhbmdlLiBJIHdvdWxkIGNvbnNpZGVyIHRoZXNlPGJyPg0KVG8gYmUgb2Ygc2hvcnQgbGlmZXNw
YW4gc28gaXQgc2hvdWxkbiYjMzk7dCBjYXVzZSBtdWNoIGdyaWVmLjxicj4NCjxicj4NCldlIHdl
cmUgYWxzbyBhYmxlIHRvIHJlbW92ZSBzb21lIGRlYWQgY29kZTo8YnI+DQo8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL3B1bGwvMTg3NiIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdh
cmUvdHBtMi10b29scy9wdWxsLzE4NzY8L2E+PGJyPg0KPGJyPg0KVGhhbmtzLDxicj4NCkJpbGw8
YnI+DQo8YnI+DQomZ3Q7IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPGJyPg0KJmd0OyBGcm9t
OiBOaWtsYXMgQW5kZXJzc29uIFttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNz
b25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVu
aGVpbS5zZTwvYT5dPGJyPg0KJmd0OyBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxNywgMjAxOSA1
OjM4IEFNPGJyPg0KJmd0OyBUbzogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWls
dG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5j
LnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7IENjOiBMdWtlIEhpbmRzICZsdDs8
YSBocmVmPSJtYWlsdG86bGhpbmRzQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5saGluZHNA
cmVkaGF0LmNvbTwvYT4mZ3Q7OyA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRh
cmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+DQomZ3Q7IFN1YmplY3Q6IFJl
OiBbdHBtMl0gUmU6IHRwbTJfY3JlYXRlIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gZmFpbHMgZHVl
IHRvPGJyPg0KJmd0OyAmcXVvdDtSU0FfcGFkZGluZ19jaGVja19QS0NTX3R5cGUxOmludmFsaWQg
cGFkZGluZyZxdW90Ozxicj4NCiZndDsgPGJyPg0KJmd0OyArMSBmb3IgYnVnIDotKTxicj4NCiZn
dDsgPGJyPg0KJmd0OyBPbiBNb24sIERlYyAxNiwgMjAxOSwgMTY6MDQgUm9iZXJ0cywgV2lsbGlh
bSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPjxicj4NCiZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJn
ZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsgJmd0OyB3cm90
ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7IEZyb206IE5pa2xhcyBBbmRlcnNzb24gW21haWx0bzo8YSBocmVmPSJtYWlsdG86
bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFuayI+bmlrbGFzLmFu
ZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJt
YWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFuayI+bmlr
bGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPiZndDsgXTxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDsgU2VudDogTW9uZGF5LCBEZWNlbWJlciAxNiwgMjAxOSAzOjUxIEFNPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyBUbzogTHVrZSBIaW5kcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxoaW5kc0By
ZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGhpbmRzQHJlZGhhdC5jb208L2E+ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOmxoaW5kc0ByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGhp
bmRzQHJlZGhhdC5jb208L2E+Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBDYzog
Um9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9h
Pjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9h
PiZndDsgJmd0OzsgPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFN1YmplY3Q6IFJlOiBbdHBtMl0g
UmU6IHRwbTJfY3JlYXRlIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gZmFpbHMgZHVlIHRvPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0OyAmcXVvdDtSU0FfcGFkZGluZ19jaGVja19QS0NTX3R5cGUxOmlu
dmFsaWQgcGFkZGluZyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IEEgY29sbGVhZ3VlIG9mIG1pbmUgaWRlbnRpZmllZCBhbmQgZml4ZWQgYm90
aCB0aGUgdHBtMl9jZXJ0aWZ5IFsxXSBhbmQ8YnI+DQomZ3Q7IHRoZTxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgc3VwZXJmbHVvdXMgYnl0ZS1zaXplIFsyXSBmaWVsZHMgaW4gdHdvIHNlcGFyYXRl
IHB1bGwtcmVxdWVzdHMuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgVHVybmVkIG91dCB0aGF0IHRoZSBhcmd1bWVudHMgdG8gdHBtMl9jZXJ0aWZ5IGdv
dCBtaXhlZCB1cC4gSWYgb25lPGJyPg0KJmd0OyBjaGFuZ2VzIHRoZTxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDsgLS1jZXJ0aWZpZWRrZXktY29udGV4dCBhbmQgLS1zaWduaW5na2V5LWNvbnRleHQg
c2lnbmF0dXJlIHZlcmlmaWNhdGlvbjxicj4NCiZndDsgd29ya3MuPGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgWzFdIDxhIGhyZWY9Imh0dHBzOi8vZ2l0
aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvcHVsbC8xODc0IiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0y
LXRvb2xzL3B1bGwvMTg3NDwvYT48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFsyXSA8YSBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL3B1bGwvMTg3MyIg
cmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTIt
c29mdHdhcmUvdHBtMi10b29scy9wdWxsLzE4NzM8L2E+PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqAgwqBUaGVzZSBsb29rIGdvb2QsIHRoYW5rcy4gVGhlIHJlYWwgcXVlc3Rpb24gaXMgd2hl
dGhlciBvciBub3Qgd2Ugdmlldzxicj4NCiZndDvCoCDCoCDCoCDCoFBSIzE4NzMgYXMgYSBub24t
YmFja3dhcmRzIGNvbXBhdGlibGUgY2hhbmdlLiBJIHZpZXcgaXQgYXMgYSBidWcsPGJyPg0KJmd0
OyBhbnlvbmU8YnI+DQomZ3Q7wqAgwqAgwqAgwqBvYmplY3QgdG8gdGhhdD88YnI+DQomZ3Q7IDxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyBEZW4gdG9ycyAxMiBkZWMuIDIwMTkga2wgMTg6MjEgc2tyZXYgTmlr
bGFzIEFuZGVyc3Nvbjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Im1haWx0
bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWtsYXMu
YW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9
Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5u
aWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+Jmd0Ozxicj4NCiZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9
Il9ibGFuayI+bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPjxicj4NCiZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0
YXJnZXQ9Il9ibGFuayI+bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPiZndDsgJmd0
OyAmZ3Q7Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgSW4gdGhlIHNvdXJjZSBpdCBsb29r
cyBsaWtlIHRwbTJfY2VydGlmeS5jIGFuZCB0cG0yX2NlcnRpZnljcmVhdGlvbi5jPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0OyBoYW5kbGVzIHNpZ25hdHVyZSBkaWZmZXJlbnRseS48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgT3BlblNT
TCBpcyBub3QgdGhlIGlzc3VlLiBJIGFtIHVzaW5nIHZlcnNpb24gT3BlblNTTCAxLjEuMSAxMSBT
ZXA8YnI+DQomZ3Q7IDIwMTgsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBhbmQgSSB0cmllZCB0
byB1bnBhY2sgdGhlIHNpZ25hdHVyZSB1c2luZyBwYXJhbWV0ZXIgJnF1b3Q7LXJhdyZxdW90OyAo
aW5zdGVhZCBvZiAtPGJyPg0KJmd0OyBwa2NzPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyB3aGlj
aCBpcyBkZWZhdWx0JnF1b3Q7LCBhbmQgdGhlIHJlc3VsdCB3YXMgZ2liYmVyaXNoLiBJIHdvdWxk
IGV4cGVjdDxicj4NCiZndDsgc29tZXdoYXQgYTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgcmVz
ZW1ibGFuY2UgdG8gQVNOLjEuPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoEkgb3BlbmVkIGFuIGlzc3VlIG9uIEdpdGh1YiA8YSBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLTwvYT48YnI+DQomZ3Q7IHNvZnR3YXJlL3RwbTIt
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyB0b29scy9pc3N1ZXMvMTg3MTxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBEZW4gdG9ycyAx
MiBkZWMuIDIwMTkga2wgMTA6MTQgc2tyZXYgTHVrZSBIaW5kcyAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmxoaW5kc0ByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGhpbmRzQHJlZGhhdC5jb208L2E+
PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpsaGluZHNAcmVkaGF0LmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmxoaW5kc0ByZWRoYXQuY29tPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmxoaW5kc0ByZWRoYXQuY29tIiB0
YXJnZXQ9Il9ibGFuayI+bGhpbmRzQHJlZGhhdC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOmxoaW5kc0ByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGhpbmRzQHJlZGhhdC5j
b208L2E+Jmd0OyAmZ3Q7ICZndDs6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBJIGhhdmUgbm90IGhhZCBtdWNoIHRpbWUgdG8gcmVzZWFyY2ggd2hhdCB5b3UgaGF2ZSB0
cmllZCwgYnV0IEk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHdvbmRlciBpZiBpdCBtaWdodCBi
ZSB0aGUgc2FtZSBhcyB0aGUgZm9sbG93aW5nIHNpdHVhdGlvbiB3ZSBoaXQ8YnI+DQomZ3Q7IHJl
Y2VudGx5LiBpaXJjIGxhdGVyPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyB2ZXJzaW9ucyBvZiBP
cGVuU1NMICgxLjEuMCAmYW1wOyBncmVhdGVyKSBhcmUgbGVzcyByZWxheGVkIGFib3V0IHBhZGRp
bmc8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGNvbnZlbnRpb25zLjxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9tdGEub3BlbnNzbC5vcmcv
cGlwZXJtYWlsL29wZW5zc2wtZGV2LzIwMTYtIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5odHRwczovL210YS5vcGVuc3NsLm9yZy9waXBlcm1haWwvb3BlbnNzbC1kZXYvMjAxNi08
L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBGZWJydWFyeS8wMDUxMDAuaHRtbDxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBPbiBXZWQsIERlYyAxMSwgMjAxOSBhdCAxMDo0NiBQTSBOaWtsYXMgQW5kZXJzc29u
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRl
cnNzb25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJl
ZGVuaGVpbS5zZTwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm5pa2xh
cy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNz
b25AZnJlZGVuaGVpbS5zZTwvYT4mZ3Q7PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWts
YXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5r
Ij5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+Jmd0OyAmZ3Q7ICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgSGkgV2lsbGlhbSw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgWWVzLiBJdCBhY3R1YWxseSBjYW1lIHRvIG1pbmQgdGhhdCBteSBUUE0gbWlnaHQgYmUgZmF1
bHR5Ljxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgQnV0IEkgaGFkIGEgY29sbGVhZ3VlIHJ1bm5p
bmcgdGhlIHNjcmlwdCBhbmQgaGUgZ290IGV4YWN0bHkgdGhlIHNhbWU8YnI+DQomZ3Q7IGVycm9y
LCBzbyBpdDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgc2VlbXMgdGhlcmUgaXMgYSBidWcgaW4g
dGhlIHBhZGRpbmcgcm91dGluZS48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBEZW4gb25zIDExIGRlYy4g
MjAxOSBrbCAxNjo1MCBza3JldiBSb2JlcnRzLCBXaWxsaWFtIEM8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0
YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2Js
YW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0Ozxicj4NCiZndDsgJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhy
ZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53
aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyAmZ3Q7ICZndDs6PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTb3Vu
ZHMgbGlrZSBhIHBvc3NpYmxlIGlzc3VlIGluIG91ciBUUE0yPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0OyBzdHJ1Y3R1cmVzIHRvIHNpZ25hdHVyZSBmb3JtYXQgcm91dGluZSBvciB0aGUgVFBNIGl0
c2VsZjo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0
d2FyZS90cG0yLSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRo
dWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyB0
b29scy9ibG9iL21hc3Rlci9saWIvdHBtMl9jb252ZXJ0LmMjTDQ2Nzxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBMb29rcyBsaWtlIHRoZSBzY3JpcHQgaGFzIGFuIHJzYSBr
ZXksIHNvIHlvdSBzaG91bGQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGdldCBhIHNpZ25hdHVy
ZSBzY2hlbWUgb2Y6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVFBNMl9BTEdfUlNBU1NBPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFdoaWNoIGlzIGp1c3QgYSBzdHJhaWdodCBtZW1jcHkg
ZnJvbSB0aGUgVFBNLjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBQZXJo
YXBzLCB0aGUgVFBNIGlzIGVpdGhlciBnZXR0aW5nIGl0IHdyb25nIG9yIHdlPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0OyBuZWVkIHRvIGNhbGwgc29tZSBtYWdpYyBPU1NMIHBhZGRpbmcgcm91dGlu
ZT88YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7IEZyb206IE5pa2xhcyBBbmRlcnNzb248YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IFttYWls
dG86PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0
PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT48YnI+DQomZ3Q7ICZs
dDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIg
dGFyZ2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT4mZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpuaWtsYXMu
YW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWtsYXMuYW5kZXJzc29u
QGZyZWRlbmhlaW0uc2U8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpu
aWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWtsYXMuYW5k
ZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+Jmd0OyAmZ3Q7IF08YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IFNl
bnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTEsIDIwMTkgNDo1OCBBTTxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+ICZsdDttYWls
dG86PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBt
MkBsaXN0cy4wMS5vcmc8L2E+Jmd0OyAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBTdWJqZWN0OiBb
dHBtMl0gUmU6IHRwbTJfY3JlYXRlIHNpZ25hdHVyZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
dmVyaWZpY2F0aW9uIGZhaWxzIGR1ZSB0bzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJnF1b3Q7UlNBX3Bh
ZGRpbmdfY2hlY2tfUEtDU190eXBlMTppbnZhbGlkPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBw
YWRkaW5nJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgSGVyZSBp
cyB0aGUgdGVzdCBjYXNlIHRoYXQgZXhwbGFpbnMgdGhlIGlzc3VlLiBOb3Q8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7IHN1cmUgaWYgSSBhbSBtaXNzaW5nIHNvbWV0aGluZy4gSTxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDsgYmVsaWV2ZSB0aGUgY2VydGlmeS5TSUdOQVRVUkUgaXMgY29ycnVwdC48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgIyEvYmlu
L2Jhc2g8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBzcmtfaGFuZGxlPTB4
ODEwMDAwMDM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IGVrX2hhbmRsZT0weDgxMDEwMDAxPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgIyBJRGV2SUQ8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
IHRwbTJfY3JlYXRlYWsgXDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1lay1jb250ZXh0PSRla19oYW5k
bGUgXDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1hay1jb250ZXh0PUlEZXZJRC5jdHggXDxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDsgLS1rZXktYWxnb3JpdGhtPXJzYSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLWhh
c2gtYWxnb3JpdGhtPXNoYTEgXDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1wdWJsaWM9SURldklELnB1
YiBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLXByaXZhdGU9SURldklELnByaXY8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7ICMgLS1zaWduaW5nLWFsZ29yaXRobT1zaGExPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgIyBMRGV2SUQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IHRwbTJfY3JlYXRlIFw8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7IC0tcGFyZW50LWNvbnRleHQ9JHNya19oYW5kbGUgXDxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDsgLS1oYXNoLWFsZ29yaXRobT1zaGExIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0t
a2V5LWFsZ29yaXRobT1yc2EyMDQ4IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tcHVibGljPUxEZXZJ
RC5wdWIgXDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1wcml2YXRlPUxEZXZJRC5wcml2IFw8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7IC0tY3JlYXRpb24tZGF0YT1MRGV2SUQuQ1JFQVRJT05fREFUQSBcPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyAtLWNyZWF0aW9uLWhhc2g9TERldklELkNSRUFUSU9OX0hBU0ggXDxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgLS1jcmVhdGlvbi10aWNrZXQ9TERldklELkNSRUFUSU9OX1RJQ0tFVDxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IHRwbTJfbG9hZCBcPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAtLXBhcmVudC1jb250ZXh0PSRzcmtfaGFuZGxlIFw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7IC0tcHVibGljPUxEZXZJRC5wdWIgXDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1wcml2YXRlPUxE
ZXZJRC5wcml2IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0ta2V5LWNvbnRleHQ9TERldklELmN0eDxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICMgQ2VydGlmeTxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDsgdHBtMl9jZXJ0aWZ5IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tY2VydGlmaWVka2V5
LWNvbnRleHQ9TERldklELmN0eCBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLXNpZ25pbmdrZXktY29u
dGV4dD1JRGV2SUQuY3R4IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0taGFzaC1hbGdvcml0aG09c2hh
MSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLWF0dGVzdGF0aW9uPWNlcnRpZnkuQVRURVNUQVRJT04g
XDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDsgLS1zaWduYXR1cmU9Y2VydGlmeS5TSUdOQVRVUkUgXDxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgLS1mb3JtYXQ9cGxhaW48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAjIENlcnRpZnkgQ3JlYXRpb248YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IHRwbTJfY2Vy
dGlmeWNyZWF0aW9uIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tY2VydGlmaWVka2V5LWNvbnRleHQ9
TERldklELmN0eCBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLXNpZ25pbmdrZXktY29udGV4dD1JRGV2
SUQuY3R4IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0taGFzaC1hbGdvcml0aG09c2hhMSBcPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyAtLWNyZWF0aW9uLWhhc2g9TERldklELkNSRUFUSU9OX0hBU0ggXDxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgLS10aWNrZXQ9TERldklELkNSRUFUSU9OX1RJQ0tFVCBcPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAtLXNpZ25hdHVyZT1jZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFIFw8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7IC0tYXR0ZXN0YXRpb249Y2VydGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9OIFwg
LS08YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGZvcm1hdD1wbGFpbjxicj4NCiZndDvCoCDCoCDC
oCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICMgSURldklELmRlcjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgZWNo
bzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgJiMzOTtNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZB
QU9DQVE4QU1JSUJDZ0tDQVFFQSYjMzk7IHwgb3BlbnNzbDxicj4NCiZndDsgYmFzZTY0PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyAtYSAtZCAmZ3Q7IElEZXZJRC5oZWFkZXIudGVtcCBkZCBpZj1JRGV2SUQu
cHViPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBicz0xIHNraXA9JChleHByICQoc3RhdCAtLTxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDsgZm9ybWF0PSVzIElEZXZJRC5wdWIpIC0gMjU2KTxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDsgb2Y9SURldklELm1vZHVsdXMudGVtcCBlY2hvIC1lbiAmIzM5O1x4MDJc
eDAzJiMzOTsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgSURldklELm1pZC1oZWFkZXIudGVtcCBl
Y2hvIC1uZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgJiMzOTtceDAxXHgwMFx4MDEmIzM5OyAm
Z3Q7IElEZXZJRC5leHBvbmVudC50ZW1wIGNhdDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgSURldklELmhl
YWRlci50ZW1wIElEZXZJRC5tb2R1bHVzLnRlbXA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IElE
ZXZJRC5taWQtaGVhZGVyLnRlbXA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IElEZXZJRC5leHBvbmVudC50
ZW1wICZndDsgSURldklELmRlcjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
ICMgUmVtb3ZlIGZpcnN0IHR3byBieXRlcyAoYnl0ZSBzaXplIG9mIHN0cnVjdCkgaW48YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IGNlcnRpZnljcmVhdGlvbi5BVFRFU1RBVElPTiAjIGluPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyBvcmRlciBmb3IgaGFzaCB0byBjb21wbHkuIE1hZ2ljIEhlYWRlciZxdW90
OyBtdXN0PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyBiZSBmZiA1NCA0MyA0NyBkZDxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDsgaWY9Y2VydGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9OPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0OyBvZj1jZXJ0aWZ5Y3JlYXRpb24uQVRURVNUQVRJT05fMiBicz0xIHNraXA9Mjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICMgV09SS1M6IFZlcmlmeSBDZXJ0
aWZ5IENyZWF0aW9uPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBvcGVuc3NsIGRnc3QgXDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDsgLXZlcmlmeSBJRGV2SUQuZGVyIC1rZXlmb3JtIGRlciBcPGJyPg0KJmd0O8KgIMKg
IMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Jmd0OyAtc2hhMSAtc2lnbmF0dXJlIGNlcnRpZnljcmVhdGlvbi5TSUdOQVRVUkU8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IGNlcnRpZnljcmVhdGlvbi5BVFRFU1RBVElPTl8yPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgIyBGQUlMUzogVmVyaWZ5IENyZWF0ZTxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDsgb3BlbnNzbCBkZ3N0IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC12ZXJpZnkgSURl
dklELmRlciAta2V5Zm9ybSBkZXIgXDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLXNoYTEgLXNpZ25hdHVy
ZSBjZXJ0aWZ5LlNJR05BVFVSRTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgY2VydGlmeS5BVFRF
U1RBVElPTjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICMgV09SS1M6PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyBvcGVuc3NsIHJzYXV0bCBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtdmVy
aWZ5IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC1wdWJpbiAtaW5rZXkgSURldklELmRlciAta2V5Zm9y
bSBERVIgXDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLWluIGNlcnRpZnljcmVhdGlvbi5TSUdOQVRVUkUg
XDxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDsgLW91dCBjZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFLmFzbjE8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBkdW1wYXNuMSBjZXJ0aWZ5Y3Jl
YXRpb24uU0lHTkFUVVJFLmFzbjE8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
OyAjIEZBSUxTOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgb3BlbnNzbCByc2F1dGwgXDxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDsgLXZlcmlmeSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtcHViaW4gLWlua2V5IElEZXZJ
RC5kZXIgLWtleWZvcm0gREVSIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC1pbiBjZXJ0aWZ5LlNJR05B
VFVSRSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtb3V0IGNlcnRpZnkuU0lHTkFUVVJFLmFzbjE8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBEZW4gdGlzIDEwIGRlYy4gMjAxOSBr
bCAyMzo0MCBza3JldiBOaWtsYXM8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEFuZGVyc3Nvbjxi
cj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZy
ZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0u
c2U8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJz
c29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIj5uaWtsYXMuYW5kZXJzc29uQGZyZWRl
bmhlaW0uc2U8L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBo
cmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFu
ayI+bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPjxicj4NCiZndDsgJmx0O21haWx0
bzo8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9
Il9ibGFuayI+bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPiZndDsgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFu
ZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFuayI+bmlrbGFzLmFuZGVyc3NvbkBm
cmVkZW5oZWltLnNlPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bmlr
bGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFuayI+bmlrbGFzLmFuZGVy
c3NvbkBmcmVkZW5oZWltLnNlPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIgdGFy
Z2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT48YnI+DQomZ3Q7
ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5z
ZSIgdGFyZ2V0PSJfYmxhbmsiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT4mZ3Q7
ICZndDsgJmd0OyAmZ3Q7Ojxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAm
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgb3BlbnNzbCBjYW4gbm90IHZlcmlmeSBwbGFpbiBz
aWduYXR1cmUgKDI1Njxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgYnl0ZXMpIGZyb20gdHBtMl9j
ZXJ0aWZ5IGR1ZTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgdG8gYmFkIHBhZGRpbmcuPGJyPg0KJmd0O8Kg
IMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoFRoaXMgc2hvdWxkIHdvcmsgKHZl
cmlmaWNhdGlvbiBvZiBzaWduYXR1cmU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGZyb20gdHBt
Ml9jZXJ0aWZ5Y3JlYXRpb248YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IHdvcmtzIGZpbmUpOjxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBvcGVuc3NsIGRnc3QgLXZl
cmlmeSAuLi9BSUtPcGFxdWUuZGVyIC08YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IGtleWZvcm0g
ZGVyIC1zaGExIC1zaWduYXR1cmU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IFNpZ25hdHVyZSBLZXlBdHRl
c3QuYmluPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVmVyaWZpY2F0aW9uIEZhaWx1cmU8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgLi4uLmV4YW1p
bmU6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG9wZW5z
c2wgcnNhdXRsIC12ZXJpZnkgLWlua2V5PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0OyAuLi9BSUtP
cGFxdWUuZGVyIC1pbiBTaWduYXR1cmUgLXB1YmluIC08YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IGtleWZv
cm0gZGVyIC1wa2NzICZndDsgZGVjcnlwdGVkLmJpbjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoFJTQSBvcGVyYXRpb24gZXJyb3I8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAxNDA2
NTQyNDczODc1ODQ6ZXJyb3I6MDQwNzAwOEE6cnNhPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDsgcm91dGluZXM6UlNBX3BhZGRpbmdfY2hlY2tfUEtDUzFfdHlwZV8x
OmludmFsaWQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IHBhZGRpbmc6Li4vY3J5cHRvL3JzYS9yc2FfcGsx
LmM6Njc6PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgMTQwNjU0MjQ3Mzg3NTg0OmVycm9y
OjA0MDY3MDcyOnJzYTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgcm91dGluZXM6cnNhX29zc2xfcHVibGlj
X2RlY3J5cHQ6cGFkZGluZzxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgY2hlY2s8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAmZ3Q7IGZhaWxlZDouLi9jcnlwdG8vcnNhL3JzYV9vc3NsLmM6NTgyOjxicj4NCiZndDvC
oCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAuLlNhbWUgb3BlcmF0aW9uIG9u
IGEgcGxhaW4gc2lnbmF0dXJlIGZyb208YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHRwbTJfY2Vy
dGlmeWNyZWF0aW9uIHdvcmtzOjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgb3BlbnNzbCByc2F1dGwgLXZlcmlmeSAtaW5r
ZXk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IC4uL0FJS09wYXF1ZS5kZXIgLWluPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAuLi9JZEJpbmRpbmcuRVhUUkFDVEVEX1RQTVRfU0lHTkFUVVJFIC08YnI+DQom
Z3Q7wqAgwqAgwqAgwqAmZ3Q7IHB1YmluIC1rZXlmb3JtIGRlcsKgICZndDs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7IGRlY3J5cHRlZC5iaW48YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgZHVtcGFzbjEgZGVjcnlwdGVkLmJpbjxicj4NCiZndDvCoCDCoCDCoCDCoCZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoDDCoCAzMzogU0VRVUVOQ0Ugezxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oCDCoDLCoCDCoDk6wqAgwqBTRVFVRU5DRSB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgNMKgIMKgNTrCoCDCoCDCoE9CSkVDVCBJREVOVElGSUVSIHNoYTEgKDEgMyAxNCAzIDI8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IDI2KTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCAx
McKgIMKgMDrCoCDCoCDCoE5VTEw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgOsKgIMKgIMKgfTxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCAxM8KgIDIwOsKgIMKg
T0NURVQgU1RSSU5HIDJEIEExIEQxIDMwIDNBIEQyIEZEPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0
OyA2OCBBMSA1QSAyRiA5QiA4QiBDMSAxRSBEQjxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgMzYgQTcgN0Mg
RDQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgOsKgIMKgfTxicj4NCiZn
dDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKg
IMKgU28uIEl0IGxvb2tzIGxpa2UgYSBidWcgaW4gdHBtMl9jZXJ0aWZ5Ljxicj4NCiZndDvCoCDC
oCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB0b29sPSZxdW90O3RwbTJfY2VydGlm
eSZxdW90OyB2ZXJzaW9uPSZxdW90OzQuMSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsg
dGN0aXM9JnF1b3Q7bGlidHNzMi10Y3RpbGRyJnF1b3Q7IHRjdGktZGVmYXVsdD10Y3RpLTxicj4N
CiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgdHBtMi10
c3MgMi4zLjItcmMwPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDC
oCDCoFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgTmlrbGFzPGJyPg0KJmd0
O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cG0yIG1haWxpbmcg
bGlzdCAtLSA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5r
Ij50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8
L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwv
YT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPjxicj4NCiZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmciIHRhcmdldD0i
X2JsYW5rIj50cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9y
ZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
PnRwbTItbGVhdmVAbGlzdHMuMDEub3JnPC9hPiZndDsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCUod2ViX3BhZ2VfdXJsKXNs
aXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJyPg0KJmd0O8KgIMKgIMKgIMKg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLS08YnI+DQomZ3Q7
wqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgTHVrZSBIaW5kc8KgIHwgQ1RPIE9mZmljZSB8IFJlZCBIYXQ8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlOiA8YSBocmVmPSJtYWlsdG86bGhpbmRz
QHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5saGluZHNAcmVkaGF0LmNvbTwvYT4gJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86bGhpbmRzQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5s
aGluZHNAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1h
aWx0bzpsaGluZHNAcmVkaGF0LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmxoaW5kc0ByZWRoYXQuY29t
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpsaGluZHNAcmVkaGF0LmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmxoaW5kc0ByZWRoYXQuY29tPC9hPiZndDsgJmd0O8KgIHwgaXJjOiBsaGluZHM8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAmZ3Q7IEBmcmVlbm9kZSB8IHQ6ICs0NCAxMiA1MiAzNiAyNDgz
PGJyPg0KJmd0O8KgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQo8YnI+
DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo=

--===============6247946423446808313==--

