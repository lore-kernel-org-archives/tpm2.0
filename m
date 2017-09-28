Content-Type: multipart/mixed; boundary="===============7986800689942881290=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2_nvwrite with policy based authorization
Date: Thu, 28 Sep 2017 12:24:27 +0200
Message-ID: <73b7026f-07b6-c936-bc3c-82b7347977f7@redhat.com>
In-Reply-To: 54CD2916B052E04BBDD1393A6800D9FDDB6A9CA3@NJ350EX02.ztgroup.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7986800689942881290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
ls
in general. Please take a look to this issue:

https://github.com/01org/tpm2-tools/issues/510

The tpm2_unseal has some basic session support (basically the tool starts a=
 new
session and calculates the PCR policy to be used for TPM2_Unseal). This is =
not
an ideal solution, but it works for simple cases.

It shouldn't be hard to do the same for tpm2_nv{read,write}, and I believe =
that
is something we need to support.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============7986800689942881290==--

