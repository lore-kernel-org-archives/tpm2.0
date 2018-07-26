Content-Type: multipart/mixed; boundary="===============2937825229675969222=="
MIME-Version: 1.0
From: Tomasz Przybysz <tomaszp at mikronika.pl>
Subject: [tpm2] tpm2-tss and buildroot compilation error
Date: Thu, 26 Jul 2018 11:50:31 +0200
Message-ID: <1d52f25f-7417-637d-4302-59e042e45ba0@mikronika.pl>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2937825229675969222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
There is a problem during tpm2-tss compilation under buidroot.

tpm2-tss 2.0.0


Compilation under buildroot:

>>> tpm2-tss 2.0.0 Installing to staging directory
PATH=3D"/home/tomaszpr/zynq_fresh/buildroot/output/host/bin:/home/tomaszpr/=
zynq_fresh/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/s=
bin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"=C2=A0
/usr/bin/make -j9
DESTDIR=3D/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-lin=
ux-gnueabihf/sysroot
install -C /home/tomaszpr/zynq_fresh/buildroot/output/build/tpm2-tss-2.0.0/
=C2=A0/bin/mkdir -p
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/lib'
=C2=A0/bin/mkdir -p
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/share/man/man3'
=C2=A0/bin/bash ./libtool=C2=A0=C2=A0 --mode=3Dinstall /usr/bin/install -c=
=C2=A0=C2=A0
src/tss2-mu/libtss2-mu.la src/tss2-tcti/libtss2-tcti-device.la
src/tss2-tcti/libtss2-tcti-mssim.la src/tss2-sys/libtss2-sys.la
src/tss2-esys/libtss2-esys.la
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/lib'
=C2=A0/bin/mkdir -p
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/share/man/man7'
=C2=A0/bin/mkdir -p
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/lib/pkgconfig'
=C2=A0/bin/mkdir -p
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/include/tss2'
=C2=A0/bin/mkdir -p
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/lib/udev/rules.d'
=C2=A0/usr/bin/install -c -m 644 lib/tss2-mu.pc lib/tss2-tcti-device.pc
lib/tss2-tcti-mssim.pc lib/tss2-sys.pc lib/tss2-esys.pc
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/lib/pkgconfig'
=C2=A0/usr/bin/install -c -m 644 dist/tpm-udev.rules
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/lib/udev/rules.d'
=C2=A0/usr/bin/install -c -m 644 man/man7/tss2-tcti-device.7
man/man7/tss2-tcti-mssim.7
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/share/man/man7'
=C2=A0/usr/bin/install -c -m 644 man/man3/Tss2_Tcti_Device_Init.3
man/man3/Tss2_Tcti_Mssim_Init.3
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/share/man/man3'
=C2=A0/usr/bin/install -c -m 644 ./include/tss2/tss2_common.h
./include/tss2/tss2_tcti.h ./include/tss2/tss2_tpm2_types.h
./include/tss2/tss2_mu.h ./include/tss2/tss2_tcti_device.h
./include/tss2/tss2_tcti_mssim.h ./include/tss2/tss2_sys.h
./include/tss2/tss2_esys.h
'/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueab=
ihf/sysroot/usr/include/tss2'
/usr/bin/make=C2=A0 install-data-hook
make[4]: Nie ma nic do zrobienia w 'install-data-hook'.
libtool: install: /usr/bin/install -c
src/tss2-mu/.libs/libtss2-mu.so.0.0.0
/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueabi=
hf/sysroot/usr/lib/libtss2-mu.so.0.0.0
libtool: install: (cd
/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueabi=
hf/sysroot/usr/lib
&& { ln -s -f libtss2-mu.so.0.0.0 libtss2-mu.so.0 || { rm -f
libtss2-mu.so.0 && ln -s libtss2-mu.so.0.0.0 libtss2-mu.so.0; }; })
libtool: install: (cd
/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueabi=
hf/sysroot/usr/lib
&& { ln -s -f libtss2-mu.so.0.0.0 libtss2-mu.so || { rm -f libtss2-mu.so
&& ln -s libtss2-mu.so.0.0.0 libtss2-mu.so; }; })
libtool: install: /usr/bin/install -c src/tss2-mu/.libs/libtss2-mu.lai
/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueabi=
hf/sysroot/usr/lib/libtss2-mu.la
libtool: warning: relinking 'src/tss2-tcti/libtss2-tcti-device.la'
libtool: install: (cd
/home/tomaszpr/zynq_fresh/buildroot/output/build/tpm2-tss-2.0.0;
/bin/bash
"/home/tomaszpr/zynq_fresh/buildroot/output/build/tpm2-tss-2.0.0/libtool"=
=C2=A0
--tag CC --mode=3Drelink
/home/tomaszpr/zynq_fresh/buildroot/output/host/bin/arm-buildroot-linux-gnu=
eabihf-gcc
-I./src -I./include/tss2 -std=3Dc99 -Wall -Wextra -Wformat-security
-Werror -fstack-protector-all -fpic -fPIC -D_DEFAULT_SOURCE
-D_BSD_SOURCE -D_POSIX_SOURCE -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g
-O2 -Wno-missing-braces -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=3D64 -Os
-Wl,--version-script=3D./lib/tss2-tcti-device.map -o
src/tss2-tcti/libtss2-tcti-device.la -rpath /usr/lib
src/tss2-tcti/src_tss2_tcti_libtss2_tcti_device_la-tcti-common.lo
src/tss2-tcti/src_tss2_tcti_libtss2_tcti_device_la-tcti-device.lo
src/tss2-mu/libtss2-mu.la libutil.la -lgcrypt -inst-prefix-dir
/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnueabi=
hf/sysroot)
libtool: relink:
/home/tomaszpr/zynq_fresh/buildroot/output/host/bin/arm-buildroot-linux-gnu=
eabihf-gcc
-shared=C2=A0 -fPIC -DPIC=C2=A0
src/tss2-tcti/.libs/src_tss2_tcti_libtss2_tcti_device_la-tcti-common.o
src/tss2-tcti/.libs/src_tss2_tcti_libtss2_tcti_device_la-tcti-device.o=C2=
=A0
-Wl,--whole-archive ./.libs/libutil.a -Wl,--no-whole-archive=C2=A0
-L/home/tomaszpr/zynq_fresh/buildroot/output/host/arm-buildroot-linux-gnuea=
bihf/sysroot/usr/lib
-L/usr/lib -ltss2-mu -lgcrypt=C2=A0 -fstack-protector-all -g -O2 -Os
-Wl,--version-script=3D./lib/tss2-tcti-device.map=C2=A0=C2=A0 -Wl,-soname
-Wl,libtss2-tcti-device.so.0 -o
src/tss2-tcti/.libs/libtss2-tcti-device.so.0.0.0
arm-buildroot-linux-gnueabihf-gcc: ERROR: unsafe header/library path
used in cross-compilation: '-L/usr/lib'
libtool:=C2=A0=C2=A0 error: error: relink 'src/tss2-tcti/libtss2-tcti-devic=
e.la'
with the above command before installing it
Makefile:4607: recipe for target 'install-libLTLIBRARIES' failed
make[3]: *** [install-libLTLIBRARIES] Error 1
Makefile:12965: recipe for target 'install-am' failed
make[2]: *** [install-am] Error 2
package/pkg-generic.mk:262: recipe for target
'/home/tomaszpr/zynq_fresh/buildroot/output/build/tpm2-tss-2.0.0/.stamp_sta=
ging_installed'
failed
make[1]: ***
[/home/tomaszpr/zynq_fresh/buildroot/output/build/tpm2-tss-2.0.0/.stamp_sta=
ging_installed]
Error 2
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2


