Content-Type: multipart/mixed; boundary="===============0516581962039678708=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Thu, 28 Apr 2022 18:26:55 +0200
Message-ID: <20220428182655.4EF6083D@centrum.cz>
In-Reply-To: DS7PR03MB5576A782DE510175ECF1CDB29AFD9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0516581962039678708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have no idea, unfortunately. I don't think the tpm was invoked, because t=
here is no error message from the tpm libraries. It feels more like if open=
ssl had not the right fields populated.

Could you please build tpm2-openssl with "./configure --enable-debug"? The =
openssl commands will then print tracing information about TPM functions be=
ing called. This could give us some indication on what could be wrong.

Another idea: Could you send me (privately) the "signer.pem"? If it fails o=
n my machine as well it will be easier to track and fix.


Petr
______________________________________________________________
> Od: "Sievert, James" <james.sievert(a)bsci.com>
> Komu: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
> Datum: 28.04.2022 17:46
> P=C5=99edm=C4=9Bt: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider.=
.. / openssl cms
>
>Actually here the error is different:
>
>bsci(a)ip-10-132-42-225:~$ openssl cms -encrypt -provider tpm2 -provider d=
efault -in file.txt -recip handle:0x01000013 -aes128
>409CFA23377F0000:error:17000074:CMS routines:cms_EnvelopedData_Encryption_=
init_bio:error setting recipientinfo:../crypto/cms/cms_env.c:1142:
>409CFA23377F0000:error:17000068:CMS routines:CMS_final:cms lib:../crypto/c=
ms/cms_smime.c:881:
>
>I was thinking that perhaps the cert. didn't permit encryption, so I read =
handle 0x01000013 into a file -- signer.pem and took the tpm2 provider comp=
letely out of the picture:
>
>$ openssl cms -encrypt -in file.txt -recip signer.pem -aes128 -out file.ci=
pher -outform der
>
>This works.  So, it doesn't seem to be a problem with the recipient certif=
icate.  I also tried this essentially making no _explicit_ use of the tpm2,=
 but specifying the provider anyway:
>
>$ openssl cms -encrypt -provider tpm2 -provider default -in file.txt -reci=
p signer.pem -aes128
>40BCDCB85F7F0000:error:17000074:CMS routines:cms_EnvelopedData_Encryption_=
init_bio:error setting recipientinfo:../crypto/cms/cms_env.c:1142:
>40BCDCB85F7F0000:error:17000068:CMS routines:CMS_final:cms lib:../crypto/c=
ms/cms_smime.c:881:
>
>For this encryption, there's a DH operation taking place under the covers =
to come up with an encryption key.  I'm thinking the TPM might be coming in=
to play for that?
>
>-----Original Message-----
>From: Petr Gotthard <petr.gotthard(a)centrum.cz> =

>Sent: Thursday, April 28, 2022 11:11 AM
>To: Sievert, James <james.sievert(a)bsci.com>; tpm2(a)lists.01.org
>Subject: Re: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / op=
enssl cms
>
>>I also tried this:  =

>>
>>openssl cms -encrypt -provider tpm2 -provider base -propquery ?provider=
=3Dtpm2,tpm2.cipher!=3Dyes -in file.txt -recip handle:0x01000013 -aes128
>>
>>Same result...
>
>That should work as well. Have you tried "-provider default" instead of "-=
provider base"?
>
>Openssl should be able to combine algorithms from different providers and =
the tpm2-openssl provider announces to openssl only those algorithms that a=
re supported by the tpm2 chip itself. The only tricky bit is when the same =
algorithm is implemented twice, which is not your case... yet ;-).
>
>
>Petr
>_______________________________________________
>tpm2 mailing list -- tpm2(a)lists.01.org
>To unsubscribe send an email to tpm2-leave(a)lists.01.org
>%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
--===============0516581962039678708==--

