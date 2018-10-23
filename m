Content-Type: multipart/mixed; boundary="===============7373285873432006262=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: Re: [tpm2] bootstrap error on CentOS7
Date: Tue, 23 Oct 2018 16:05:29 +0800
Message-ID: <CA+tBKVh8ZR4qERXWUdLTHVe5GGdTC6m0=xz1iNarE_fwq2iutg@mail.gmail.com>
In-Reply-To: CA+tBKVh3O7FRpY8_96YDSOKsFzQoegTMvh0ckWVHCd9+ypw-fw@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7373285873432006262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

here is my tpm2-tss & tpm2-abrmd scripts:
1. tpm2-tss-2.1.0
./configure --prefix=3D/usr --enable-debug --with-crypto=3Dossl
--disable-doxygen-doc
make && make install
2. tpm2-abrmd-2.0.2
yum install dbus-devel glib2-devel
TSS2_SYS_CFLAGS=3D' ' TSS2_SYS_LIBS=3D'-ltss2-sys -L/usr/lib/' ./configure
--prefix=3D/usr
make && make install

On Tue, Oct 23, 2018 at 3:51 PM Terry An <terry.an.bj(a)gmail.com> wrote:

> I have cloned the latest code of kms-tools from github, and I need to test
> the command 'tpm2-import'
> but the master branch doesn't have "configure" command, and "bootstrap"
> return error
>
> [root(a)localhost tpm2-tools]# ./bootstrap
> Generating file lists: src_vars.mk
> libtoolize: putting auxiliary files in `.'.
> libtoolize: linking file `./ltmain.sh'
> libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
> libtoolize: linking file `m4/libtool.m4'
> libtoolize: linking file `m4/ltoptions.m4'
> libtoolize: linking file `m4/ltsugar.m4'
> libtoolize: linking file `m4/ltversion.m4'
> libtoolize: linking file `m4/lt~obsolete.m4'
> configure.ac:65: error: possibly undefined macro: AC_MSG_ERROR
>       If this token and others are legitimate, please use m4_pattern_allo=
w.
>       See the Autoconf documentation.
> autoreconf: /usr/bin/autoconf failed with exit status: 1
> [root(a)localhost tpm2-tools]# rpm -q libtool pkgconfig autoconf automake
> m4
> libtool-2.4.2-22.el7_3.x86_64
> pkgconfig-0.27.1-4.el7.x86_64
> autoconf-2.69-11.el7.noarch
> automake-1.13.4-3.el7.noarch
> m4-1.4.16-10.el7.x86_64
>
>
>

--===============7373285873432006262==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+aGVyZSBpcyBteSB0cG0yLXRzcyAmYW1wOyB0
cG0yLWFicm1kIHNjcmlwdHM6PGRpdj48ZGl2PjEuIHRwbTItdHNzLTIuMS4wPC9kaXY+PGRpdj48
c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPi4vY29uZmlndXJlIC0tcHJlZml4
PS91c3IgLS1lbmFibGUtZGVidWcgLS13aXRoLWNyeXB0bz1vc3NsIC0tZGlzYWJsZS1kb3h5Z2Vu
LWRvYzwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5tYWtl
ICZhbXA7JmFtcDsgbWFrZSBpbnN0YWxsPC9kaXY+PGRpdj4yLiB0cG0yLWFicm1kLTIuMC4yPC9k
aXY+PGRpdj48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPnl1bSBpbnN0YWxs
IGRidXMtZGV2ZWwgZ2xpYjItZGV2ZWw8L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFj
ZTpwcmUiPgk8L3NwYW4+VFNTMl9TWVNfQ0ZMQUdTPSYjMzk7ICYjMzk7IFRTUzJfU1lTX0xJQlM9
JiMzOTstbHRzczItc3lzIC1ML3Vzci9saWIvJiMzOTsgLi9jb25maWd1cmUgLS1wcmVmaXg9L3Vz
cjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj5tYWtlICZh
bXA7JmFtcDsgbWFrZSBpbnN0YWxsPC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIj5PbiBUdWUsIE9jdCAyMywgMjAxOCBhdCAz
OjUxIFBNIFRlcnJ5IEFuICZsdDs8YSBocmVmPSJtYWlsdG86dGVycnkuYW4uYmpAZ21haWwuY29t
Ij50ZXJyeS5hbi5iakBnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVv
dGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdiBk
aXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5JIGhhdmUgY2xvbmVkIHRoZSBsYXRlc3QgY29k
ZSBvZiBrbXMtdG9vbHMgZnJvbSBnaXRodWIsIGFuZCBJIG5lZWQgdG8gdGVzdCB0aGUgY29tbWFu
ZCAmIzM5O3RwbTItaW1wb3J0JiMzOTs8L2Rpdj48ZGl2PmJ1dCB0aGUgbWFzdGVyIGJyYW5jaCBk
b2VzbiYjMzk7dCBoYXZlICZxdW90O2NvbmZpZ3VyZSZxdW90OyBjb21tYW5kLCBhbmQgJnF1b3Q7
Ym9vdHN0cmFwJnF1b3Q7IHJldHVybiBlcnJvcjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+W3Jv
b3RAbG9jYWxob3N0IHRwbTItdG9vbHNdIyAuL2Jvb3RzdHJhcMKgPC9kaXY+PGRpdj5HZW5lcmF0
aW5nIGZpbGUgbGlzdHM6IDxhIGhyZWY9Imh0dHA6Ly9zcmNfdmFycy5tayIgdGFyZ2V0PSJfYmxh
bmsiPnNyY192YXJzLm1rPC9hPjwvZGl2PjxkaXY+bGlidG9vbGl6ZTogcHV0dGluZyBhdXhpbGlh
cnkgZmlsZXMgaW4gYC4mIzM5Oy48L2Rpdj48ZGl2PmxpYnRvb2xpemU6IGxpbmtpbmcgZmlsZSBg
Li9sdG1haW4uc2gmIzM5OzwvZGl2PjxkaXY+bGlidG9vbGl6ZTogcHV0dGluZyBtYWNyb3MgaW4g
QUNfQ09ORklHX01BQ1JPX0RJUiwgYG00JiMzOTsuPC9kaXY+PGRpdj5saWJ0b29saXplOiBsaW5r
aW5nIGZpbGUgYG00L2xpYnRvb2wubTQmIzM5OzwvZGl2PjxkaXY+bGlidG9vbGl6ZTogbGlua2lu
ZyBmaWxlIGBtNC9sdG9wdGlvbnMubTQmIzM5OzwvZGl2PjxkaXY+bGlidG9vbGl6ZTogbGlua2lu
ZyBmaWxlIGBtNC9sdHN1Z2FyLm00JiMzOTs8L2Rpdj48ZGl2PmxpYnRvb2xpemU6IGxpbmtpbmcg
ZmlsZSBgbTQvbHR2ZXJzaW9uLm00JiMzOTs8L2Rpdj48ZGl2PmxpYnRvb2xpemU6IGxpbmtpbmcg
ZmlsZSBgbTQvbHR+b2Jzb2xldGUubTQmIzM5OzwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cDovL2Nv
bmZpZ3VyZS5hYzo2NSIgdGFyZ2V0PSJfYmxhbmsiPmNvbmZpZ3VyZS5hYzo2NTwvYT46IGVycm9y
OiBwb3NzaWJseSB1bmRlZmluZWQgbWFjcm86IEFDX01TR19FUlJPUjwvZGl2PjxkaXY+wqAgwqAg
wqAgSWYgdGhpcyB0b2tlbiBhbmQgb3RoZXJzIGFyZSBsZWdpdGltYXRlLCBwbGVhc2UgdXNlIG00
X3BhdHRlcm5fYWxsb3cuPC9kaXY+PGRpdj7CoCDCoCDCoCBTZWUgdGhlIEF1dG9jb25mIGRvY3Vt
ZW50YXRpb24uPC9kaXY+PGRpdj5hdXRvcmVjb25mOiAvdXNyL2Jpbi9hdXRvY29uZiBmYWlsZWQg
d2l0aCBleGl0IHN0YXR1czogMTwvZGl2PjxkaXY+PGRpdj5bcm9vdEBsb2NhbGhvc3QgdHBtMi10
b29sc10jIHJwbSAtcSBsaWJ0b29sIHBrZ2NvbmZpZyBhdXRvY29uZiBhdXRvbWFrZSBtNMKgPC9k
aXY+PGRpdj5saWJ0b29sLTIuNC4yLTIyLmVsN18zLng4Nl82NDwvZGl2PjxkaXY+cGtnY29uZmln
LTAuMjcuMS00LmVsNy54ODZfNjQ8L2Rpdj48ZGl2PmF1dG9jb25mLTIuNjktMTEuZWw3Lm5vYXJj
aDwvZGl2PjxkaXY+YXV0b21ha2UtMS4xMy40LTMuZWw3Lm5vYXJjaDwvZGl2PjxkaXY+bTQtMS40
LjE2LTEwLmVsNy54ODZfNjQ8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48L2Rpdj48L2Rpdj48L2Rpdj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============7373285873432006262==--

