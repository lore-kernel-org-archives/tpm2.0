Content-Type: multipart/mixed; boundary="===============3096282082089750794=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Tue, 17 Dec 2019 15:16:40 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E60927@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAJ8N_u-kx93kdRTi8+ApMT8sUa2Ys539DXTZwsHJu_XQruMkdg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3096282082089750794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I pulled all these in, so attestation's on disk format will change. I would=
 consider these
To be of short lifespan so it shouldn't cause much grief.

We were also able to remove some dead code:
https://github.com/tpm2-software/tpm2-tools/pull/1876

Thanks,
Bill

> -----Original Message-----
> From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
> Sent: Tuesday, December 17, 2019 5:38 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: Luke Hinds <lhinds(a)redhat.com>; tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: tpm2_create signature verification fails due to
> "RSA_padding_check_PKCS_type1:invalid padding"
> =

> +1 for bug :-)
> =

> On Mon, Dec 16, 2019, 16:04 Roberts, William C <william.c.roberts(a)intel=
.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> =

> =

> 	> -----Original Message-----
> 	> From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se> ]
> 	> Sent: Monday, December 16, 2019 3:51 AM
> 	> To: Luke Hinds <lhinds(a)redhat.com <mailto:lhinds(a)redhat.com> >
> 	> Cc: Roberts, William C <william.c.roberts(a)intel.com
> <mailto:william.c.roberts(a)intel.com> >; tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> Subject: Re: [tpm2] Re: tpm2_create signature verification fails due to
> 	> "RSA_padding_check_PKCS_type1:invalid padding"
> 	>
> 	> A colleague of mine identified and fixed both the tpm2_certify [1] and
> the
> 	> superfluous byte-size [2] fields in two separate pull-requests.
> 	>
> 	> Turned out that the arguments to tpm2_certify got mixed up. If one
> changes the
> 	> --certifiedkey-context and --signingkey-context signature verification
> works.
> 	>
> 	> [1] https://github.com/tpm2-software/tpm2-tools/pull/1874
> 	> [2] https://github.com/tpm2-software/tpm2-tools/pull/1873
> =

> 	These look good, thanks. The real question is whether or not we view
> 	PR#1873 as a non-backwards compatible change. I view it as a bug,
> anyone
> 	object to that?
> =

