Content-Type: multipart/mixed; boundary="===============2061873029644430344=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: Re: [tpm2] bootstrap error on CentOS7
Date: Tue, 23 Oct 2018 16:17:53 +0800
Message-ID: <CA+tBKVjrnsGOJm8WT32NN4Jc+9M6c1RChVZbBnVybHK6k3ZDUg@mail.gmail.com>
In-Reply-To: CA+tBKVgaFLQzLH5jJxZM8frxuwyv5rj9emRNSWTdk4iEGFwMEw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2061873029644430344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tpm2-abrmd is in my executable path: /usr/sbin
[root(a)localhost ~]# whereis tpm2-abrmd
tpm2-abrmd: /usr/sbin/tpm2-abrmd /usr/share/man/man8/tpm2-abrmd.8
[root(a)localhost ~]#

On Tue, Oct 23, 2018 at 4:07 PM Terry An <terry.an.bj(a)gmail.com> wrote:

> The line 65 in configure.ac, and I don't know how to solve it.
>
>  53 AC_DEFUN([unit_test_checks],[
>  54
>  55     PKG_CHECK_MODULES([CMOCKA],[cmocka],
>  56         [AC_DEFINE([HAVE_CMOCKA],[1])])
>  57
>  58     AC_CHECK_PROG([tpm2_abrmd], [tpm2-abrmd],
>  59         [yes], [no])
>  60
>  61     AC_CHECK_PROG([tpm_server], [tpm_server],
>  62         [yes], [no])
>  63
>  64     AS_IF([test "$tpm2_abrmd" !=3D "yes"],
>  65            [AC_MSG_ERROR([Required executable tpm2_abrmd not found,
> try setting PATH])],
>  66         [])
>  67
>  68     AS_IF([test "$tpm_server" !=3D "yes"],
>  69         [AC_MSG_ERROR([Required executable tpm_server not found, try
> setting PATH])],
>  70         [])
>  71 ])
>  72
>
>
> On Tue, Oct 23, 2018 at 4:05 PM Terry An <terry.an.bj(a)gmail.com> wrote:
>
>> here is my tpm2-tss & tpm2-abrmd scripts:
>> 1. tpm2-tss-2.1.0
>> ./configure --prefix=3D/usr --enable-debug --with-crypto=3Dossl
>> --disable-doxygen-doc
>> make && make install
>> 2. tpm2-abrmd-2.0.2
>> yum install dbus-devel glib2-devel
>> TSS2_SYS_CFLAGS=3D' ' TSS2_SYS_LIBS=3D'-ltss2-sys -L/usr/lib/' ./configu=
re
>> --prefix=3D/usr
>> make && make install
>>
>> On Tue, Oct 23, 2018 at 3:51 PM Terry An <terry.an.bj(a)gmail.com> wrote:
>>
>>> I have cloned the latest code of kms-tools from github, and I need to
>>> test the command 'tpm2-import'
>>> but the master branch doesn't have "configure" command, and "bootstrap"
>>> return error
>>>
>>> [root(a)localhost tpm2-tools]# ./bootstrap
>>> Generating file lists: src_vars.mk
>>> libtoolize: putting auxiliary files in `.'.
>>> libtoolize: linking file `./ltmain.sh'
>>> libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
>>> libtoolize: linking file `m4/libtool.m4'
>>> libtoolize: linking file `m4/ltoptions.m4'
>>> libtoolize: linking file `m4/ltsugar.m4'
>>> libtoolize: linking file `m4/ltversion.m4'
>>> libtoolize: linking file `m4/lt~obsolete.m4'
>>> configure.ac:65: error: possibly undefined macro: AC_MSG_ERROR
>>>       If this token and others are legitimate, please use
>>> m4_pattern_allow.
>>>       See the Autoconf documentation.
>>> autoreconf: /usr/bin/autoconf failed with exit status: 1
>>> [root(a)localhost tpm2-tools]# rpm -q libtool pkgconfig autoconf automa=
ke
>>> m4
>>> libtool-2.4.2-22.el7_3.x86_64
>>> pkgconfig-0.27.1-4.el7.x86_64
>>> autoconf-2.69-11.el7.noarch
>>> automake-1.13.4-3.el7.noarch
>>> m4-1.4.16-10.el7.x86_64
>>>
>>>
>>>

--===============2061873029644430344==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+dHBtMi1hYnJtZCBpcyBpbiBteSBleGVjdXRh
YmxlIHBhdGg6IC91c3Ivc2JpbjxkaXY+PGRpdj5bcm9vdEBsb2NhbGhvc3Qgfl0jIHdoZXJlaXMg
dHBtMi1hYnJtZDwvZGl2PjxkaXY+dHBtMi1hYnJtZDogL3Vzci9zYmluL3RwbTItYWJybWQgL3Vz
ci9zaGFyZS9tYW4vbWFuOC90cG0yLWFicm1kLjg8L2Rpdj48ZGl2Pltyb290QGxvY2FsaG9zdCB+
XSPCoDwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+
PGRpdiBkaXI9Imx0ciI+T24gVHVlLCBPY3QgMjMsIDIwMTggYXQgNDowNyBQTSBUZXJyeSBBbiAm
bHQ7PGEgaHJlZj0ibWFpbHRvOnRlcnJ5LmFuLmJqQGdtYWlsLmNvbSI+dGVycnkuYW4uYmpAZ21h
aWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlk
O3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJsdHIiPlRoZSBsaW5l
IDY1IGluIDxhIGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiIHRhcmdldD0iX2JsYW5rIj5jb25m
aWd1cmUuYWM8L2E+LCBhbmQgSSBkb24mIzM5O3Qga25vdyBob3cgdG8gc29sdmUgaXQuPC9kaXY+
PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXY+PGRpdj7CoDUzIEFDX0RFRlVOKFt1bml0X3Rlc3RfY2hl
Y2tzXSxbPC9kaXY+PGRpdj7CoDU0wqA8L2Rpdj48ZGl2PsKgNTXCoCDCoCDCoFBLR19DSEVDS19N
T0RVTEVTKFtDTU9DS0FdLFtjbW9ja2FdLDwvZGl2PjxkaXY+wqA1NsKgIMKgIMKgIMKgIMKgW0FD
X0RFRklORShbSEFWRV9DTU9DS0FdLFsxXSldKTwvZGl2PjxkaXY+wqA1N8KgPC9kaXY+PGRpdj7C
oDU4wqAgwqAgwqBBQ19DSEVDS19QUk9HKFt0cG0yX2Ficm1kXSwgW3RwbTItYWJybWRdLDwvZGl2
PjxkaXY+wqA1OcKgIMKgIMKgIMKgIMKgW3llc10sIFtub10pPC9kaXY+PGRpdj7CoDYwwqA8L2Rp
dj48ZGl2PsKgNjHCoCDCoCDCoEFDX0NIRUNLX1BST0coW3RwbV9zZXJ2ZXJdLCBbdHBtX3NlcnZl
cl0sPC9kaXY+PGRpdj7CoDYywqAgwqAgwqAgwqAgwqBbeWVzXSwgW25vXSk8L2Rpdj48ZGl2PsKg
NjPCoDwvZGl2PjxkaXY+wqA2NMKgIMKgIMKgQVNfSUYoW3Rlc3QgJnF1b3Q7JHRwbTJfYWJybWQm
cXVvdDsgIT0gJnF1b3Q7eWVzJnF1b3Q7XSw8L2Rpdj48ZGl2PsKgNjXCoCDCoCDCoCDCoCDCoCDC
oCBbQUNfTVNHX0VSUk9SKFtSZXF1aXJlZCBleGVjdXRhYmxlIHRwbTJfYWJybWQgbm90IGZvdW5k
LCB0cnkgc2V0dGluZyBQQVRIXSldLDwvZGl2PjxkaXY+wqA2NsKgIMKgIMKgIMKgIMKgW10pPC9k
aXY+PGRpdj7CoDY3wqA8L2Rpdj48ZGl2PsKgNjjCoCDCoCDCoEFTX0lGKFt0ZXN0ICZxdW90OyR0
cG1fc2VydmVyJnF1b3Q7ICE9ICZxdW90O3llcyZxdW90O10sPC9kaXY+PGRpdj7CoDY5wqAgwqAg
wqAgwqAgwqBbQUNfTVNHX0VSUk9SKFtSZXF1aXJlZCBleGVjdXRhYmxlIHRwbV9zZXJ2ZXIgbm90
IGZvdW5kLCB0cnkgc2V0dGluZyBQQVRIXSldLDwvZGl2PjxkaXY+wqA3MMKgIMKgIMKgIMKgIMKg
W10pPC9kaXY+PGRpdj7CoDcxIF0pPC9kaXY+PGRpdj7CoDcywqA8L2Rpdj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGly
PSJsdHIiPk9uIFR1ZSwgT2N0IDIzLCAyMDE4IGF0IDQ6MDUgUE0gVGVycnkgQW4gJmx0OzxhIGhy
ZWY9Im1haWx0bzp0ZXJyeS5hbi5iakBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj50ZXJyeS5h
bi5iakBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNj
Y2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+
aGVyZSBpcyBteSB0cG0yLXRzcyAmYW1wOyB0cG0yLWFicm1kIHNjcmlwdHM6PGRpdj48ZGl2PjEu
IHRwbTItdHNzLTIuMS4wPC9kaXY+PGRpdj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlLXdy
YXAiPgk8L3NwYW4+Li9jb25maWd1cmUgLS1wcmVmaXg9L3VzciAtLWVuYWJsZS1kZWJ1ZyAtLXdp
dGgtY3J5cHRvPW9zc2wgLS1kaXNhYmxlLWRveHlnZW4tZG9jPC9kaXY+PGRpdj48c3BhbiBzdHls
ZT0id2hpdGUtc3BhY2U6cHJlLXdyYXAiPgk8L3NwYW4+bWFrZSAmYW1wOyZhbXA7IG1ha2UgaW5z
dGFsbDwvZGl2PjxkaXY+Mi4gdHBtMi1hYnJtZC0yLjAuMjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9
IndoaXRlLXNwYWNlOnByZS13cmFwIj4JPC9zcGFuPnl1bSBpbnN0YWxsIGRidXMtZGV2ZWwgZ2xp
YjItZGV2ZWw8L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUtd3JhcCI+CTwv
c3Bhbj5UU1MyX1NZU19DRkxBR1M9JiMzOTsgJiMzOTsgVFNTMl9TWVNfTElCUz0mIzM5Oy1sdHNz
Mi1zeXMgLUwvdXNyL2xpYi8mIzM5OyAuL2NvbmZpZ3VyZSAtLXByZWZpeD0vdXNyPC9kaXY+PGRp
dj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlLXdyYXAiPgk8L3NwYW4+bWFrZSAmYW1wOyZh
bXA7IG1ha2UgaW5zdGFsbDwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciI+T24gVHVlLCBPY3QgMjMsIDIwMTggYXQgMzo1MSBQ
TSBUZXJyeSBBbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRlcnJ5LmFuLmJqQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPnRlcnJ5LmFuLmJqQGdtYWlsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhl
eDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0i
bHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2PkkgaGF2ZSBjbG9uZWQgdGhl
IGxhdGVzdCBjb2RlIG9mIGttcy10b29scyBmcm9tIGdpdGh1YiwgYW5kIEkgbmVlZCB0byB0ZXN0
IHRoZSBjb21tYW5kICYjMzk7dHBtMi1pbXBvcnQmIzM5OzwvZGl2PjxkaXY+YnV0IHRoZSBtYXN0
ZXIgYnJhbmNoIGRvZXNuJiMzOTt0IGhhdmUgJnF1b3Q7Y29uZmlndXJlJnF1b3Q7IGNvbW1hbmQs
IGFuZCAmcXVvdDtib290c3RyYXAmcXVvdDsgcmV0dXJuIGVycm9yPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5bcm9vdEBsb2NhbGhvc3QgdHBtMi10b29sc10jIC4vYm9vdHN0cmFwwqA8L2Rpdj48
ZGl2PkdlbmVyYXRpbmcgZmlsZSBsaXN0czogPGEgaHJlZj0iaHR0cDovL3NyY192YXJzLm1rIiB0
YXJnZXQ9Il9ibGFuayI+c3JjX3ZhcnMubWs8L2E+PC9kaXY+PGRpdj5saWJ0b29saXplOiBwdXR0
aW5nIGF1eGlsaWFyeSBmaWxlcyBpbiBgLiYjMzk7LjwvZGl2PjxkaXY+bGlidG9vbGl6ZTogbGlu
a2luZyBmaWxlIGAuL2x0bWFpbi5zaCYjMzk7PC9kaXY+PGRpdj5saWJ0b29saXplOiBwdXR0aW5n
IG1hY3JvcyBpbiBBQ19DT05GSUdfTUFDUk9fRElSLCBgbTQmIzM5Oy48L2Rpdj48ZGl2PmxpYnRv
b2xpemU6IGxpbmtpbmcgZmlsZSBgbTQvbGlidG9vbC5tNCYjMzk7PC9kaXY+PGRpdj5saWJ0b29s
aXplOiBsaW5raW5nIGZpbGUgYG00L2x0b3B0aW9ucy5tNCYjMzk7PC9kaXY+PGRpdj5saWJ0b29s
aXplOiBsaW5raW5nIGZpbGUgYG00L2x0c3VnYXIubTQmIzM5OzwvZGl2PjxkaXY+bGlidG9vbGl6
ZTogbGlua2luZyBmaWxlIGBtNC9sdHZlcnNpb24ubTQmIzM5OzwvZGl2PjxkaXY+bGlidG9vbGl6
ZTogbGlua2luZyBmaWxlIGBtNC9sdH5vYnNvbGV0ZS5tNCYjMzk7PC9kaXY+PGRpdj48YSBocmVm
PSJodHRwOi8vY29uZmlndXJlLmFjOjY1IiB0YXJnZXQ9Il9ibGFuayI+Y29uZmlndXJlLmFjOjY1
PC9hPjogZXJyb3I6IHBvc3NpYmx5IHVuZGVmaW5lZCBtYWNybzogQUNfTVNHX0VSUk9SPC9kaXY+
PGRpdj7CoCDCoCDCoCBJZiB0aGlzIHRva2VuIGFuZCBvdGhlcnMgYXJlIGxlZ2l0aW1hdGUsIHBs
ZWFzZSB1c2UgbTRfcGF0dGVybl9hbGxvdy48L2Rpdj48ZGl2PsKgIMKgIMKgIFNlZSB0aGUgQXV0
b2NvbmYgZG9jdW1lbnRhdGlvbi48L2Rpdj48ZGl2PmF1dG9yZWNvbmY6IC91c3IvYmluL2F1dG9j
b25mIGZhaWxlZCB3aXRoIGV4aXQgc3RhdHVzOiAxPC9kaXY+PGRpdj48ZGl2Pltyb290QGxvY2Fs
aG9zdCB0cG0yLXRvb2xzXSMgcnBtIC1xIGxpYnRvb2wgcGtnY29uZmlnIGF1dG9jb25mIGF1dG9t
YWtlIG00wqA8L2Rpdj48ZGl2PmxpYnRvb2wtMi40LjItMjIuZWw3XzMueDg2XzY0PC9kaXY+PGRp
dj5wa2djb25maWctMC4yNy4xLTQuZWw3Lng4Nl82NDwvZGl2PjxkaXY+YXV0b2NvbmYtMi42OS0x
MS5lbDcubm9hcmNoPC9kaXY+PGRpdj5hdXRvbWFrZS0xLjEzLjQtMy5lbDcubm9hcmNoPC9kaXY+
PGRpdj5tNC0xLjQuMTYtMTAuZWw3Lng4Nl82NDwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pgo8L2Jsb2NrcXVvdGU+PC9kaXY+CjwvYmxv
Y2txdW90ZT48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============2061873029644430344==--

