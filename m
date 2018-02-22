Content-Type: multipart/mixed; boundary="===============5906589950423233569=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Library libtcti-device.so not found in initramfs
Date: Thu, 22 Feb 2018 00:48:48 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563FEEBC34@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 08b9d880f9d34497b940d522ff111f07@WIN0011224.engel.int
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5906589950423233569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When you specify --tcti=3Ddevice, the tool attempts to:
1. dlopen exactly what was provided, as this could be a path/proper library=
 name, so in this case dlopen("device"), which fails.
2. dlopen(libtcti-device.so) which fails.

In this case, you would need to have libtcti-device.so packaged in the init=
ramfs, and I'm assuming dlopen() is smart enough to
find it. (dlopen has its own search rules and respects LD_LIBRARY_PATH). Yo=
u could optionally pass the library path to
the --tcti option, so dlopen doesn't perform it's search practices: --tcti=
=3D/usr/local/lib/libtcti-device.so

Bill

--EOF--

From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Schoenberger K=
laus
Sent: Wednesday, February 21, 2018 6:44 AM
To: 'tpm2(a)lists.01.org' <tpm2(a)lists.01.org>
Subject: [tpm2] Library libtcti-device.so not found in initramfs

Hello everyone,
=C2=A0
I want to use tpm2_tools in the initramfs, but I get following error:
=C2=A0
>(initramfs) /usr/local/bin/tpm2_pcrlist --tcti=3Ddevice
> ERROR: Could not dlopen library: "libtcti-device.so"
> ERROR: Unknown tcti, got: "device"
=C2=A0
When=C2=A0I run the command in my local Terminal (after I stopped the tpm2-=
abrmd=C2=A0service) everything works fine and I receive the PCR-Values from=
 the tpm 2.0.
=C2=A0
What i have done:

I've searched the dependencies from tpm2_nvread and tpm2_pcrlist for an ini=
tramfs-hook:
> root(a)ts:~# ldd $(which tpm2_nvread)
> linux-vdso.so.1 =3D> (0x00007ffe4b5b7000)
> libsapi.so.0 =3D> /usr/local/lib/libsapi.so.0 (0x00007fb1a429f000)
> libmarshal.so.0 =3D> /usr/local/lib/libmarshal.so.0 (0x00007fb1a4061000)
> libcrypto.so.1.0.0 =3D> /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 (0x00007=
fb1a3c1d000)
> libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fb1a3a19000)
> libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fb1a364f000)
> /lib64/ld-linux-x86-64.so.2 (0x00007fb1a46d1000)
=C2=A0
Then i generated a initramfs-hook where i copied the binaries and the libra=
ries from above to initramfs. Additionally I copied the libtcti-device.so t=
o initramfs (every file to the same location as in the main system). Afterw=
ards I created an initramfs-script to the init-premount scripts that will r=
ead the data from the tpm2 and i included the tpm_crb Kernelmodule to the i=
nitramfs.
=C2=A0
Afterwards I=C2=A0generated a new Initramfs with update-initramfs -u and re=
booted the system. Then the error occurs.
I added the boot option "break=3Dmount" to drop to an initramfs shell, so t=
hat I can test and verify everything by myself. --> Every library and binar=
y is at the right directory and I have no idea what I can do, to manually c=
onfigure the path from the libtcti-device.so. Furthermore=C2=A0I don't want=
 to run the whole tpm2-abrmd in initramfs because then I have problems with=
 dbus and so on...
=C2=A0
Btw: I'm on Ubuntu 16.04 LTS with Kernel 14.04 and I'm using tpm2-tools und=
 tpm2-tss master branch.
=C2=A0
Please, can anyone help me?
=C2=A0
Best regards,
Klaus

Important Notice:
This electronic transmission (including any attachments) is intended solely=
 for the use and information
of the addressee(s). It may contain confidential or legally privileged info=
rmation. Any unauthorized use
or disclosure of this message is strictly prohibited.If you are not the int=
ended recipient, please notify
the sender immediately and delete the message and its attachments.
The sender does not guarantee the integrity of this transmission and shall =
therefore never be liable if
the message is altered or falsified nor for any virus, interception or dama=
ge to your system.

--===============5906589950423233569==--

