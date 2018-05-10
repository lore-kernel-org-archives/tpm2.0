Content-Type: multipart/mixed; boundary="===============4428859620182111272=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] PCR missing SHA-512 support
Date: Thu, 10 May 2018 12:17:33 -0700
Message-ID: <c32408b9-4458-d9bc-e5de-05572f4a94bb@intel.com>
In-Reply-To: 207C810BE4BA2440832668E0F208BFD3BCAB46@ORSMSX108.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4428859620182111272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/10/2018 10:09 AM, Anderson, Daniel wrote:
> I was playing around with tpm2_pcrlist and noticed it supports SHA-1, SHA=
-256, SHA-384, but SHA-512 is missing:
> =

> =C2=A0
> =

> =C2=A0
> =

> tumalo ~/tpm/bin$ tpm2_pcrlist -L sha512:22
> =

> WARN: Ignore unsupported bank/algorithm: sha512(0x000d)
> =

> ERROR: Unable to run tpm2_pcrlist
> =

> tumalo ~/tpm/bin$ tpm2_pcrlist -L sha384:22
> =

> sha384:
> =

> =C2=A0 22: 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF=
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
> =

> =C2=A0
> =

> Then I look in the man page and see SHA-512 is supported.
> =

> =C2=A0
> =

> Is this a bug or a feature?
> =


It is supported, but it looks like the TPM simulator doesn't support SHA512=
 by default:

Implementation.h:
#define  ALG_SHA256            ALG_YES
#define  ALG_SHA384            ALG_YES
#define  ALG_SHA512            ALG_NO
...

--===============4428859620182111272==--

