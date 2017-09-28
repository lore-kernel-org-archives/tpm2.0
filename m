Content-Type: multipart/mixed; boundary="===============8843616028415655401=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2-abrmd and tpm2_tools collision
Date: Thu, 28 Sep 2017 12:11:59 +0200
Message-ID: <bf78faea-0e4a-1fc7-5f62-3c9a097eaf3d@redhat.com>
In-Reply-To: 54CD2916B052E04BBDD1393A6800D9FDDB6A9C78@NJ350EX02.ztgroup.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8843616028415655401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/28/2017 09:12 AM, Slash Wu wrote:
> Hi,
> =

> I launched tpm2-abrmd, and then the tpm2-tools (e.g. tpm2_nvlist) failed =
with the following msg, but it worked without the tpm2-abrmd been launched,=
 why ?
> =

> # /usr/local/bin/tpm2_nvlist -T device
> ERROR: Failed to initialize device TCTI context: 0xa000a
>

It's expected. If the tpm2-abrmd is running, then it has opened the TPM dev=
ice.
So when the device TCTI library tries to open the device again, the driver =
will
return an -EBUSY error.

You can easily check this by running your process with strace or enabling t=
he
dynamic debug log messages for the TPM driver:

$ strace -f -eopenat tpm2_pcrlist -T device:/dev/tpm0 2>&1 | grep "/dev/tpm=
0"
openat(AT_FDCWD, "/dev/tpm0", O_RDWR)   =3D -1 EBUSY (Device or resource bu=
sy)

$ echo 'file drivers/char/tpm/tpm-dev.c +p' > /sys/kernel/debug/dynamic_deb=
ug/control

$ dmesg | grep tpm
[71684.903356] tpm tpm0: Another process owns this TPM

What's your use case to bypass the tpm2-abrmd? I don't think that's a good =
idea.
 =

> Thanks.
> =

> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============8843616028415655401==--

