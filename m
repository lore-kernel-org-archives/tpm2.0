Content-Type: multipart/mixed; boundary="===============0189425108837421761=="
MIME-Version: 1.0
From: Sievert, James <james.sievert at bsci.com>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Wed, 27 Apr 2022 15:20:06 +0000
Message-ID: <
 <DS7PR03MB557663142DFF081829F097179AFA9@DS7PR03MB5576.namprd03.prod.outlook.com>>
In-Reply-To: 20220426235440.9B2351AF@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0189425108837421761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Okay, Petr, I've added -md sha256 to the command line, and both signing and=
 verification now work:

$ echo "hi there" >file.txt
$ openssl cms -sign -provider tpm2 -provider base -in file.txt -inkey handl=
e:0x81800002 -signer handle:0x01000013 -md sha256 -out file.sig -outform der
$ echo $?
0
$ openssl cms -verify -content file.txt -in file.sig -inform der -CApath /r=
un/user/201/trustStore/
hi there
CMS Verification successful

So, that's great!

CMS encryption fails as follows:

$ openssl cms -encrypt -provider tpm2 -provider base -in file.txt -recip ha=
ndle:0x01000013
WARNING:esys:src/tss2-esys/api/Esys_CreateLoaded.c:368:Esys_CreateLoaded_Fi=
nish() Received TPM Error
ERROR:esys:src/tss2-esys/api/Esys_CreateLoaded.c:129:Esys_CreateLoaded() Es=
ys Finish ErrorCode (0x000b0143)
40FCFCC0017F0000:error:4000000B:tpm2::cannot create key::-1:721219 rmt:erro=
r(2.0): command code not supported

This looks like https://github.com/tpm2-software/tpm2-openssl/issues/29.  F=
or my use case, support for TPMs without the CreateLoaded command will be e=
ssential.  My machines have an OPTIGA TPM2.

Thanks!

-----Original Message-----
From: Petr Gotthard <petr.gotthard(a)centrum.cz> =

Sent: Tuesday, April 26, 2022 5:55 PM
To: tpm2(a)lists.01.org
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl=
 cms

>> Debugging openssl is tricky when it fails without any error message
>
>Sorry about that.  =E2=98=B9

No problem. I am glad you are trying the tpm2 provider in your environment.=
 :-)

>> If you create e.g. a RSA-PSS key restricted to a specific =

>> hash-algorithm you shouldn't need this extra argument
>
>I was under the impression that the key was created using the sha256 hashi=
ng algorithm.  Here's the command used for creating the key:
>
>tpm2_create -C /run/user/201/platform.ctx -G ecc256:ecdsa-sha256 -r /run/u=
ser/201/private -u /run/user/201/public -a 'fixedtpm|fixedparent|sensitived=
ataorigin|sign|userwithauth|noda'
>
>Here's the result:
>
>$ tpm2_readpublic -c 0x81800002
>scheme:
>  value: ecdsa
>  raw: 0x18
>scheme-halg:
>  value: sha256
>  raw: 0xb

Yeah. What I wrote was apparently true for RSA keys only. The EC keys do no=
t correctly supply the hash algorithm. That is a bug that will be fixed in =
the coming days: https://github.com/tpm2-software/tpm2-openssl/issues/34


Petr
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org %(web_page_url)sl=
istinfo%(cgiext)s/%(_internal_name)s

--===============0189425108837421761==--

