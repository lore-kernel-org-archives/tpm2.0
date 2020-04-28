Content-Type: multipart/mixed; boundary="===============1757045303304700812=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Usage of openssl command line API as library function
 along with tpm-tss engine
Date: Tue, 28 Apr 2020 14:42:51 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649ED855D@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20200428123306.2763.94944@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1757045303304700812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

After you generate the keypair, can't you call:
openssl rsa -in key.pem -pubout -out pubkey.pem

Specifying the inkey and the engine, there are examples in the
Test scripts. Then from there you have a normal public key pem file
You can pass to openssl like normal without engine stuff, so it wont
Use the engine and just do software.

If you want a random key, again just generate it and use the openssl symmet=
ric
Key operations. So if you wanted to do something like encrypt a file and sh=
are
The decryption key, the steps would be
1. generate aes key
2. encrypt the file data
3. encrypt the key with the public key
4. decrypt the key with the private key
5. decrypt the file with the obtained decrypted aes key

	=

> -----Original Message-----
> From: muthu.smk(a)gmail.com [mailto:muthu.smk(a)gmail.com]
> Sent: Tuesday, April 28, 2020 7:33 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Re: Usage of openssl command line API as library function=
 along
> with tpm-tss engine
> =

> seems this iesys_crypto_sym_aes_encrypt() API and iesys_crypto_pk_encrypt=
()
> API uses TPM for encryption and decryption .  What i want is to use pure =
openssl
> API (s/w based encryption) with the input of tpm generated hardware priv =
key
> and random key and do encrypt & decrypt it as explained in the first thre=
ad .
> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
--===============1757045303304700812==--

