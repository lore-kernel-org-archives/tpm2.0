Content-Type: multipart/mixed; boundary="===============5194781364699644439=="
MIME-Version: 1.0
From: Tadeusz Struk <tstruk at gmail.com>
Subject: [tpm2] Re: Installing on FreeBSD?
Date: Thu, 31 Mar 2022 18:46:09 -0700
Message-ID: <407dd8bf-734d-34e0-e3c2-677dca3ba040@gmail.com>
In-Reply-To: df281f63-806a-5fe1-4295-03f3ceeead1c@skylon.me.uk
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5194781364699644439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/31/22 15:04, John Connett wrote:
>> did you "sudo kldload tpm" ?
> I hadn't (on bare hardware the TPM was found automatically). Here's the o=
utput:
> =

>     root(a)atelier2:~ # kldload tpm
>     tpmcrb0: <Trusted Platform Module 2.0, CRB mode> iomem 0xfed40000-0xf=
ed40fff
>     on acpi0
>     device_attach: tpmcrb0 attach returned 6
>     tpmcrb0: <Trusted Platform Module 2.0, CRB mode> iomem 0xfed40000-0xf=
ed40fff
>     on acpi0
>     device_attach: tpmcrb0 attach returned 6
>     root(a)atelier2:~ #
> =

> Still no /dev/tpm0

6 - ENXIO Device not configured. There is something wrong with that device.
You need to debug that first.

https://www.freebsd.org/cgi/man.cgi?query=3Derrno&sektion=3D2&manpath=3Dfre=
ebsd-release-ports

Thanks,
Tadeusz
--===============5194781364699644439==--

