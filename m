Content-Type: multipart/mixed; boundary="===============5813510767651243281=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Fri, 29 Nov 2019 14:57:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E48866@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 7d4427e9-6e0a-322e-71c5-979935aa104e@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5813510767651243281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Tadeusz Struk [mailto:tadeusz.struk(a)intel.com]
> Sent: Wednesday, November 27, 2019 2:18 PM
> To: Niklas Andersson <niklas.andersson(a)fredenheim.se>; Jaureguiberry,
> IgnacioX <ignaciox.jaureguiberry(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
> =

> On 11/27/19 11:18 AM, Niklas Andersson wrote:
> > Don't know if this passage from the book "Towards a Secure and User
> > Friendly Authentication Method for Public Wireless Networks" [1] sheds
> > some light:
> >
> > "Since the TPM has not been designed to meet the PKCS#11 interface,
> > some limitations exist when using the PKCS#11 TPM interface. PKCS#11
> > allows to set RSA padding types at signing or encryption time, which
> > means they can change with every operation. However, TPM keys have a
> > fixed RSA padding scheme once they are created. Furthermore, PKCS#11
> > allows to create keys for signing and encryption, which is not desired
> > for TPM keys. The only key type in TPMs that allows both are legacy

They map to tpm2 key attributes and object schemes. However, TPM does
Allow NULL scheme's whereas the scheme can be determined at run time.
With the scheme set, it's essentially the CKA_ALLOWED_MECHANISMS (or
Something like that) of a list length of 1.

There is a lot of stuff in PKCS11 that we can't support in any meaningful w=
ay.

> > keys. In order to cover most of the PKCS#11 applications, TPM keys in
> > openCryptoki are by default of the type TSS_KEY_TYPE_LEGACY with the
> > TSS_ES_RSAESPKCSV15 encryption scheme and the
> > TSS_SS_RSASSAPKCS1V15_DER signing scheme. As mentioned in Chapter 5,
> > the use of legacy keys is not recommended due to possible security
> > problems, but at the moment, there is no better solutoin for using TPM =
keys in
> PKCS#11"
> =

> I think these limitations apply only to TPM1.2. With TPM2.0 the objects
> (keys) can be used for signing and encryption if created with
> TPMA_OBJECT_SIGN_ENCRYPT attributes.
> =

> --
> Tadeusz
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============5813510767651243281==--

