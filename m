Content-Type: multipart/mixed; boundary="===============5747349406303281209=="
MIME-Version: 1.0
From: Sievert, James <james.sievert at bsci.com>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Thu, 28 Apr 2022 15:07:55 +0000
Message-ID: <
 <DS7PR03MB55766301B4D6369D582181AD9AFD9@DS7PR03MB5576.namprd03.prod.outlook.com>>
In-Reply-To: 20220427193732.704789D2@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5747349406303281209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I also tried this:  =


openssl cms -encrypt -provider tpm2 -provider base -propquery ?provider=3Dt=
pm2,tpm2.cipher!=3Dyes -in file.txt -recip handle:0x01000013 -aes128

Same result...

-----Original Message-----
From: Petr Gotthard <petr.gotthard(a)centrum.cz> =

Sent: Wednesday, April 27, 2022 1:38 PM
To: tpm2(a)lists.01.org
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl=
 cms

>CMS encryption fails as follows:
>
>$ openssl cms -encrypt -provider tpm2 -provider base -in file.txt =

>-recip handle:0x01000013
>WARNING:esys:src/tss2-esys/api/Esys_CreateLoaded.c:368:Esys_CreateLoade
>d_Finish() Received TPM Error
>ERROR:esys:src/tss2-esys/api/Esys_CreateLoaded.c:129:Esys_CreateLoaded(
>) Esys Finish ErrorCode (0x000b0143) =

>40FCFCC0017F0000:error:4000000B:tpm2::cannot create key::-1:721219 =

>rmt:error(2.0): command code not supported
>
>This looks like https://github.com/tpm2-software/tpm2-openssl/issues/29.
> For my use case, support for TPMs without the CreateLoaded command will b=
e essential.  My machines have an OPTIGA TPM2.

The CreateLoaded issue should be fixed now (in the latest master branch).


Petr
_______________________________________________
tpm2 mailing list -- tpm2(a)lists.01.org
To unsubscribe send an email to tpm2-leave(a)lists.01.org %(web_page_url)sl=
istinfo%(cgiext)s/%(_internal_name)s
--===============5747349406303281209==--

