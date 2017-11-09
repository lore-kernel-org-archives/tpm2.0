Content-Type: multipart/mixed; boundary="===============7227137394275248832=="
MIME-Version: 1.0
From: flihp <flihp at twobit.us>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Thu, 09 Nov 2017 07:25:07 -0800
Message-ID: <e90e9fd3-a801-6763-9675-9852605beb2c@twobit.us>
In-Reply-To: 1510232036.22094.29.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7227137394275248832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

On 11/09/2017 04:53 AM, Patrick Ohly wrote:
> Hello!
> =

> I am trying to port the refkit support for whole-disk encryption from
> TPM 1.2 to TPM 2.0. In refkit, an installer image sets up the internal
> disk with the root partition encrypted with LUKS. The initramfs then
> unlocks that partition before mounting it and transferring control to
> /bin/init. TPM NVRAM is used to store a per-machine LUKS password.

You may also want to take a look at similar work WindRiver has done with
tying disk encryption to the TPM2. Checking your code against an
existing implementation may be a good way to remove some variables from
your debugging:

https://github.com/WindRiver-OpenSourceLabs/cryptfs-tpm2

Regards,
Philip

> The automated tests uses QEMU + swtpm. More precisely, I am using QEMU
> 2.10.0 with backported chardev patches plus a custom patch that makes
> it possible to have QEMU start swtpm.=C2=A0 swtpm and libtpms are from the
> current tpm2-preview branches (5c70e401824e4f3f0900bddb50e7ea5fb7bbd84f
> resp. e0331c6d71b273ef7f71ce6fa17306f6773f543e).
> =

> I'm using tpm2.0-tools v2.1.0. Kernel is 4.9.
> =

> In this setup, I get a TPM2.0 /dev/tpm0 in the virtual machine when I
> start QEMU with:
> =

> -chardev 'socket,id=3Dchrtpm0,cmd=3Dexec swtpm_oe.sh socket --terminate -=
-ctrl type=3Dunixio,,clientfd=3D0 --tpmstate dir=3D... --log level=3D10,,fi=
le=3D.../swtpm.log --tpm2' \
> -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm0 \
> -device tpm-tis,tpmdev=3Dtpm0=C2=A0
> =

> The whole thing is built with Yocto/OE-Core, hence the swtpm_oe.sh
> wrapper script. It just sets some paths, then calls swtpm.
> =

> There are automated tests, too. All of this was working with TPM1.2.
> With TPM2.0, I have everything set up and installing to internal disk
> works without issues. But after rebooting the virtual machine, the
> NVRAM no longer contains the password. tpm2_nvlist shows nothing.
> =

> I'm unsure whether this is an issue in tpm2.0-tools, in swtpm2, or my
> usage of both. Let me describe in more details what commands are used. =

> =

> The virtual TPM gets initialized with:
>     swtpm_setup_oe.sh --tpm2 --tpm-state ... --createe
> =

> The commands that run as part of installation are:
>     tpm2_takeownership -o ownerpass -e endorsepass -l lockpass
>     tpm2_nvdefine -x 0x1500001 -s 40 -a 0x40000001 -t 0x80020002 -P owner=
pass
>     tpm2_nvwrite -x 0x1500001 -a 0x40000001 -f /dev/shm/keydir.sVrmLQ/key=
file -P ownerpass
>     52 45 46 4b 49 54 5f 30 70 e6 2b b9 ca 0c 1c 00 1d 6d eb 58 a1 7a cf =
0d 1d 71 46 bc fd 7a 80 a0 8f 8b 0a 30 fc 89 9b db=C2=A0
> =

>     tpm2_nvlist
>     1 NV indexes defined.
> =

>     =C2=A0 0. NV Index: 0x1500001
>     =C2=A0 {
>     	    Hash algorithm(nameAlg):11
>     =C2=A0    	    The Index attributes(attributes):0xa0020002
>     =C2=A0    	    The size of the data area(dataSize):40
>     =C2=A0=C2=A0=C2=A0}
> =

>     tpm2_nvreadlock -x 0x1500001 -a 0x40000001 -P ownerpass
> =

> =

> Then the initramfs does:
>     tpm2_nvlist
>     0 NV indexes defined.
> =

>     tpm2_nvread -x 0x1500001 -a 0x40000001 -s 40 -o 0 -P ownerpass
>     ERROR: Failed to read NVRAM area at index 0x1500001 (22020097). Error=
:0x28b
> =

> I tried also without tpm2_nvreadlock and without tpm2_takeownership,
> but neither of that made a difference.
> =

> Conceptually this is similar to the commands used with TPM 1.2. The
> simplifying assumption is=C2=A0that only a single OS is getting installed=
 to
> virgin hardware and then Secure Boot ensures that no other code ever
> gets access to the active TPM. Therefore a fixed index and no real
> access protection for the slot are okay. A read-lock is set to ensure
> that the key is protected from potentially malicious applications which
>  might have access to /dev/tpm0. Does that sound alright?
> =

> The index was chosen as in the tpm2.0-tools Wiki (https://github.com/in
> tel/tpm2-tools/wiki/How-to-use-tpm2-tools). Is there anything special
> about that index?
> =

> I checked the swtpm.log (log level 10). Somehow it only contains
> SWTPM_IO_Read/Write entries. I'll check whether logging perhaps also
> needs to be enabled during compilation.
> =

> Any other suggestions for how I could debug this?
> =



--===============7227137394275248832==--

