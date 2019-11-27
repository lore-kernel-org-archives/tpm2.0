Content-Type: multipart/mixed; boundary="===============4243648193113429814=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: wpa_supplicant fails to use tpm2_pkcs11 key
Date: Wed, 27 Nov 2019 12:18:03 -0800
Message-ID: <7d4427e9-6e0a-322e-71c5-979935aa104e@intel.com>
In-Reply-To: CAJ8N_u9cq9iyCO5Y5Tr6ssJ2nturKH+4nfrQvPH5=h=nxxNLTw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4243648193113429814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/27/19 11:18 AM, Niklas Andersson wrote:
> Don't know if this passage from the book "Towards a Secure and User
> Friendly Authentication Method for Public Wireless Networks" [1] sheds
> some light:
> =

> "Since the TPM has not been designed to meet the PKCS#11 interface, some
> limitations exist when using the PKCS#11 TPM interface. PKCS#11 allows
> to set RSA padding types at signing or encryption time, which means they
> can change with every operation. However, TPM keys have a fixed RSA
> padding scheme once they are created. Furthermore, PKCS#11 allows to
> create keys for signing and encryption, which is not desired for TPM
> keys. The only key type in TPMs that allows both are legacy keys. In
> order to cover most of the PKCS#11 applications, TPM keys in
> openCryptoki are by default of the type TSS_KEY_TYPE_LEGACY with the
> TSS_ES_RSAESPKCSV15 encryption scheme and the TSS_SS_RSASSAPKCS1V15_DER
> signing scheme. As mentioned in Chapter 5, the use of legacy keys is not
> recommended due to possible security problems, but at the moment, there
> is no better solutoin for using TPM keys in PKCS#11"

I think these limitations apply only to TPM1.2. With TPM2.0 the objects
(keys) can be used for signing and encryption if created with
TPMA_OBJECT_SIGN_ENCRYPT attributes.

--
Tadeusz
--===============4243648193113429814==--

