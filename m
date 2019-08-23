Content-Type: multipart/mixed; boundary="===============3324468781823592435=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] [Help] what the default parameter of tpm2-tools
Date: Fri, 23 Aug 2019 17:15:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEE4CC@ORSMSX101.amr.corp.intel.com>
In-Reply-To: A888B25CD99C1141B7C254171A953E8E49067334@shsmsx102.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3324468781823592435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm on git sha's:
Tpm2-tools:   1fe9e8
Tpm2-tss:        3440cd
Tpm2-abrmd: 69e00f

I cannot reproduce.

./tools/tpm2_getrandom 3 | xxd
00000000: 6fa7 e0                                  o..
wcrobert(a)wcrobert-MOBL1:~/workspace/tpm2-tools$


> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Zhao, Shirley
> Sent: Thursday, August 15, 2019 4:14 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] [Help] what the default parameter of tpm2-tools
> =

> Hi, all,
> =

> =

> =

> I just downloaded tpm2-tss, tpm2-tool, and tpm2-abrmd from master, compile
> and install using the following command.
> =

> *	Tpm2-tss
> =

> $ git clone https://github.com/tpm2-software/tpm2-tss.git
> =

> $ cd tpm2-tss
> =

> $ ./bootstrap
> =

> $ ./configure --prefix=3D/usr
> =

> $ make -j5
> =

> $ sudo make install
> =

> *	Tpm2-abrmd
> =

> $ git clone https://github.com/tpm2-software/tpm2-abrmd.git
> =

> $ cd tpm2-abrmd
> =

> $ ./bootstrap
> =

> $ ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d
> =

> --with-udevrulesdir=3D/usr/lib/udev/rules.d
> =

> --with-systemdsystemunitdir=3D/usr/lib/systemd/system
> =

> --libdir=3D/usr/lib64 --prefix=3D/usr
> =

> $ make -j5
> =

> $ sudo make install
> =

> *	Tpm2-tools
> =

> $ git clone https://github.com/tpm2-software/tpm2-tools.git
> =

> $ cd tpm2-tools
> =

> $ ./bootstrap
> =

> $ ./configure --prefix=3D/usr
> =

> $ make -j5
> =

> $ sudo make install
> =

> =

> =

> =

> =

> Start tpm simulator and tpm2-abrmd as below:
> =

> $tpm_server =E2=80=93rm
> =

> $sudo tpm2-abrmd --allow-root --tcti=3Dmssim
> =

> =

> =

> Previously, run tpm2_tool command can connect to simulator directly.
> =

> But this time, I got error like.
> =

> $tpm2_getrandom 3
> =

> ERROR:tcti:src/tss2-tcti/tcti-device.c:440:Tss2_Tcti_Device_Init() Failed=
 to open
> device file /dev/tpm0: No such file or directory
> =

> WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for fu=
nction
> 0x7fc15195c1f1 failed with a000a
> =

> WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not initia=
lize TCTI
> named: tcti-device
> =

> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not init=
ialize TCTI
> file: libtss2-tcti-default.so
> =

> ERROR:tcti:src/tss2-tcti/tcti-device.c:440:Tss2_Tcti_Device_Init() Failed=
 to open
> device file /dev/tpmrm0: No such file or directory
> =

> WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for fu=
nction
> 0x7fc15195c1f1 failed with a000a
> =

> WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not initia=
lize TCTI
> named: tcti-device
> =

> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not init=
ialize TCTI
> file: libtss2-tcti-device.so.0
> =

> ERROR:tcti:src/tss2-tcti/tcti-device.c:440:Tss2_Tcti_Device_Init() Failed=
 to open
> device file /dev/tpm0: No such file or directory
> =

> WARNING:tcti:src/tss2-tcti/tctildr.c:62:tcti_from_init() TCTI init for fu=
nction
> 0x7fc15195c1f1 failed with a000a
> =

> WARNING:tcti:src/tss2-tcti/tctildr.c:92:tcti_from_info() Could not initia=
lize TCTI
> named: tcti-device
> =

> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:150:tcti_from_file() Could not init=
ialize TCTI
> file: libtss2-tcti-device.so.0
> =

> =

> =

> =

> =

> If I point to simulator, got some unknown text, like:
> =

> $tpm2_getrandom 3 --tcti=3Dmssim
> =

> =E2=96=92g=E2=96=92
> =

> =

> =

> What=E2=80=99s wrong with my step? Is there any new guide to run these to=
ols?
> =

> =

> =

> Thanks.
> =

> =

> =

> -        Shirley
> =

> =

> =

> =

> =

> =

> =

> =



--===============3324468781823592435==--

