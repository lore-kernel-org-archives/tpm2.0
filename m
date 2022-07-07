Content-Type: multipart/mixed; boundary="===============2938052963681530205=="
MIME-Version: 1.0
From: Sergey 'Jin' Bostandzhyan <jin at mediatomb.cc>
Subject: [tpm2] Selecting a key which was created via Fapi in the OpenSSL
 "engine"
Date: Thu, 07 Jul 2022 15:59:23 +0200
Message-ID: <20220707135923.GC26089@xn--80adja5bqm.su>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2938052963681530205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I am struggling to figure out how the following scenario could work:

let's say I have a C application where I created a persistent key pair =

via Fapi_CreateKey(), the key can be identified by its path,
typically something like "HS/SRK/mykey".

Now, let's assume I need to use that key from OpenSSL as well, via the engi=
ne
option, i.e. "-engine tpm2tss", what I am failing to understand is - how do
I pass the path/key identifier, to tell OpenSSL which key to use?

All examples in the tpm2-tss-engine README somehow assume that you first
used tpm2tss-genkey which produces an actual key file in the fs, and then
this file is being used in OpenSSL?

From https://github.com/tpm2-software/tpm2-tss-engine
tpm2tss-genkey -a rsa -s 2048 mykey
openssl rsa -engine tpm2tss -inform engine -in mykey -pubout -outform pem -=
out mykey.pub
openssl pkeyutl -pubin -inkey mykey.pub -in mydata -encrypt -out mycipher
openssl pkeyutl -engine tpm2tss -keyform engine -inkey mykey -decrypt -in m=
ycipher -out mydata

I naively tried passing "-in HS/SRK/mykey", but of course it did not work.

So what is the correct way to do it, if the key has not been generated usin=
g =

tpm2tss-genkey, but if the key has been created via the Fapi_CreateKey() =

function?

My actual scenario is, that my application is using libmosquitto which in
turn needs to use the private key which I have in TPM. The library uses Ope=
nSSL
and allows to pass equivalents of "-engine" and "-keyform" parameters to the
OpenSSL library. The question however remains the same as with the above
command line example - how do I select the key, if "mykey" is not a file, b=
ut
something that is stored in TPM?

I am not an expert in any of those TPM or security related questions, so I =
may
very well misunderstand how this is supposed to work overall, so far I was =
not
able to figure it out by studying the docs, I hope someone has a hint for m=
e.

Kind regards,
Jin



--===============2938052963681530205==--

