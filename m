Content-Type: multipart/mixed; boundary="===============0541194932518570189=="
MIME-Version: 1.0
From: John Connett <jrc at skylon.me.uk>
Subject: [tpm2] Building tpm2-tss-3.0.1-rc0 on OmniOS?
Date: Thu, 10 Sep 2020 11:48:03 +0100
Message-ID: <481a4469-deb2-760c-19b9-f6ca367978b7@skylon.me.uk>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0541194932518570189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm attempting to build tpm2-tss-3.0.1-rc0 on the latest version of
OmniOS (https://omniosce.org/).

    $ cat /etc/os-release
    NAME=3D"OmniOS"
    PRETTY_NAME=3D"OmniOS Community Edition v11 r151034r"
    CPE_NAME=3D"cpe:/o:omniosce:omnios:11:151034:18"
    ID=3Domnios
    VERSION=3Dr151034r
    VERSION_ID=3Dr151034r
    BUILD_ID=3D151034.18.2020.08.29
    HOME_URL=3D"https://omniosce.org/"
    SUPPORT_URL=3D"https://omniosce.org/"
    BUG_REPORT_URL=3D"https://github.com/omniosorg/omnios-build/issues/new"
    $

I think I have the prerequisites installed either from the release or
from pkgsrc (https://pkgsrc.joyent.com/). I have also set the following
environment variables:

    export PATH=3D/opt/local/sbin:/opt/local/bin:$PATH
    export MANPATH=3D/opt/local/man:/usr/share/man
    export PKG_CONFIG_PATH=3D/opt/local/lib/pkgconfig
    export MAKE=3Dgmake

I have made the following modification to recognise the OS:

$ diff -u configure.ac.orig configure.ac
--- configure.ac.orig   Wed Sep  9 08:01:43 2020
+++ configure.ac        Thu Sep 10 10:53:18 2020
@@ -44,6 +44,11 @@
         HOSTOS=3D'BSD'
         LIBSOCKET_LDFLAGS=3D""
         ;;
+    *solaris*)
+        HOSTOS=3D'SOLARIS'
+        ADD_COMPILER_FLAG([-D__EXTENSIONS__])
+        LIBSOCKET_LDFLAGS=3D"-lsocket -lnsl"
+        ;;
     *)
         #Assume linux
         HOSTOS=3D'Linux'
$

This is what I see when I run bootstrap:

$ ./bootstrap
Generating file lists: src_vars.mk
aclocal: installing 'm4/libtool.m4' from '/usr/share/aclocal/libtool.m4'
aclocal: installing 'm4/ltdl.m4' from '/usr/share/aclocal/ltdl.m4'
aclocal: installing 'm4/ltoptions.m4' from '/usr/share/aclocal/ltoptions.m4'
aclocal: installing 'm4/ltsugar.m4' from '/usr/share/aclocal/ltsugar.m4'
aclocal: installing 'm4/ltversion.m4' from '/usr/share/aclocal/ltversion.m4'
aclocal: installing 'm4/lt~obsolete.m4' from
'/usr/share/aclocal/lt~obsolete.m4'
aclocal: installing 'm4/pkg.m4' from '/usr/share/aclocal/pkg.m4'
libtoolize: putting auxiliary files in '.'.
libtoolize: linking file './ltmain.sh'
configure.ac:21: error: possibly undefined macro: AC_SUBST
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:68: error: possibly undefined macro: AS_IF
configure.ac:101: error: possibly undefined macro: AC_MSG_ERROR
configure.ac:130: error: possibly undefined macro: AC_MSG_WARN
autoreconf: /usr/bin/autoconf failed with exit status: 1
$

I don't have much experience with autotools. Can anyone spot if I have
made an obvious mistake. The first error reported is for this line:

AC_SUBST([DISTCHECK_CONFIGURE_FLAGS],[$ac_configure_args])

I am aware of other issues with OmniOS: make =3D> gmake; tar =3D> gtar;
doesn't have _DIRENT_HAVE_D_TYPE defined; requires explicit use of
"#include <stdarg.h>" on more files. However, there seems a good chance
it could be made to work with the simulators (OmniOS doesn't yet have a
TPM2 device driver).

Has anyone else tried building on other flavours of Illumos/Solaris?
--
John


--===============0541194932518570189==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUV4d09hcXJvNWNp
bkdkRS9YanpFVkVTNjQyMVFGQWw5YUJHNEFDZ2tRanpFVkVTNjQKMjFTZ29nZ0FpQnVQS21YSVYx
akRacG5vT2VMaktnZURXdGxwQXZudlpjcHAxeTh4cVh3TElDYm5OMUhoQWVnbgpwNUxhZDcwVG93
K0E2cTBSSWNjd3hmSHlObDFleEpzVmdCcVhjUUt5eURsblpXWHl5SGxiSmlxVW9yOG5Gci9ICk8y
OENFUkNDZklTVTk2bGZUdmx4VjhNZ1ZJSEZoaEpNWlVyME03TWoyazRoT0xuSHZTeFE5eThUb3ky
NzYwQTkKWlNSWkpQajFJTkNweVdRODUvU2xoaFBnWncwNWcxZk1MN0ZCNFN1WUJ3QlArOGQ1NXVF
cWlXclFaSDhweTg4ZgoySENJazJWYTFTU1l2YlBBOFJCSmRuYkpDdHN3eDFBTmdCZTNMRmE2bzJ4
SlA1TVc5VlZHV1BwYzdRMjhGeUVhClhtMFZIT2FGMk1rcFBVdFgyOGlwWW1hMlJwdlpDUT09Cj1F
RkRoCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0541194932518570189==--

