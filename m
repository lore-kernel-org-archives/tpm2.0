Content-Type: multipart/mixed; boundary="===============2996953364663028345=="
MIME-Version: 1.0
From: Niklas Andersson <niklas.andersson at fredenheim.se>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Tue, 17 Dec 2019 12:37:33 +0100
Message-ID: <CAJ8N_u-kx93kdRTi8+ApMT8sUa2Ys539DXTZwsHJu_XQruMkdg@mail.gmail.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E5E2CF@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2996953364663028345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+1 for bug :-)

On Mon, Dec 16, 2019, 16:04 Roberts, William C <william.c.roberts(a)intel.c=
om>
wrote:

>
>
> > -----Original Message-----
> > From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
> > Sent: Monday, December 16, 2019 3:51 AM
> > To: Luke Hinds <lhinds(a)redhat.com>
> > Cc: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01=
.org
> > Subject: Re: [tpm2] Re: tpm2_create signature verification fails due to
> > "RSA_padding_check_PKCS_type1:invalid padding"
> >
> > A colleague of mine identified and fixed both the tpm2_certify [1] and
> the
> > superfluous byte-size [2] fields in two separate pull-requests.
> >
> > Turned out that the arguments to tpm2_certify got mixed up. If one
> changes the
> > --certifiedkey-context and --signingkey-context signature verification
> works.
> >
> > [1] https://github.com/tpm2-software/tpm2-tools/pull/1874
> > [2] https://github.com/tpm2-software/tpm2-tools/pull/1873
>
> These look good, thanks. The real question is whether or not we view
> PR#1873 as a non-backwards compatible change. I view it as a bug, anyone
> object to that?
>
> >
> >
> > Den tors 12 dec. 2019 kl 18:21 skrev Niklas Andersson
> > <niklas.andersson(a)fredenheim.se <mailto:niklas.andersson(a)fredenheim=
.se>
> >:
> >
> >
> >       In the source it looks like tpm2_certify.c and
> tpm2_certifycreation.c
> > handles signature differently.
> >
> >       OpenSSL is not the issue. I am using version OpenSSL 1.1.1 11 Sep
> 2018,
> > and I tried to unpack the signature using parameter "-raw" (instead of
> -pkcs
> > which is default", and the result was gibberish. I would expect somewhat
> a
> > resemblance to ASN.1.
> >
> >       I opened an issue on Github https://github.com/tpm2-software/tpm2-
> > tools/issues/1871
> >
> >       Den tors 12 dec. 2019 kl 10:14 skrev Luke Hinds <lhinds(a)redhat.=
com
> > <mailto:lhinds(a)redhat.com> >:
> >
> >
> >               I have not had much time to research what you have tried,
> but I
> > wonder if it might be the same as the following situation we hit
> recently. iirc later
> > versions of OpenSSL (1.1.0 & greater) are less relaxed about padding
> > conventions.
> >
> >
> >               https://mta.openssl.org/pipermail/openssl-dev/2016-
> > February/005100.html
> >
> >               On Wed, Dec 11, 2019 at 10:46 PM Niklas Andersson
> > <niklas.andersson(a)fredenheim.se <mailto:niklas.andersson(a)fredenheim=
.se>
> >
> > wrote:
> >
> >
> >                       Hi William,
> >
> >                       Yes. It actually came to mind that my TPM might be
> faulty.
> > But I had a colleague running the script and he got exactly the same
> error, so it
> > seems there is a bug in the padding routine.
> >
> >
> >
> >                       Den ons 11 dec. 2019 kl 16:50 skrev Roberts,
> William C
> > <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> >:
> >
> >
> >                               Sounds like a possible issue in our TPM2
> > structures to signature format routine or the TPM itself:
> >                               https://github.com/tpm2-software/tpm2-
> > tools/blob/master/lib/tpm2_convert.c#L467
> >
> >                               Looks like the script has an rsa key, so
> you should
> > get a signature scheme of:
> >                               TPM2_ALG_RSASSA
> >
> >                               Which is just a straight memcpy from the
> TPM.
> >
> >                               Perhaps, the TPM is either getting it
> wrong or we
> > need to call some magic OSSL padding routine?
> >
> >
> >                               > -----Original Message-----
> >                               > From: Niklas Andersson
> > [mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se> ]
> >                               > Sent: Wednesday, December 11, 2019 4:58
> AM
> >                               > To: tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >                               > Subject: [tpm2] Re: tpm2_create signatu=
re
> > verification fails due to
> >                               > "RSA_padding_check_PKCS_type1:invalid
> > padding"
> >                               >
> >                               > Here is the test case that explains the
> issue. Not
> > sure if I am missing something. I
> >                               > believe the certify.SIGNATURE is corrup=
t.
> >                               >
> >                               >
> >                               > #!/bin/bash
> >                               >
> >                               > srk_handle=3D0x81000003
> >                               > ek_handle=3D0x81010001
> >                               >
> >                               > # IDevID
> >                               > tpm2_createak \
> >                               > --ek-context=3D$ek_handle \
> >                               > --ak-context=3DIDevID.ctx \
> >                               > --key-algorithm=3Drsa \
> >                               > --hash-algorithm=3Dsha1 \
> >                               > --public=3DIDevID.pub \
> >                               > --private=3DIDevID.priv
> >                               > # --signing-algorithm=3Dsha1
> >                               >
> >                               > # LDevID
> >                               > tpm2_create \
> >                               > --parent-context=3D$srk_handle \
> >                               > --hash-algorithm=3Dsha1 \
> >                               > --key-algorithm=3Drsa2048 \
> >                               > --public=3DLDevID.pub \
> >                               > --private=3DLDevID.priv \
> >                               > --creation-data=3DLDevID.CREATION_DATA \
> >                               > --creation-hash=3DLDevID.CREATION_HASH \
> >                               > --creation-ticket=3DLDevID.CREATION_TIC=
KET
> >                               >
> >                               > tpm2_load \
> >                               > --parent-context=3D$srk_handle \
> >                               > --public=3DLDevID.pub \
> >                               > --private=3DLDevID.priv \
> >                               > --key-context=3DLDevID.ctx
> >                               >
> >                               > # Certify
> >                               > tpm2_certify \
> >                               > --certifiedkey-context=3DLDevID.ctx \
> >                               > --signingkey-context=3DIDevID.ctx \
> >                               > --hash-algorithm=3Dsha1 \
> >                               > --attestation=3Dcertify.ATTESTATION \
> >                               > --signature=3Dcertify.SIGNATURE \
> >                               > --format=3Dplain
> >                               >
> >                               > # Certify Creation
> >                               > tpm2_certifycreation \
> >                               > --certifiedkey-context=3DLDevID.ctx \
> >                               > --signingkey-context=3DIDevID.ctx \
> >                               > --hash-algorithm=3Dsha1 \
> >                               > --creation-hash=3DLDevID.CREATION_HASH \
> >                               > --ticket=3DLDevID.CREATION_TICKET \
> >                               > --signature=3Dcertifycreation.SIGNATURE=
 \
> >                               >
> --attestation=3Dcertifycreation.ATTESTATION \ --
> > format=3Dplain
> >                               >
> >                               > # IDevID.der
> >                               > echo
> > 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl base64
> >                               > -a -d > IDevID.header.temp dd
> if=3DIDevID.pub
> > bs=3D1 skip=3D$(expr $(stat --
> >                               > format=3D%s IDevID.pub) - 256)
> > of=3DIDevID.modulus.temp echo -en '\x02\x03' >
> >                               > IDevID.mid-header.temp echo -ne
> > '\x01\x00\x01' > IDevID.exponent.temp cat
> >                               > IDevID.header.temp IDevID.modulus.temp
> > IDevID.mid-header.temp
> >                               > IDevID.exponent.temp > IDevID.der
> >                               >
> >                               > # Remove first two bytes (byte size of
> struct) in
> > certifycreation.ATTESTATION # in
> >                               > order for hash to comply. Magic Header"
> must
> > be ff 54 43 47 dd
> >                               > if=3Dcertifycreation.ATTESTATION
> > of=3Dcertifycreation.ATTESTATION_2 bs=3D1 skip=3D2
> >                               >
> >                               > # WORKS: Verify Certify Creation
> >                               > openssl dgst \
> >                               > -verify IDevID.der -keyform der \
> >                               > -sha1 -signature
> certifycreation.SIGNATURE
> > certifycreation.ATTESTATION_2
> >                               >
> >                               > # FAILS: Verify Create
> >                               > openssl dgst \
> >                               > -verify IDevID.der -keyform der \
> >                               > -sha1 -signature certify.SIGNATURE
> > certify.ATTESTATION
> >                               >
> >                               > # WORKS:
> >                               > openssl rsautl \
> >                               > -verify \
> >                               > -pubin -inkey IDevID.der -keyform DER \
> >                               > -in certifycreation.SIGNATURE \
> >                               > -out certifycreation.SIGNATURE.asn1
> >                               >
> >                               > dumpasn1 certifycreation.SIGNATURE.asn1
> >                               >
> >                               > # FAILS:
> >                               > openssl rsautl \
> >                               > -verify \
> >                               > -pubin -inkey IDevID.der -keyform DER \
> >                               > -in certify.SIGNATURE \
> >                               > -out certify.SIGNATURE.asn1
> >                               >
> >                               > Den tis 10 dec. 2019 kl 23:40 skrev
> Niklas
> > Andersson
> >                               > <niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se>
> > <mailto:niklas.andersson(a)fredenheim.se
> > <mailto:niklas.andersson(a)fredenheim.se> > >:
> >                               >
> >                               >
> >                               >       openssl can not verify plain
> signature (256
> > bytes) from tpm2_certify due
> >                               > to bad padding.
> >                               >
> >                               >       This should work (verification of
> signature
> > from tpm2_certifycreation
> >                               > works fine):
> >                               >
> >                               >       openssl dgst -verify
> ../AIKOpaque.der -
> > keyform der -sha1 -signature
> >                               > Signature KeyAttest.bin
> >                               >       Verification Failure
> >                               >
> >                               >       ....examine:
> >                               >
> >                               >       openssl rsautl -verify -inkey
> > ../AIKOpaque.der -in Signature -pubin -
> >                               > keyform der -pkcs > decrypted.bin
> >                               >       RSA operation error
> >                               >       140654247387584:error:0407008A:rsa
> >                               >
> > routines:RSA_padding_check_PKCS1_type_1:invalid
> >                               > padding:../crypto/rsa/rsa_pk1.c:67:
> >                               >       140654247387584:error:04067072:rsa
> >                               > routines:rsa_ossl_public_decrypt:padding
> > check
> >                               > failed:../crypto/rsa/rsa_ossl.c:582:
> >                               >
> >                               >       ..Same operation on a plain
> signature from
> > tpm2_certifycreation works:
> >                               >
> >                               >
> >                               >       openssl rsautl -verify -inkey
> > ../AIKOpaque.der -in
> >                               > ../IdBinding.EXTRACTED_TPMT_SIGNATURE -
> > pubin -keyform der  >
> >                               > decrypted.bin
> >                               >
> >                               >       dumpasn1 decrypted.bin
> >                               >         0  33: SEQUENCE {
> >                               >         2   9:   SEQUENCE {
> >                               >         4   5:     OBJECT IDENTIFIER
> sha1 (1 3 14 3 2
> > 26)
> >                               >        11   0:     NULL
> >                               >              :     }
> >                               >        13  20:   OCTET STRING 2D A1 D1
> 30 3A D2 FD
> > 68 A1 5A 2F 9B 8B C1 1E DB
> >                               > 36 A7 7C D4
> >                               >              :   }
> >                               >
> >                               >
> >                               >       So. It looks like a bug in
> tpm2_certify.
> >                               >
> >                               >       tool=3D"tpm2_certify" version=3D"=
4.1"
> > tctis=3D"libtss2-tctildr" tcti-default=3Dtcti-
> >                               > device
> >                               >       tpm2-tss 2.3.2-rc0
> >                               >
> >                               >       Regards,
> >                               >       Niklas
> >                               >
> >                               >
> >
> >
> >
> >
> >       _______________________________________________
> >                       tpm2 mailing list -- tpm2(a)lists.01.org
> > <mailto:tpm2(a)lists.01.org>
> >                       To unsubscribe send an email to
> tpm2-leave(a)lists.01.org
> > <mailto:tpm2-leave(a)lists.01.org>
> >
>  %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >
> >
> >
> >               --
> >
> >               Luke Hinds  | CTO Office | Red Hat
> >               e: lhinds(a)redhat.com <mailto:lhinds(a)redhat.com>  | ir=
c:
> lhinds
> > @freenode | t: +44 12 52 36 2483
> >
>
>

