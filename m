Content-Type: multipart/mixed; boundary="===============5347117670926168924=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Mon, 16 Dec 2019 15:04:12 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E5E2CF@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAJ8N_u_ruFRctmzxErv7WZuNvO5Air8zcN1EkZzuz3scExGb1w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5347117670926168924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
> Sent: Monday, December 16, 2019 3:51 AM
> To: Luke Hinds <lhinds(a)redhat.com>
> Cc: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg
> Subject: Re: [tpm2] Re: tpm2_create signature verification fails due to
> "RSA_padding_check_PKCS_type1:invalid padding"
> =

> A colleague of mine identified and fixed both the tpm2_certify [1] and the
> superfluous byte-size [2] fields in two separate pull-requests.
> =

> Turned out that the arguments to tpm2_certify got mixed up. If one change=
s the
> --certifiedkey-context and --signingkey-context signature verification wo=
rks.
> =

> [1] https://github.com/tpm2-software/tpm2-tools/pull/1874
> [2] https://github.com/tpm2-software/tpm2-tools/pull/1873

These look good, thanks. The real question is whether or not we view
PR#1873 as a non-backwards compatible change. I view it as a bug, anyone
object to that?

> =

> =

> Den tors 12 dec. 2019 kl 18:21 skrev Niklas Andersson
> <niklas.andersson(a)fredenheim.se <mailto:niklas.andersson(a)fredenheim.s=
e> >:
> =

> =

> 	In the source it looks like tpm2_certify.c and tpm2_certifycreation.c
> handles signature differently.
> =

