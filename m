Content-Type: multipart/mixed; boundary="===============0028256436816277634=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Mon, 02 Dec 2019 15:26:02 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E4B50E@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20191129173228.2967.54608@new-ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0028256436816277634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I made a bug here, this should be as easy as adding a test in the integrati=
on tests
And fixing it

https://github.com/tpm2-software/tpm2-pkcs11/issues/335


> -----Original Message-----
> From: Ignacio Jaureguiberry [mailto:ignaciox.jaureguiberry(a)intel.com]
> Sent: Friday, November 29, 2019 11:32 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
> =

> I'm not sure what you mean by object usign in C_SIgnInit. I debugged the
> C_SignInit call and openssl is calling it with a CKM_RSA_X_509, then tpm2=
-pkcs11
> returns that the mechanism is not supported.
> =

> I've debugged the ssh case, using pkcs11 to connect to a remote host as s=
pecified
> in the docs. This is working and is calling C_SignInit with a mechanism
> CKM_RSA_PKCS, which is supported.
> =

> Then I searched OpenSSL and libp11 sources and found this
> (https://github.com/OpenSC/libp11/blob/64569a391897bd29c5060b19fa4613e61
> 9e59277/src/p11_rsa.c#L59):
> =

> ```
> /* Setup PKCS#11 mechanisms for encryption/decryption */ static int
> pkcs11_mechanism(CK_MECHANISM *mechanism, const int padding) {
> 	memset(mechanism, 0, sizeof(CK_MECHANISM));
> 	switch (padding) {
> 	case RSA_PKCS1_PADDING:
> 		mechanism->mechanism =3D CKM_RSA_PKCS;
> 		break;
> 	case RSA_NO_PADDING:
> 		mechanism->mechanism =3D CKM_RSA_X_509;
> 		break;
> 	case RSA_X931_PADDING:
> 		mechanism->mechanism =3D CKM_RSA_X9_31;
> 		break;
> 	default:
> 		fprintf(stderr, "PKCS#11: Unsupported padding type\n");
> 		return -1;
> 	}
> 	return 0;
> }
> ```
> =

> So it looks the mechanism (CKM_RSA_X_509, not supported) is chosen by the
> engine based entirely on the padding parameter. And this padding is here
> (https://github.com/openssl/openssl/blob/dbcf53f867146766845f6e64243208d87
> 007f970/crypto/rsa/rsa_pmeth.c#L176):
> =

> ```
> ret =3D RSA_private_encrypt(RSA_size(rsa), rctx->tbuf, sig, rsa,
> RSA_NO_PADDING); ```
> =

> Hope this helps...
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============0028256436816277634==--