--===============2996953364663028345==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9ImF1dG8iPisxIGZvciBidWcgOi0pPC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gTW9uLCBEZWMgMTYs
IDIwMTksIDE2OjA0IFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbSI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZn
dDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVm
dDoxZXgiPjxicj4NCjxicj4NCiZndDsgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnI+DQom
Z3Q7IEZyb206IE5pa2xhcyBBbmRlcnNzb24gW21haWx0bzo8YSBocmVmPSJtYWlsdG86bmlrbGFz
LmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVy
Ij5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+XTxicj4NCiZndDsgU2VudDogTW9u
ZGF5LCBEZWNlbWJlciAxNiwgMjAxOSAzOjUxIEFNPGJyPg0KJmd0OyBUbzogTHVrZSBIaW5kcyAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmxoaW5kc0ByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVs
PSJub3JlZmVycmVyIj5saGluZHNAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyBDYzogUm9i
ZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50
ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj53aWxsaWFtLmMucm9iZXJ0
c0BpbnRlbC5jb208L2E+Jmd0OzsgPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0
YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj50cG0yQGxpc3RzLjAxLm9yZzwvYT48YnI+
DQomZ3Q7IFN1YmplY3Q6IFJlOiBbdHBtMl0gUmU6IHRwbTJfY3JlYXRlIHNpZ25hdHVyZSB2ZXJp
ZmljYXRpb24gZmFpbHMgZHVlIHRvPGJyPg0KJmd0OyAmcXVvdDtSU0FfcGFkZGluZ19jaGVja19Q
S0NTX3R5cGUxOmludmFsaWQgcGFkZGluZyZxdW90Ozxicj4NCiZndDsgPGJyPg0KJmd0OyBBIGNv
bGxlYWd1ZSBvZiBtaW5lIGlkZW50aWZpZWQgYW5kIGZpeGVkIGJvdGggdGhlIHRwbTJfY2VydGlm
eSBbMV0gYW5kIHRoZTxicj4NCiZndDsgc3VwZXJmbHVvdXMgYnl0ZS1zaXplIFsyXSBmaWVsZHMg
aW4gdHdvIHNlcGFyYXRlIHB1bGwtcmVxdWVzdHMuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFR1cm5l
ZCBvdXQgdGhhdCB0aGUgYXJndW1lbnRzIHRvIHRwbTJfY2VydGlmeSBnb3QgbWl4ZWQgdXAuIElm
IG9uZSBjaGFuZ2VzIHRoZTxicj4NCiZndDsgLS1jZXJ0aWZpZWRrZXktY29udGV4dCBhbmQgLS1z
aWduaW5na2V5LWNvbnRleHQgc2lnbmF0dXJlIHZlcmlmaWNhdGlvbiB3b3Jrcy48YnI+DQomZ3Q7
IDxicj4NCiZndDsgWzFdIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJl
L3RwbTItdG9vbHMvcHVsbC8xODc0IiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvcHVs
bC8xODc0PC9hPjxicj4NCiZndDsgWzJdIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0y
LXNvZnR3YXJlL3RwbTItdG9vbHMvcHVsbC8xODczIiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTIt
dG9vbHMvcHVsbC8xODczPC9hPjxicj4NCjxicj4NClRoZXNlIGxvb2sgZ29vZCwgdGhhbmtzLiBU
aGUgcmVhbCBxdWVzdGlvbiBpcyB3aGV0aGVyIG9yIG5vdCB3ZSB2aWV3PGJyPg0KUFIjMTg3MyBh
cyBhIG5vbi1iYWNrd2FyZHMgY29tcGF0aWJsZSBjaGFuZ2UuIEkgdmlldyBpdCBhcyBhIGJ1Zywg
YW55b25lPGJyPg0Kb2JqZWN0IHRvIHRoYXQ/PGJyPg0KPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxi
cj4NCiZndDsgRGVuIHRvcnMgMTIgZGVjLiAyMDE5IGtsIDE4OjIxIHNrcmV2IE5pa2xhcyBBbmRl
cnNzb248YnI+DQomZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVk
ZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5uaWtsYXMuYW5kZXJz
c29uQGZyZWRlbmhlaW0uc2U8L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5h
bmRlcnNzb25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+
bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPiZndDsgJmd0Ozo8YnI+DQomZ3Q7IDxi
cj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgSW4gdGhlIHNvdXJjZSBpdCBsb29rcyBsaWtl
IHRwbTJfY2VydGlmeS5jIGFuZCB0cG0yX2NlcnRpZnljcmVhdGlvbi5jPGJyPg0KJmd0OyBoYW5k
bGVzIHNpZ25hdHVyZSBkaWZmZXJlbnRseS48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDC
oE9wZW5TU0wgaXMgbm90IHRoZSBpc3N1ZS4gSSBhbSB1c2luZyB2ZXJzaW9uIE9wZW5TU0wgMS4x
LjEgMTEgU2VwIDIwMTgsPGJyPg0KJmd0OyBhbmQgSSB0cmllZCB0byB1bnBhY2sgdGhlIHNpZ25h
dHVyZSB1c2luZyBwYXJhbWV0ZXIgJnF1b3Q7LXJhdyZxdW90OyAoaW5zdGVhZCBvZiAtcGtjczxi
cj4NCiZndDsgd2hpY2ggaXMgZGVmYXVsdCZxdW90OywgYW5kIHRoZSByZXN1bHQgd2FzIGdpYmJl
cmlzaC4gSSB3b3VsZCBleHBlY3Qgc29tZXdoYXQgYTxicj4NCiZndDsgcmVzZW1ibGFuY2UgdG8g
QVNOLjEuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqBJIG9wZW5lZCBhbiBpc3N1ZSBv
biBHaXRodWIgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0i
IHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRo
dWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi08L2E+PGJyPg0KJmd0OyB0b29scy9pc3N1ZXMvMTg3
MTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgRGVuIHRvcnMgMTIgZGVjLiAyMDE5IGts
IDEwOjE0IHNrcmV2IEx1a2UgSGluZHMgJmx0OzxhIGhyZWY9Im1haWx0bzpsaGluZHNAcmVkaGF0
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+bGhpbmRzQHJlZGhhdC5jb208
L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpsaGluZHNAcmVkaGF0LmNv
bSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+bGhpbmRzQHJlZGhhdC5jb208L2E+
Jmd0OyAmZ3Q7Ojxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBJIGhhdmUgbm90IGhhZCBtdWNoIHRpbWUgdG8gcmVzZWFyY2ggd2hhdCB5b3UgaGF2
ZSB0cmllZCwgYnV0IEk8YnI+DQomZ3Q7IHdvbmRlciBpZiBpdCBtaWdodCBiZSB0aGUgc2FtZSBh
cyB0aGUgZm9sbG93aW5nIHNpdHVhdGlvbiB3ZSBoaXQgcmVjZW50bHkuIGlpcmMgbGF0ZXI8YnI+
DQomZ3Q7IHZlcnNpb25zIG9mIE9wZW5TU0wgKDEuMS4wICZhbXA7IGdyZWF0ZXIpIGFyZSBsZXNz
IHJlbGF4ZWQgYWJvdXQgcGFkZGluZzxicj4NCiZndDsgY29udmVudGlvbnMuPGJyPg0KJmd0OyA8
YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxhIGhyZWY9Imh0dHBz
Oi8vbXRhLm9wZW5zc2wub3JnL3BpcGVybWFpbC9vcGVuc3NsLWRldi8yMDE2LSIgcmVsPSJub3Jl
ZmVycmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL210YS5vcGVuc3NsLm9y
Zy9waXBlcm1haWwvb3BlbnNzbC1kZXYvMjAxNi08L2E+PGJyPg0KJmd0OyBGZWJydWFyeS8wMDUx
MDAuaHRtbDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgT24gV2Vk
LCBEZWMgMTEsIDIwMTkgYXQgMTA6NDYgUE0gTmlrbGFzIEFuZGVyc3Nvbjxicj4NCiZndDsgJmx0
OzxhIGhyZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0i
X2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwv
YT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWlt
LnNlIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5uaWtsYXMuYW5kZXJzc29uQGZy
ZWRlbmhlaW0uc2U8L2E+Jmd0OyAmZ3Q7PGJyPg0KJmd0OyB3cm90ZTo8YnI+DQomZ3Q7IDxicj4N
CiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgSGkgV2ls
bGlhbSw8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFllcy4gSXQgYWN0dWFsbHkgY2FtZSB0byBtaW5kIHRoYXQgbXkgVFBNIG1pZ2h0IGJlIGZh
dWx0eS48YnI+DQomZ3Q7IEJ1dCBJIGhhZCBhIGNvbGxlYWd1ZSBydW5uaW5nIHRoZSBzY3JpcHQg
YW5kIGhlIGdvdCBleGFjdGx5IHRoZSBzYW1lIGVycm9yLCBzbyBpdDxicj4NCiZndDsgc2VlbXMg
dGhlcmUgaXMgYSBidWcgaW4gdGhlIHBhZGRpbmcgcm91dGluZS48YnI+DQomZ3Q7IDxicj4NCiZn
dDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBEZW4gb25zIDExIGRlYy4gMjAxOSBrbCAxNjo1MCBza3JldiBSb2JlcnRzLCBXaWxsaWFtIEM8
YnI+DQomZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29t
IiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRl
bC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGlu
dGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tPC9hPiZndDsgJmd0Ozo8YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgU291bmRzIGxp
a2UgYSBwb3NzaWJsZSBpc3N1ZSBpbiBvdXIgVFBNMjxicj4NCiZndDsgc3RydWN0dXJlcyB0byBz
aWduYXR1cmUgZm9ybWF0IHJvdXRpbmUgb3IgdGhlIFRQTSBpdHNlbGY6PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGEgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi0iIHJlbD0ibm9yZWZlcnJlciBub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBt
Mi08L2E+PGJyPg0KJmd0OyB0b29scy9ibG9iL21hc3Rlci9saWIvdHBtMl9jb252ZXJ0LmMjTDQ2
Nzxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgTG9va3MgbGlrZSB0aGUgc2NyaXB0IGhhcyBhbiByc2Ega2V5LCBzbyB5b3Ug
c2hvdWxkPGJyPg0KJmd0OyBnZXQgYSBzaWduYXR1cmUgc2NoZW1lIG9mOjxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFRQTTJfQUxHX1JTQVNT
QTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgV2hpY2ggaXMganVzdCBhIHN0cmFpZ2h0IG1lbWNweSBmcm9tIHRoZSBUUE0u
PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBQZXJoYXBzLCB0aGUgVFBNIGlzIGVpdGhlciBnZXR0aW5nIGl0IHdyb25nIG9y
IHdlPGJyPg0KJmd0OyBuZWVkIHRvIGNhbGwgc29tZSBtYWdpYyBPU1NMIHBhZGRpbmcgcm91dGlu
ZT88YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgRnJvbTogTmlrbGFzIEFuZGVyc3Nvbjxicj4NCiZndDsgW21haWx0bzo8YSBocmVmPSJtYWls
dG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJu
b3JlZmVycmVyIj5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2U8L2E+PGJyPg0KJmd0OyAm
bHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2Ui
IHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVu
aGVpbS5zZTwvYT4mZ3Q7IF08YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTEsIDIwMTkg
NDo1OCBBTTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDsgVG86IDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0
OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgU3Vi
amVjdDogW3RwbTJdIFJlOiB0cG0yX2NyZWF0ZSBzaWduYXR1cmU8YnI+DQomZ3Q7IHZlcmlmaWNh
dGlvbiBmYWlscyBkdWUgdG88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICZxdW90O1JTQV9wYWRkaW5nX2NoZWNrX1BLQ1NfdHlwZTE6
aW52YWxpZDxicj4NCiZndDsgcGFkZGluZyZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IEhlcmUgaXMgdGhlIHRlc3Qg
Y2FzZSB0aGF0IGV4cGxhaW5zIHRoZSBpc3N1ZS4gTm90PGJyPg0KJmd0OyBzdXJlIGlmIEkgYW0g
bWlzc2luZyBzb21ldGhpbmcuIEk8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IGJlbGlldmUgdGhlIGNlcnRpZnkuU0lHTkFUVVJFIGlz
IGNvcnJ1cHQuPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICMhL2Jpbi9iYXNoPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgc3JrX2hhbmRsZT0weDgx
MDAwMDAzPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyBla19oYW5kbGU9MHg4MTAxMDAwMTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICMgSURldklEPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyB0cG0y
X2NyZWF0ZWFrIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7IC0tZWstY29udGV4dD0kZWtfaGFuZGxlIFw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tYWstY29udGV4
dD1JRGV2SUQuY3R4IFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7IC0ta2V5LWFsZ29yaXRobT1yc2EgXDxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1oYXNoLWFsZ29y
aXRobT1zaGExIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7IC0tcHVibGljPUlEZXZJRC5wdWIgXDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1wcml2YXRlPUlEZXZJ
RC5wcml2PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAjIC0tc2lnbmluZy1hbGdvcml0aG09c2hhMTxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7ICMgTERldklEPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
OyB0cG0yX2NyZWF0ZSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0OyAtLXBhcmVudC1jb250ZXh0PSRzcmtfaGFuZGxlIFw8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0t
aGFzaC1hbGdvcml0aG09c2hhMSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLWtleS1hbGdvcml0aG09cnNhMjA0OCBcPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAt
LXB1YmxpYz1MRGV2SUQucHViIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tcHJpdmF0ZT1MRGV2SUQucHJpdiBcPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLWNy
ZWF0aW9uLWRhdGE9TERldklELkNSRUFUSU9OX0RBVEEgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1jcmVhdGlvbi1oYXNoPUxE
ZXZJRC5DUkVBVElPTl9IQVNIIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tY3JlYXRpb24tdGlja2V0PUxEZXZJRC5DUkVBVElP
Tl9USUNLRVQ8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyB0cG0yX2xvYWQgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1wYXJlbnQtY29udGV4dD0kc3JrX2hh
bmRsZSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAtLXB1YmxpYz1MRGV2SUQucHViIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tcHJpdmF0ZT1MRGV2SUQucHJp
diBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0OyAtLWtleS1jb250ZXh0PUxEZXZJRC5jdHg8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAjIENlcnRpZnk8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IHRw
bTJfY2VydGlmeSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyAtLWNlcnRpZmllZGtleS1jb250ZXh0PUxEZXZJRC5jdHggXDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsg
LS1zaWduaW5na2V5LWNvbnRleHQ9SURldklELmN0eCBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLWhhc2gtYWxnb3JpdGhtPXNo
YTEgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDsgLS1hdHRlc3RhdGlvbj1jZXJ0aWZ5LkFUVEVTVEFUSU9OIFw8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tc2lnbmF0
dXJlPWNlcnRpZnkuU0lHTkFUVVJFIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tZm9ybWF0PXBsYWluPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgIyBDZXJ0
aWZ5IENyZWF0aW9uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgJmd0OyB0cG0yX2NlcnRpZnljcmVhdGlvbiBcPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLWNlcnRpZmllZGtl
eS1jb250ZXh0PUxEZXZJRC5jdHggXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1zaWduaW5na2V5LWNvbnRleHQ9SURldklELmN0
eCBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0OyAtLWhhc2gtYWxnb3JpdGhtPXNoYTEgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLS1jcmVhdGlvbi1oYXNoPUxEZXZJ
RC5DUkVBVElPTl9IQVNIIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC0tdGlja2V0PUxEZXZJRC5DUkVBVElPTl9USUNLRVQgXDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgLS1zaWduYXR1cmU9Y2VydGlmeWNyZWF0aW9uLlNJR05BVFVSRSBcPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtLWF0dGVzdGF0
aW9uPWNlcnRpZnljcmVhdGlvbi5BVFRFU1RBVElPTiBcIC0tPGJyPg0KJmd0OyBmb3JtYXQ9cGxh
aW48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0OyAjIElEZXZJRC5kZXI8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IGVjaG88YnI+DQomZ3Q7ICYjMzk7TUlJQklqQU5C
Z2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUEmIzM5OyB8IG9wZW5zc2wgYmFzZTY0
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Jmd0OyAtYSAtZCAmZ3Q7IElEZXZJRC5oZWFkZXIudGVtcCBkZCBpZj1JRGV2SUQucHViPGJyPg0K
Jmd0OyBicz0xIHNraXA9JChleHByICQoc3RhdCAtLTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgZm9ybWF0PSVzIElEZXZJRC5wdWIp
IC0gMjU2KTxicj4NCiZndDsgb2Y9SURldklELm1vZHVsdXMudGVtcCBlY2hvIC1lbiAmIzM5O1x4
MDJceDAzJiMzOTsgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDsgSURldklELm1pZC1oZWFkZXIudGVtcCBlY2hvIC1uZTxicj4N
CiZndDsgJiMzOTtceDAxXHgwMFx4MDEmIzM5OyAmZ3Q7IElEZXZJRC5leHBvbmVudC50ZW1wIGNh
dDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDsgSURldklELmhlYWRlci50ZW1wIElEZXZJRC5tb2R1bHVzLnRlbXA8YnI+DQomZ3Q7IElE
ZXZJRC5taWQtaGVhZGVyLnRlbXA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IElEZXZJRC5leHBvbmVudC50ZW1wICZndDsgSURldklE
LmRlcjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmZ3Q7ICMgUmVtb3ZlIGZpcnN0IHR3byBieXRlcyAoYnl0ZSBzaXplIG9mIHN0cnVj
dCkgaW48YnI+DQomZ3Q7IGNlcnRpZnljcmVhdGlvbi5BVFRFU1RBVElPTiAjIGluPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBvcmRl
ciBmb3IgaGFzaCB0byBjb21wbHkuIE1hZ2ljIEhlYWRlciZxdW90OyBtdXN0PGJyPg0KJmd0OyBi
ZSBmZiA1NCA0MyA0NyBkZDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZndDsgaWY9Y2VydGlmeWNyZWF0aW9uLkFUVEVTVEFUSU9OPGJyPg0K
Jmd0OyBvZj1jZXJ0aWZ5Y3JlYXRpb24uQVRURVNUQVRJT05fMiBicz0xIHNraXA9Mjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
ICMgV09SS1M6IFZlcmlmeSBDZXJ0aWZ5IENyZWF0aW9uPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBvcGVuc3NsIGRnc3QgXDxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsg
LXZlcmlmeSBJRGV2SUQuZGVyIC1rZXlmb3JtIGRlciBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtc2hhMSAtc2lnbmF0dXJlIGNl
cnRpZnljcmVhdGlvbi5TSUdOQVRVUkU8YnI+DQomZ3Q7IGNlcnRpZnljcmVhdGlvbi5BVFRFU1RB
VElPTl8yPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgIyBGQUlMUzogVmVyaWZ5IENyZWF0ZTxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgb3BlbnNzbCBkZ3N0IFw8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7IC12ZXJpZnkgSURldklELmRlciAta2V5Zm9ybSBkZXIgXDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLXNoYTEgLXNpZ25hdHVy
ZSBjZXJ0aWZ5LlNJR05BVFVSRTxicj4NCiZndDsgY2VydGlmeS5BVFRFU1RBVElPTjxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7
ICMgV09SS1M6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgJmd0OyBvcGVuc3NsIHJzYXV0bCBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtdmVyaWZ5IFw8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC1wdWJpbiAt
aW5rZXkgSURldklELmRlciAta2V5Zm9ybSBERVIgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLWluIGNlcnRpZnljcmVhdGlvbi5T
SUdOQVRVUkUgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZndDsgLW91dCBjZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFLmFzbjE8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
OyBkdW1wYXNuMSBjZXJ0aWZ5Y3JlYXRpb24uU0lHTkFUVVJFLmFzbjE8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAjIEZBSUxT
Ojxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDsgb3BlbnNzbCByc2F1dGwgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgLXZlcmlmeSBcPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAtcHViaW4gLWlua2V5IElE
ZXZJRC5kZXIgLWtleWZvcm0gREVSIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC1pbiBjZXJ0aWZ5LlNJR05BVFVSRSBcPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAt
b3V0IGNlcnRpZnkuU0lHTkFUVVJFLmFzbjE8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyBEZW4gdGlzIDEwIGRlYy4gMjAxOSBr
bCAyMzo0MCBza3JldiBOaWtsYXM8YnI+DQomZ3Q7IEFuZGVyc3Nvbjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgJmx0OzxhIGhyZWY9
Im1haWx0bzpuaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhlaW0uc2UiIHRhcmdldD0iX2JsYW5rIiBy
ZWw9Im5vcmVmZXJyZXIiPm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZTwvYT48YnI+DQom
Z3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOm5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVp
bS5zZSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+bmlrbGFzLmFuZGVyc3NvbkBm
cmVkZW5oZWltLnNlPC9hPiZndDs8YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRv
Om5pa2xhcy5hbmRlcnNzb25AZnJlZGVuaGVpbS5zZSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9y
ZWZlcnJlciI+bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlPC9hPjxicj4NCiZndDsgJmx0
O21haWx0bzo8YSBocmVmPSJtYWlsdG86bmlrbGFzLmFuZGVyc3NvbkBmcmVkZW5oZWltLnNlIiB0
YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5uaWtsYXMuYW5kZXJzc29uQGZyZWRlbmhl
aW0uc2U8L2E+Jmd0OyAmZ3Q7ICZndDs6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBvcGVuc3NsIGNh
biBub3QgdmVyaWZ5IHBsYWluIHNpZ25hdHVyZSAoMjU2PGJyPg0KJmd0OyBieXRlcykgZnJvbSB0
cG0yX2NlcnRpZnkgZHVlPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJmd0OyB0byBiYWQgcGFkZGluZy48YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgVGhp
cyBzaG91bGQgd29yayAodmVyaWZpY2F0aW9uIG9mIHNpZ25hdHVyZTxicj4NCiZndDsgZnJvbSB0
cG0yX2NlcnRpZnljcmVhdGlvbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgd29ya3MgZmluZSk6PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoG9w
ZW5zc2wgZGdzdCAtdmVyaWZ5IC4uL0FJS09wYXF1ZS5kZXIgLTxicj4NCiZndDsga2V5Zm9ybSBk
ZXIgLXNoYTEgLXNpZ25hdHVyZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgU2lnbmF0dXJlIEtleUF0dGVzdC5iaW48YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAg
wqAgwqBWZXJpZmljYXRpb24gRmFpbHVyZTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAuLi4uZXhhbWluZTo8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgb3BlbnNzbCByc2F1dGwgLXZlcmlmeSAtaW5rZXk8YnI+DQomZ3Q7
IC4uL0FJS09wYXF1ZS5kZXIgLWluIFNpZ25hdHVyZSAtcHViaW4gLTxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsga2V5Zm9ybSBkZXIg
LXBrY3MgJmd0OyBkZWNyeXB0ZWQuYmluPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgUlNBIG9wZXJhdGlvbiBlcnJv
cjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoDE0MDY1NDI0NzM4NzU4NDplcnJvcjowNDA3MDA4QTpyc2E8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJy
Pg0KJmd0OyByb3V0aW5lczpSU0FfcGFkZGluZ19jaGVja19QS0NTMV90eXBlXzE6aW52YWxpZDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZn
dDsgcGFkZGluZzouLi9jcnlwdG8vcnNhL3JzYV9wazEuYzo2Nzo8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAxNDA2
NTQyNDczODc1ODQ6ZXJyb3I6MDQwNjcwNzI6cnNhPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyByb3V0aW5lczpyc2Ffb3NzbF9wdWJs
aWNfZGVjcnlwdDpwYWRkaW5nPGJyPg0KJmd0OyBjaGVjazxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsgZmFpbGVkOi4uL2NyeXB0by9y
c2EvcnNhX29zc2wuYzo1ODI6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoC4uU2FtZSBvcGVyYXRpb24gb24g
YSBwbGFpbiBzaWduYXR1cmUgZnJvbTxicj4NCiZndDsgdHBtMl9jZXJ0aWZ5Y3JlYXRpb24gd29y
a3M6PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBvcGVuc3NsIHJzYXV0bCAtdmVyaWZ5IC1pbmtleTxi
cj4NCiZndDsgLi4vQUlLT3BhcXVlLmRlciAtaW48YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7IC4uL0lkQmluZGluZy5FWFRSQUNURURf
VFBNVF9TSUdOQVRVUkUgLTxicj4NCiZndDsgcHViaW4gLWtleWZvcm0gZGVywqAgJmd0Ozxicj4N
CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDsg
ZGVjcnlwdGVkLmJpbjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBkdW1wYXNuMSBkZWNyeXB0ZWQuYmluPGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0
O8KgIMKgIMKgIMKgIMKgMMKgIDMzOiBTRVFVRU5DRSB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgMsKgIMKg
OTrCoCDCoFNFUVVFTkNFIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqA0wqAgwqA1OsKgIMKgIMKgT0JKRUNU
IElERU5USUZJRVIgc2hhMSAoMSAzIDE0IDMgMjxicj4NCiZndDsgMjYpPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8KgIMKgIMKgIMKg
IDExwqAgwqAwOsKgIMKgIMKgTlVMTDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCA6wqAgwqAgwqB9
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIDEzwqAgMjA6wqAgwqBPQ1RFVCBTVFJJTkcgMkQgQTEgRDEgMzAgM0Eg
RDIgRkQ8YnI+DQomZ3Q7IDY4IEExIDVBIDJGIDlCIDhCIEMxIDFFIERCPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0OyAzNiBBNyA3QyBE
NDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCA6wqAgwqB9PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBT
by4gSXQgbG9va3MgbGlrZSBhIGJ1ZyBpbiB0cG0yX2NlcnRpZnkuPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZndDvCoCDCoCDCoCDC
oHRvb2w9JnF1b3Q7dHBtMl9jZXJ0aWZ5JnF1b3Q7IHZlcnNpb249JnF1b3Q7NC4xJnF1b3Q7PGJy
Pg0KJmd0OyB0Y3Rpcz0mcXVvdDtsaWJ0c3MyLXRjdGlsZHImcXVvdDsgdGN0aS1kZWZhdWx0PXRj
dGktPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmd0OyBkZXZpY2U8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB0cG0yLXRzcyAyLjMuMi1yYzA8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0O8Kg
IMKgIMKgIMKgUmVnYXJkcyw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBOaWtsYXM8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmd0Ozxicj4NCiZndDsg
PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cG0yIG1haWxpbmcgbGlzdCAtLSA8YSBo
cmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVm
ZXJyZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPjxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJy
ZXIiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIDxhIGhyZWY9
Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9y
ZWZlcnJlciI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPg0KJmd0OyAmbHQ7bWFpbHRv
OjxhIGhyZWY9Im1haWx0bzp0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsi
IHJlbD0ibm9yZWZlcnJlciI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCUod2ViX3BhZ2VfdXJsKXNsaXN0
aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxi
cj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLS08YnI+DQomZ3Q7IDxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEx1a2UgSGluZHPCoCB8IENUTyBPZmZpY2Ug
fCBSZWQgSGF0PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZTogPGEgaHJlZj0ibWFp
bHRvOmxoaW5kc0ByZWRoYXQuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5s
aGluZHNAcmVkaGF0LmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86bGhpbmRzQHJl
ZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPmxoaW5kc0ByZWRoYXQu
Y29tPC9hPiZndDvCoCB8IGlyYzogbGhpbmRzPGJyPg0KJmd0OyBAZnJlZW5vZGUgfCB0OiArNDQg
MTIgNTIgMzYgMjQ4Mzxicj4NCiZndDsgPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K

--===============2996953364663028345==--

