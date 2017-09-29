Content-Type: multipart/mixed; boundary="===============1991428114046088972=="
MIME-Version: 1.0
From: Slash Wu <slash.wu at ztsystems.com>
Subject: Re: [tpm2] tpm2_nvwrite with policy based authorization
Date: Fri, 29 Sep 2017 04:33:38 +0000
Message-ID: <54CD2916B052E04BBDD1393A6800D9FDDB6A9E7B@NJ350EX02.ztgroup.com>
In-Reply-To: 73b7026f-07b6-c936-bc3c-82b7347977f7@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1991428114046088972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Javier,

Thanks so much for the reply promptly.

Currently I defined a NV index like below, do you know if the tpm2_unseal i=
s capable of a 'policywrite' to this NV Space ? and if it does, can you ple=
ase give me an example how ?

  0. NV Index: 0x1800001
  {
        Hash algorithm(nameAlg):11
        attributes: policywrite|policydelete|authread|no_da|written|platfor=
mcreate(0x8040462)
        The size of the data area(dataSize):70
        Authorization Policy for R/W/D: C001C8000210D0FAA4F4F4F8A78EF4F8264=
E6F8555340D2F04180F8CF110FFDD
  }

Much appreciate.
Slash

-----Original Message-----
From: Javier Martinez Canillas [mailto:javierm(a)redhat.com] =

Sent: Thursday, September 28, 2017 6:24 PM
To: Slash Wu <slash.wu(a)ztsystems.com>; tpm2(a)lists.01.org
Subject: Re: [tpm2] tpm2_nvwrite with policy based authorization

On 09/28/2017 09:54 AM, Slash Wu wrote:
> Hi,
> =

> Is there any example shows how to tpm2_nvwrite via 'policy based authoriz=
ation' ?
> Much appreciate.
> =


There's still no support for it. Please take a look to this issue:

https://github.com/01org/tpm2-tools/issues/348

There's currently a very long discussion about sessions support for the too=
ls in general. Please take a look to this issue:

https://github.com/01org/tpm2-tools/issues/510

The tpm2_unseal has some basic session support (basically the tool starts a=
 new session and calculates the PCR policy to be used for TPM2_Unseal). Thi=
s is not an ideal solution, but it works for simple cases.

It shouldn't be hard to do the same for tpm2_nv{read,write}, and I believe =
that is something we need to support.

Best regards,
--
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement Red Hat

--===============1991428114046088972==--

