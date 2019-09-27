Content-Type: multipart/mixed; boundary="===============3970959294378524331=="
MIME-Version: 1.0
From: ZhengYu Tsai <kalohomulder at gmail.com>
Subject: Re: [tpm2] How to generate the statically linked executable
Date: Fri, 27 Sep 2019 09:10:17 +0800
Message-ID: <CAAG8Em13B-SuTfP-Ckkjco4r9FbE4k84UD_=XXxFqpPuw6X=Yw@mail.gmail.com>
In-Reply-To: 6901331d-e7cf-6922-381d-787a7fd83358@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3970959294378524331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tadeusz :
when i build tpm2-tss used
*./configure --enable-shared=3Dno --enable-nodl && make && sudo make instal=
l*

I get responding in build tpm2-tools as below :
*./configure "CFLAGS=3D--static -lidn -lrt" --enable-shared=3Dno
--disable-hardening*
or
*./configure "CFLAGS=3D--static" --enable-shared=3Dno --disable-hardening*

derek(a)ubuntu:~/workdir/tpm2-tools$ make
  CC       lib/lib_libcommon_a-files.o
  CC       lib/lib_libcommon_a-log.o
  CC       lib/lib_libcommon_a-object.o
  CC       lib/lib_libcommon_a-pcr.o
  CC       lib/lib_libcommon_a-tool_rc.o
  CC       lib/lib_libcommon_a-tpm2.o
  CC       lib/lib_libcommon_a-tpm2_alg_util.o
  CC       lib/lib_libcommon_a-tpm2_attr_util.o
  CC       lib/lib_libcommon_a-tpm2_auth_util.o
  CC       lib/lib_libcommon_a-tpm2_capability.o
  CC       lib/lib_libcommon_a-tpm2_cc_util.o
  CC       lib/lib_libcommon_a-tpm2_convert.o
  CC       lib/lib_libcommon_a-tpm2_ctx_mgmt.o
  CC       lib/lib_libcommon_a-tpm2_errata.o
  CC       lib/lib_libcommon_a-tpm2_hash.o
  CC       lib/lib_libcommon_a-tpm2_hierarchy.o
  CC       lib/lib_libcommon_a-tpm2_identity_util.o
  CC       lib/lib_libcommon_a-tpm2_kdfa.o
  CC       lib/lib_libcommon_a-tpm2_kdfe.o
  CC       lib/lib_libcommon_a-tpm2_openssl.o
  CC       lib/lib_libcommon_a-tpm2_options.o
  CC       lib/lib_libcommon_a-tpm2_policy.o
  CC       lib/lib_libcommon_a-tpm2_session.o
  CC       lib/lib_libcommon_a-tpm2_util.o
  AR       lib/libcommon.a
ar: `u' modifier ignored since `D' is the default (see `U')
  CC       tools/misc/tpm2_checkquote.o
  CC       tools/tpm2_tool.o
  CCLD     tools/misc/tpm2_checkquote
/usr/local/lib/libtss2-tcti-mssim.a(tcti-mssim.o):(.data.rel.ro+0x0):
multiple definition of `tss2_tcti_info'
/usr/local/lib/libtss2-tcti-device.a(tcti-device.o):(.data.rel.ro+0x0):
first defined here
/usr/local/lib/libtss2-tcti-mssim.a(tcti-mssim.o): In function
`Tss2_Tcti_Info':
/home/derek/workdir/tpm2-tss/src/tss2-tcti/tcti-mssim.c:601: multiple
definition of `Tss2_Tcti_Info'
/usr/local/lib/libtss2-tcti-device.a(tcti-device.o):/home/derek/workdir/tpm=
2-tss/src/tss2-tcti/tcti-device.c:458:
first defined here
/usr/local/lib/libtss2-tcti-device.a(io.o): In function `socket_connect':
/home/derek/workdir/tpm2-tss/src/util/io.c:216: warning: Using
'getaddrinfo' in statically linked applications requires at runtime the
shared libraries from the glibc version used for linking
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_globallookup':
(.text+0xa): undefined reference to `dlopen'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_globallookup':
(.text+0x20): undefined reference to `dlsym'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_globallookup':
(.text+0x2a): undefined reference to `dlclose'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_bind_func':
(.text+0x32d): undefined reference to `dlsym'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_bind_func':
(.text+0x3ad): undefined reference to `dlerror'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_bind_var':
(.text+0x42d): undefined reference to `dlsym'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_bind_var':
(.text+0x4ad): undefined reference to `dlerror'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_load':
(.text+0x518): undefined reference to `dlopen'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_load':
(.text+0x575): undefined reference to `dlclose'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_load':
(.text+0x5ae): undefined reference to `dlerror'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_pathbyaddr':
(.text+0x641): undefined reference to `dladdr'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_pathbyaddr':
(.text+0x6a1): undefined reference to `dlerror'
/usr/lib/gcc/i686-linux-gnu/5/../../../i386-linux-gnu/libcrypto.a(dso_dlfcn=
.o):
In function `dlfcn_unload':
(.text+0x70b): undefined reference to `dlclose'
collect2: error: ld returned 1 exit status
Makefile:2054: recipe for target 'tools/misc/tpm2_checkquote' failed
make: *** [tools/misc/tpm2_checkquote] Error 1


