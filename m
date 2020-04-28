Content-Type: multipart/mixed; boundary="===============2876501011539120940=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Usage of openssl command line API as library function
Date: Tue, 28 Apr 2020 16:57:37 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED8623@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANGCWd0JcFe4oM=E=CUqBmhbiKpyb8_qpd77iDBd5CqTO=PyPQ@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2876501011539120940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Muthukumar S [mailto:muthu.smk(a)gmail.com]
> Sent: Tuesday, April 28, 2020 11:38 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Re: Usage of openssl command line API as library func=
tion
> =

> Hi Robert,
> =

> Thanks for your quick response.
> =

> =

> As you said , I am exactly looking for openssl symmetric key operation.
> =

> As said in my intial thead ,below are the implementation that I have done=
 so far in
> my application.
> =

> 1) created rsa "priv_key" using tpm2tss-rsa-gen key using tpm
> 2) created a random key (and saved as input_random_key) using
> Esys_GetRandom() using tpm and kept as it is .
> =

> 3) By using below openssl s/w APIs ,just want to encrypt the "private key=
" along
> with "random key" and save the encrypted file .
> openssl enc -aes-256-cbc -salt -in priv_key -out output_enc_key -k
> input_random_key
> =

> 4) do decrypt with below openssl command with input "random key" and get
> back the "private key"
> =

> openssl enc -aes-256-cbc -d -in output_enc_key -out decrypted_output_key =
-k
> input_random_rum
> =

> =

> Here comes my query, how to use the above two openssl command line API as
> an library function inside "c" code.

https://lmgtfy.com/?q=3Dopenssl+aes+encryption+example+in+c

Learn to fish:
1. Google things
2. Look at the openssl commandlets, its open source, trace what they are do=
ing
3. pkcs11 does some of this as well, look there.

Good luck.

> =

> On Tue, Apr 28, 2020, 8:12 PM Roberts, William C <william.c.roberts(a)int=
el.com
> <mailto:william.c.roberts(a)intel.com>  wrote:
> =

> =

> 	After you generate the keypair, can't you call:
> 	openssl rsa -in key.pem -pubout -out pubkey.pem
> =

> 	Specifying the inkey and the engine, there are examples in the
> 	Test scripts. Then from there you have a normal public key pem file
> 	You can pass to openssl like normal without engine stuff, so it wont
> 	Use the engine and just do software.
> =

> 	If you want a random key, again just generate it and use the openssl
> symmetric
> 	Key operations. So if you wanted to do something like encrypt a file and
> share
> 	The decryption key, the steps would be
> 	1. generate aes key
> 	2. encrypt the file data
> 	3. encrypt the key with the public key
> 	4. decrypt the key with the private key
> 	5. decrypt the file with the obtained decrypted aes key
> =

> =

> 	> -----Original Message-----
> 	> From: muthu.smk(a)gmail.com <mailto:muthu.smk(a)gmail.com>
> [mailto:muthu.smk(a)gmail.com <mailto:muthu.smk(a)gmail.com> ]
> 	> Sent: Tuesday, April 28, 2020 7:33 AM
> 	> To: tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> Subject: [tpm2] Re: Usage of openssl command line API as library
> function along
> 	> with tpm-tss engine
> 	>
> 	> seems this iesys_crypto_sym_aes_encrypt() API and
> iesys_crypto_pk_encrypt()
> 	> API uses TPM for encryption and decryption .  What i want is to use
> pure openssl
> 	> API (s/w based encryption) with the input of tpm generated hardware
> priv key
> 	> and random key and do encrypt & decrypt it as explained in the first
> thread .
> 	> _______________________________________________
> 	> tpm2 mailing list -- tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>
> 	> To unsubscribe send an email to tpm2-leave(a)lists.01.org <mailto:tpm2-
> leave(a)lists.01.org>
> 	> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =



--===============2876501011539120940==--

