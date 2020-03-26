Content-Type: multipart/mixed; boundary="===============5693348438238848269=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: TPM Encryption Key
Date: Thu, 26 Mar 2020 15:26:02 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB246D@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAE8e83QFfBTKMPO-fQBzDPbk=_dB1uR=YkVZS9WYFqc3utFGMw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5693348438238848269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Ashok Kumar [mailto:ashokar.1980(a)gmail.com]
> Sent: Thursday, March 26, 2020 6:49 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] TPM Encryption Key
> =

> Hello,
> =

> Our requirement is to encrypt the given data (for example, private key) w=
ith TPM
> key.
> As and when required, decrypt the data using the TPM key and use it in the
> application.
> =

> To address this requirement, did the following.
> =

> First time initialization:
> =

> - Generated primary key under owner hierarchy
> - Created the TPM symmetric key (which is used to encrypt/decrypt applica=
tion
> data)
>   under the primary key.
> - Used Esys_EvictControl() to store the TPM key handle in the TPM persist=
ent
> memory
> =

> During Encryption/Decryption:
> =

> - Used Esys_TR_FromTPMPublic() to fetch existing TPM key handle from the
> persistent memory

I don't understand, tpm2_evictcontrol will give you a persistent key handle=
 that=E2=80=99s good.
Why did you do this step, to get an ESYS_TR handle?

I also urge folks to use transient memory. tpm2_create will provide a publi=
c and
private blob that can be loaded with tpm2_load and then used. Persistent me=
mory
is only so big. So use wisely.

> - Used Esys_EncryptDecrypt() to encrypt/decrypt the given data
> =

> Is this the right approach?
> =

> It worked fine with simulator. However, it failed with "command code not
> supported" error with TPM device.

Not many TPMs support symmetric encryption:

Let's look into your TPMs supported command set, do:

tpm2_getcap  commands

$ tpm2_getcap commands | grep -i encrypt
TPM2_CC_EncryptDecrypt:
TPM2_CC_RSA_Encrypt:
TPM2_CC_EncryptDecrypt2:

If you don't have them, it won't work.

What you could do, is:
1. If you have to store externally generated private keys, use tpm2_import.
2. seal an AES key to the tpm with tpm2_create -I and wrap the key with tha=
t key.

1 is the better option. Because once you do that, you can scrub all unprote=
cted occurrences of
the key in plaintext, and let it be a managed TPM object, protected by the =
TPM.

> =

> ---x---
> WARNING:esys:src/tss2-
> esys/api/Esys_EncryptDecrypt.c:324:Esys_EncryptDecrypt_Finish() Received =
TPM
> Error
> ERROR:esys:src/tss2-esys/api/Esys_EncryptDecrypt.c:110:Esys_EncryptDecryp=
t()
> Esys Finish ErrorCode (0x00000143)
> versa_tpm2_encrypt_decrypt.382: Esys_EncryptDecrypt failed; rc 0x143
> Output:
> main#568: Wrote 0 bytes of data
> [admin(a)TPM2-VersaCSG-Ashok: ~] $ tpm2_rc_decode 0x143 error layer
>   hex: 0x0
>   identifier: TSS2_TPM_ERROR_LEVEL
>   description: Error produced by the TPM format 0 error code
>   hex: 0x43
>   name: TPM_RC_COMMAND_CODE
>   description: command code not supported
> =

> ---x---
> =

> From the tpm2_dump_capability, looks like Esys_EncryptDecrypt() and
> Esys_EncryptDecrypt2() are not supported.
> =

> For our usecase, what could be the right alternative method to use? Shall=
 we use
> Esys_RSA_Encrypt()? In that case, which scheme is better? TPM2_ALG_RSAES =
or
> TPM2_ALG_OAEP?
> =

> =

> Thanks,
> Ashok Kumar

--===============5693348438238848269==--

