Content-Type: multipart/mixed; boundary="===============2401442971998377256=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: TPM Encryption Key
Date: Fri, 27 Mar 2020 15:18:42 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649EB38C5@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CAE8e83SWP_ZjKV36Hz__NU4M+dPO1aVkUAqhb8ZJ0pk8kLn96A@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2401442971998377256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm just gonna top post since the threading is kind of messed up anyways.

Exactly what are you trying to do? I read this as: I have an existing asymm=
etric keypair
that I want to protect with the TPM. Is that assumption correct?

If that's true, you already have the private key bytes and you would use th=
e TPM
as storage, protection and private key operations. The whole point would be=
 not
to reveal them again from the TPM. The public key, you can always get from =
the
tpm with tpm2_readpublic and output it as a pem file.

If my assumption is correct, you can do something like this (update as need=
ed):

openssl genrsa -out private.pem 2048
openssl rsa -in private.pem -pubout > public.pem

tpm2_import -Q -G rsa -g "$name_alg" -i private.pem -C primary.ctx \
    -u import_rsa_key.pub -r import_rsa_key.priv

tpm2_load -C primary.ctx -u import_rsa_key.pub -r import_rsa_key.priv \
    -n import_rsa_key.name -c import_rsa_key.ctx

# use rsa encrypt/decrypt
openssl rsa -in private.pem -out public.pem -outform PEM -pubout
openssl rsautl -encrypt -inkey public.pem -pubin -in plain.txt \
    -out plain.rsa.enc

tpm2_rsadecrypt -c import_rsa_key.ctx -o plain.rsa.dec plain.rsa.enc

# no diff, should be same data
diff plain.txt plain.rsa.dec

# test verifying a sigature with the imported key, ie sign in tpm and
# verify with openssl
echo "data to sign" > data.in.raw

shasum -a 256 data.in.raw | awk '{ print "000000 " $1 }' | xxd -r -c 32 > \
    data.in.digest

tpm2_sign -c import_rsa_key.ctx -g sha256 -d -f plain \
    -o data.out.signed data.in.digest

openssl dgst -verify public.pem -keyform pem -sha256 -signature \
    data.out.signed data.in.raw

The above code was taken from the tpm2-tools repository here:
https://github.com/tpm2-software/tpm2-tools/blob/master/test/integration/te=
sts/import.sh


> -----Original Message-----
> From: Ashok Kumar [mailto:ashokar.1980(a)gmail.com]
> Sent: Friday, March 27, 2020 1:34 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] TPM Encryption Key
> =

> Hello,
> =

> Please see my response inline ... [ashoka]
> =

> =

> On Thu, Mar 26, 2020 at 8:56 PM Roberts, William C <william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> =

> =

> 	> -----Original Message-----
> 	> From: Ashok Kumar [mailto:ashokar.1980(a)gmail.com
> <mailto:ashokar.1980(a)gmail.com> ]
> 	> Sent: Thursday, March 26, 2020 6:49 AM
> 	> To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> Subject: [tpm2] TPM Encryption Key
> 	>
> 	> Hello,
> 	>
> 	> Our requirement is to encrypt the given data (for example, private key)
> with TPM
> 	> key.
> 	> As and when required, decrypt the data using the TPM key and use it in
> the
> 	> application.
> 	>
> 	> To address this requirement, did the following.
> 	>
> 	> First time initialization:
> 	>
> 	> - Generated primary key under owner hierarchy
> 	> - Created the TPM symmetric key (which is used to encrypt/decrypt
> application
> 	> data)
> 	>   under the primary key.
> 	> - Used Esys_EvictControl() to store the TPM key handle in the TPM
> persistent
> 	> memory
> 	>
> 	> During Encryption/Decryption:
> 	>
> 	> - Used Esys_TR_FromTPMPublic() to fetch existing TPM key handle
> from the
> 	> persistent memory
> =

> 	I don't understand, tpm2_evictcontrol will give you a persistent key
> handle that=E2=80=99s good.
> 	Why did you do this step, to get an ESYS_TR handle?
> =

> =

> =

> [ashoka]
> Yes. If this API succeeds, I skipped the above mentioned initialization s=
teps
> (including primary key create) during the process initialization. That wa=
s done just
> to save some time during the initialization.
> Agree that we don't need this step functionality wise as we can recreate =
the
> same primary key handle.
> =

> If we make any change in the public params (though that is not expected) =
in
> future release, thought this approach would help to get the key handle us=
ed for
> encrypting the private key.
> =

> =

