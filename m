Content-Type: multipart/mixed; boundary="===============2068019319081702539=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.org>
Subject: [tpm2] Re: ./configure error for tpm2-abrmd Centos 7
Date: Wed, 04 Dec 2019 09:28:27 -0800
Message-ID: <a8d1ad52-f57d-cedf-fd07-8d46468f7109@twobit.org>
In-Reply-To: 20191204002914.2967.59017@new-ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2068019319081702539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/3/19 4:29 PM, pneumiller(a)directstream.com wrote:
> I am using the instructions found in the INSTALL.md found at the tpm2-too=
ls git repo.  Any ideas/help would be greatly appreciated.
> =

> ./configure error for tpm2-abrmd using the Dockerfile below.
> =

> checking for TSS2_SYS... no
> configure: error: Package requirements (tss2-sys >=3D 2.0.0) were not met:
> =

> No package 'tss2-sys' found
> =

> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
> =

> Alternatively, you may set the environment variables TSS2_SYS_CFLAGS
> and TSS2_SYS_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.

This error indicates that pkgconfig isn't able to find the .pc file for
libtss2-sys. pkgconfig has a few standard places that it searches and
also the PKG_CONFIG_PATH (which you're using below).

> FROM centos:7
>   =

> # install build dependencies
> RUN yum clean all
> RUN yum install -y git make autoconf autoconf-archive automake libtool gc=
c gcc-c++ glibc-headers pkgconfig openssl-devel curl-devel epel-release pan=
doc doxygen cmake flex bison dbus
> RUN rm -rf /var/cache/yum
> RUN yum -y update && yum -y install automake libtool \
> autoconf autoconf-archive libstdc++-devel gcc pkg-config \
> uriparser-devel libgcrypt-devel dbus-devel glib2-devel \
> compat-openssl10-devel libcurl-devel PyYAML
> # Install tpm2-tss
> WORKDIR /root
> RUN git clone https://github.com/tpm2-software/tpm2-tss
> WORKdIR /root/tpm2-tss
> RUN ./bootstrap
> RUN ./configure --prefix=3D/usr  --disable-doxygen-doc
> RUN make -j5
> RUN make install
> RUN export LD_LIBRARY_PATH=3D/usr/lib
> RUN ldconfig
> RUN PKG_CONFIG_PATH=3D/usr/lib/pkgconfig

I don't know much about the details w/r/t `ENV` vs `RUN export` in
Docker but it looks like you're missing the 'export' part when you set
PKG_CONFIG_PATH here. This is a guess based on what you've done a few
lines earlier with `LD_LIBRARY_PATH`.

Philip

> My Dockerfile
> =

> # Install tpm2-abrmd
> WORKDIR /root
> RUN git clone https://github.com/tpm2-software/tpm2-abrmd
> WORKDIR /root/tpm2-abrmd
> RUN ./bootstrap
> RUN ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d \
> --with-udevrulesdir=3D/usr/lib/udev/rules.d \
> --with-systemdsystemunitdir=3D/usr/lib/systemd/system \
> --libdir=3D/usr/lib64 --prefix=3D/usr
> RUN make -j5
> RUN make install
--===============2068019319081702539==--

