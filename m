Content-Type: multipart/mixed; boundary="===============8259985903299098998=="
MIME-Version: 1.0
From: Trevor Woerner <twoerner at gmail.com>
Subject: Re: [tpm2] OE recipe for tpm2-tss works with 1.4.0 but not 2.0.0
Date: Thu, 12 Jul 2018 20:47:28 -0400
Message-ID: <20180713004728.GB16423@linux-uys3>
In-Reply-To: 93090e1902e944318241dd75e934b01a@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8259985903299098998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 2018-07-12 @ 09:33:45 PM, Scheie, Peter M wrote:
> I'm puzzled as to why the two Makefiles are different, as I'd expect them=
 to
> be the same.

I wouldn't expect them to be anywhere near the same at all. In the case whe=
re
you're running ./configure by hand, you're probably setting up a build for
native compilation. In the case where you're using OE, OE would be getting =
the
build ready for, most likely, a very different, cross-development target.

OE does a lot of work to make sure that its builds are not "contaminated" by
the host on which the builds take place. Your host probably has an older
version of glibc (2.24) whereas (if you're using master) OE will want to use
its glibc-2.27. Your host probably has an older version of gcc (4.8 maybe?)
whereas OE will want to use the gcc-8.1 cross-compiler that it just built f=
or
you to target your specific device.

Being able to produce your own cross-binutils, cross-glibc, and cross-compi=
ler
then using those to cross-compile your source without the build accidentally
being corrupted by the native things on your host takes quite a bit of effo=
rt.
Which is why the results differ between a native ./configure and the
./configure that OE does to guard against these problems and cross-compile
correctly.

Even if your native machine is x86-64 and the thing OE is targetting is also
x86-64, I would expect quite a difference because the OE build still doesn't
want to be corrupted by the host; it wants to use the tools it has created,
even if it's "cross-compiling" back to the same architecture.

--===============8259985903299098998==--