> 	>
> 	>
> 	> Den tors 12 dec. 2019 kl 18:21 skrev Niklas Andersson
> 	> <niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se>
> <mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se> > >:
> 	>
> 	>
> 	>       In the source it looks like tpm2_certify.c and tpm2_certifycreat=
ion.c
> 	> handles signature differently.
> 	>
> 	>       OpenSSL is not the issue. I am using version OpenSSL 1.1.1 11 Sep
> 2018,
> 	> and I tried to unpack the signature using parameter "-raw" (instead of=
 -
> pkcs
> 	> which is default", and the result was gibberish. I would expect
> somewhat a
> 	> resemblance to ASN.1.
> 	>
> 	>       I opened an issue on Github https://github.com/tpm2-
> software/tpm2-
> 	> tools/issues/1871
> 	>
> 	>       Den tors 12 dec. 2019 kl 10:14 skrev Luke Hinds <lhinds(a)redhat=
.com
> <mailto:lhinds(a)redhat.com>
> 	> <mailto:lhinds(a)redhat.com <mailto:lhinds(a)redhat.com> > >:
> 	>
> 	>
> 	>               I have not had much time to research what you have tried=
, but I
> 	> wonder if it might be the same as the following situation we hit
> recently. iirc later
> 	> versions of OpenSSL (1.1.0 & greater) are less relaxed about padding
> 	> conventions.
> 	>
> 	>
> 	>               https://mta.openssl.org/pipermail/openssl-dev/2016-
> 	> February/005100.html
> 	>
> 	>               On Wed, Dec 11, 2019 at 10:46 PM Niklas Andersson
> 	> <niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se>
> <mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se> > >
> 	> wrote:
> 	>
> 	>
> 	>                       Hi William,
> 	>
> 	>                       Yes. It actually came to mind that my TPM might =
be faulty.
> 	> But I had a colleague running the script and he got exactly the same
> error, so it
> 	> seems there is a bug in the padding routine.
> 	>
> 	>
> 	>
> 	>                       Den ons 11 dec. 2019 kl 16:50 skrev Roberts, Wil=
liam C
> 	> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>
> <mailto:william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.c=
om> > >:
> 	>
> 	>
> 	>                               Sounds like a possible issue in our TPM2
> 	> structures to signature format routine or the TPM itself:
> 	>                               https://github.com/tpm2-software/tpm2-
> 	> tools/blob/master/lib/tpm2_convert.c#L467
> 	>
> 	>                               Looks like the script has an rsa key, so=
 you should
> 	> get a signature scheme of:
> 	>                               TPM2_ALG_RSASSA
> 	>
> 	>                               Which is just a straight memcpy from the=
 TPM.
> 	>
> 	>                               Perhaps, the TPM is either getting it wr=
ong or we
> 	> need to call some magic OSSL padding routine?
> 	>
> 	>
> 	>                               > -----Original Message-----
> 	>                               > From: Niklas Andersson
> 	> [mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se>
> 	> <mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se> > ]
> 	>                               > Sent: Wednesday, December 11, 2019 4:5=
8 AM
> 	>                               > To: tpm2(a)lists.01.org <mailto:tpm2(a=
)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>                               > Subject: [tpm2] Re: tpm2_create signat=
ure
> 	> verification fails due to
> 	>                               > "RSA_padding_check_PKCS_type1:invalid
> 	> padding"
> 	>                               >
> 	>                               > Here is the test case that explains th=
e issue. Not
> 	> sure if I am missing something. I
> 	>                               > believe the certify.SIGNATURE is corru=
pt.
> 	>                               >
> 	>                               >
> 	>                               > #!/bin/bash
> 	>                               >
> 	>                               > srk_handle=3D0x81000003
> 	>                               > ek_handle=3D0x81010001
> 	>                               >
> 	>                               > # IDevID
> 	>                               > tpm2_createak \
> 	>                               > --ek-context=3D$ek_handle \
> 	>                               > --ak-context=3DIDevID.ctx \
> 	>                               > --key-algorithm=3Drsa \
> 	>                               > --hash-algorithm=3Dsha1 \
> 	>                               > --public=3DIDevID.pub \
> 	>                               > --private=3DIDevID.priv
> 	>                               > # --signing-algorithm=3Dsha1
> 	>                               >
> 	>                               > # LDevID
> 	>                               > tpm2_create \
> 	>                               > --parent-context=3D$srk_handle \
> 	>                               > --hash-algorithm=3Dsha1 \
> 	>                               > --key-algorithm=3Drsa2048 \
> 	>                               > --public=3DLDevID.pub \
> 	>                               > --private=3DLDevID.priv \
> 	>                               > --creation-data=3DLDevID.CREATION_DATA=
 \
> 	>                               > --creation-hash=3DLDevID.CREATION_HASH=
 \
> 	>                               > --creation-ticket=3DLDevID.CREATION_TI=
CKET
> 	>                               >
> 	>                               > tpm2_load \
> 	>                               > --parent-context=3D$srk_handle \
> 	>                               > --public=3DLDevID.pub \
> 	>                               > --private=3DLDevID.priv \
> 	>                               > --key-context=3DLDevID.ctx
> 	>                               >
> 	>                               > # Certify
> 	>                               > tpm2_certify \
> 	>                               > --certifiedkey-context=3DLDevID.ctx \
> 	>                               > --signingkey-context=3DIDevID.ctx \
> 	>                               > --hash-algorithm=3Dsha1 \
> 	>                               > --attestation=3Dcertify.ATTESTATION \
> 	>                               > --signature=3Dcertify.SIGNATURE \
> 	>                               > --format=3Dplain
> 	>                               >
> 	>                               > # Certify Creation
> 	>                               > tpm2_certifycreation \
> 	>                               > --certifiedkey-context=3DLDevID.ctx \
> 	>                               > --signingkey-context=3DIDevID.ctx \
> 	>                               > --hash-algorithm=3Dsha1 \
> 	>                               > --creation-hash=3DLDevID.CREATION_HASH=
 \
> 	>                               > --ticket=3DLDevID.CREATION_TICKET \
> 	>                               > --signature=3Dcertifycreation.SIGNATUR=
E \
> 	>                               > --attestation=3Dcertifycreation.ATTEST=
ATION \ --
> 	> format=3Dplain
> 	>                               >
> 	>                               > # IDevID.der
> 	>                               > echo
> 	> 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl
> base64
> 	>                               > -a -d > IDevID.header.temp dd if=3DIDe=
vID.pub
> 	> bs=3D1 skip=3D$(expr $(stat --
> 	>                               > format=3D%s IDevID.pub) - 256)
> 	> of=3DIDevID.modulus.temp echo -en '\x02\x03' >
> 	>                               > IDevID.mid-header.temp echo -ne
> 	> '\x01\x00\x01' > IDevID.exponent.temp cat
> 	>                               > IDevID.header.temp IDevID.modulus.temp
> 	> IDevID.mid-header.temp
> 	>                               > IDevID.exponent.temp > IDevID.der
> 	>                               >
> 	>                               > # Remove first two bytes (byte size of=
 struct) in
