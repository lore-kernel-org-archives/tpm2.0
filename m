Content-Type: multipart/mixed; boundary="===============4465667561148985412=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Cannot execute commands on TPM2-Simulator
Date: Tue, 03 Apr 2018 12:24:11 +0200
Message-ID: <a98c9636-5cf4-3605-5644-4878ad403d4a@redhat.com>
In-Reply-To: eaf4625d-be32-6a87-7e07-099389781b54@sg.bosch.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4465667561148985412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 04/03/2018 11:30 AM, fixed-term.Jan.Bissinger wrote:
> Hi everyone,
> =

> I just setup the complete stack with the following versions:
> =

>     tpm2-tools: master (as of 03/04/2018)
> =

>     tpm2-tss: master (as of 03/04/2018)
> =

>     tpm2-abrmd: 1.3.1
> =


Did you build in this order? You should instead build:

tpm2-tss
tpm2-abrmd
tpm2-tools

Otherwise the tpm2-tools won't be built with tpm2-abrmd support.

> I am running Ubuntu 14.02 on my machine.
> =

> I have two questions:
> =

> _1) Executing of tpm2_* commands_
> =

> I was able to compile and install all files. Now, I want to execute e.g. =

> the command tpm2_getrandom 4, so this is what I am doing:
> =

>     $ sudo ./~/tpm2/tpm2-simulator/src/tpm_server & // starts
>     successfully and also logs when tpm2-abrmd is connected
> =

>     $ sudo ./~/tpm2/tpm-abrmd/tpm2-abrmd --tcti=3Dsocket // without
>     --tcti=3Dsocket I get the error "TCTI initialization failed: 0xa000a"
>

I believe the default is to use the device TCTI, can you check the
permission bits for /dev/tpm* ?

>     $ sudo ./~/tpm2/tpm-tools/tools/tpm2_startup // as required in the
>     documentation of the TPM2-simulator
> =

>     $ sudo ./~/tpm2/tpm-tools/tools/tpm2_getrandom 4
> =

> However, there is nothing happening. I can only cancel with CRTL+C. Same =

> behavior for e.g. tpm2_pcrlist
> =

> _2) Not full range of tpm2_* commands_
> =

> The executables in my ~/tpm2/tpm-tools/tools/-directory are not =

> complete. Several commands, like e.g. tpm2_version or tpm2_takeownership
>

I don't think there was ever tpm2_version tool... but tpm2_takeownership
doesn't exist in master anymore. Now you should use tpm2_changeauth.
 =

> How is that possible?
> =

> Thanks
> =

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============4465667561148985412==--

