Content-Type: multipart/mixed; boundary="===============6821681651733148383=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] ERROR: Failed to initialize tcti context: 0x1
Date: Fri, 22 Sep 2017 01:42:57 +0200
Message-ID: <06aae075-939c-2b4a-30a3-9be820356860@redhat.com>
In-Reply-To: a34d069a-1e5d-c72d-a931-4767645353b9@arm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6821681651733148383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Stuart,

On 09/21/2017 11:48 PM, Stuart Yoder wrote:
> I'm trying to build/test tpm2-tools and am running into an issue.  This i=
s on
> an Ubuntu 16.04 machine and I know the tpm is alive and functioning
> because the distro tpm2-tools package worked.  That's an older codebase, =
so I
> wanted to build everything from source.
> =

> So I've successfully built:  tpm2-tss, tpm2-tools, tpm2-abrmd.
> =

> I followed the build/install instructions here:
> https://github.com/01org/tpm2-abrmd/issues/92
> ...which seem to follow what is recommended in INSTALL.md.
>

Since your distro is Ubuntu, and you want to use the tabrmd resource manage=
r and
the simulator, I would double check your steps with the ones made by the Tr=
avis
CI, since it does the same that you want:

https://github.com/01org/tpm2-tools/blob/master/.travis.yml#L51

If you find any divergence between what's done there and the INSTALL file, =
please
file an issue.
 =

> I start tpm2-abrmd like this:
> sudo -u tss tpm2-abrmd --tcti=3Ddevice &
>

I think the problem is that you are using --tcti=3Ddevice (and so telling t=
he RM
to access the TPM device directly). But IIUC you want to use the simulator,=
 so
instead need to do:

$ sudo -u tss tpm2-abrmd --tcti=3Dsocket =


> ..and it runs, but when running a command like
> tpm2_pcrlist I get this error:
> =

>    ERROR: Failed to initialize tcti context: 0x1
> =

> Also, I built abrmb with these options:
> --enable-unit --with-simulatorbin=3D/usr/local/bin/tpm_server
> =

> ...and ran make check.  The unit tests pass, but the
> integration tests fail.
> =

> Anything obvious I am missing?
> =

> Thanks,
> Stuart
 =

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============6821681651733148383==--