> 	> certifycreation.ATTESTATION # in
> 	>                               > order for hash to comply. Magic Header=
" must
> 	> be ff 54 43 47 dd
> 	>                               > if=3Dcertifycreation.ATTESTATION
> 	> of=3Dcertifycreation.ATTESTATION_2 bs=3D1 skip=3D2
> 	>                               >
> 	>                               > # WORKS: Verify Certify Creation
> 	>                               > openssl dgst \
> 	>                               > -verify IDevID.der -keyform der \
> 	>                               > -sha1 -signature certifycreation.SIGNA=
TURE
> 	> certifycreation.ATTESTATION_2
> 	>                               >
> 	>                               > # FAILS: Verify Create
> 	>                               > openssl dgst \
> 	>                               > -verify IDevID.der -keyform der \
> 	>                               > -sha1 -signature certify.SIGNATURE
> 	> certify.ATTESTATION
> 	>                               >
> 	>                               > # WORKS:
> 	>                               > openssl rsautl \
> 	>                               > -verify \
> 	>                               > -pubin -inkey IDevID.der -keyform DER \
> 	>                               > -in certifycreation.SIGNATURE \
> 	>                               > -out certifycreation.SIGNATURE.asn1
> 	>                               >
> 	>                               > dumpasn1 certifycreation.SIGNATURE.asn1
> 	>                               >
> 	>                               > # FAILS:
> 	>                               > openssl rsautl \
> 	>                               > -verify \
> 	>                               > -pubin -inkey IDevID.der -keyform DER \
> 	>                               > -in certify.SIGNATURE \
> 	>                               > -out certify.SIGNATURE.asn1
> 	>                               >
> 	>                               > Den tis 10 dec. 2019 kl 23:40 skrev Ni=
klas
> 	> Andersson
> 	>                               > <niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se>
> 	> <mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se> >
> 	> <mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se>
> 	> <mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se> > > >:
> 	>                               >
> 	>                               >
> 	>                               >       openssl can not verify plain sig=
nature (256
> 	> bytes) from tpm2_certify due
> 	>                               > to bad padding.
> 	>                               >
> 	>                               >       This should work (verification o=
f signature
> 	> from tpm2_certifycreation
> 	>                               > works fine):
> 	>                               >
> 	>                               >       openssl dgst -verify ../AIKOpaqu=
e.der -
> 	> keyform der -sha1 -signature
> 	>                               > Signature KeyAttest.bin
> 	>                               >       Verification Failure
> 	>                               >
> 	>                               >       ....examine:
> 	>                               >
> 	>                               >       openssl rsautl -verify -inkey
> 	> ../AIKOpaque.der -in Signature -pubin -
> 	>                               > keyform der -pkcs > decrypted.bin
> 	>                               >       RSA operation error
> 	>                               >       140654247387584:error:0407008A:r=
sa
> 	>                               >
> 	> routines:RSA_padding_check_PKCS1_type_1:invalid
> 	>                               > padding:../crypto/rsa/rsa_pk1.c:67:
> 	>                               >       140654247387584:error:04067072:r=
sa
> 	>                               > routines:rsa_ossl_public_decrypt:paddi=
ng
> 	> check
> 	>                               > failed:../crypto/rsa/rsa_ossl.c:582:
> 	>                               >
> 	>                               >       ..Same operation on a plain sign=
ature from
> 	> tpm2_certifycreation works:
> 	>                               >
> 	>                               >
> 	>                               >       openssl rsautl -verify -inkey
> 	> ../AIKOpaque.der -in
> 	>                               > ../IdBinding.EXTRACTED_TPMT_SIGNATURE -
> 	> pubin -keyform der  >
> 	>                               > decrypted.bin
> 	>                               >
> 	>                               >       dumpasn1 decrypted.bin
> 	>                               >         0  33: SEQUENCE {
> 	>                               >         2   9:   SEQUENCE {
> 	>                               >         4   5:     OBJECT IDENTIFIER s=
ha1 (1 3 14 3 2
> 	> 26)
> 	>                               >        11   0:     NULL
> 	>                               >              :     }
> 	>                               >        13  20:   OCTET STRING 2D A1 D1=
 30 3A D2 FD
> 	> 68 A1 5A 2F 9B 8B C1 1E DB
> 	>                               > 36 A7 7C D4
> 	>                               >              :   }
> 	>                               >
> 	>                               >
> 	>                               >       So. It looks like a bug in tpm2_=
certify.
> 	>                               >
> 	>                               >       tool=3D"tpm2_certify" version=3D=
"4.1"
> 	> tctis=3D"libtss2-tctildr" tcti-default=3Dtcti-
> 	>                               > device
> 	>                               >       tpm2-tss 2.3.2-rc0
> 	>                               >
> 	>                               >       Regards,
> 	>                               >       Niklas
> 	>                               >
> 	>                               >
> 	>
> 	>
> 	>
> 	>
> 	>       _______________________________________________
> 	>                       tpm2 mailing list -- tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 	> <mailto:tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> >
> 	>                       To unsubscribe send an email to tpm2-leave(a)lis=
ts.01.org
> <mailto:tpm2-leave(a)lists.01.org>
> 	> <mailto:tpm2-leave(a)lists.01.org <mailto:tpm2-leave(a)lists.01.org> >
> 	>                       %(web_page_url)slistinfo%(cgiext)s/%(_internal_n=
ame)s
> 	>
> 	>
> 	>
> 	>               --
> 	>
> 	>               Luke Hinds  | CTO Office | Red Hat
> 	>               e: lhinds(a)redhat.com <mailto:lhinds(a)redhat.com>
> <mailto:lhinds(a)redhat.com <mailto:lhinds(a)redhat.com> >  | irc: lhinds
> 	> @freenode | t: +44 12 52 36 2483
> 	>
> =

> =



--===============3096282082089750794==--

