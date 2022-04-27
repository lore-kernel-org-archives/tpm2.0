Content-Type: multipart/mixed; boundary="===============6327063864556175907=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Wed, 27 Apr 2022 16:46:54 +0200
Message-ID: <20220427164654.4F797A73@centrum.cz>
In-Reply-To: 20220426235440.9B2351AF@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6327063864556175907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>Yeah. What I wrote was apparently true for RSA keys only. The EC keys do n=
ot correctly supply the hash algorithm. That is a bug that will be fixed in=
 the coming days: https://github.com/tpm2-software/tpm2-openssl/issues/34

The bug has been fixed in the latest master branch.

A new test shows openssl cms -sign with an EC key without the -md parameter.
https://github.com/tpm2-software/tpm2-openssl/blob/master/test/ec_createak_=
x509_cms.sh


regards,
Petr
--===============6327063864556175907==--