Tadeusz Struk <tadeusz.struk(a)intel.com> =E6=96=BC 2019=E5=B9=B49=E6=9C=88=
27=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8812:44=E5=AF=AB=E9=81=93=EF=
=BC=9A

> On 9/25/19 6:40 PM, ZhengYu Tsai wrote:
> >
> /usr/local/lib/libtss2-esys.a(src_tss2_esys_libtss2_esys_la-tctildr-dl.o):
> In function `handle_from_name':
> > /home/derek/workdir/tpm2-tss/src/tss2-tcti/tctildr-dl.c:84: warning:
> Using 'dlopen' in statically linked applications requires at runtime the
> shared libraries from the glibc version used for linking
> > /usr/bin/ld: attempted static link of dynamic object
> `/usr/lib/i386-linux-gnu/libcurl-gnutls.so'
> > collect2: error: ld returned 1 exit status
> > Makefile:2170: recipe for target 'tools/tpm2_getekcertificate' failed
> > make: *** [tools/tpm2_getekcertificate] Error 1
> >
> > I also found the tpm2-tss configure *--enable-shared=3Dno,*
> > This option is necessary, it will affect the compilation tpm2-tools.
>
> Right, you also need to use --enable_nodl configure option when you build
> tss.
>
> --
> Tadeusz
>