> 	OpenSSL is not the issue. I am using version OpenSSL 1.1.1 11 Sep 2018,
> and I tried to unpack the signature using parameter "-raw" (instead of -p=
kcs
> which is default", and the result was gibberish. I would expect somewhat a
> resemblance to ASN.1.
> =

> 	I opened an issue on Github https://github.com/tpm2-software/tpm2-
> tools/issues/1871
> =

> 	Den tors 12 dec. 2019 kl 10:14 skrev Luke Hinds <lhinds(a)redhat.com
> <mailto:lhinds(a)redhat.com> >:
> =

> =

> 		I have not had much time to research what you have tried, but I
> wonder if it might be the same as the following situation we hit recently=
. iirc later
> versions of OpenSSL (1.1.0 & greater) are less relaxed about padding
> conventions.
> =

> =

> 		https://mta.openssl.org/pipermail/openssl-dev/2016-
> February/005100.html
> =

> 		On Wed, Dec 11, 2019 at 10:46 PM Niklas Andersson
> <niklas.andersson(a)fredenheim.se <mailto:niklas.andersson(a)fredenheim.s=
e> >
> wrote:
> =

> =

> 			Hi William,
> =

> 			Yes. It actually came to mind that my TPM might be faulty.
> But I had a colleague running the script and he got exactly the same erro=
r, so it
> seems there is a bug in the padding routine.
> =

> =

> =

> 			Den ons 11 dec. 2019 kl 16:50 skrev Roberts, William C
> <william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com> >:
> =

> =

> 				Sounds like a possible issue in our TPM2
> structures to signature format routine or the TPM itself:
> 				https://github.com/tpm2-software/tpm2-
> tools/blob/master/lib/tpm2_convert.c#L467
> =

> 				Looks like the script has an rsa key, so you should
> get a signature scheme of:
> 				TPM2_ALG_RSASSA
> =

> 				Which is just a straight memcpy from the TPM.
> =

> 				Perhaps, the TPM is either getting it wrong or we
> need to call some magic OSSL padding routine?
> =

> =

> 				> -----Original Message-----
> 				> From: Niklas Andersson
> [mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se> ]
> 				> Sent: Wednesday, December 11, 2019 4:58 AM
> 				> To: tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 				> Subject: [tpm2] Re: tpm2_create signature
> verification fails due to
> 				> "RSA_padding_check_PKCS_type1:invalid
> padding"
> 				>
> 				> Here is the test case that explains the issue. Not
> sure if I am missing something. I
> 				> believe the certify.SIGNATURE is corrupt.
> 				>
> 				>
> 				> #!/bin/bash
> 				>
> 				> srk_handle=3D0x81000003
> 				> ek_handle=3D0x81010001
> 				>
> 				> # IDevID
> 				> tpm2_createak \
> 				> --ek-context=3D$ek_handle \
> 				> --ak-context=3DIDevID.ctx \
> 				> --key-algorithm=3Drsa \
> 				> --hash-algorithm=3Dsha1 \
> 				> --public=3DIDevID.pub \
> 				> --private=3DIDevID.priv
> 				> # --signing-algorithm=3Dsha1
> 				>
> 				> # LDevID
> 				> tpm2_create \
> 				> --parent-context=3D$srk_handle \
> 				> --hash-algorithm=3Dsha1 \
> 				> --key-algorithm=3Drsa2048 \
> 				> --public=3DLDevID.pub \
> 				> --private=3DLDevID.priv \
> 				> --creation-data=3DLDevID.CREATION_DATA \
> 				> --creation-hash=3DLDevID.CREATION_HASH \
> 				> --creation-ticket=3DLDevID.CREATION_TICKET
> 				>
> 				> tpm2_load \
> 				> --parent-context=3D$srk_handle \
> 				> --public=3DLDevID.pub \
> 				> --private=3DLDevID.priv \
> 				> --key-context=3DLDevID.ctx
> 				>
> 				> # Certify
> 				> tpm2_certify \
> 				> --certifiedkey-context=3DLDevID.ctx \
> 				> --signingkey-context=3DIDevID.ctx \
> 				> --hash-algorithm=3Dsha1 \
> 				> --attestation=3Dcertify.ATTESTATION \
> 				> --signature=3Dcertify.SIGNATURE \
> 				> --format=3Dplain
> 				>
> 				> # Certify Creation
> 				> tpm2_certifycreation \
> 				> --certifiedkey-context=3DLDevID.ctx \
> 				> --signingkey-context=3DIDevID.ctx \
> 				> --hash-algorithm=3Dsha1 \
> 				> --creation-hash=3DLDevID.CREATION_HASH \
> 				> --ticket=3DLDevID.CREATION_TICKET \
> 				> --signature=3Dcertifycreation.SIGNATURE \
> 				> --attestation=3Dcertifycreation.ATTESTATION \ --
> format=3Dplain
> 				>
> 				> # IDevID.der
> 				> echo
> 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl base64
> 				> -a -d > IDevID.header.temp dd if=3DIDevID.pub
> bs=3D1 skip=3D$(expr $(stat --
> 				> format=3D%s IDevID.pub) - 256)
> of=3DIDevID.modulus.temp echo -en '\x02\x03' >
> 				> IDevID.mid-header.temp echo -ne
> '\x01\x00\x01' > IDevID.exponent.temp cat
> 				> IDevID.header.temp IDevID.modulus.temp
> IDevID.mid-header.temp
> 				> IDevID.exponent.temp > IDevID.der
> 				>
> 				> # Remove first two bytes (byte size of struct) in
> certifycreation.ATTESTATION # in
> 				> order for hash to comply. Magic Header" must
> be ff 54 43 47 dd
> 				> if=3Dcertifycreation.ATTESTATION
> of=3Dcertifycreation.ATTESTATION_2 bs=3D1 skip=3D2
> 				>
> 				> # WORKS: Verify Certify Creation
> 				> openssl dgst \
> 				> -verify IDevID.der -keyform der \
> 				> -sha1 -signature certifycreation.SIGNATURE
> certifycreation.ATTESTATION_2
> 				>
> 				> # FAILS: Verify Create
> 				> openssl dgst \
> 				> -verify IDevID.der -keyform der \
> 				> -sha1 -signature certify.SIGNATURE
> certify.ATTESTATION
> 				>
> 				> # WORKS:
> 				> openssl rsautl \
> 				> -verify \
> 				> -pubin -inkey IDevID.der -keyform DER \
> 				> -in certifycreation.SIGNATURE \
> 				> -out certifycreation.SIGNATURE.asn1
> 				>
> 				> dumpasn1 certifycreation.SIGNATURE.asn1
> 				>
> 				> # FAILS:
> 				> openssl rsautl \
> 				> -verify \
> 				> -pubin -inkey IDevID.der -keyform DER \
> 				> -in certify.SIGNATURE \
> 				> -out certify.SIGNATURE.asn1
> 				>
> 				> Den tis 10 dec. 2019 kl 23:40 skrev Niklas
> Andersson
> 				> <niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se>
> <mailto:niklas.andersson(a)fredenheim.se
> <mailto:niklas.andersson(a)fredenheim.se> > >:
> 				>
> 				>
> 				>       openssl can not verify plain signature (256
> bytes) from tpm2_certify due
> 				> to bad padding.
> 				>
> 				>       This should work (verification of signature
> from tpm2_certifycreation
> 				> works fine):
> 				>
> 				>       openssl dgst -verify ../AIKOpaque.der -
> keyform der -sha1 -signature
> 				> Signature KeyAttest.bin
> 				>       Verification Failure
> 				>
> 				>       ....examine:
> 				>
> 				>       openssl rsautl -verify -inkey
> ../AIKOpaque.der -in Signature -pubin -
> 				> keyform der -pkcs > decrypted.bin
> 				>       RSA operation error
> 				>       140654247387584:error:0407008A:rsa
> 				>
> routines:RSA_padding_check_PKCS1_type_1:invalid
> 				> padding:../crypto/rsa/rsa_pk1.c:67:
> 				>       140654247387584:error:04067072:rsa
> 				> routines:rsa_ossl_public_decrypt:padding
> check
> 				> failed:../crypto/rsa/rsa_ossl.c:582:
> 				>
> 				>       ..Same operation on a plain signature from
> tpm2_certifycreation works:
> 				>
> 				>
> 				>       openssl rsautl -verify -inkey
> ../AIKOpaque.der -in
> 				> ../IdBinding.EXTRACTED_TPMT_SIGNATURE -
> pubin -keyform der  >
> 				> decrypted.bin
> 				>
> 				>       dumpasn1 decrypted.bin
> 				>         0  33: SEQUENCE {
> 				>         2   9:   SEQUENCE {
> 				>         4   5:     OBJECT IDENTIFIER sha1 (1 3 14 3 2
> 26)
> 				>        11   0:     NULL
> 				>              :     }
> 				>        13  20:   OCTET STRING 2D A1 D1 30 3A D2 FD
> 68 A1 5A 2F 9B 8B C1 1E DB
> 				> 36 A7 7C D4
> 				>              :   }
> 				>
> 				>
> 				>       So. It looks like a bug in tpm2_certify.
> 				>
> 				>       tool=3D"tpm2_certify" version=3D"4.1"
> tctis=3D"libtss2-tctildr" tcti-default=3Dtcti-
> 				> device
> 				>       tpm2-tss 2.3.2-rc0
> 				>
> 				>       Regards,
> 				>       Niklas
> 				>
> 				>
> =

> =

> =

> =

> 	_______________________________________________
> 			tpm2 mailing list -- tpm2(a)lists.01.org
> <mailto:tpm2(a)lists.01.org>
> 			To unsubscribe send an email to tpm2-leave(a)lists.01.org
> <mailto:tpm2-leave(a)lists.01.org>
> 			%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =

> =

> =

> 		--
> =

> 		Luke Hinds  | CTO Office | Red Hat
> 		e: lhinds(a)redhat.com <mailto:lhinds(a)redhat.com>  | irc: lhinds
> @freenode | t: +44 12 52 36 2483
> =



--===============5347117670926168924==--

