Content-Type: multipart/mixed; boundary="===============7618836381555290386=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: QUEMU and TPM2 device emulation
Date: Wed, 14 Oct 2020 19:44:56 +0000
Message-ID: <SN6PR11MB34376F61682669164004284EB8050@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: 20201014155815.GA7562@mail.hallyn.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7618836381555290386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Serge E. Hallyn <serge(a)hallyn.com>
> Sent: Wednesday, October 14, 2020 10:58 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org; ryaharpe(a)cisco.com; scmoser(a)cisco.com; linux-
> integrity(a)vger.kernel.org
> Subject: Re: QUEMU and TPM2 device emulation
> =

> On Wed, Oct 14, 2020 at 03:27:53PM +0000, Roberts, William C wrote:
> > Has anyone ever setup a QUEMU instance with a virtualized TPM? I need
> > to try and replicate an issue with the in-kernel Resource manager. My g=
oal is to
> use the integrated QUEMU support To bring up an emulated TPM device and i=
t's
> associated RM node @ /dev/tpmrm0.
> >
> > I am looking at:
> > https://android.googlesource.com/platform/external/qemu/+/emu-master-d
> > ev/docs/specs/tpm.txt
> >
> > Which shows this command:
> >
> > qemu-system-x86_64 -display sdl -enable-kvm \
> >   -m 1024 -boot d -bios bios-256k.bin -boot menu=3Don \
> >   -chardev socket,id=3Dchrtpm,path=3D/tmp/mytpm1/swtpm-sock \
> >   -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
> >   -device tpm-tis,tpmdev=3Dtpm0 test.img
> >
> > <snip>
> > #> dmesg | grep -i tpm
> > [    0.711310] tpm_tis 00:06: 1.2 TPM (device=3Did 0x1, rev-id 1)
> >
> > I have a few questions around this that I cannot seem to dig up any
> documentation on:
> > 1. How to specify TPM2.0 device? The project
> https://github.com/stefanberger/swtpm/wiki seems to indicate it would be
> supported.
> >
> > 2. Does anyone know the minimum QUEMU version for this support? I
> > looked in the CHANGELOG here, https://wiki.qemu.org/ChangeLog from
> version 2.8 to 5.2 and never saw anything Call out TPM 2.0 specifically.
> =

> 2.11 should suffice.
> =

> > 3. Does anyone have or know of better documentation to set this up? If =
their
> isn't better documentation, should we (read I) create it? This seems like=
 a pretty
> handy feature.
> =

> I'm not sure how relevant this is any more, but I did this about two year=
s ago and
> documented it at https://s3hh.wordpress.com/2018/06/03/tpm-2-0-in-qemu/

Thanks, yeah I stumbled into this, it was super helpful. I got it working a=
nd posted back
With my commands.

--===============7618836381555290386==--

