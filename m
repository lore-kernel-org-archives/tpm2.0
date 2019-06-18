Content-Type: multipart/mixed; boundary="===============0776422976530463822=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: =?utf-8?q?Re=3A_=5Btpm2=5D_How_to_implement_key_distribution_using_tpm2?=
 =?utf-8?q?=5Fimport_and_tpm2=5Fload=EF=BC=9F?=
Date: Tue, 18 Jun 2019 17:02:24 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DB2806@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 6150E177A208094F9076F5DB74147EE170344218@nkgeml514-mbx.china.huawei.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0776422976530463822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Caiqishen
> Sent: Tuesday, June 18, 2019 12:11 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] How to implement key distribution using tpm2_import and
> tpm2_load=EF=BC=9F
> =

> In the book, "A Practical Guide to TPM 2.0", there's a process describing=
 key
> distribution which is as the following:
> =

> 1.	The central IT system creates an HMAC key using TPM2_GetRandom.
> 2.	The central IT system encrypts the HMAC key with the public portion of
> the target client=E2=80=99s storage key.
> 3.	The central IT system signs the encrypted HMAC key with its private
> signing key. This is done so the local platform knows that what is being =
sent is
> authorized by IT.
> 4.	The encrypted HMAC key is sent to the client along with a signature th=
at
> proves it came from the central IT system.
> 5.	The client verifies the signature on the encrypted key by loading the
> central server=E2=80=99s public key. (This can be done with the TPM using=
 TPM2_Load and
> then using TPM2_VerifySignature, if you like.)
> 6.	The client imports the verified, encrypted HMAC key into its system us=
ing
> TPM2_Import, getting out a loadable, encrypted blob containing the HMAC k=
ey.
> 7.	The client loads the HMAC key when the user wishes to use it, using
> TPM2_Load, and uses it as normal. At this point, the local platform has r=
eceived
> an HMAC key from the IT central
> 8.	system that has never been decrypted in the local system=E2=80=99s mem=
ory.
> =

> I wonder how to encrypts the HMAC key and how to import it using
> TPM2_Import? How to import a symmetric key encrypted by a rsa public key?
> Appreciate for any replies, thanks!
> =


You would reverse the steps:
1. The receiving application would check that IT signature matches and that=
 the cert chain is valid. Use normal OSSL.
2. decrypt the blob (key) with RSA Decrypt using the TPM private key corres=
ponding with the public portion used for encrypt
3. Now that you have the plaintext blob (actual symmetric key), call tpm2_i=
mport.

--===============0776422976530463822==--

