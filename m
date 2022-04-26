Content-Type: multipart/mixed; boundary="===============3751471064551969744=="
MIME-Version: 1.0
From: Sievert, James <james.sievert at bsci.com>
Subject: [tpm2] Re: {External} Re: OpenSSL 3 and tpm2 provider... / openssl cms
Date: Tue, 26 Apr 2022 21:43:48 +0000
Message-ID: <
 <DS7PR03MB5576A61EBF01CE46694CE3B79AFB9@DS7PR03MB5576.namprd03.prod.outlook.com>>
In-Reply-To: 20220426222233.E2A0DF7A@centrum.cz
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3751471064551969744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Debugging openssl is tricky when it fails without any error message

Sorry about that.  =E2=98=B9

> If you create e.g. a RSA-PSS key restricted to a specific hash-algorithm =
you shouldn't need this extra argument

I was under the impression that the key was created using the sha256 hashin=
g algorithm.  Here's the command used for creating the key:

tpm2_create -C /run/user/201/platform.ctx -G ecc256:ecdsa-sha256 -r /run/us=
er/201/private -u /run/user/201/public -a 'fixedtpm|fixedparent|sensitiveda=
taorigin|sign|userwithauth|noda'

Here's the result:

$ tpm2_readpublic -c 0x81800002
name: 000bb512ddf666370d1d957955207a3159f07a499acdb36a43b5bb928000874aff0e
qualified name: 000b087ef34ba32025d7430d242d5b95813935c8b0c66983bf0107b63fd=
f00e62b07
name-alg:
  value: sha256
  raw: 0xb
attributes:
  value: fixedtpm|fixedparent|sensitivedataorigin|userwithauth|noda|sign
  raw: 0x40472
type:
  value: ecc
  raw: 0x23
curve-id:
  value: NIST p256
  raw: 0x3
kdfa-alg:
  value: null
  raw: 0x10
kdfa-halg:
  value: (null)
  raw: 0x0
scheme:
  value: ecdsa
  raw: 0x18
scheme-halg:
  value: sha256
  raw: 0xb
sym-alg:
  value: null
  raw: 0x10
sym-mode:
  value: (null)
  raw: 0x0
sym-keybits: 0
x: b326cf2f3088979065d64f692dabb8e72384cd480738325a92ec6e0af3ad066d
y: 7147de064a9b5d438b3e5c4f64f9437eec64816f1c3ddc21b0b194ab620706d1

> Adding "-md sha256" fixed the issue for me.

I'm unable to test at the moment.  I'll hopefully be able to confirm tomorr=
ow.

--===============3751471064551969744==--