When I disable buildroot option:
make menuconfig
Build options ---> Advanced
[ ] paranoid check of library/header paths

compilation finishes correct, but default option for buildroot is
paranoid check of library/header paths enabled.
In my opinion it's not good idea to disable it.

Best regards,

-- =

*Tomasz Przybysz*
Software Engineer
B.R.Sp.P.M.S.A. Mikronika

--===============2937825229675969222==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CgogICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250
ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPgogIDwvaGVhZD4KICA8Ym9keSB0ZXh0PSIj
MDAwMDAwIiBiZ2NvbG9yPSIjRkZGRkZGIj4KICAgIEhpLDxicj4KICAgIFRoZXJlIGlzIGEgcHJv
YmxlbSBkdXJpbmcgdHBtMi10c3MgY29tcGlsYXRpb24gdW5kZXIgYnVpZHJvb3QuPGJyPgogICAg
PGJyPgogICAgdHBtMi10c3MgMi4wLjA8YnI+CiAgICA8YnI+CiAgICA8YnI+CiAgICBDb21waWxh
dGlvbiB1bmRlciBidWlsZHJvb3Q6PGJyPgogICAgPGJyPgogICAgJmd0OyZndDsmZ3Q7IHRwbTIt
dHNzIDIuMC4wIEluc3RhbGxpbmcgdG8gc3RhZ2luZyBkaXJlY3Rvcnk8YnI+ClBBVEg9Ii9ob21l
L3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9ob3N0L2JpbjovaG9tZS90b21h
c3pwci96eW5xX2ZyZXNoL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9zYmluOi91c3IvbG9jYWwvc2Jp
bjovdXNyL2xvY2FsL2JpbjovdXNyL3NiaW46L3Vzci9iaW46L3NiaW46L2JpbjovdXNyL2dhbWVz
Oi91c3IvbG9jYWwvZ2FtZXM6L3NuYXAvYmluIsKgCiAgICAvdXNyL2Jpbi9tYWtlIC1qOQpERVNU
RElSPS9ob21lL3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9ob3N0L2FybS1i
dWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QKICAgIGluc3RhbGwgLUMKICAgIC9ob21l
L3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9idWlsZC90cG0yLXRzcy0yLjAu
MC88YnI+CiAgICDCoC9iaW4vbWtkaXIgLXAKJy9ob21lL3RvbWFzenByL3p5bnFfZnJlc2gvYnVp
bGRyb290L291dHB1dC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3Qv
dXNyL2xpYic8YnI+CiAgICDCoC9iaW4vbWtkaXIgLXAKJy9ob21lL3RvbWFzenByL3p5bnFfZnJl
c2gvYnVpbGRyb290L291dHB1dC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5
c3Jvb3QvdXNyL3NoYXJlL21hbi9tYW4zJzxicj4KICAgIMKgL2Jpbi9iYXNoIC4vbGlidG9vbMKg
wqAgLS1tb2RlPWluc3RhbGwgL3Vzci9iaW4vaW5zdGFsbCAtY8KgwqAKICAgIHNyYy90c3MyLW11
L2xpYnRzczItbXUubGEgc3JjL3RzczItdGN0aS9saWJ0c3MyLXRjdGktZGV2aWNlLmxhCiAgICBz
cmMvdHNzMi10Y3RpL2xpYnRzczItdGN0aS1tc3NpbS5sYSBzcmMvdHNzMi1zeXMvbGlidHNzMi1z
eXMubGEKICAgIHNyYy90c3MyLWVzeXMvbGlidHNzMi1lc3lzLmxhCicvaG9tZS90b21hc3pwci96
eW5xX2ZyZXNoL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVh
YmloZi9zeXNyb290L3Vzci9saWInPGJyPgogICAgwqAvYmluL21rZGlyIC1wCicvaG9tZS90b21h
c3pwci96eW5xX2ZyZXNoL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4
LWdudWVhYmloZi9zeXNyb290L3Vzci9zaGFyZS9tYW4vbWFuNyc8YnI+CiAgICDCoC9iaW4vbWtk
aXIgLXAKJy9ob21lL3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9ob3N0L2Fy
bS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2xpYi9wa2djb25maWcnPGJy
PgogICAgwqAvYmluL21rZGlyIC1wCicvaG9tZS90b21hc3pwci96eW5xX2ZyZXNoL2J1aWxkcm9v
dC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNyb290L3Vzci9p
bmNsdWRlL3RzczInPGJyPgogICAgwqAvYmluL21rZGlyIC1wCicvaG9tZS90b21hc3pwci96eW5x
X2ZyZXNoL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmlo
Zi9zeXNyb290L3Vzci9saWIvdWRldi9ydWxlcy5kJzxicj4KICAgIMKgL3Vzci9iaW4vaW5zdGFs
bCAtYyAtbSA2NDQgbGliL3RzczItbXUucGMgbGliL3RzczItdGN0aS1kZXZpY2UucGMKICAgIGxp
Yi90c3MyLXRjdGktbXNzaW0ucGMgbGliL3RzczItc3lzLnBjIGxpYi90c3MyLWVzeXMucGMKJy9o
b21lL3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9ob3N0L2FybS1idWlsZHJv
b3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2xpYi9wa2djb25maWcnPGJyPgogICAgwqAv
dXNyL2Jpbi9pbnN0YWxsIC1jIC1tIDY0NCBkaXN0L3RwbS11ZGV2LnJ1bGVzCicvaG9tZS90b21h
c3pwci96eW5xX2ZyZXNoL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4
LWdudWVhYmloZi9zeXNyb290L3Vzci9saWIvdWRldi9ydWxlcy5kJzxicj4KICAgIMKgL3Vzci9i
aW4vaW5zdGFsbCAtYyAtbSA2NDQgbWFuL21hbjcvdHNzMi10Y3RpLWRldmljZS43CiAgICBtYW4v
bWFuNy90c3MyLXRjdGktbXNzaW0uNwonL2hvbWUvdG9tYXN6cHIvenlucV9mcmVzaC9idWlsZHJv
b3Qvb3V0cHV0L2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC91c3Iv
c2hhcmUvbWFuL21hbjcnPGJyPgogICAgwqAvdXNyL2Jpbi9pbnN0YWxsIC1jIC1tIDY0NCBtYW4v
bWFuMy9Uc3MyX1RjdGlfRGV2aWNlX0luaXQuMwogICAgbWFuL21hbjMvVHNzMl9UY3RpX01zc2lt
X0luaXQuMwonL2hvbWUvdG9tYXN6cHIvenlucV9mcmVzaC9idWlsZHJvb3Qvb3V0cHV0L2hvc3Qv
YXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC91c3Ivc2hhcmUvbWFuL21hbjMn
PGJyPgogICAgwqAvdXNyL2Jpbi9pbnN0YWxsIC1jIC1tIDY0NCAuL2luY2x1ZGUvdHNzMi90c3My
X2NvbW1vbi5oCiAgICAuL2luY2x1ZGUvdHNzMi90c3MyX3RjdGkuaCAuL2luY2x1ZGUvdHNzMi90
c3MyX3RwbTJfdHlwZXMuaAogICAgLi9pbmNsdWRlL3RzczIvdHNzMl9tdS5oIC4vaW5jbHVkZS90
c3MyL3RzczJfdGN0aV9kZXZpY2UuaAogICAgLi9pbmNsdWRlL3RzczIvdHNzMl90Y3RpX21zc2lt
LmggLi9pbmNsdWRlL3RzczIvdHNzMl9zeXMuaAogICAgLi9pbmNsdWRlL3RzczIvdHNzMl9lc3lz
LmgKJy9ob21lL3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9ob3N0L2FybS1i
dWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvdHNzMic8YnI+CiAg
ICAvdXNyL2Jpbi9tYWtlwqAgaW5zdGFsbC1kYXRhLWhvb2s8YnI+CiAgICBtYWtlWzRdOiBOaWUg
bWEgbmljIGRvIHpyb2JpZW5pYSB3ICdpbnN0YWxsLWRhdGEtaG9vaycuPGJyPgogICAgbGlidG9v
bDogaW5zdGFsbDogL3Vzci9iaW4vaW5zdGFsbCAtYwogICAgc3JjL3RzczItbXUvLmxpYnMvbGli
dHNzMi1tdS5zby4wLjAuMAovaG9tZS90b21hc3pwci96eW5xX2ZyZXNoL2J1aWxkcm9vdC9vdXRw
dXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNyb290L3Vzci9saWIvbGli
dHNzMi1tdS5zby4wLjAuMDxicj4KICAgIGxpYnRvb2w6IGluc3RhbGw6IChjZAovaG9tZS90b21h
c3pwci96eW5xX2ZyZXNoL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4
LWdudWVhYmloZi9zeXNyb290L3Vzci9saWIKICAgICZhbXA7JmFtcDsgeyBsbiAtcyAtZiBsaWJ0
c3MyLW11LnNvLjAuMC4wIGxpYnRzczItbXUuc28uMCB8fCB7IHJtIC1mCiAgICBsaWJ0c3MyLW11
LnNvLjAgJmFtcDsmYW1wOyBsbiAtcyBsaWJ0c3MyLW11LnNvLjAuMC4wCiAgICBsaWJ0c3MyLW11
LnNvLjA7IH07IH0pPGJyPgogICAgbGlidG9vbDogaW5zdGFsbDogKGNkCi9ob21lL3RvbWFzenBy
L3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251
ZWFiaWhmL3N5c3Jvb3QvdXNyL2xpYgogICAgJmFtcDsmYW1wOyB7IGxuIC1zIC1mIGxpYnRzczIt
bXUuc28uMC4wLjAgbGlidHNzMi1tdS5zbyB8fCB7IHJtIC1mCiAgICBsaWJ0c3MyLW11LnNvICZh
bXA7JmFtcDsgbG4gLXMgbGlidHNzMi1tdS5zby4wLjAuMCBsaWJ0c3MyLW11LnNvOyB9OwogICAg
fSk8YnI+CiAgICBsaWJ0b29sOiBpbnN0YWxsOiAvdXNyL2Jpbi9pbnN0YWxsIC1jCiAgICBzcmMv
dHNzMi1tdS8ubGlicy9saWJ0c3MyLW11LmxhaQovaG9tZS90b21hc3pwci96eW5xX2ZyZXNoL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNyb290
L3Vzci9saWIvbGlidHNzMi1tdS5sYTxicj4KICAgIGxpYnRvb2w6IHdhcm5pbmc6IHJlbGlua2lu
ZyAnc3JjL3RzczItdGN0aS9saWJ0c3MyLXRjdGktZGV2aWNlLmxhJzxicj4KICAgIGxpYnRvb2w6
IGluc3RhbGw6IChjZAogICAgL2hvbWUvdG9tYXN6cHIvenlucV9mcmVzaC9idWlsZHJvb3Qvb3V0
cHV0L2J1aWxkL3RwbTItdHNzLTIuMC4wOwogICAgL2Jpbi9iYXNoCiIvaG9tZS90b21hc3pwci96
eW5xX2ZyZXNoL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvdHBtMi10c3MtMi4wLjAvbGlidG9vbCLC
oAogICAgLS10YWcgQ0MgLS1tb2RlPXJlbGluawovaG9tZS90b21hc3pwci96eW5xX2ZyZXNoL2J1
aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYtZ2Nj
CiAgICAtSS4vc3JjIC1JLi9pbmNsdWRlL3RzczIgLXN0ZD1jOTkgLVdhbGwgLVdleHRyYSAtV2Zv
cm1hdC1zZWN1cml0eQogICAgLVdlcnJvciAtZnN0YWNrLXByb3RlY3Rvci1hbGwgLWZwaWMgLWZQ
SUMgLURfREVGQVVMVF9TT1VSQ0UKICAgIC1EX0JTRF9TT1VSQ0UgLURfUE9TSVhfU09VUkNFIC1V
X0ZPUlRJRllfU09VUkNFIC1EX0ZPUlRJRllfU09VUkNFPTIKICAgIC1nIC1PMiAtV25vLW1pc3Np
bmctYnJhY2VzIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFCiAgICAt
RF9GSUxFX09GRlNFVF9CSVRTPTY0IC1PcwogICAgLVdsLC0tdmVyc2lvbi1zY3JpcHQ9Li9saWIv
dHNzMi10Y3RpLWRldmljZS5tYXAgLW8KICAgIHNyYy90c3MyLXRjdGkvbGlidHNzMi10Y3RpLWRl
dmljZS5sYSAtcnBhdGggL3Vzci9saWIKICAgIHNyYy90c3MyLXRjdGkvc3JjX3RzczJfdGN0aV9s
aWJ0c3MyX3RjdGlfZGV2aWNlX2xhLXRjdGktY29tbW9uLmxvCiAgICBzcmMvdHNzMi10Y3RpL3Ny
Y190c3MyX3RjdGlfbGlidHNzMl90Y3RpX2RldmljZV9sYS10Y3RpLWRldmljZS5sbwogICAgc3Jj
L3RzczItbXUvbGlidHNzMi1tdS5sYSBsaWJ1dGlsLmxhIC1sZ2NyeXB0IC1pbnN0LXByZWZpeC1k
aXIKL2hvbWUvdG9tYXN6cHIvenlucV9mcmVzaC9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYXJtLWJ1
aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdCk8YnI+CiAgICBsaWJ0b29sOiByZWxpbms6
Ci9ob21lL3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9ob3N0L2Jpbi9hcm0t
YnVpbGRyb290LWxpbnV4LWdudWVhYmloZi1nY2MKICAgIC1zaGFyZWTCoCAtZlBJQyAtRFBJQ8Kg
CiAgICBzcmMvdHNzMi10Y3RpLy5saWJzL3NyY190c3MyX3RjdGlfbGlidHNzMl90Y3RpX2Rldmlj
ZV9sYS10Y3RpLWNvbW1vbi5vCnNyYy90c3MyLXRjdGkvLmxpYnMvc3JjX3RzczJfdGN0aV9saWJ0
c3MyX3RjdGlfZGV2aWNlX2xhLXRjdGktZGV2aWNlLm/CoAogICAgLVdsLC0td2hvbGUtYXJjaGl2
ZSAuLy5saWJzL2xpYnV0aWwuYSAtV2wsLS1uby13aG9sZS1hcmNoaXZlwqAKLUwvaG9tZS90b21h
c3pwci96eW5xX2ZyZXNoL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4
LWdudWVhYmloZi9zeXNyb290L3Vzci9saWIKICAgIC1ML3Vzci9saWIgLWx0c3MyLW11IC1sZ2Ny
eXB0wqAgLWZzdGFjay1wcm90ZWN0b3ItYWxsIC1nIC1PMiAtT3MKICAgIC1XbCwtLXZlcnNpb24t
c2NyaXB0PS4vbGliL3RzczItdGN0aS1kZXZpY2UubWFwwqDCoCAtV2wsLXNvbmFtZQogICAgLVds
LGxpYnRzczItdGN0aS1kZXZpY2Uuc28uMCAtbwogICAgc3JjL3RzczItdGN0aS8ubGlicy9saWJ0
c3MyLXRjdGktZGV2aWNlLnNvLjAuMC4wPGJyPgogICAgYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVl
YWJpaGYtZ2NjOiBFUlJPUjogdW5zYWZlIGhlYWRlci9saWJyYXJ5IHBhdGgKICAgIHVzZWQgaW4g
Y3Jvc3MtY29tcGlsYXRpb246ICctTC91c3IvbGliJzxicj4KICAgIGxpYnRvb2w6wqDCoCBlcnJv
cjogZXJyb3I6IHJlbGluawogICAgJ3NyYy90c3MyLXRjdGkvbGlidHNzMi10Y3RpLWRldmljZS5s
YScgd2l0aCB0aGUgYWJvdmUgY29tbWFuZCBiZWZvcmUKICAgIGluc3RhbGxpbmcgaXQ8YnI+CiAg
ICBNYWtlZmlsZTo0NjA3OiByZWNpcGUgZm9yIHRhcmdldCAnaW5zdGFsbC1saWJMVExJQlJBUklF
UycgZmFpbGVkPGJyPgogICAgbWFrZVszXTogKioqIFtpbnN0YWxsLWxpYkxUTElCUkFSSUVTXSBF
cnJvciAxPGJyPgogICAgTWFrZWZpbGU6MTI5NjU6IHJlY2lwZSBmb3IgdGFyZ2V0ICdpbnN0YWxs
LWFtJyBmYWlsZWQ8YnI+CiAgICBtYWtlWzJdOiAqKiogW2luc3RhbGwtYW1dIEVycm9yIDI8YnI+
CiAgICBwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI2MjogcmVjaXBlIGZvciB0YXJnZXQKJy9ob21l
L3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9idWlsZC90cG0yLXRzcy0yLjAu
MC8uc3RhbXBfc3RhZ2luZ19pbnN0YWxsZWQnCiAgICBmYWlsZWQ8YnI+CiAgICBtYWtlWzFdOiAq
KioKWy9ob21lL3RvbWFzenByL3p5bnFfZnJlc2gvYnVpbGRyb290L291dHB1dC9idWlsZC90cG0y
LXRzcy0yLjAuMC8uc3RhbXBfc3RhZ2luZ19pbnN0YWxsZWRdCiAgICBFcnJvciAyPGJyPgogICAg
TWFrZWZpbGU6Nzk6IHJlY2lwZSBmb3IgdGFyZ2V0ICdfYWxsJyBmYWlsZWQ8YnI+CiAgICBtYWtl
OiAqKiogW19hbGxdIEVycm9yIDI8YnI+CiAgICA8YnI+CiAgICA8YnI+CiAgICBXaGVuIEkgZGlz
YWJsZSBidWlsZHJvb3Qgb3B0aW9uOjxicj4KICAgIG1ha2UgbWVudWNvbmZpZzxicj4KICAgIEJ1
aWxkIG9wdGlvbnMgLS0tJmd0OyBBZHZhbmNlZDxicj4KICAgIFsgXSBwYXJhbm9pZCBjaGVjayBv
ZiBsaWJyYXJ5L2hlYWRlciBwYXRoczxicj4KICAgIDxicj4KICAgIGNvbXBpbGF0aW9uIGZpbmlz
aGVzIGNvcnJlY3QsIGJ1dCBkZWZhdWx0IG9wdGlvbiBmb3IgYnVpbGRyb290IGlzCiAgICBwYXJh
bm9pZCBjaGVjayBvZiBsaWJyYXJ5L2hlYWRlciBwYXRocyBlbmFibGVkLjxicj4KICAgIEluIG15
IG9waW5pb24gaXQncyBub3QgZ29vZCBpZGVhIHRvIGRpc2FibGUgaXQuPGJyPgogICAgPGJyPgog
ICAgQmVzdCByZWdhcmRzLDxicj4KICAgIDxicj4KICAgIDxkaXYgY2xhc3M9Im1vei1zaWduYXR1
cmUiPi0tIDxicj4KICAgICAgPG1ldGEgaHR0cC1lcXVpdj0iY29udGVudC10eXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPgogICAgICA8dGl0bGU+PC90aXRsZT4KICAgICAg
PGRpdj48c21hbGw+IDxiPlRvbWFzeiBQcnp5YnlzejwvYj4gPGJyPgogICAgICAgICAgU29mdHdh
cmUgRW5naW5lZXI8YnI+CiAgICAgICAgPC9zbWFsbD48c21hbGw+Qi5SLlNwLlAuTS5TLkEuIE1p
a3JvbmlrYSA8L3NtYWxsPjxicj4KICAgICAgPC9kaXY+CiAgICA8L2Rpdj4KICA8L2JvZHk+Cjwv
aHRtbD4K

--===============2937825229675969222==--

