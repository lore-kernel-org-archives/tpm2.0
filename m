Content-Type: multipart/mixed; boundary="===============0395349159961163694=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: QUEMU and TPM2 device emulation
Date: Wed, 14 Oct 2020 19:43:38 +0000
Message-ID: <SN6PR11MB3437AF5422ABFC3D20052822B8050@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: dfbdf8575aa358864a99a9e51ccd885a943f27e5.camel@HansenPartnership.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0395349159961163694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: James Bottomley <James.Bottomley(a)HansenPartnership.com>
> Sent: Wednesday, October 14, 2020 11:32 AM
> To: Roberts, William C <william.c.roberts(a)intel.com>; tpm2(a)lists.01.o=
rg; linux-
> integrity(a)vger.kernel.org
> Subject: Re: QUEMU and TPM2 device emulation
> =

> On Wed, 2020-10-14 at 15:27 +0000, Roberts, William C wrote:
> > Has anyone ever setup a QUEMU instance with a virtualized TPM? I need
> > to try and replicate an issue with the in-kernel Resource manager. My
> > goal is to use the integrated QUEMU support To bring up an emulated
> > TPM device and it's associated RM node @ /dev/tpmrm0.
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
> > documentation on:
> > 1. How to specify TPM2.0 device? The project
> > https://github.com/stefanberger/swtpm/wiki seems to indicate it would
> > be supported.
> =

> All QEMU is doing is passing through a socket to something as a TPM.
> Either TPM 1.2 or 2.0 could be on the end of that socket, so what really =
matters is
> what's at the other end of /tmp/mytpm1/swtpm-sock.
> If you change that to be TPM 2.0 then QEMU will see it.

Thanks James, once I started fiddling with it, it started to make sense. Yo=
u need to start the swtpm component
with the option --tpm2, then pass through everything else in qemu the same =
way, as you point out.

Ill post my commands for anyone else who may stumble into this on their que=
st:

## Start TPM Emulator

Note that one needs the --tpm2 option to start a TPM2.0 emulator.

mkdir /tmp/mytpm1
swtpm socket --tpmstate dir=3D/tmp/mytpm1 --ctrl type=3Dunixio,path=3D/tmp/=
mytpm1/swtpm-sock --log level=3D20 --tpm2

## Boot the VM
qemu-system-x86_64 -hda ~/qemu-images/ubuntu-20.04-amd64.img -boot d -m 204=
8 -enable-kvm -chardev socket,id=3Dchrtpm,path=3D/tmp/mytpm1/swtpm-sock -tp=
mdev emulator,id=3Dtpm0,chardev=3Dchrtpm -device tpm-tis,tpmdev=3Dtpm0


--===============0395349159961163694==--

