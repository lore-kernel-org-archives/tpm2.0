Content-Type: multipart/mixed; boundary="===============9107677449099122474=="
MIME-Version: 1.0
From: Petr Vandrovec <petr at vmware.com>
Subject: Re: [tpm2] tpm2 rsaencrypt and rsadecrypt
Date: Wed, 06 Feb 2019 19:54:33 +0000
Message-ID: <47d382ae-6249-d2b7-6dc9-b86d5491d706@vmware.com>
In-Reply-To: DM5PR1301MB1883D9F1BF65ECADDA3C6047FE6F0@DM5PR1301MB1883.namprd13.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9107677449099122474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Eric.Zaluzec(a)vertivco.com wrote on 2/6/2019 11:42 AM:
> Does the tpm2 allow an encrypted file file, encrypted by =

> tpm2_rsaencrypt, to be decrypted, by tpm2_rsadecrypt, on another device =

> if the public key is passed and loaded with tpm2_loadexternal? Both =

> devices are have a tpm. This scenario is similar to how tpm2 can be used =

> to sign a file; then that file, public key & signature can be passed to =

> another device and verified there.
> =

> Both systems are running kernel v4.14.78 on an arch x86_64 GNU/Linux =

> platform. The tpm2 software versions are:

Yes, it is other way around:

You can do encryption with public-key external entity, but decryption =

requires both public + private key.  TPM error about Auth value needed =

is symptom of trying to use public-only key for operation that needs =

private key.

It would not make much sense otherwise - if only one entity can encrypt =

it, while everybody can decrypt it, you are actually not getting =

encryption, but obfuscation, as public keys are... public.  You want =

signing, to prove that data originated at the source holding private key.

If you want obfuscation so that entities that do not posses your public =

key cannot see data, use RSA signing (for authenticity) + symmetric =

encryption key (for obfuscation or "encryption") derived from RSA public =

key (you can use f.e. HMAC-SHA256 of public key as AES-256 key).

Petr

--===============9107677449099122474==--

