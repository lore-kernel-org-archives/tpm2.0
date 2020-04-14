Content-Type: multipart/mixed; boundary="===============8831966192958086423=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: using Esys_Create() API creating a key with AES encryption
Date: Tue, 14 Apr 2020 07:51:18 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171B1A7E2@exch2010c.sit.fraunhofer.de>
In-Reply-To: 20200414073858.2799.96850@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8831966192958086423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Just keep in mind that 99.9% of TPMs do not support AES keys.
This is due to export / import restrictions of most countries in the world.
Just be sure that your TPM supports AES keys; otherwise your code will fail.

Your inPublic must be of type SYMCIPHER and then the algorithm would be
AES. Have a look at the "TPM library specification Part 2" and look for the
descriptions of TPMT_PUBLIC and which type yields which union-selection
to figure out the details.

The lack of examples comes from the aforementioned reason.

________________________________________
From: muthu.smk(a)gmail.com [muthu.smk(a)gmail.com]
Sent: Tuesday, April 14, 2020 09:38
To: tpm2(a)lists.01.org
Subject: [tpm2] using Esys_Create() API creating a key with AES encryption

Hi @williams
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

/* Esys_Create API , which will take above struct inputs filled by user as
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
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s

--===============8831966192958086423==--