> 	I also urge folks to use transient memory. tpm2_create will provide a
> public and
> 	private blob that can be loaded with tpm2_load and then used. Persistent
> memory
> 	is only so big. So use wisely.
> =

> =

> =

> [ashoka]
> Sure, that sounds good.
> =

> =

> =

> =

> 	> - Used Esys_EncryptDecrypt() to encrypt/decrypt the given data
> 	>
> 	> Is this the right approach?
> 	>
> 	> It worked fine with simulator. However, it failed with "command code
> not
> 	> supported" error with TPM device.
> =

> 	Not many TPMs support symmetric encryption:
> =

> 	Let's look into your TPMs supported command set, do:
> =

> 	tpm2_getcap  commands
> =

> 	$ tpm2_getcap commands | grep -i encrypt
> 	TPM2_CC_EncryptDecrypt:
> 	TPM2_CC_RSA_Encrypt:
> 	TPM2_CC_EncryptDecrypt2:
> =

> 	If you don't have them, it won't work.
> =

> =

> =

> [ashoka]
> =

> tpm2_getcap command is not available in my system. Instead, have
> tpm2_dump_capability command.
> Confirmed that TPM2_CC_EncryptDecrypt and TPM2_CC_EncryptDecrypt2
> commands are not supported.
> =

> RSA_Decrypt and RSA_Encrypt are supported
> =

> [admin(a)TPM2-VersaCSG-Ashok: ~] $ tpm2_dump_capability -p 2323 -c
> commands | grep -A 8 159
> TPMA_CC: 0x02000159
>   commandIndex: 0x159
>   reserved1:    0x0
>   nv:           clear
>   extensive:    clear
>   flushed:      clear
>   cHandles:     0x1
>   rHandle:      clear
>   V:            clear
>   Res:          0x0
> =

> [admin(a)TPM2-VersaCSG-Ashok: ~] $ tpm2_dump_capability -p 2323 -c
> commands | grep -A 8 174
> TPMA_CC: 0x02000174
>   commandIndex: 0x174
>   reserved1:    0x0
>   nv:           clear
>   extensive:    clear
>   flushed:      clear
>   cHandles:     0x1
>   rHandle:      clear
>   V:            clear
>   Res:          0x0
> =

> =

> =

> 	What you could do, is:
> 	1. If you have to store externally generated private keys, use
> tpm2_import.
> 	2. seal an AES key to the tpm with tpm2_create -I and wrap the key with
> that key.
> =

> 	1 is the better option. Because once you do that, you can scrub all
> unprotected occurrences of
> 	the key in plaintext, and let it be a managed TPM object, protected by
> the TPM.
> =

> =

> =

> [ashoka]
> Thanks for your suggestion. After the tpm2_import, how do we get the plai=
n text
> (key) back?
> What is the command to get the original text?
> =

> Thanks,
> Ashok Kumar
> =

> =

> =

> 	>
> 	> ---x---
> 	> WARNING:esys:src/tss2-
> 	> esys/api/Esys_EncryptDecrypt.c:324:Esys_EncryptDecrypt_Finish()
> Received TPM
> 	> Error
> 	> ERROR:esys:src/tss2-
> esys/api/Esys_EncryptDecrypt.c:110:Esys_EncryptDecrypt()
> 	> Esys Finish ErrorCode (0x00000143)
> 	> versa_tpm2_encrypt_decrypt.382: Esys_EncryptDecrypt failed; rc 0x143
> 	> Output:
> 	> main#568: Wrote 0 bytes of data
> 	> [admin(a)TPM2-VersaCSG-Ashok: ~] $ tpm2_rc_decode 0x143 error
> layer
> 	>   hex: 0x0
> 	>   identifier: TSS2_TPM_ERROR_LEVEL
> 	>   description: Error produced by the TPM format 0 error code
> 	>   hex: 0x43
> 	>   name: TPM_RC_COMMAND_CODE
> 	>   description: command code not supported
> 	>
> 	> ---x---
> 	>
> 	> From the tpm2_dump_capability, looks like Esys_EncryptDecrypt() and
> 	> Esys_EncryptDecrypt2() are not supported.
> 	>
> 	> For our usecase, what could be the right alternative method to use?
> Shall we use
> 	> Esys_RSA_Encrypt()? In that case, which scheme is better?
> TPM2_ALG_RSAES or
> 	> TPM2_ALG_OAEP?
> 	>
> 	>
> 	> Thanks,
> 	> Ashok Kumar
> =



--===============2401442971998377256==--

