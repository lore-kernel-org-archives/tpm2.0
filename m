Content-Type: multipart/mixed; boundary="===============2779052690616656625=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] OE recipe for tpm2-tss works with 1.4.0 but not 2.0.0
Date: Mon, 16 Jul 2018 16:38:21 +0000
Message-ID: <5d1b5cd4b45b4509a8d166b54f3ac6e2@AZDC-MMB02.GD-MS.US>
In-Reply-To: 20180713003409.GA16423@linux-uys3
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2779052690616656625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: Trevor Woerner [mailto:twoerner(a)gmail.com] =

Sent: Thursday, July 12, 2018 7:34 PM
To: Scheie, Peter M
Cc: tpm2(a)lists.01.org
Subject: Re: [tpm2] OE recipe for tpm2-tss works with 1.4.0 but not 2.0.0

Hi Peter,

On Thu 2018-07-12 @ 06:25:52 PM, Scheie, Peter M wrote:
> I'm trying to get the tpm2-tss package in our WindRiver 8 build system
> (bitbake) upgraded from 1.4.0 to 2.0.0. I'm using the tpm2-tss recipe from
> OpenEmbedded which I think was originally written for 1.x (1.3?) and it's
> been working fine with the tpm2-tss_1.4.0.tar.gz file.

Do you know which layers, and which branches of these layers, you're using =
in
your build? Neither OpenEmbedded core itself nor meta-openembedded include =
any
TPM2 recipes, they are provided by other, added-on layers. There are at lea=
st
3 different layers of which I'm aware that provide the TPM2 recipes:

	meta-secure-core: https://github.com/jiazhang0/meta-secure-core.git
	meta-security:    https://git.yoctoproject.org/cgit/cgit.cgi/meta-security
	meta-measured:    https://github.com/flihp/meta-measured

If you could provide the "Build Configuration:" (that is printed at the sta=
rt
of every build) for your specific build, that might help.

*********************************************

I'm using the recipe from Phil's meta-measured layer.  Here is my Build Con=
figuration:

Build Configuration:
BB_VERSION        =3D "1.28.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "CentOS-Linux-7.3.1611"
DISTRO            =3D "wrlinux-small"
DISTRO_VERSION    =3D "8.0.0.25"
MACHINE           =3D ""
DEFAULTTUNE       =3D "broadwell-64"
TARGET_SYS        =3D "x86_64-wrs-linux"
TUNE_FEATURES     =3D "m64 haswell haswell-ep broadwell"
TARGET_FPU        =3D ""
wrlinux           =3D "LB13_8.0_RCPL0025:fe10a7f9353ea72d10524eaf7bb1bfb7cd=
fba34f"
wrlcompat         =3D "LB13_8.0_RCPL0025:5b9708c1b5a4fffafc0a154f24f3490d60=
451b84"
wr-sdk-toolchain  =3D "LB13_8.0_RCPL0025:5f02ee99498f0cd9b0a112f19588c112fb=
e8113a"
wr-tcwrappers     =3D "LB13_8.0_RCPL0025:6d4a369c118fd0035918d944bfdb3b939f=
67f46c"
meta              =3D "LB13_8.0_RCPL0025:f5a2ade7d01f8a841e04a76e2d36bb1348=
beb907"
oe-core-dl-2.0    =3D "LB13_8.0_RCPL0025:c0dd4c25af7e8a88bcd58285adcb7c3495=
cd7ae7"
meta-downloads    =3D "LB13_8.0_RCPL0025:234b15cb1b5c77431c7839fa25694baf63=
6aa91b"
wr-kernel         =3D "LB13_8.0_RCPL0025:e85e50fe8776d58e1b726e9e8dc65bd1b4=
be0edd"
wr-base           =3D "LB13_8.0_RCPL0025:61ccb153fdf527d9466ed8173475ad2e58=
972742"
wr-fixes          =3D "LB13_8.0_RCPL0025:bf8e21c57a641b52242314737eb0c19b3a=
20aa6a"
wr-tools-profile  =3D "LB13_8.0_RCPL0025:b4f87661c1919fc8354ee4c582b173f26c=
26d487"
wr-tools-debug    =3D "LB13_8.0_RCPL0025:b3361fc0bb65c164104cb60df1b1a9e62e=
34bd35"
meta-filesystems  =

meta-initramfs    =

meta-gnome        =

meta-multimedia   =

meta-networking   =

meta-oe           =

meta-python       =

meta-perl         =

meta-webserver    =

meta-xfce         =3D "LB13_8.0_RCPL0025:2ae6429c21dbd05ad954f401c251f12e58=
5b5e6e"
wr-prebuilts      =3D "LB13_8.0_RCPL0025:fd15422c1f9e51ddb1958ef89aef779dc5=
ded9ab"
meta-selinux      =3D "wr-8.0-20151119:6e48e40d4197ff29619abb716130d35f0878=
6d23"
common-downloads  =3D "LB13_8.0_RCPL0025:830ea7a950f7ec419cc6ab3820cc1fc951=
28dec4"
extra-downloads   =

local             =3D "<unknown>:<unknown>"

I had to remove a few proprietary items from the list, but I don't think th=
eir values are significant in this context.

Peter

--===============2779052690616656625==--

