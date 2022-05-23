Content-Type: multipart/mixed; boundary="===============2482169218297711783=="
MIME-Version: 1.0
From: dawn.howe at alten.com
Subject: [tpm2] Virtualbox ubuntu 22.04 guest with tpm_server
Date: Mon, 23 May 2022 15:44:15 +0000
Message-ID: <20220523154415.2134.74422@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2482169218297711783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I am developing a c++ application for a dell server running ubuntu 22.04. T=
he application needs to store private keys and use them to decrypt files.

Before working on target hardware, I'm trying to get a virtualbox environme=
nt set up to use a simulated TPM2.  Before writing the C++ application I'd =
like to get some command line tools working. I have struggled for a week fo=
llowing instructions I've found (for example: https://tpm2-tools.readthedoc=
s.io/en/latest/INSTALL/, https://francislampayan.medium.com/how-to-setup-tp=
m-simulator-in-ubuntu-20-04-25ec673b88dc, etc). I am trying to use IBM's SW=
TPM2, but have not had any luck.

Virtualbox 6.1.30
Windows 10 host
Ubuntu 22.04 server guest

TPM SERVER SIMULATOR
First, I'm installing tpm_server. Since ubuntu 22.04 uses openssl3.0, I can=
not use v1661, but instead am getting the latest version from the "next" br=
anch:
$ git clone https://git.code.sf.net/p/ibmswtpm2/tpm2 ibmswtpm2-tpm2
$ cd ibmswtpm2-tpm/src
$ make

TPM2 - ABRMD
$ git clone https://github.com/tpm2-software/tpm2-abrmd.git
$ cd tpm2-abrmd
$ ./bootstrap
$ ./configure \
--with-dbuspolicydir=3D/etc/dbus-1/system.d \
--with-systemdsystemunitdir=3D/usr/lib/systemd/system \
--libdir=3D/usr/lib64 --prefix=3D/usr =

$ make -j5
$ sudo make install

TPM2 - tss
$ git clone https://github.com/tpm2-software/tpm2-tss.git
$ cd tpm2-tss
$ ./bootstrap
$ ./configure
$ make
$ sudo make install
$ sudo ldconfig

TPM2 - tools
$ git clone https://github.com/tpm2-software/tpm2-tools.git
$ cd tpm2-tools
$ ./bootstrap
$ ./configure --prefix=3D/usr
$ make -j5
$ sudo make install

I'm just starting things on the command line, before makin them services. I=
n one window I start the TPM simulator:
$ tpm2_server

In another window I start the ABRMD:
sudo -u tss tpm2-abrmd --tcti=3D"libtss2-tcti-mssim.so.0:host=3D127.0.0.1,p=
ort=3D2321"

I see this in the window that started the TPM server:
LIBRARY_COMPATIBILITY_CHECK is ON
Starting ACT thread...
TPM command server listening on port 2321
Platform server listening on port 2322
Command IPv4 client accepted
Platform IPv4 client accepted

Then I try to run a command line tool:
tpm2_pcrread
ERROR:tcti:src/tss2-tcti/tcti-device.c:452:Tss2_Tcti_Device_Init() Failed t=
o open specified TCTI device file /dev/tpmrm0: No such file or directory
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() Could not initia=
lize TCTI file: libtss2-tcti-device.so.0
ERROR:tcti:src/tss2-tcti/tcti-device.c:452:Tss2_Tcti_Device_Init() Failed t=
o open specified TCTI device file /dev/tpm0: No such file or directory
ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() Could not initia=
lize TCTI file: libtss2-tcti-device.so.0

And I get no output.  I feel like I'm not configuring the TSS correctly. Ca=
n anyone give me insight on how to run this?  Should I be using a different=
 simulator? I haven't found any good instructions for how to run https://gi=
thub.com/stefanberger/swtpm in a virtualbox guest.
--===============2482169218297711783==--

