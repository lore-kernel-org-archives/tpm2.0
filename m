Content-Type: multipart/mixed; boundary="===============5333504196958341464=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Tue, 26 Apr 2022 22:22:33 +0200
Message-ID: <20220426222233.E2A0DF7A@centrum.cz>
In-Reply-To: DS7PR03MB5576DBEE0181A7DBD38E9C259AFB9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5333504196958341464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you, James.

Debugging openssl is tricky when it fails without any error message. :-/ Th=
is happens especially when the provider does not supply openssl with someth=
ing that the default provider usually supplies-- in this case the MD algori=
thm.

The command
> openssl cms -sign -provider tpm2 -provider default -in file.txt -inkey ha=
ndle:0x81800002 -signer handle:0x01000013
was failing because the key had no mandatory digest and there was no digest=
 specified via the command line.

Adding "-md sha256" fixed the issue for me. If you create e.g. a RSA-PSS ke=
y restricted to a specific hash-algorithm you shouldn't need this extra arg=
ument, because openssl will ask the key for the digest algorithm.

Based on the commands you sent I made a new test for 'openssl cms'. Have a =
look here:
https://github.com/tpm2-software/tpm2-openssl/blob/master/test/rsa_genpkey_=
x509_cms.sh
This should show a full test scenario for CMS. I can add more if you think =
something is missing, or when you encounter another weird behaviour.


Regards,
Petr
______________________________________________________________
> Od: "Sievert, James" <james.sievert(a)bsci.com>
> Komu: "tpm2(a)lists.01.org" <tpm2(a)lists.01.org>
> Datum: 26.04.2022 16:24
> P=C5=99edm=C4=9Bt: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider.=
..
>
>> Could you please suggest a sequence of openssl (and other commands) to v=
erify all required CMS functions?
>
>Tell you what, I'll frame the test sequences in terms of the tpm2tss engin=
e commands as I can verify correct syntax and command operation.  I'll assu=
me for the time being that the necessary keys and certs are stored in TPM N=
VRAM through tpm2_* commands.
>
>The a good start to testing would be something to the effect:
>
>	echo "this is some text" >file.txt
>
>	openssl cms -sign -engine tpm2tss -keyform engine -inkey 0x81800002 -sign=
er signer.pem -in file.txt -binary -nodetach -out file.sig
>
>	(note that although the tpm2tss engine doesn't support it, the signer cou=
ld also be given as a handle to the tpm2 provider)
>
>	openssl cms -verify -in file.sig -binary -noverify
>
>	(note that you can remove the -noverify and point to a truststore if nece=
ssary with -CApath /somewhere/truststore)
>
>	openssl cms -encrypt -recip signer.pem -in file.txt -out file.enc
>
>	(note that although the tpm2tss engine doesn't support it, the recip coul=
d also be given as a handle to the tpm2 provider)
>
>	openssl cms -decrypt -engine tpm2tss -keyform engine -inkey 0x81800002 -i=
n file.enc -recip signer.pem
>
>	(note that this command doesn't work with the tpm2tss engine.  See:  http=
s://bugs.launchpad.net/ubuntu/+source/openssl/+bug/1962549.)
>
>	openssl cms  -encrypt  -sign...
>
>	(the cms command can encrypt, sign, and bundle everything into an output =
with a single command -- the syntax is a combination of what's above)
>
>	openssl cms -verify -decrypt ...
>
>	(the cms command can verify and decrypt an input with a single command --=
 the syntax is a combination of what's above)
>
>	 =

>_______________________________________________
>tpm2 mailing list -- tpm2(a)lists.01.org
>To unsubscribe send an email to tpm2-leave(a)lists.01.org
>%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
>
>
--===============5333504196958341464==--

