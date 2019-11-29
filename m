Content-Type: multipart/mixed; boundary="===============3876458032878589875=="
MIME-Version: 1.0
From: Ignacio Jaureguiberry <ignaciox.jaureguiberry at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Fri, 29 Nov 2019 17:32:28 +0000
Message-ID: <20191129173228.2967.54608@new-ml01.vlan13.01.org>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649E48851@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3876458032878589875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm not sure what you mean by object usign in C_SIgnInit. I debugged the C_=
SignInit call and openssl is calling it with a CKM_RSA_X_509, then tpm2-pkc=
s11 returns that the mechanism is not supported.

I've debugged the ssh case, using pkcs11 to connect to a remote host as spe=
cified in the docs. This is working and is calling C_SignInit with a mechan=
ism CKM_RSA_PKCS, which is supported.

Then I searched OpenSSL and libp11 sources and found this (https://github.c=
om/OpenSC/libp11/blob/64569a391897bd29c5060b19fa4613e619e59277/src/p11_rsa.=
c#L59):

```
/* Setup PKCS#11 mechanisms for encryption/decryption */
static int pkcs11_mechanism(CK_MECHANISM *mechanism, const int padding)
{
	memset(mechanism, 0, sizeof(CK_MECHANISM));
	switch (padding) {
	case RSA_PKCS1_PADDING:
		mechanism->mechanism =3D CKM_RSA_PKCS;
		break;
	case RSA_NO_PADDING:
		mechanism->mechanism =3D CKM_RSA_X_509;
		break;
	case RSA_X931_PADDING:
		mechanism->mechanism =3D CKM_RSA_X9_31;
		break;
	default:
		fprintf(stderr, "PKCS#11: Unsupported padding type\n");
		return -1;
	}
	return 0;
}
```

So it looks the mechanism (CKM_RSA_X_509, not supported) is chosen by the e=
ngine based entirely on the padding parameter. And this padding is here (ht=
tps://github.com/openssl/openssl/blob/dbcf53f867146766845f6e64243208d87007f=
970/crypto/rsa/rsa_pmeth.c#L176):

```
ret =3D RSA_private_encrypt(RSA_size(rsa), rctx->tbuf, sig, rsa, RSA_NO_PAD=
DING);
```

Hope this helps...
--===============3876458032878589875==--

