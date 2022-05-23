Content-Type: multipart/mixed; boundary="===============7988215116060227509=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Virtualbox ubuntu 22.04 guest with tpm_server
Date: Mon, 23 May 2022 16:14:51 +0000
Message-ID: <e65bdebc22c58fbfedaebdc55373aaa1c0a8f7f0.camel@intel.com>
In-Reply-To: 20220523154415.2134.74422@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7988215116060227509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-05-23 at 15:44 +0000, dawn.howe(a)alten.com wrote:
> I am developing a c++ application for a dell server running ubuntu
> 22.04. The application needs to store private keys and use them to
> decrypt files.
> =

> Before working on target hardware, I'm trying to get a virtualbox
> environment set up to use a simulated TPM2.  Before writing the C++
> application I'd like to get some command line tools working. I have
> struggled for a week following instructions I've found (for example: =

> https://tpm2-tools.readthedocs.io/en/latest/INSTALL/, =

> https://francislampayan.medium.com/how-to-setup-tpm-simulator-in-ubuntu-2=
0-04-25ec673b88dc
> , etc). I am trying to use IBM's SWTPM2, but have not had any luck.
> =

> Virtualbox 6.1.30
> Windows 10 host
> Ubuntu 22.04 server guest
> =

> TPM SERVER SIMULATOR
> First, I'm installing tpm_server. Since ubuntu 22.04 uses openssl3.0,
> I cannot use v1661, but instead am getting the latest version from
> the "next" branch:
> $ git clone https://git.code.sf.net/p/ibmswtpm2/tpm2 ibmswtpm2-tpm2
> $ cd ibmswtpm2-tpm/src
> $ make
> =

> TPM2 - ABRMD
> $ git clone https://github.com/tpm2-software/tpm2-abrmd.git
> $ cd tpm2-abrmd
> $ ./bootstrap
> $ ./configure \
> --with-dbuspolicydir=3D/etc/dbus-1/system.d \
> --with-systemdsystemunitdir=3D/usr/lib/systemd/system \
> --libdir=3D/usr/lib64 --prefix=3D/usr =

> $ make -j5
> $ sudo make install
> =

> TPM2 - tss
> $ git clone https://github.com/tpm2-software/tpm2-tss.git
> $ cd tpm2-tss
> $ ./bootstrap
> $ ./configure
> $ make
> $ sudo make install
> $ sudo ldconfig
> =

> TPM2 - tools
> $ git clone https://github.com/tpm2-software/tpm2-tools.git
> $ cd tpm2-tools
> $ ./bootstrap
> $ ./configure --prefix=3D/usr
> $ make -j5
> $ sudo make install
> =

> I'm just starting things on the command line, before makin them
> services. In one window I start the TPM simulator:
> $ tpm2_server
> =

> In another window I start the ABRMD:
> sudo -u tss tpm2-abrmd --tcti=3D"libtss2-tcti-
> mssim.so.0:host=3D127.0.0.1,port=3D2321"

You can drop all the tcti specific options, those are the defaults.
You can also just use the short name.

sudo -u tss tpm2-abrmd --tcti=3Dmssim

> I see this in the window that started the TPM server:
> LIBRARY_COMPATIBILITY_CHECK is ON
> Starting ACT thread...
> TPM command server listening on port 2321
> Platform server listening on port 2322
> Command IPv4 client accepted
> Platform IPv4 client accepted
> =

> Then I try to run a command line tool:
> tpm2_pcrread
> ERROR:tcti:src/tss2-tcti/tcti-device.c:452:Tss2_Tcti_Device_Init()
> Failed to open specified TCTI device file /dev/tpmrm0: No such file
> or directory
> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() Could not
> initialize TCTI file: libtss2-tcti-device.so.0
> ERROR:tcti:src/tss2-tcti/tcti-device.c:452:Tss2_Tcti_Device_Init()
> Failed to open specified TCTI device file /dev/tpm0: No such file or
> directory
> ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() Could not
> initialize TCTI file: libtss2-tcti-device.so.0
> =

> And I get no output.  I feel like I'm not configuring the TSS
> correctly. Can anyone give me insight on how to run this?  Should I =


what is the output of tpm2_pcrread --version?

For example:
tpm2_pcrread --version
tool=3D"tpm2_pcrread" version=3D"5.2-158-g5a19b856d02a" tctis=3D"libtss2-
tctildr" tcti-default=3Dtcti-abrmd

Notice the "tcti-defualt" field is set to "tcti-abrmd". That means it's
going to try abrmd first, but for some reason something is failing.
When you get a failure it will try other TCTI's as well. I wonder what
your version thinks is the default-tcti. For some reason it's not
seeing tpm2-abrmd, which makes me think if its not visable on dbus for
some reason. In commit 0c659acc0e of tpm2-abrmd I changed the
permission in tpm2-abrmd to be, in essence, 0660 tss tss to match the
in-kernel /dev/tpmrm0 permissions. I wonder if your current user that
is running the tpm2_pcrread command is part of the tss group? Is your
clone of tpm2-abrmd new enough to contain that commit? You can look
using git branch --contains like so:

git branch --contains 0c659ac
* master

Note the star indicated the checked out branch, so it has it.

If you have that commit, you need to be group tss. Try looking at
groups output, it should have group tss like my example output below:

groups
wcrobert adm cdrom sudo dip plugdev tss lpadmin lxd sambashare docker

Let me know if any of that helps.

> be using a different simulator? I haven't found any good instructions
> for how to run https://github.com/stefanberger/swtpm in a virtualbox
> guest.

That shouldn't matter, it'd be the same for any linux machine. This is
what I do:

swtpm socket --tpm2 \
      --server port=3D2321 \
      --ctrl type=3Dtcp,port=3D2322 \
      --flags not-need-init --tpmstate dir=3D"$PWD" &



--===============7988215116060227509==--

