Content-Type: multipart/mixed; boundary="===============4811185467281978002=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] Re: Need help cross compiling tpm2-* for arm
Date: Wed, 19 Feb 2020 10:32:29 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0163C8F57E@exch2010c.sit.fraunhofer.de>
In-Reply-To: 480f7aeb581f441ab5daecfb02a96395@EXDAG32-1.EXCHANGE.INT
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4811185467281978002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

First, try to run

make V=3D1

that will enable verbose output. There we can have a look if the LDFLAGS fo=
r the paths were correctly forwarded to the make target.

Then we can take it from there.
________________________________________
From: pweggler(a)jacol.de [pweggler(a)jacol.de]
Sent: Wednesday, February 19, 2020 11:29
To: tpm2(a)lists.01.org
Subject: [tpm2] Need help cross compiling tpm2-* for arm

Hello,

I=E2=80=99m failing to crosscompile the tpm2-tss-engine. The build fails wi=
th =E2=80=9C/usr/bin/ld: cannot find -ltss2-mu=E2=80=9D. Can you provide me=
 with an instruction or howto guide? I=E2=80=99m not sure if even the cross=
 compilation is successful at all. Is there a way to explicitly specify the=
 compiler path?

My steps so far:
I=E2=80=99m using ubuntu 18.04 LTS
I have cloned all github repos into a directory tpm2
tpm2
=E2=94=9C=E2=94=80=E2=94=80 tpm2-abrmd
=E2=94=9C=E2=94=80=E2=94=80 tpm2-tools
=E2=94=9C=E2=94=80=E2=94=80 tpm2-tss
=E2=94=9C=E2=94=80=E2=94=80 tpm2-tss-engine
=E2=94=94=E2=94=80=E2=94=80 tpm2-tss_orig

In the tpm2-tss folder:
./bootstrap
./configure --build=3Di686-pc-linux-gnu --host=3Darm-oe-linux-gnueabi --tar=
get=3Darm-oe-linux-gnueabi make -j$(nproc)

After this has succeeded
In the tpm2-tss-engine folder:
TPM2TSS=3D../tpm2-tss
./bootstrap
./configure --build=3Di686-pc-linux-gnu --host=3Darm-oe-linux-gnueabi --tar=
get=3Darm-oe-linux-gnueabi PKG_CONFIG_PATH=3D${TPM2TSS}/lib:$PKG_CONFIG_PAT=
H CFLAGS=3D-I${TPM2TSS}/include LDFLAGS=3D-L${TPM2TSS}/src/tss2-{tcti,mu,sy=
s,esys}/.libs
make -j$(nproc)

the complete error is:
CCLD     libtpm2tss.la
/usr/bin/ld: cannot find -ltss2-mu
/usr/bin/ld: cannot find -ltss2-tctildr
collect2: error: ld returned 1 exit status
Makefile:854: recipe for target 'libtpm2tss.la' failed
make: *** [libtpm2tss.la] Error 1

I have attached the output from both configure and make runs.



With kind regards
Patrick Weggler

B.Sc Informatik
Entwicklung

---------------------------------------------------------------------------=
-----
JacoL =E2=80=93 FPGA Entwicklungen GmbH
H=C3=B6rvelsinger Weg 27
89081 Ulm-Jungingen
Deutschland
Mail: pweggler(a)jacol.de
B=C3=BCro: 0731 / 20649331
Mobil: 0171 / 2067034
Fax: 0731 / 397 69 155
------------------------------------------------------------------------
Registergericht Ulm, HRB 734013
Umsatzsteueridentifikationsnummer DE276321495

Gesch=C3=A4ftsf=C3=BChrung:
Florian Jablonska

Hiermit widerspreche ich ausdr=C3=BCcklich jeglicher Nutzung oder =C3=9Cber=
mittlung meiner Daten, gleichg=C3=BCltig, zu welchen Zwecken oder an welche=
n Empf=C3=A4nger sie erfolgt. Insbesondere widerspreche ich der Nutzung ode=
r =C3=9Cbermittlung meiner Daten f=C3=BCr Werbe, Markt- oder Meinungsforsch=
ungszwecken gem=C3=A4=C3=9F =C2=A7 28 Absatz 3 Bundesdatenschutzgesetz


--===============4811185467281978002==--

