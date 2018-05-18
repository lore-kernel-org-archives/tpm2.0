Content-Type: multipart/mixed; boundary="===============0314290109533963842=="
MIME-Version: 1.0
From: Tony Yip <Juan.Yip at panasonic.aero>
Subject: Re: [tpm2] Documentation for configure
Date: Fri, 18 May 2018 20:49:30 +0000
Message-ID: <AE617DA1151F25478215F3E5790FBCFB15CB9CA3@MAIL-SNA04.mascorp.com>
In-Reply-To: 207C810BE4BA2440832668E0F208BFD3D40BCB@ORSMSX108.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0314290109533963842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for your reply. I'm trying to configure the default for simulator us=
e.

-----

I had to wrap the tctidefaultmodule value in quotes so I did the same for t=
ctidefaultconfig. However, I ran into some errors:
./configure --with-tctidefaultmodule=3D\"libtss2-tcti-mssim.so\" --enable-u=
nit --with-tctidefaultconfig=3D\"host=3D10.139.90.53,port=3D2321\"

The check against the string "host" fails due to the extra " (i.e. "\"host")
ERROR:tcti:src/util/key-value-parse.c:102:parse_key_value_string() parsing =
key/value: "host=3D10.139.90.53 =


https://github.com/tpm2-software/tpm2-tss/blob/373d4e4f1678401ac0f5e999be63=
fc1b63c950b3/src/tss2-tcti/tcti-mssim.c#L471

-----

Changing the configure command to use no quotes results in a compilation er=
ror:
./configure --with-tctidefaultmodule=3D\"libtss2-tcti-mssim.so\" --enable-u=
nit --with-tctidefaultconfig=3Dhost=3D10.139.90.53,port=3D2321

src/tss2-esys/esys_tcti_default.c: In function =E2=80=98get_tcti_default=E2=
=80=99:
src/tss2-esys/esys_tcti_default.c:186:56: error: macro "_STR" passed 2 argu=
ments, but takes just 1
     const char *config =3D _XSTR(ESYS_TCTI_DEFAULT_CONFIG);

https://github.com/tpm2-software/tpm2-tss/blob/373d4e4f1678401ac0f5e999be63=
fc1b63c950b3/src/tss2-esys/esys_tcti_default.c#L181

-----

Anyway, after looking at it some more, I believe I need to use Tss2_Tcti_Ms=
sim_Init instead of relying on a default configuration. I still haven't bee=
n able to get the debug/trace logs to output however.

________________________________________
From: tpm2 [tpm2-bounces(a)lists.01.org] on behalf of Anderson, Daniel [dan=
iel.anderson(a)intel.com]
Sent: Friday, May 18, 2018 1:24 PM
To: tpm2(a)lists.01.org
Subject: Re: [tpm2] Documentation for configure

I suggested some documentation on this, but it was pointed out to me that t=
hese are rarely-used options and that the documentation is available from h=
ere:

./bootstrap; ./configure --help

But to answer your question, configure --enable-tcti-mssim allows use of th=
e Microsoft/IBM TPM 2.0 simulator and
Configure --enable-tcti-device allows use of the real TPM 2.0 (including vi=
rtual or firmware TPMs) through the /dev/tpm0 device driver.

Having both enabled is the default and is useful unless you want to do a lo=
t of minimization or something.

If you care, here's the options I use in a testing environment:
./configure --enable-unit --enable-integration --enable-doxygen-doc

Dan

$ ./configure --help
`configure' configures tpm2-tss 2.0.0_rc1 to adapt to many kinds of systems.

Usage: ./configure [OPTION]... [VAR=3DVALUE]...
. . .
Optional Features:
  --disable-option-checking  ignore unrecognized --enable/--with options
  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=
=3Dno)
  --enable-FEATURE[=3DARG]  include FEATURE [ARG=3Dyes]
  --enable-shared[=3DPKGS]  build shared libraries [default=3Dyes]
  --enable-static[=3DPKGS]  build static libraries [default=3Dyes]
  --enable-fast-install[=3DPKGS]
                          optimize for fast installation [default=3Dyes]
  --disable-libtool-lock  avoid locking (might break parallel builds)
  --enable-dependency-tracking
                          do not reject slow dependency extractors
  --disable-dependency-tracking
                          speeds up one-time build
  --enable-silent-rules   less verbose build output (undo: "make V=3D1")
  --disable-silent-rules  verbose build output (undo: "make V=3D0")
  --enable-unit           build cmocka unit tests (default is no)
  --enable-esapi          build the esapi layer (default is yes)
  --enable-tcti-device    build the tcti-device module (default is yes)
  --enable-tcti-mssim     build the tcti-mssim module (default is yes)
  --enable-integration    build and execute integration tests (default is n=
o)
  --enable-ld-version-script
                          enable linker version script (default is enabled =
when possible)
  --enable-debug          build with debug info (default is no)
  --disable-doxygen-doc   don't generate any doxygen documentation
  --enable-doxygen-dot    generate graphics for doxygen documentation
  --disable-doxygen-man   don't generate doxygen manual pages
  --enable-doxygen-rtf    generate doxygen RTF documentation
  --enable-doxygen-xml    generate doxygen XML documentation
  --enable-doxygen-chm    generate doxygen compressed HTML help documentati=
on
  --enable-doxygen-chi    generate doxygen separate compressed HTML help in=
dex file
  --disable-doxygen-html  don't generate doxygen plain HTML documentation
  --enable-doxygen-ps     generate doxygen PostScript documentation
  --enable-doxygen-pdf    generate doxygen PDF documentation
  --enable-code-coverage  Whether to enable code coverage support

Optional Packages:
  --with-PACKAGE[=3DARG]    use PACKAGE [ARG=3Dyes]
  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=3Dno)
  --with-pic[=3DPKGS]       try to use only PIC/non-PIC objects [default=3D=
use
                          both]
  --with-aix-soname=3Daix|svr4|both
                          shared library versioning (aka "SONAME") variant =
to
                          provide on AIX, [default=3Daix].
  --with-gnu-ld           assume the C compiler uses GNU ld [default=3Dno]
  --with-sysroot[=3DDIR]    Search for dependent libraries within DIR (or t=
he
                          compiler's sysroot if not specified).
  --with-tctidefaultmodule
                          The default TCTI module for ESAPI. (Default:
                          libtss2-tcti-default.so
  --with-tctidefaultconfig
                          The default tcti module's configuration.
  --with-udevrulesdir=3DDIR udev rules directory
  --with-udevrulesprefix=3DXY
                          prefix for udev rules file
  --with-maxloglevel=3D{none,error,warning,info,debug,trace}
                          sets the maximum log level (default is trace)
  --with-gcov=3DGCOV        use given GCOV for coverage (GCOV=3Dgcov).

Some influential environment variables:
. . .


_______________________________________________
tpm2 mailing list
tpm2(a)lists.01.org
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.01.org_mailman=
_listinfo_tpm2&d=3DDwICAg&c=3DlaiMAACGcvAxeLF9-K5nZ1uCTN9kBzTH8fWOxFTVLgs&r=
=3DGVrlcb0t_QREzpaQn_xsFgE-o00NN5nuTSi4_Sd9gHI&m=3DHQhsQuNedhU2-zRlvGxzibWy=
AeNnmstvACWgTm1oboA&s=3DrXnlMmDWmljIyD0CXgg7UcVd9iI9-hSri0xkPC6vSuY&e=3D

--===============0314290109533963842==--

