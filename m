Content-Type: multipart/mixed; boundary="===============2070411026928479742=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] It is a problem about device or resource busy when I use
 the tpm2-tools
Date: Thu, 01 Nov 2018 08:47:02 -0700
Message-ID: <9deb3135-774b-fc52-0bde-ab6d7cc28874@intel.com>
In-Reply-To: 4bd75dd7e9444cfba8e49b86a1c854ad@zhaoxin.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2070411026928479742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/31/18 8:04 PM, Sherry Zhang(BJ-RD) wrote:
> Hi all,
> =

> The packages that I have installed(ubuntu16.04.2 with kernel-4.16.2) :
> =

> # install TSS itself
> =

> git clone https://github.com/tpm2-software/tpm2-tss.git
> =

> cd tpm2-tss
> =

> ./bootstrap
> =

> ./configure --enable-unit
> =

> make check
> =

> sudo make install
> =

> =C2=A0
> =

> # Install abrmd itself
> =

> git clone https://github.com/tpm2-software/tpm2-abrmd.git
> =

> cd tpm2-abrmd
> =

> ./bootstrap
> =

> ./configure --enable-unit --with-dbuspolicydir=3D/etc/dbus-1/system.d
> =

> dbus-launch make check
> =

> sudo make install
> =

> =C2=A0
> =

> # Install tools itself
> =

> git clone https://github.com/tpm2-software/tpm2-tools.git
> =

> cd tpm2-tools
> =

> ./bootstrap
> =

> ./configure --enable-unit
> =

> make check
> =

> sudo make install
> =

> And I can see /dev/tpm0 and /dev/tpmrm0 with the the tpm_tis.ko in the ke=
rnel-4.16.2.
> =

> But I have a problem as follows:
> =

> (1)#strace tpm2-abrmd --tcti=3D"device:/dev/tpm0"=C2=A0 --allow-root
> =

> (2)In a C =C2=A0program:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fd =3D open("/dev/tpm0",O_RDWR);
> =

> *result:*
> =

> open("/dev/tpm0", O_RDWR)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -1 EBUSY (Device or resource busy)
> =

> *So could someone give advice=C2=A0 to me how to solve this problem? *

Could you make sure that there isn't another instance of tpm2-abrmd running
in the background already?

# systemctl status tpm2-abrmd

-- =

Tadeusz

--===============2070411026928479742==--

