Content-Type: multipart/mixed; boundary="===============5031333197501450961=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] OpenSSL Compatibility in tpm2_MakeCredential
Date: Fri, 23 Aug 2019 17:07:19 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEE4B9@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAP3jAwT0xBrQj_-vhpzERd=Nwv=wjwZG_pKfHCmG=P-tziJdFg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5031333197501450961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The current master and 4.0 release can use >=3D 1.0.2g. However, there is a=
 compat layer
In lib/tpm2_openssl.c and it's respective header file as well.

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Rahul Hardik=
ar
> Sent: Friday, August 16, 2019 4:04 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] OpenSSL Compatibility in tpm2_MakeCredential
> =

> Hello Experts,
> =

> What is OpenSSL version being used to implement the TPM_MakeCredential off
> the TPM chip? (i'm talking about the tpm2_makecredential.c code in
> tpm2_tools/, that has 2 implementations, one using TPM chip and one using
> OpenSSL)
> =

> I copied the code on my server but it seems that mine supports 1.0.2n and=
 my
> manager said that they will not upgrade to newer versions until next year.
> =

> How can I compile this ? How do I make it compatible with 1.0.2n are ther=
e ways
> to copy code present in  the  OpenSSL version used in tpm2_tools?
>  This is a snippet of the compiler errors I get in my local file:
> tpm2_common.c: In function =E2=80=98encrypt_seed_with_rsa_public_key=E2=
=80=99:
> tpm2_common.c:894:5: warning: implicit declaration of function
> =E2=80=98RSA_padding_add_PKCS1_OAEP_mgf1=E2=80=99 [-Wimplicit-function-de=
claration]
>      int return_code =3D RSA_padding_add_PKCS1_OAEP_mgf1(encoded,
>      ^
> tpm2_common.c: In function =E2=80=98aes_encrypt_buffers=E2=80=99:
> tpm2_common.c:1194:5: warning: implicit declaration of function
> =E2=80=98tpm_alg_to_ossl=E2=80=99 [-Wimplicit-function-declaration]
>      const EVP_CIPHER *cipher =3D tpm_alg_to_ossl(sym); ...
> tpm2_common.c:1441:5: error: incompatible type for argument 1 of
> =E2=80=98EVP_DigestUpdate=E2=80=99
>      return EVP_DigestUpdate(ctx->md_ctx, data, len);
>      ^
> In file included from tpm2_common.c:11:0:
> /usr/include/node/openssl/evp.h:573:5: note: expected =E2=80=98struct EVP=
_MD_CTX *=E2=80=99
> but argument is of type =E2=80=98EVP_MD_CTX=E2=80=99
>  int EVP_DigestUpdate(EVP_MD_CTX *ctx, const void *d, size_t cnt);
>      ^
> tpm2_common.c: In function =E2=80=98HMAC_Final=E2=80=99:
> tpm2_common.c:1452:5: error: incompatible type for argument 1 of
> =E2=80=98EVP_DigestFinal_ex=E2=80=99
>      if (!EVP_DigestFinal_ex(ctx->md_ctx, buf, &i))
> =

> 1.0.2 does not seem to have it or arguments are different!
> =

> Thanks,
> Rahul
>      ^


--===============5031333197501450961==--

