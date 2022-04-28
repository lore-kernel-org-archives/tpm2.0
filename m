Content-Type: multipart/mixed; boundary="===============8916720688738096528=="
MIME-Version: 1.0
From: Sievert, James <james.sievert at bsci.com>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Thu, 28 Apr 2022 15:46:47 +0000
Message-ID: <
 <DS7PR03MB5576A782DE510175ECF1CDB29AFD9@DS7PR03MB5576.namprd03.prod.outlook.com>>
In-Reply-To: 20220428171057.180185B4@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8916720688738096528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Actually here the error is different:

bsci(a)ip-10-132-42-225:~$ openssl cms -encrypt -provider tpm2 -provider de=
fault -in file.txt -recip handle:0x01000013 -aes128
409CFA23377F0000:error:17000074:CMS routines:cms_EnvelopedData_Encryption_i=
nit_bio:error setting recipientinfo:../crypto/cms/cms_env.c:1142:
409CFA23377F0000:error:17000068:CMS routines:CMS_final:cms lib:../crypto/cm=
s/cms_smime.c:881:

I was thinking that perhaps the cert. didn't permit encryption, so I read h=
andle 0x01000013 into a file -- signer.pem and took the tpm2 provider compl=
etely out of the picture:

$ openssl cms -encrypt -in file.txt -recip signer.pem -aes128 -out file.cip=
her -outform der

This works.  So, it doesn't seem to be a problem with the recipient certifi=
cate.  I also tried this essentially making no _explicit_ use of the tpm2, =
but specifying the provider anyway:

$ openssl cms -encrypt -provider tpm2 -provider default -in file.txt -recip=
 signer.pem -aes128
40BCDCB85F7F0000:error:17000074:CMS routines:cms_EnvelopedData_Encryption_i=
nit_bio:error setting recipientinfo:../crypto/cms/cms_env.c:1142:
40BCDCB85F7F0000:error:17000068:CMS routines:CMS_final:cms lib:../crypto/cm=
s/cms_smime.c:881:

For this encryption, there's a DH operation taking place under the covers t=
o come up with an encryption key.  I'm thinking the TPM might be coming int=
o play for that?

-----Original Message-----
From: Petr Gotthard <petr.gotthard(a)centrum.cz> =

Sent: Thursday, April 28, 2022 11:11 AM
To: Sievert, James <james.sievert(a)bsci.com>; tpm2(a)lists.01.org
Subject: Re: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / ope=
nssl cms

>I also tried this:  =

>
>openssl cms -encrypt -provider tpm2 -provider base -propquery ?provider=3D=
tpm2,tpm2.cipher!=3Dyes -in file.txt -recip handle:0x01000013 -aes128
>
>Same result...

That should work as well. Have you tried "-provider default" instead of "-p=
rovider base"?

Openssl should be able to combine algorithms from different providers and t=
he tpm2-openssl provider announces to openssl only those algorithms that ar=
e supported by the tpm2 chip itself. The only tricky bit is when the same a=
lgorithm is implemented twice, which is not your case... yet ;-).


Petr
--===============8916720688738096528==--

