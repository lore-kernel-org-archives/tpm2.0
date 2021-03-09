Content-Type: multipart/mixed; boundary="===============9074695336212008240=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2-abrmd bootstrap error
Date: Tue, 09 Mar 2021 23:24:27 +0000
Message-ID: <SN6PR11MB3437611018CB1D11972E04D9B8929@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: OF5329FB9F.2FB13C3C-ON00258692.007017CC-85258692.007061BC@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9074695336212008240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Kenneth Goldman <kgoldman(a)us.ibm.com>
> Sent: Monday, March 8, 2021 2:28 PM
> To: tpm2(a)lists.01.org
> Subject: [tpm2] tpm2-abrmd bootstrap error
> =

> Does anyone have working instructions to build abrmd from source on =

> Ubuntu 16 xenial?

This script example works on an ubuntu:16.04 docker image. Which I would im=
agine will be close to WSL.
It also deals with the fact that docker images don't really have dbus/syste=
md and all that. Which might be your WSL issues.
https://gist.github.com/williamcroberts/cd5dce68ff3c8d6608a0b336b968da79

Take a look through that and try it, email me if you have questions.

> =

> I did this, =

> http://ftpmirror.gnu.org/autoconf-archive/autoconf-archive-
> 2019.01.06.tar.xz =

> <http://ftpmirror.gnu.org/autoconf-archive/autoconf-archive-
> 2019.01.06.tar.xz>  fix, then got this:

Commented here:
https://github.com/tpm2-software/tpm2-abrmd/issues/766

It' superfluous automake warnings with us dealing with their bugs.

> =

> libtoolize: putting auxiliary files in '.'.
> libtoolize: linking file './ltmain.sh'
> configure.ac:10: installing './compile'
> configure.ac:13: installing './config.guess'
> configure.ac:13: installing './config.sub'
> configure.ac:15: installing './install-sh'
> configure.ac:15: installing './missing'
> aminclude_static.am:126: warning: .PHONY was already defined in =

> condition TRUE, which includes condition AUTOCONF_CODE_COVERAGE_2019_01_0=
6 ...
> Makefile.am:175: 'aminclude_static.am' included from here
> Makefile.am:6: ... '.PHONY' previously defined here
> Makefile.am:182: warning: AM_DISTCHECK_CONFIGURE_FLAGS multiply =

> defined in condition AUTOCONF_CODE_COVERAGE_2019_01_06 and =

> CODE_COVERAGE_ENABLED ...
> aminclude_static.am:100: ... 'AM_DISTCHECK_CONFIGURE_FLAGS' previously =

> defined here
> Makefile.am:175: 'aminclude_static.am' included from here
> Makefile.am: installing './depcomp'
> parallel-tests: installing './test-driver'
> =

> --
> Ken Goldman kgoldman(a)us.ibm.com
> 914-945-2415 (862-2415)
>=20

--===============9074695336212008240==--

