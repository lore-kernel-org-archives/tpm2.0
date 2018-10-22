Content-Type: multipart/mixed; boundary="===============1764320343443456172=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] How do I import a PEM format privateKey into TPM2 ?
Date: Mon, 22 Oct 2018 15:29:31 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C60421@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CA+tBKViXgSTQASd03OPDcCH1LFPM2tjOJcVgtwvj00Xa3Zyi0w@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1764320343443456172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Terry An
> Sent: Sunday, October 21, 2018 11:26 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] How do I import a PEM format privateKey into TPM2 ?
> =

> Hi everyone,
> =

> I generated a PEM format keypair using openssl:
> # openssl genrsa -out priv.key
> =

> # openssl rsa -in priv.key  -out pub.key -pubout
> =

> =

> and then I used tpm2-tools to import:
> # tpm2_createprimary -H o -g sha256 -G ecc -C context.out
> ObjectAttribute: 0x00030072
> CreatePrimary Succeed ! Handle: 0x800000ff
> =

> # tpm2_load -H 0x80000ff -c context.out -r priv.key
> ERROR: File "priv.key" size is larger than buffer, got 1766 expected less=
 than 1552
> an error appeared.

tpm2_load is not the command you want. tpm2_loads a TPM controlled object i=
nto the TPM.
You want to use tpm2_import which is only available on the master branch.

Examples in the man page:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/tpm2_import.1.md


> =

> My purpose is to encrypt by public key and decrypt by tpm2.0
> Encrypt:
> # openssl rsautl -encrypt -inkey pub.key  -pubin -in data.in <http://data=
.in>  -out
> data.enc
> =

> Decrypt:
> what should I do?

--===============1764320343443456172==--

