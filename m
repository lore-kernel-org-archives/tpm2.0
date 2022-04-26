Content-Type: multipart/mixed; boundary="===============9113823776492061249=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Tue, 26 Apr 2022 23:54:40 +0200
Message-ID: <20220426235440.9B2351AF@centrum.cz>
In-Reply-To: DS7PR03MB5576A61EBF01CE46694CE3B79AFB9@ds7pr03mb5576.namprd03.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9113823776492061249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> Debugging openssl is tricky when it fails without any error message
>
>Sorry about that.  =E2=98=B9

No problem. I am glad you are trying the tpm2 provider in your environment.=
 :-)

>> If you create e.g. a RSA-PSS key restricted to a specific hash-algorithm=
 you shouldn't need this extra argument
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
--===============9113823776492061249==--

