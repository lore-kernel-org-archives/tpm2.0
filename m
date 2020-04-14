Content-Type: multipart/mixed; boundary="===============7448460368656309859=="
MIME-Version: 1.0
From: muthu.smk at gmail.com
Subject: [tpm2] using Esys_Create() API creating a key with AES encryption
Date: Tue, 14 Apr 2020 07:38:58 +0000
Message-ID: <20200414073858.2799.96850@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7448460368656309859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi @williams =

As suggested by you creating this request in the emailing list

I just want to create a "AES key" using TPM , i could find the below sample=
 of RSA key generation using tpm2tss_rsa_genkey() API . Could you help me o=
n sharing the API or sample code block that helps me to generate "AES based=
 key" using TPM ?

rsa =3D RSA_new();
if (!rsa) {
ERR("out of memory\n");
BN_free(e);
return NULL;
}
if (!tpm2tss_rsa_genkey(rsa, opt.keysize, e, opt.password, opt.parent)) {
BN_free(e);
RSA_free(rsa);
ERR("Error: Generating key failed\n");
return NULL;
}

You have suggested to use - Esys_Create, with the public template filled in=
 for an AES key.
I have found the sample of the same in https://github.com/tpm2-software/tpm=
2-tss/blob/master/test/integration/esys-encrypt-decrypt.int.c

And the below code block/structure that enable "AES" based key generation w=
as  shared below. Can you please confirm whether am i going in correct dire=
ction to achieve my requirement . It would be great if you have any sample =
code to be shared with me on this front.
...
..
 TPM2B_PUBLIC inPublic2 =3D {
..
..
.parameters.rsaDetail =3D {
                 .symmetric =3D {
                     .algorithm =3D TPM2_ALG_AES,
                     .keyBits.aes =3D 128,
                     .mode.aes =3D TPM2_ALG_CFB},
                 .scheme =3D {
                      .scheme =3D TPM2_ALG_NULL
                  },
                 .keyBits =3D 2048,
                 .exponent =3D 0,
             },

...
...
}

/* Esys_Create API , which will take above struct inputs filled by user as =

  r =3D Esys_Create(esys_context,
                    primaryHandle,
                    ESYS_TR_PASSWORD, ESYS_TR_NONE, ESYS_TR_NONE,
                    &inSensitive2,
                    &inPublic2,    /* in this struct we are filling that we=
 required AES based input key gen */
                    &outsideInfo2,
                    &creationPCR2,
                    &outPrivate2,
                    &outPublic2,
                    &creationData2, &creationHash2, &creationTicket2);
                           &creationTicket);
--===============7448460368656309859==--

