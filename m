Content-Type: multipart/mixed; boundary="===============8049346964750208125=="
MIME-Version: 1.0
From: Sievert, James <james.sievert at bsci.com>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider...
Date: Tue, 26 Apr 2022 14:24:15 +0000
Message-ID: <
 <DS7PR03MB5576DBEE0181A7DBD38E9C259AFB9@DS7PR03MB5576.namprd03.prod.outlook.com>>
In-Reply-To: 20220426150913.699DCD0C@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8049346964750208125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Could you please suggest a sequence of openssl (and other commands) to ve=
rify all required CMS functions?

Tell you what, I'll frame the test sequences in terms of the tpm2tss engine=
 commands as I can verify correct syntax and command operation.  I'll assum=
e for the time being that the necessary keys and certs are stored in TPM NV=
RAM through tpm2_* commands.

The a good start to testing would be something to the effect:

	echo "this is some text" >file.txt

	openssl cms -sign -engine tpm2tss -keyform engine -inkey 0x81800002 -signe=
r signer.pem -in file.txt -binary -nodetach -out file.sig

	(note that although the tpm2tss engine doesn't support it, the signer coul=
d also be given as a handle to the tpm2 provider)

	openssl cms -verify -in file.sig -binary -noverify

	(note that you can remove the -noverify and point to a truststore if neces=
sary with -CApath /somewhere/truststore)

	openssl cms -encrypt -recip signer.pem -in file.txt -out file.enc

	(note that although the tpm2tss engine doesn't support it, the recip could=
 also be given as a handle to the tpm2 provider)

	openssl cms -decrypt -engine tpm2tss -keyform engine -inkey 0x81800002 -in=
 file.enc -recip signer.pem

	(note that this command doesn't work with the tpm2tss engine.  See:  https=
://bugs.launchpad.net/ubuntu/+source/openssl/+bug/1962549.)

	openssl cms  -encrypt  -sign...

	(the cms command can encrypt, sign, and bundle everything into an output w=
ith a single command -- the syntax is a combination of what's above)

	openssl cms -verify -decrypt ...

	(the cms command can verify and decrypt an input with a single command -- =
the syntax is a combination of what's above)

	=20

--===============8049346964750208125==--

