Content-Type: multipart/mixed; boundary="===============7209169233493808525=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] QUEMU and TPM2 device emulation
Date: Wed, 14 Oct 2020 15:27:53 +0000
Message-ID: <SN6PR11MB34372D6EA769E056632095CFB8050@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7209169233493808525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Has anyone ever setup a QUEMU instance with a virtualized TPM? I need to tr=
y and replicate an issue with the in-kernel Resource manager. My goal is to=
 use the integrated QUEMU support
To bring up an emulated TPM device and it's associated RM node @ /dev/tpmrm=
0.

I am looking at:
https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/do=
cs/specs/tpm.txt

Which shows this command:

qemu-system-x86_64 -display sdl -enable-kvm \
  -m 1024 -boot d -bios bios-256k.bin -boot menu=3Don \
  -chardev socket,id=3Dchrtpm,path=3D/tmp/mytpm1/swtpm-sock \
  -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
  -device tpm-tis,tpmdev=3Dtpm0 test.img

<snip>
#> dmesg | grep -i tpm
[    0.711310] tpm_tis 00:06: 1.2 TPM (device=3Did 0x1, rev-id 1)

I have a few questions around this that I cannot seem to dig up any documen=
tation on:
1. How to specify TPM2.0 device? The project https://github.com/stefanberge=
r/swtpm/wiki seems to indicate it would be supported.

2. Does anyone know the minimum QUEMU version for this support? I looked in=
 the CHANGELOG here, https://wiki.qemu.org/ChangeLog from version 2.8 to 5.=
2 and never saw anything
Call out TPM 2.0 specifically.

3. Does anyone have or know of better documentation to set this up? If thei=
r isn't better documentation, should we (read I) create it? This seems like=
 a pretty handy feature.

Thanks,
Bill
--===============7209169233493808525==--

