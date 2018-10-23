Content-Type: multipart/mixed; boundary="===============4244341936095366393=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: Re: [tpm2] bootstrap error on CentOS7
Date: Tue, 23 Oct 2018 16:07:09 +0800
Message-ID: <CA+tBKVgaFLQzLH5jJxZM8frxuwyv5rj9emRNSWTdk4iEGFwMEw@mail.gmail.com>
In-Reply-To: CA+tBKVh8ZR4qERXWUdLTHVe5GGdTC6m0=xz1iNarE_fwq2iutg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4244341936095366393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The line 65 in configure.ac, and I don't know how to solve it.

 53 AC_DEFUN([unit_test_checks],[
 54
 55     PKG_CHECK_MODULES([CMOCKA],[cmocka],
 56         [AC_DEFINE([HAVE_CMOCKA],[1])])
 57
 58     AC_CHECK_PROG([tpm2_abrmd], [tpm2-abrmd],
 59         [yes], [no])
 60
 61     AC_CHECK_PROG([tpm_server], [tpm_server],
 62         [yes], [no])
 63
 64     AS_IF([test "$tpm2_abrmd" !=3D "yes"],
 65            [AC_MSG_ERROR([Required executable tpm2_abrmd not found, try
setting PATH])],
 66         [])
 67
 68     AS_IF([test "$tpm_server" !=3D "yes"],
 69         [AC_MSG_ERROR([Required executable tpm_server not found, try
setting PATH])],
 70         [])
 71 ])
 72


On Tue, Oct 23, 2018 at 4:05 PM Terry An <terry.an.bj(a)gmail.com> wrote:

