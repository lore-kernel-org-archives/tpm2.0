Content-Type: multipart/mixed; boundary="===============4971520095688570455=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_create signature verification fails due to
 "RSA_padding_check_PKCS_type1:invalid padding"
Date: Wed, 11 Dec 2019 15:50:10 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E599B3@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAJ8N_u-QS=yHyDfGfWn5Mp6eMd=-j_xuUrXvsQp=3M6vj2=+sw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4971520095688570455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sounds like a possible issue in our TPM2 structures to signature format rou=
tine or the TPM itself:
https://github.com/tpm2-software/tpm2-tools/blob/master/lib/tpm2_convert.c#=
L467

Looks like the script has an rsa key, so you should get a signature scheme =
of:
TPM2_ALG_RSASSA

Which is just a straight memcpy from the TPM.

Perhaps, the TPM is either getting it wrong or we need to call some magic O=
SSL padding routine?


> -----Original Message-----
> From: Niklas Andersson [mailto:niklas.andersson(a)fredenheim.se]
> Sent: Wednesday, December 11, 2019 4:58 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: tpm2_create signature verification fails due to
> "RSA_padding_check_PKCS_type1:invalid padding"
> =

> Here is the test case that explains the issue. Not sure if I am missing s=
omething. I
> believe the certify.SIGNATURE is corrupt.
> =

> =

> #!/bin/bash
> =

> srk_handle=3D0x81000003
> ek_handle=3D0x81010001
> =

> # IDevID
> tpm2_createak \
> --ek-context=3D$ek_handle \
> --ak-context=3DIDevID.ctx \
> --key-algorithm=3Drsa \
> --hash-algorithm=3Dsha1 \
> --public=3DIDevID.pub \
> --private=3DIDevID.priv
> # --signing-algorithm=3Dsha1
> =

> # LDevID
> tpm2_create \
> --parent-context=3D$srk_handle \
> --hash-algorithm=3Dsha1 \
> --key-algorithm=3Drsa2048 \
> --public=3DLDevID.pub \
> --private=3DLDevID.priv \
> --creation-data=3DLDevID.CREATION_DATA \
> --creation-hash=3DLDevID.CREATION_HASH \
> --creation-ticket=3DLDevID.CREATION_TICKET
> =

> tpm2_load \
> --parent-context=3D$srk_handle \
> --public=3DLDevID.pub \
> --private=3DLDevID.priv \
> --key-context=3DLDevID.ctx
> =

> # Certify
> tpm2_certify \
> --certifiedkey-context=3DLDevID.ctx \
> --signingkey-context=3DIDevID.ctx \
> --hash-algorithm=3Dsha1 \
> --attestation=3Dcertify.ATTESTATION \
> --signature=3Dcertify.SIGNATURE \
> --format=3Dplain
> =

> # Certify Creation
> tpm2_certifycreation \
> --certifiedkey-context=3DLDevID.ctx \
> --signingkey-context=3DIDevID.ctx \
> --hash-algorithm=3Dsha1 \
> --creation-hash=3DLDevID.CREATION_HASH \
> --ticket=3DLDevID.CREATION_TICKET \
> --signature=3Dcertifycreation.SIGNATURE \
> --attestation=3Dcertifycreation.ATTESTATION \ --format=3Dplain
> =

> # IDevID.der
> echo 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' | openssl base64
> -a -d > IDevID.header.temp dd if=3DIDevID.pub bs=3D1 skip=3D$(expr $(stat=
 --
> format=3D%s IDevID.pub) - 256) of=3DIDevID.modulus.temp echo -en '\x02\x0=
3' >
> IDevID.mid-header.temp echo -ne '\x01\x00\x01' > IDevID.exponent.temp cat
> IDevID.header.temp IDevID.modulus.temp IDevID.mid-header.temp
> IDevID.exponent.temp > IDevID.der
> =

> # Remove first two bytes (byte size of struct) in certifycreation.ATTESTA=
TION # in
> order for hash to comply. Magic Header" must be ff 54 43 47 dd
> if=3Dcertifycreation.ATTESTATION of=3Dcertifycreation.ATTESTATION_2 bs=3D=
1 skip=3D2
> =

> # WORKS: Verify Certify Creation
> openssl dgst \
> -verify IDevID.der -keyform der \
> -sha1 -signature certifycreation.SIGNATURE certifycreation.ATTESTATION_2
> =

> # FAILS: Verify Create
> openssl dgst \
> -verify IDevID.der -keyform der \
> -sha1 -signature certify.SIGNATURE certify.ATTESTATION
> =

> # WORKS:
> openssl rsautl \
> -verify \
> -pubin -inkey IDevID.der -keyform DER \
> -in certifycreation.SIGNATURE \
> -out certifycreation.SIGNATURE.asn1
> =

> dumpasn1 certifycreation.SIGNATURE.asn1
> =

> # FAILS:
> openssl rsautl \
> -verify \
> -pubin -inkey IDevID.der -keyform DER \
> -in certify.SIGNATURE \
> -out certify.SIGNATURE.asn1
> =

> Den tis 10 dec. 2019 kl 23:40 skrev Niklas Andersson
> <niklas.andersson(a)fredenheim.se <mailto:niklas.andersson(a)fredenheim.s=
e> >:
> =

> =

> 	openssl can not verify plain signature (256 bytes) from tpm2_certify due
> to bad padding.
> =

> 	This should work (verification of signature from tpm2_certifycreation
> works fine):
> =

> 	openssl dgst -verify ../AIKOpaque.der -keyform der -sha1 -signature
> Signature KeyAttest.bin
> 	Verification Failure
> =

> 	....examine:
> =

> 	openssl rsautl -verify -inkey ../AIKOpaque.der -in Signature -pubin -
> keyform der -pkcs > decrypted.bin
> 	RSA operation error
> 	140654247387584:error:0407008A:rsa
> routines:RSA_padding_check_PKCS1_type_1:invalid
> padding:../crypto/rsa/rsa_pk1.c:67:
> 	140654247387584:error:04067072:rsa
> routines:rsa_ossl_public_decrypt:padding check
> failed:../crypto/rsa/rsa_ossl.c:582:
> =

> 	..Same operation on a plain signature from tpm2_certifycreation works:
> =

> =

> 	openssl rsautl -verify -inkey ../AIKOpaque.der -in
> ../IdBinding.EXTRACTED_TPMT_SIGNATURE -pubin -keyform der  >
> decrypted.bin
> =

> 	dumpasn1 decrypted.bin
> 	  0  33: SEQUENCE {
> 	  2   9:   SEQUENCE {
> 	  4   5:     OBJECT IDENTIFIER sha1 (1 3 14 3 2 26)
> 	 11   0:     NULL
> 	       :     }
> 	 13  20:   OCTET STRING 2D A1 D1 30 3A D2 FD 68 A1 5A 2F 9B 8B C1 1E DB
> 36 A7 7C D4
> 	       :   }
> =

> =

> 	So. It looks like a bug in tpm2_certify.
> =

> 	tool=3D"tpm2_certify" version=3D"4.1" tctis=3D"libtss2-tctildr" tcti-def=
ault=3Dtcti-
> device
> 	tpm2-tss 2.3.2-rc0
> =

> 	Regards,
> 	Niklas
> =

> =



--===============4971520095688570455==--

