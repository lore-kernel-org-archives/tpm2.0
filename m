Content-Type: multipart/mixed; boundary="===============2551759805388110047=="
MIME-Version: 1.0
From: Anderson, Daniel <daniel.anderson at intel.com>
Subject: [tpm2] tpm2-abrmd configure syntax error near expected token
 AX_VALGRIND_DFLT
Date: Wed, 28 Mar 2018 22:02:59 +0000
Message-ID: <207C810BE4BA2440832668E0F208BFD3B02817@ORSMSX108.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2551759805388110047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If you get this error building tpm2-abrmd during ./configure:

./configure: line 13634: syntax error near unexpected token sgcheck,' ./con=
figure: line 13634:AX_VALGRIND_DFLT(sgcheck, off)'

The problem is your version of Linux does not have the latest and greatest =
autoconf-archive package.  In my case the current Ubuntu 16.04.4 ("xenial")=
 LTS package autoconf-archive is too old (version 20150925-1).

But the future Ubuntu 17.10 LTS ("artful") has a newer version that works O=
K: 20170928-2.

Here's a workaround until the new Ubuntu LTS version is released (or you ca=
n switch to Ubuntu development releases). It grabs a newer version of ax_va=
lgrind_check.m4 with m4 macro AX_VALGRIND_DFLT defined.

Details in https://github.com/tpm2-software/tpm2-abrmd/issues/404

Dan

cd /usr/share/aclocal
cp -p ax_valgrind_check.m4 ax_valgrind_check.m4.ori
mkdir tmp
cd tmp
wget http://mirrors.kernel.org/ubuntu/pool/universe/a/autoconf-archive/auto=
conf-archive_20170321-1_all.deb =

dpkg-deb -R autoconf-archive_20170321-1_all.deb tmp
cp tmp/usr/share/aclocal/ax_valgrind_check.m4  ..
ls -l /usr/share/aclocal/ax_valgrind_check.m4*
cd ..
rm -rf tmp

--===============2551759805388110047==--