--===============3970959294378524331==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGZvbnQgY29sb3I9IiMwMDAwZmYiPkhpIFRhZGV1c3ogOjwvZm9udD48
ZGl2Pjxmb250IGNvbG9yPSIjMDAwMGZmIj53aGVuIGkgYnVpbGQgdHBtMi10c3MgdXNlZDwvZm9u
dD7CoDwvZGl2PjxkaXY+PGI+Li9jb25maWd1cmUgLS1lbmFibGUtc2hhcmVkPW5vIDxmb250IGNv
bG9yPSIjMDAwMDAwIiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwwKSI+LS1l
bmFibGUtbm9kbDwvZm9udD48Zm9udCBjb2xvcj0iIzAwMDAwMCIgc3R5bGU9ImJhY2tncm91bmQt
Y29sb3I6cmdiKDI1NSwyNTUsMjU1KSI+ICZhbXA7JmFtcDsgbWFrZSAmYW1wOyZhbXA7IHN1ZG8g
bWFrZSBpbnN0YWxsPC9mb250PjwvYj48L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMDAwMGZmIj48
YnI+PC9mb250PjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMwMDAwZmYiPkkgZ2V0wqByZXNwb25k
aW5nIGluIGJ1aWxkIHRwbTItdG9vbHMgYXMgYmVsb3cgOjwvZm9udD48L2Rpdj48ZGl2PjxiPi4v
Y29uZmlndXJlICZxdW90O0NGTEFHUz0tLXN0YXRpYyA8c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1j
b2xvcjpyZ2IoMjU1LDI1NSwwKSI+LWxpZG4gLWxydDwvc3Bhbj4mcXVvdDsgLS1lbmFibGUtc2hh
cmVkPW5vIC0tZGlzYWJsZS1oYXJkZW5pbmc8L2I+PGJyPjwvZGl2PjxkaXY+b3I8L2Rpdj48ZGl2
PjxiPi4vY29uZmlndXJlICZxdW90O0NGTEFHUz0tLXN0YXRpYyZxdW90OyAtLWVuYWJsZS1zaGFy
ZWQ9bm8gLS1kaXNhYmxlLWhhcmRlbmluZzwvYj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmRl
cmVrQHVidW50dTp+L3dvcmtkaXIvdHBtMi10b29scyQgbWFrZTxicj7CoCBDQyDCoCDCoCDCoCBs
aWIvbGliX2xpYmNvbW1vbl9hLWZpbGVzLm88YnI+wqAgQ0MgwqAgwqAgwqAgbGliL2xpYl9saWJj
b21tb25fYS1sb2cubzxicj7CoCBDQyDCoCDCoCDCoCBsaWIvbGliX2xpYmNvbW1vbl9hLW9iamVj
dC5vPGJyPsKgIENDIMKgIMKgIMKgIGxpYi9saWJfbGliY29tbW9uX2EtcGNyLm88YnI+wqAgQ0Mg
wqAgwqAgwqAgbGliL2xpYl9saWJjb21tb25fYS10b29sX3JjLm88YnI+wqAgQ0MgwqAgwqAgwqAg
bGliL2xpYl9saWJjb21tb25fYS10cG0yLm88YnI+wqAgQ0MgwqAgwqAgwqAgbGliL2xpYl9saWJj
b21tb25fYS10cG0yX2FsZ191dGlsLm88YnI+wqAgQ0MgwqAgwqAgwqAgbGliL2xpYl9saWJjb21t
b25fYS10cG0yX2F0dHJfdXRpbC5vPGJyPsKgIENDIMKgIMKgIMKgIGxpYi9saWJfbGliY29tbW9u
X2EtdHBtMl9hdXRoX3V0aWwubzxicj7CoCBDQyDCoCDCoCDCoCBsaWIvbGliX2xpYmNvbW1vbl9h
LXRwbTJfY2FwYWJpbGl0eS5vPGJyPsKgIENDIMKgIMKgIMKgIGxpYi9saWJfbGliY29tbW9uX2Et
dHBtMl9jY191dGlsLm88YnI+wqAgQ0MgwqAgwqAgwqAgbGliL2xpYl9saWJjb21tb25fYS10cG0y
X2NvbnZlcnQubzxicj7CoCBDQyDCoCDCoCDCoCBsaWIvbGliX2xpYmNvbW1vbl9hLXRwbTJfY3R4
X21nbXQubzxicj7CoCBDQyDCoCDCoCDCoCBsaWIvbGliX2xpYmNvbW1vbl9hLXRwbTJfZXJyYXRh
Lm88YnI+wqAgQ0MgwqAgwqAgwqAgbGliL2xpYl9saWJjb21tb25fYS10cG0yX2hhc2gubzxicj7C
oCBDQyDCoCDCoCDCoCBsaWIvbGliX2xpYmNvbW1vbl9hLXRwbTJfaGllcmFyY2h5Lm88YnI+wqAg
Q0MgwqAgwqAgwqAgbGliL2xpYl9saWJjb21tb25fYS10cG0yX2lkZW50aXR5X3V0aWwubzxicj7C
oCBDQyDCoCDCoCDCoCBsaWIvbGliX2xpYmNvbW1vbl9hLXRwbTJfa2RmYS5vPGJyPsKgIENDIMKg
IMKgIMKgIGxpYi9saWJfbGliY29tbW9uX2EtdHBtMl9rZGZlLm88YnI+wqAgQ0MgwqAgwqAgwqAg
bGliL2xpYl9saWJjb21tb25fYS10cG0yX29wZW5zc2wubzxicj7CoCBDQyDCoCDCoCDCoCBsaWIv
bGliX2xpYmNvbW1vbl9hLXRwbTJfb3B0aW9ucy5vPGJyPsKgIENDIMKgIMKgIMKgIGxpYi9saWJf
bGliY29tbW9uX2EtdHBtMl9wb2xpY3kubzxicj7CoCBDQyDCoCDCoCDCoCBsaWIvbGliX2xpYmNv
bW1vbl9hLXRwbTJfc2Vzc2lvbi5vPGJyPsKgIENDIMKgIMKgIMKgIGxpYi9saWJfbGliY29tbW9u
X2EtdHBtMl91dGlsLm88YnI+wqAgQVIgwqAgwqAgwqAgbGliL2xpYmNvbW1vbi5hPGJyPmFyOiBg
dSYjMzk7IG1vZGlmaWVyIGlnbm9yZWQgc2luY2UgYEQmIzM5OyBpcyB0aGUgZGVmYXVsdCAoc2Vl
IGBVJiMzOTspPGJyPsKgIENDIMKgIMKgIMKgIHRvb2xzL21pc2MvdHBtMl9jaGVja3F1b3RlLm88
YnI+wqAgQ0MgwqAgwqAgwqAgdG9vbHMvdHBtMl90b29sLm88YnI+wqAgQ0NMRCDCoCDCoCB0b29s
cy9taXNjL3RwbTJfY2hlY2txdW90ZTxicj4vdXNyL2xvY2FsL2xpYi9saWJ0c3MyLXRjdGktbXNz
aW0uYSh0Y3RpLW1zc2ltLm8pOiguPGEgaHJlZj0iaHR0cDovL2RhdGEucmVsLnJvIj5kYXRhLnJl
bC5ybzwvYT4rMHgwKTogbXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBgdHNzMl90Y3RpX2luZm8mIzM5
Ozxicj4vdXNyL2xvY2FsL2xpYi9saWJ0c3MyLXRjdGktZGV2aWNlLmEodGN0aS1kZXZpY2Uubyk6
KC48YSBocmVmPSJodHRwOi8vZGF0YS5yZWwucm8iPmRhdGEucmVsLnJvPC9hPisweDApOiBmaXJz
dCBkZWZpbmVkIGhlcmU8YnI+L3Vzci9sb2NhbC9saWIvbGlidHNzMi10Y3RpLW1zc2ltLmEodGN0
aS1tc3NpbS5vKTogSW4gZnVuY3Rpb24gYFRzczJfVGN0aV9JbmZvJiMzOTs6PGJyPi9ob21lL2Rl
cmVrL3dvcmtkaXIvdHBtMi10c3Mvc3JjL3RzczItdGN0aS90Y3RpLW1zc2ltLmM6NjAxOiBtdWx0
aXBsZSBkZWZpbml0aW9uIG9mIGBUc3MyX1RjdGlfSW5mbyYjMzk7PGJyPi91c3IvbG9jYWwvbGli
L2xpYnRzczItdGN0aS1kZXZpY2UuYSh0Y3RpLWRldmljZS5vKTovaG9tZS9kZXJlay93b3JrZGly
L3RwbTItdHNzL3NyYy90c3MyLXRjdGkvdGN0aS1kZXZpY2UuYzo0NTg6IGZpcnN0IGRlZmluZWQg
aGVyZTxicj4vdXNyL2xvY2FsL2xpYi9saWJ0c3MyLXRjdGktZGV2aWNlLmEoaW8ubyk6IEluIGZ1
bmN0aW9uIGBzb2NrZXRfY29ubmVjdCYjMzk7Ojxicj4vaG9tZS9kZXJlay93b3JrZGlyL3RwbTIt
dHNzL3NyYy91dGlsL2lvLmM6MjE2OiB3YXJuaW5nOiBVc2luZyAmIzM5O2dldGFkZHJpbmZvJiMz
OTsgaW4gc3RhdGljYWxseSBsaW5rZWQgYXBwbGljYXRpb25zIHJlcXVpcmVzIGF0IHJ1bnRpbWUg
dGhlIHNoYXJlZCBsaWJyYXJpZXMgZnJvbSB0aGUgZ2xpYmMgdmVyc2lvbiB1c2VkIGZvciBsaW5r
aW5nPGJyPi91c3IvbGliL2djYy9pNjg2LWxpbnV4LWdudS81Ly4uLy4uLy4uL2kzODYtbGludXgt
Z251L2xpYmNyeXB0by5hKGRzb19kbGZjbi5vKTogSW4gZnVuY3Rpb24gYGRsZmNuX2dsb2JhbGxv
b2t1cCYjMzk7Ojxicj4oLnRleHQrMHhhKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZGxvcGVu
JiMzOTs8YnI+L3Vzci9saWIvZ2NjL2k2ODYtbGludXgtZ251LzUvLi4vLi4vLi4vaTM4Ni1saW51
eC1nbnUvbGliY3J5cHRvLmEoZHNvX2RsZmNuLm8pOiBJbiBmdW5jdGlvbiBgZGxmY25fZ2xvYmFs
bG9va3VwJiMzOTs6PGJyPigudGV4dCsweDIwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZGxz
eW0mIzM5Ozxicj4vdXNyL2xpYi9nY2MvaTY4Ni1saW51eC1nbnUvNS8uLi8uLi8uLi9pMzg2LWxp
bnV4LWdudS9saWJjcnlwdG8uYShkc29fZGxmY24ubyk6IEluIGZ1bmN0aW9uIGBkbGZjbl9nbG9i
YWxsb29rdXAmIzM5Ozo8YnI+KC50ZXh0KzB4MmEpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBk
bGNsb3NlJiMzOTs8YnI+L3Vzci9saWIvZ2NjL2k2ODYtbGludXgtZ251LzUvLi4vLi4vLi4vaTM4
Ni1saW51eC1nbnUvbGliY3J5cHRvLmEoZHNvX2RsZmNuLm8pOiBJbiBmdW5jdGlvbiBgZGxmY25f
YmluZF9mdW5jJiMzOTs6PGJyPigudGV4dCsweDMyZCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGRsc3ltJiMzOTs8YnI+L3Vzci9saWIvZ2NjL2k2ODYtbGludXgtZ251LzUvLi4vLi4vLi4vaTM4
Ni1saW51eC1nbnUvbGliY3J5cHRvLmEoZHNvX2RsZmNuLm8pOiBJbiBmdW5jdGlvbiBgZGxmY25f
YmluZF9mdW5jJiMzOTs6PGJyPigudGV4dCsweDNhZCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGRsZXJyb3ImIzM5Ozxicj4vdXNyL2xpYi9nY2MvaTY4Ni1saW51eC1nbnUvNS8uLi8uLi8uLi9p
Mzg2LWxpbnV4LWdudS9saWJjcnlwdG8uYShkc29fZGxmY24ubyk6IEluIGZ1bmN0aW9uIGBkbGZj
bl9iaW5kX3ZhciYjMzk7Ojxicj4oLnRleHQrMHg0MmQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBkbHN5bSYjMzk7PGJyPi91c3IvbGliL2djYy9pNjg2LWxpbnV4LWdudS81Ly4uLy4uLy4uL2kz
ODYtbGludXgtZ251L2xpYmNyeXB0by5hKGRzb19kbGZjbi5vKTogSW4gZnVuY3Rpb24gYGRsZmNu
X2JpbmRfdmFyJiMzOTs6PGJyPigudGV4dCsweDRhZCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGRsZXJyb3ImIzM5Ozxicj4vdXNyL2xpYi9nY2MvaTY4Ni1saW51eC1nbnUvNS8uLi8uLi8uLi9p
Mzg2LWxpbnV4LWdudS9saWJjcnlwdG8uYShkc29fZGxmY24ubyk6IEluIGZ1bmN0aW9uIGBkbGZj
bl9sb2FkJiMzOTs6PGJyPigudGV4dCsweDUxOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRs
b3BlbiYjMzk7PGJyPi91c3IvbGliL2djYy9pNjg2LWxpbnV4LWdudS81Ly4uLy4uLy4uL2kzODYt
bGludXgtZ251L2xpYmNyeXB0by5hKGRzb19kbGZjbi5vKTogSW4gZnVuY3Rpb24gYGRsZmNuX2xv
YWQmIzM5Ozo8YnI+KC50ZXh0KzB4NTc1KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZGxjbG9z
ZSYjMzk7PGJyPi91c3IvbGliL2djYy9pNjg2LWxpbnV4LWdudS81Ly4uLy4uLy4uL2kzODYtbGlu
dXgtZ251L2xpYmNyeXB0by5hKGRzb19kbGZjbi5vKTogSW4gZnVuY3Rpb24gYGRsZmNuX2xvYWQm
IzM5Ozo8YnI+KC50ZXh0KzB4NWFlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZGxlcnJvciYj
Mzk7PGJyPi91c3IvbGliL2djYy9pNjg2LWxpbnV4LWdudS81Ly4uLy4uLy4uL2kzODYtbGludXgt
Z251L2xpYmNyeXB0by5hKGRzb19kbGZjbi5vKTogSW4gZnVuY3Rpb24gYGRsZmNuX3BhdGhieWFk
ZHImIzM5Ozo8YnI+KC50ZXh0KzB4NjQxKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZGxhZGRy
JiMzOTs8YnI+L3Vzci9saWIvZ2NjL2k2ODYtbGludXgtZ251LzUvLi4vLi4vLi4vaTM4Ni1saW51
eC1nbnUvbGliY3J5cHRvLmEoZHNvX2RsZmNuLm8pOiBJbiBmdW5jdGlvbiBgZGxmY25fcGF0aGJ5
YWRkciYjMzk7Ojxicj4oLnRleHQrMHg2YTEpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkbGVy
cm9yJiMzOTs8YnI+L3Vzci9saWIvZ2NjL2k2ODYtbGludXgtZ251LzUvLi4vLi4vLi4vaTM4Ni1s
aW51eC1nbnUvbGliY3J5cHRvLmEoZHNvX2RsZmNuLm8pOiBJbiBmdW5jdGlvbiBgZGxmY25fdW5s
b2FkJiMzOTs6PGJyPigudGV4dCsweDcwYik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRsY2xv
c2UmIzM5Ozxicj5jb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXM8YnI+
TWFrZWZpbGU6MjA1NDogcmVjaXBlIGZvciB0YXJnZXQgJiMzOTt0b29scy9taXNjL3RwbTJfY2hl
Y2txdW90ZSYjMzk7IGZhaWxlZDxicj5tYWtlOiAqKiogW3Rvb2xzL21pc2MvdHBtMl9jaGVja3F1
b3RlXSBFcnJvciAxPGJyPjxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVv
dGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5UYWRldXN6IFN0cnVrICZsdDs8
YSBocmVmPSJtYWlsdG86dGFkZXVzei5zdHJ1a0BpbnRlbC5jb20iPnRhZGV1c3ouc3RydWtAaW50
ZWwuY29tPC9hPiZndDsg5pa8IDIwMTnlubQ55pyIMjfml6Ug6YCx5LqUIOS4iuWNiDEyOjQ05a+r
6YGT77yaPGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiA5LzI1LzE5IDY6NDAgUE0sIFpoZW5nWXUgVHNhaSB3
cm90ZTo8YnI+CiZndDsgL3Vzci9sb2NhbC9saWIvbGlidHNzMi1lc3lzLmEoc3JjX3RzczJfZXN5
c19saWJ0c3MyX2VzeXNfbGEtdGN0aWxkci1kbC5vKTogSW4gZnVuY3Rpb24gYGhhbmRsZV9mcm9t
X25hbWUmIzM5Ozo8YnI+CiZndDsgL2hvbWUvZGVyZWsvd29ya2Rpci90cG0yLXRzcy9zcmMvdHNz
Mi10Y3RpL3RjdGlsZHItZGwuYzo4NDogd2FybmluZzogVXNpbmcgJiMzOTtkbG9wZW4mIzM5OyBp
biBzdGF0aWNhbGx5IGxpbmtlZCBhcHBsaWNhdGlvbnMgcmVxdWlyZXMgYXQgcnVudGltZSB0aGUg
c2hhcmVkIGxpYnJhcmllcyBmcm9tIHRoZSBnbGliYyB2ZXJzaW9uIHVzZWQgZm9yIGxpbmtpbmc8
YnI+CiZndDsgL3Vzci9iaW4vbGQ6IGF0dGVtcHRlZCBzdGF0aWMgbGluayBvZiBkeW5hbWljIG9i
amVjdCBgL3Vzci9saWIvaTM4Ni1saW51eC1nbnUvbGliY3VybC1nbnV0bHMuc28mIzM5Ozxicj4K
Jmd0OyBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXM8YnI+CiZndDsg
TWFrZWZpbGU6MjE3MDogcmVjaXBlIGZvciB0YXJnZXQgJiMzOTt0b29scy90cG0yX2dldGVrY2Vy
dGlmaWNhdGUmIzM5OyBmYWlsZWQ8YnI+CiZndDsgbWFrZTogKioqIFt0b29scy90cG0yX2dldGVr
Y2VydGlmaWNhdGVdIEVycm9yIDE8YnI+CiZndDsgPGJyPgomZ3Q7IEkgYWxzbyBmb3VuZCB0aGUg
dHBtMi10c3MgY29uZmlndXJlwqAqLS1lbmFibGUtc2hhcmVkPW5vLCo8YnI+CiZndDsgVGhpcyBv
cHRpb24gaXMgbmVjZXNzYXJ5LCBpdCB3aWxsIGFmZmVjdCB0aGUgY29tcGlsYXRpb24gdHBtMi10
b29scy48YnI+Cjxicj4KUmlnaHQsIHlvdSBhbHNvIG5lZWQgdG8gdXNlIC0tZW5hYmxlX25vZGwg
Y29uZmlndXJlIG9wdGlvbiB3aGVuIHlvdSBidWlsZCB0c3MuPGJyPgo8YnI+Ci0tIDxicj4KVGFk
ZXVzejxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============3970959294378524331==--

