Content-Type: multipart/mixed; boundary="===============4814788755498129309=="
MIME-Version: 1.0
From: dawn.howe at alten.com
Subject: [tpm2] Ecrypting and decrypting a file using a TPM2
Date: Wed, 15 Jun 2022 00:06:01 +0000
Message-ID: <20220615000601.1682.85901@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4814788755498129309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I am writing a c++ application on ubuntu 22.04 server that needs to encrypt=
 and decrypt files and am using the FAPI api. The files need to be secured =
until the application uses them at a later time, so I am receiving plain fi=
les and encrypting them using Fapi_Encrypt(). =


I tried following the pattern in the integration tests found in the tpm2-to=
ols. (tpm2-tools/test/integration/fapi/fapi-encrypt-decrypt.sh)

It basically does the following:
Fapi_Initialize(&global_fapi_context, NULL);
Fapi_Provision (global_fapi_context, NULL, NULL, NULL);

const char * key_type =3D "noDa, decrypt, system";
char * auth_value =3D NULL; // no password
char * policy_path =3D NULL;
Fapi_CreateKey (global_fapi_context, key_path, key_type, policy_path, auth_=
value);

Fapi_Encrypt (global_fapi_context, key_path, (const uint8_t*)data, size, &c=
ipherText, &cipherTextSize);

The files (data buffer) I need to encrypt are about 3k bytes big. =


The encryption fails because the file is too big. The error comes from =

.../tpm2-tss/src/tss2-fapi/api/Fapi_Encrypt.c line 309:

if (encKeyObject->misc.key.public.publicArea.type =3D=3D TPM2_ALG_RSA) {
                TPM2B_DATA null_data =3D { .size =3D 0, .buffer =3D {} };
                TPM2B_PUBLIC_KEY_RSA *rsa_message =3D (TPM2B_PUBLIC_KEY_RSA=
 *)&context->aux_data;
                size_t key_size =3D
                    encKeyObject->misc.key.public.publicArea.parameters.rsa=
Detail.keyBits / 8;
                if (context->cmd.Data_EncryptDecrypt.in_dataSize > key_size=
) {
                    goto_error_reset_state(r, TSS2_FAPI_RC_BAD_VALUE,
                                           "Size to big for RSA encryption.=
", error_cleanup);


Is my strategy completely wrong? What's the proper way to do this?  Is my s=
trategy ok, but need to generate a different type of key?

I'm new to this technology and am curious how it ought to be done.
--===============4814788755498129309==--

