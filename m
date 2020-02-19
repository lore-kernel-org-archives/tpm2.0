Content-Type: multipart/mixed; boundary="===============6229587275406315124=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: [tpm2] Re: Need help cross compiling tpm2-* for arm
Date: Wed, 19 Feb 2020 10:38:23 -0800
Message-ID: <0d69d83f-3528-2751-77c6-deb83d8341d0@intel.com>
In-Reply-To: a8e9516a21464004bafc26965bf77ff0@EXDAG32-1.EXCHANGE.INT
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6229587275406315124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/19/20 8:04 AM, pweggler(a)jacol.de wrote:
> Thank you! It compiles now, but the filetype of .libs/ libtpm2tss.so is E=
LF x86-64 instead of the expected arm

You can also pass in the standard --prefix=3D<dir> when you ./configure
the TSS libraries and then do "make install".That is the easiest and
proffered way.
WRT the so being ELF x86-64 make sure that you set the $CC and other
tools are set to the cross-compiler.

-- =

Tadeusz
--===============6229587275406315124==--

