Content-Type: multipart/mixed; boundary="===============2867776982489143494=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Advice on Building tpm-tools
Date: Tue, 16 Oct 2018 18:02:20 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C5EF29@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CY4PR18MB098126C0197707B3224C7561FDFD0@CY4PR18MB0981.namprd18.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2867776982489143494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For tpm2-tools that looks right, and the version matrix last I knew was cor=
rect also.

Master branch should work off the latest release of the TSS code, what issu=
es are you facing?

> -----Original Message-----
> From: tpm2 [mailto:tpm2-bounces(a)lists.01.org] On Behalf Of Bryan Diehl
> Sent: Monday, October 15, 2018 10:17 AM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] Advice on Building tpm-tools
> =

> I am trying to build and test the latest tpm-tools for tpm 2.0 and am hav=
ing
> problems with errors from unit and integration tests.
> =

> Then I realized that I was using master branches and should be using rele=
ased
> branches.
> =

> =

> =

> Per https://github.com/tpm2-software/tpm2-tools/blob/master/INSTALL.md
> <https://github.com/tpm2-software/tpm2-tools/blob/master/INSTALL.md>
> =

> I should be using:
> =

> tpm2-tools          version 3.1.0
> =

> tpm2-tss              version 2.0.0
> =

> tpm2-abrmd      version 2.0.0
> =

> =

> =

> tpm2-tss
> =

> https://github.com/tpm2-software/tpm2-tss
> =

> git clone https://github.com/tpm2-software/tpm2-tss.git
> =

> cd tpm2-tss
> =

> git checkout 2.0.x    #branch 2.0.x
> =

> =

> =

> tpm2-abrmd
> =

> git clone https://github.com/tpm2-software/tpm2-abrmd.git
> =

> cd tpm2-abrmd
> =

> git checkout tags/2.0.0   #tag 2.0.0
> =

> =

> =

> tpm2-tools
> =

> https://github.com/tpm2-software/tpm2-tools
> =

> git clone https://github.com/tpm2-software/tpm2-abrmd.git
> =

> cd tpm2-abrmd
> =

> git checkout tags/3.1.0   #tag 3.1.0
> =

> =

> =

> tpm-server (tpm emulator)
> =

> https://sourceforge.net/projects/ibmswtpm2
> =

> ibmtss1331.tar.gz
> =

> Is 1331 the correct version to be using with the above tools, tss, and ab=
rmd?
> =

> =

> =

> Are these the correct versions of each project to work together?
> =

> I need to be doing testing at least installing certificates and generatin=
g ECDSA
> asap.
> =

> I cannot get these tools to build without error.
> =

> =

> =

> Here are my install/build scripts:
> =

> =

> =

> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> # tpm2-tss - ONE TIME ONLY - git source code and select the correct branch
> =

> =

> =

> cd ~/src
> =

> =

> =

> git clone https://github.com/tpm2-software/tpm2-tss.git
> =

> cd tpm2-tss
> =

> git checkout 2.0.x
> =

> =

> =

> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> # tpm2-tss - Update Source and Build
> =

> =

> =

> cd ~/src/tpm2-tss
> =

> make clean
> =

> git pull
> =

> =

> =

> ./bootstrap
> =

> ./configure --enable-unit --enable-integration
> =

> =

> =

> make -j4 check
> =

> =

> =

> sudo make install
> =

> =

> =

> =

> =

> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> # tpm2-abrmd - ONE TIME ONLY - git source code and select the correct bra=
nch
> =

> =

> =

> cd ~/src
> =

> =

> =

> git clone https://github.com/tpm2-software/tpm2-abrmd.git
> =

> cd tpm2-abrmd
> =

> =

> =

> #git the latest release branch, NOT the master
> =

> git checkout tags/2.0.0
> =

> =

> =

> =

> =

> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> # tpm2-abrmd - Update Source and Build
> =

> =

> =

> cd ~/src/tpm2-abrmd
> =

> make clean
> =

> git pull
> =

> =

> =

> ./bootstrap
> =

> ./configure --enable-unit --with-dbuspolicydir=3D/etc/dbus-1/system.d
> =

> =

> =

> #dbus-launch make check   # need dbus-launch? comment this out if not
> =

> =

> =

> make -j4 check
> =

> =

> =

> sudo make install
> =

> =

> =

> =

> =

> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> # tpm2-tools - ONE TIME ONLY - git source code and select the correct bra=
nch
> =

> =

> =

> cd ~/src
> =

> =

> =

> git clone https://github.com/tpm2-software/tpm2-tools.git
> =

> =

> =

> cd tpm2-tools
> =

> =

> =

> #git the latest release branch, NOT the master
> =

> git checkout tags/3.1.0
> =

> =

> =

> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> # tpm2-tools - Update Source and Build
> =

> =

> =

> cd ~/src/tpm2-tools
> =

> make clean
> =

> git pull
> =

> =

> =

> ./bootstrap
> =

> ./configure --enable-unit --enable-integration
> =

> make -j4 check
> =

> sudo make install
> =

> =

> =

> =

> =

> =

> =

> =

> =

> Thank you!
> =

> =

> =

> Bryan Diehl
> =

> =



--===============2867776982489143494==--

