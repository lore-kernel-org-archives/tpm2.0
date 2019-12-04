Content-Type: multipart/mixed; boundary="===============0789260732495944383=="
MIME-Version: 1.0
From: pneumiller at directstream.com
Subject: [tpm2] ./configure error for tpm2-abrmd Centos 7
Date: Wed, 04 Dec 2019 00:29:14 +0000
Message-ID: <20191204002914.2967.59017@new-ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0789260732495944383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I am using the instructions found in the INSTALL.md found at the tpm2-tools=
 git repo.  Any ideas/help would be greatly appreciated.

./configure error for tpm2-abrmd using the Dockerfile below.

checking for TSS2_SYS... no
configure: error: Package requirements (tss2-sys >=3D 2.0.0) were not met:

No package 'tss2-sys' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables TSS2_SYS_CFLAGS
and TSS2_SYS_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

FROM centos:7
  =

# install build dependencies
RUN yum clean all
RUN yum install -y git make autoconf autoconf-archive automake libtool gcc =
gcc-c++ glibc-headers pkgconfig openssl-devel curl-devel epel-release pando=
c doxygen cmake flex bison dbus
RUN rm -rf /var/cache/yum
RUN yum -y update && yum -y install automake libtool \
autoconf autoconf-archive libstdc++-devel gcc pkg-config \
uriparser-devel libgcrypt-devel dbus-devel glib2-devel \
compat-openssl10-devel libcurl-devel PyYAML
# Install tpm2-tss
WORKDIR /root
RUN git clone https://github.com/tpm2-software/tpm2-tss
WORKdIR /root/tpm2-tss
RUN ./bootstrap
RUN ./configure --prefix=3D/usr  --disable-doxygen-doc
RUN make -j5
RUN make install
RUN export LD_LIBRARY_PATH=3D/usr/lib
RUN ldconfig
RUN PKG_CONFIG_PATH=3D/usr/lib/pkgconfig

My Dockerfile

# Install tpm2-abrmd
WORKDIR /root
RUN git clone https://github.com/tpm2-software/tpm2-abrmd
WORKDIR /root/tpm2-abrmd
RUN ./bootstrap
RUN ./configure --with-dbuspolicydir=3D/etc/dbus-1/system.d \
--with-udevrulesdir=3D/usr/lib/udev/rules.d \
--with-systemdsystemunitdir=3D/usr/lib/systemd/system \
--libdir=3D/usr/lib64 --prefix=3D/usr
RUN make -j5
RUN make install
--===============0789260732495944383==--