> here is my tpm2-tss & tpm2-abrmd scripts:
> 1. tpm2-tss-2.1.0
> ./configure --prefix=3D/usr --enable-debug --with-crypto=3Dossl
> --disable-doxygen-doc
> make && make install
> 2. tpm2-abrmd-2.0.2
> yum install dbus-devel glib2-devel
> TSS2_SYS_CFLAGS=3D' ' TSS2_SYS_LIBS=3D'-ltss2-sys -L/usr/lib/' ./configure
> --prefix=3D/usr
> make && make install
>
> On Tue, Oct 23, 2018 at 3:51 PM Terry An <terry.an.bj(a)gmail.com> wrote:
>
>> I have cloned the latest code of kms-tools from github, and I need to
>> test the command 'tpm2-import'
>> but the master branch doesn't have "configure" command, and "bootstrap"
>> return error
>>
>> [root(a)localhost tpm2-tools]# ./bootstrap
>> Generating file lists: src_vars.mk
>> libtoolize: putting auxiliary files in `.'.
>> libtoolize: linking file `./ltmain.sh'
>> libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
>> libtoolize: linking file `m4/libtool.m4'
>> libtoolize: linking file `m4/ltoptions.m4'
>> libtoolize: linking file `m4/ltsugar.m4'
>> libtoolize: linking file `m4/ltversion.m4'
>> libtoolize: linking file `m4/lt~obsolete.m4'
>> configure.ac:65: error: possibly undefined macro: AC_MSG_ERROR
>>       If this token and others are legitimate, please use
>> m4_pattern_allow.
>>       See the Autoconf documentation.
>> autoreconf: /usr/bin/autoconf failed with exit status: 1
>> [root(a)localhost tpm2-tools]# rpm -q libtool pkgconfig autoconf automake
>> m4
>> libtool-2.4.2-22.el7_3.x86_64
>> pkgconfig-0.27.1-4.el7.x86_64
>> autoconf-2.69-11.el7.noarch
>> automake-1.13.4-3.el7.noarch
>> m4-1.4.16-10.el7.x86_64
>>
>>
>>

--===============4244341936095366393==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+VGhlIGxpbmUgNjUgaW4gPGEgaHJlZj0iaHR0
cDovL2NvbmZpZ3VyZS5hYyI+Y29uZmlndXJlLmFjPC9hPiwgYW5kIEkgZG9uJiMzOTt0IGtub3cg
aG93IHRvIHNvbHZlIGl0LjwvZGl2PjxkaXYgZGlyPSJsdHIiPjxicj48ZGl2PjxkaXY+wqA1MyBB
Q19ERUZVTihbdW5pdF90ZXN0X2NoZWNrc10sWzwvZGl2PjxkaXY+wqA1NMKgPC9kaXY+PGRpdj7C
oDU1wqAgwqAgwqBQS0dfQ0hFQ0tfTU9EVUxFUyhbQ01PQ0tBXSxbY21vY2thXSw8L2Rpdj48ZGl2
PsKgNTbCoCDCoCDCoCDCoCDCoFtBQ19ERUZJTkUoW0hBVkVfQ01PQ0tBXSxbMV0pXSk8L2Rpdj48
ZGl2PsKgNTfCoDwvZGl2PjxkaXY+wqA1OMKgIMKgIMKgQUNfQ0hFQ0tfUFJPRyhbdHBtMl9hYnJt
ZF0sIFt0cG0yLWFicm1kXSw8L2Rpdj48ZGl2PsKgNTnCoCDCoCDCoCDCoCDCoFt5ZXNdLCBbbm9d
KTwvZGl2PjxkaXY+wqA2MMKgPC9kaXY+PGRpdj7CoDYxwqAgwqAgwqBBQ19DSEVDS19QUk9HKFt0
cG1fc2VydmVyXSwgW3RwbV9zZXJ2ZXJdLDwvZGl2PjxkaXY+wqA2MsKgIMKgIMKgIMKgIMKgW3ll
c10sIFtub10pPC9kaXY+PGRpdj7CoDYzwqA8L2Rpdj48ZGl2PsKgNjTCoCDCoCDCoEFTX0lGKFt0
ZXN0ICZxdW90OyR0cG0yX2Ficm1kJnF1b3Q7ICE9ICZxdW90O3llcyZxdW90O10sPC9kaXY+PGRp
dj7CoDY1wqAgwqAgwqAgwqAgwqAgwqAgW0FDX01TR19FUlJPUihbUmVxdWlyZWQgZXhlY3V0YWJs
ZSB0cG0yX2Ficm1kIG5vdCBmb3VuZCwgdHJ5IHNldHRpbmcgUEFUSF0pXSw8L2Rpdj48ZGl2PsKg
NjbCoCDCoCDCoCDCoCDCoFtdKTwvZGl2PjxkaXY+wqA2N8KgPC9kaXY+PGRpdj7CoDY4wqAgwqAg
wqBBU19JRihbdGVzdCAmcXVvdDskdHBtX3NlcnZlciZxdW90OyAhPSAmcXVvdDt5ZXMmcXVvdDtd
LDwvZGl2PjxkaXY+wqA2OcKgIMKgIMKgIMKgIMKgW0FDX01TR19FUlJPUihbUmVxdWlyZWQgZXhl
Y3V0YWJsZSB0cG1fc2VydmVyIG5vdCBmb3VuZCwgdHJ5IHNldHRpbmcgUEFUSF0pXSw8L2Rpdj48
ZGl2PsKgNzDCoCDCoCDCoCDCoCDCoFtdKTwvZGl2PjxkaXY+wqA3MSBdKTwvZGl2PjxkaXY+wqA3
MsKgPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIj5PbiBUdWUsIE9jdCAyMywgMjAxOCBhdCA0OjA1
IFBNIFRlcnJ5IEFuICZsdDs8YSBocmVmPSJtYWlsdG86dGVycnkuYW4uYmpAZ21haWwuY29tIj50
ZXJyeS5hbi5iakBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUg
Y2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9
Imx0ciI+aGVyZSBpcyBteSB0cG0yLXRzcyAmYW1wOyB0cG0yLWFicm1kIHNjcmlwdHM6PGRpdj48
ZGl2PjEuIHRwbTItdHNzLTIuMS4wPC9kaXY+PGRpdj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6
cHJlLXdyYXAiPgk8L3NwYW4+Li9jb25maWd1cmUgLS1wcmVmaXg9L3VzciAtLWVuYWJsZS1kZWJ1
ZyAtLXdpdGgtY3J5cHRvPW9zc2wgLS1kaXNhYmxlLWRveHlnZW4tZG9jPC9kaXY+PGRpdj48c3Bh
biBzdHlsZT0id2hpdGUtc3BhY2U6cHJlLXdyYXAiPgk8L3NwYW4+bWFrZSAmYW1wOyZhbXA7IG1h
a2UgaW5zdGFsbDwvZGl2PjxkaXY+Mi4gdHBtMi1hYnJtZC0yLjAuMjwvZGl2PjxkaXY+PHNwYW4g
c3R5bGU9IndoaXRlLXNwYWNlOnByZS13cmFwIj4JPC9zcGFuPnl1bSBpbnN0YWxsIGRidXMtZGV2
ZWwgZ2xpYjItZGV2ZWw8L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUtd3Jh
cCI+CTwvc3Bhbj5UU1MyX1NZU19DRkxBR1M9JiMzOTsgJiMzOTsgVFNTMl9TWVNfTElCUz0mIzM5
Oy1sdHNzMi1zeXMgLUwvdXNyL2xpYi8mIzM5OyAuL2NvbmZpZ3VyZSAtLXByZWZpeD0vdXNyPC9k
aXY+PGRpdj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlLXdyYXAiPgk8L3NwYW4+bWFrZSAm
YW1wOyZhbXA7IG1ha2UgaW5zdGFsbDwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNs
YXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciI+T24gVHVlLCBPY3QgMjMsIDIwMTggYXQg
Mzo1MSBQTSBUZXJyeSBBbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRlcnJ5LmFuLmJqQGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPnRlcnJ5LmFuLmJqQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxi
cj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAw
IDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2
IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2PkkgaGF2ZSBjbG9u
ZWQgdGhlIGxhdGVzdCBjb2RlIG9mIGttcy10b29scyBmcm9tIGdpdGh1YiwgYW5kIEkgbmVlZCB0
byB0ZXN0IHRoZSBjb21tYW5kICYjMzk7dHBtMi1pbXBvcnQmIzM5OzwvZGl2PjxkaXY+YnV0IHRo
ZSBtYXN0ZXIgYnJhbmNoIGRvZXNuJiMzOTt0IGhhdmUgJnF1b3Q7Y29uZmlndXJlJnF1b3Q7IGNv
bW1hbmQsIGFuZCAmcXVvdDtib290c3RyYXAmcXVvdDsgcmV0dXJuIGVycm9yPC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj5bcm9vdEBsb2NhbGhvc3QgdHBtMi10b29sc10jIC4vYm9vdHN0cmFwwqA8
L2Rpdj48ZGl2PkdlbmVyYXRpbmcgZmlsZSBsaXN0czogPGEgaHJlZj0iaHR0cDovL3NyY192YXJz
Lm1rIiB0YXJnZXQ9Il9ibGFuayI+c3JjX3ZhcnMubWs8L2E+PC9kaXY+PGRpdj5saWJ0b29saXpl
OiBwdXR0aW5nIGF1eGlsaWFyeSBmaWxlcyBpbiBgLiYjMzk7LjwvZGl2PjxkaXY+bGlidG9vbGl6
ZTogbGlua2luZyBmaWxlIGAuL2x0bWFpbi5zaCYjMzk7PC9kaXY+PGRpdj5saWJ0b29saXplOiBw
dXR0aW5nIG1hY3JvcyBpbiBBQ19DT05GSUdfTUFDUk9fRElSLCBgbTQmIzM5Oy48L2Rpdj48ZGl2
PmxpYnRvb2xpemU6IGxpbmtpbmcgZmlsZSBgbTQvbGlidG9vbC5tNCYjMzk7PC9kaXY+PGRpdj5s
aWJ0b29saXplOiBsaW5raW5nIGZpbGUgYG00L2x0b3B0aW9ucy5tNCYjMzk7PC9kaXY+PGRpdj5s
aWJ0b29saXplOiBsaW5raW5nIGZpbGUgYG00L2x0c3VnYXIubTQmIzM5OzwvZGl2PjxkaXY+bGli
dG9vbGl6ZTogbGlua2luZyBmaWxlIGBtNC9sdHZlcnNpb24ubTQmIzM5OzwvZGl2PjxkaXY+bGli
dG9vbGl6ZTogbGlua2luZyBmaWxlIGBtNC9sdH5vYnNvbGV0ZS5tNCYjMzk7PC9kaXY+PGRpdj48
YSBocmVmPSJodHRwOi8vY29uZmlndXJlLmFjOjY1IiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJl
LmFjOjY1PC9hPjogZXJyb3I6IHBvc3NpYmx5IHVuZGVmaW5lZCBtYWNybzogQUNfTVNHX0VSUk9S
PC9kaXY+PGRpdj7CoCDCoCDCoCBJZiB0aGlzIHRva2VuIGFuZCBvdGhlcnMgYXJlIGxlZ2l0aW1h
dGUsIHBsZWFzZSB1c2UgbTRfcGF0dGVybl9hbGxvdy48L2Rpdj48ZGl2PsKgIMKgIMKgIFNlZSB0
aGUgQXV0b2NvbmYgZG9jdW1lbnRhdGlvbi48L2Rpdj48ZGl2PmF1dG9yZWNvbmY6IC91c3IvYmlu
L2F1dG9jb25mIGZhaWxlZCB3aXRoIGV4aXQgc3RhdHVzOiAxPC9kaXY+PGRpdj48ZGl2Pltyb290
QGxvY2FsaG9zdCB0cG0yLXRvb2xzXSMgcnBtIC1xIGxpYnRvb2wgcGtnY29uZmlnIGF1dG9jb25m
IGF1dG9tYWtlIG00wqA8L2Rpdj48ZGl2PmxpYnRvb2wtMi40LjItMjIuZWw3XzMueDg2XzY0PC9k
aXY+PGRpdj5wa2djb25maWctMC4yNy4xLTQuZWw3Lng4Nl82NDwvZGl2PjxkaXY+YXV0b2NvbmYt
Mi42OS0xMS5lbDcubm9hcmNoPC9kaXY+PGRpdj5hdXRvbWFrZS0xLjEzLjQtMy5lbDcubm9hcmNo
PC9kaXY+PGRpdj5tNC0xLjQuMTYtMTAuZWw3Lng4Nl82NDwvZGl2PjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+
CjwvYmxvY2txdW90ZT48L2Rpdj4K

--===============4244341936095366393==--

