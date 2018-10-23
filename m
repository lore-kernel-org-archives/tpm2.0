Content-Type: multipart/mixed; boundary="===============3948637669704865365=="
MIME-Version: 1.0
From: Terry An <terry.an.bj at gmail.com>
Subject: [tpm2] bootstrap error on CentOS7
Date: Tue, 23 Oct 2018 15:51:08 +0800
Message-ID: <CA+tBKVh3O7FRpY8_96YDSOKsFzQoegTMvh0ckWVHCd9+ypw-fw@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3948637669704865365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have cloned the latest code of kms-tools from github, and I need to test
the command 'tpm2-import'
but the master branch doesn't have "configure" command, and "bootstrap"
return error

[root(a)localhost tpm2-tools]# ./bootstrap
Generating file lists: src_vars.mk
libtoolize: putting auxiliary files in `.'.
libtoolize: linking file `./ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
libtoolize: linking file `m4/libtool.m4'
libtoolize: linking file `m4/ltoptions.m4'
libtoolize: linking file `m4/ltsugar.m4'
libtoolize: linking file `m4/ltversion.m4'
libtoolize: linking file `m4/lt~obsolete.m4'
configure.ac:65: error: possibly undefined macro: AC_MSG_ERROR
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
autoreconf: /usr/bin/autoconf failed with exit status: 1
[root(a)localhost tpm2-tools]# rpm -q libtool pkgconfig autoconf automake m4
libtool-2.4.2-22.el7_3.x86_64
pkgconfig-0.27.1-4.el7.x86_64
autoconf-2.69-11.el7.noarch
automake-1.13.4-3.el7.noarch
m4-1.4.16-10.el7.x86_64

--===============3948637669704865365==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5JIGhhdmUg
Y2xvbmVkIHRoZSBsYXRlc3QgY29kZSBvZiBrbXMtdG9vbHMgZnJvbSBnaXRodWIsIGFuZCBJIG5l
ZWQgdG8gdGVzdCB0aGUgY29tbWFuZCAmIzM5O3RwbTItaW1wb3J0JiMzOTs8L2Rpdj48ZGl2PmJ1
dCB0aGUgbWFzdGVyIGJyYW5jaCBkb2VzbiYjMzk7dCBoYXZlICZxdW90O2NvbmZpZ3VyZSZxdW90
OyBjb21tYW5kLCBhbmQgJnF1b3Q7Ym9vdHN0cmFwJnF1b3Q7IHJldHVybiBlcnJvcjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+W3Jvb3RAbG9jYWxob3N0IHRwbTItdG9vbHNdIyAuL2Jvb3RzdHJh
cMKgPC9kaXY+PGRpdj5HZW5lcmF0aW5nIGZpbGUgbGlzdHM6IDxhIGhyZWY9Imh0dHA6Ly9zcmNf
dmFycy5tayI+c3JjX3ZhcnMubWs8L2E+PC9kaXY+PGRpdj5saWJ0b29saXplOiBwdXR0aW5nIGF1
eGlsaWFyeSBmaWxlcyBpbiBgLiYjMzk7LjwvZGl2PjxkaXY+bGlidG9vbGl6ZTogbGlua2luZyBm
aWxlIGAuL2x0bWFpbi5zaCYjMzk7PC9kaXY+PGRpdj5saWJ0b29saXplOiBwdXR0aW5nIG1hY3Jv
cyBpbiBBQ19DT05GSUdfTUFDUk9fRElSLCBgbTQmIzM5Oy48L2Rpdj48ZGl2PmxpYnRvb2xpemU6
IGxpbmtpbmcgZmlsZSBgbTQvbGlidG9vbC5tNCYjMzk7PC9kaXY+PGRpdj5saWJ0b29saXplOiBs
aW5raW5nIGZpbGUgYG00L2x0b3B0aW9ucy5tNCYjMzk7PC9kaXY+PGRpdj5saWJ0b29saXplOiBs
aW5raW5nIGZpbGUgYG00L2x0c3VnYXIubTQmIzM5OzwvZGl2PjxkaXY+bGlidG9vbGl6ZTogbGlu
a2luZyBmaWxlIGBtNC9sdHZlcnNpb24ubTQmIzM5OzwvZGl2PjxkaXY+bGlidG9vbGl6ZTogbGlu
a2luZyBmaWxlIGBtNC9sdH5vYnNvbGV0ZS5tNCYjMzk7PC9kaXY+PGRpdj48YSBocmVmPSJodHRw
Oi8vY29uZmlndXJlLmFjOjY1Ij5jb25maWd1cmUuYWM6NjU8L2E+OiBlcnJvcjogcG9zc2libHkg
dW5kZWZpbmVkIG1hY3JvOiBBQ19NU0dfRVJST1I8L2Rpdj48ZGl2PsKgIMKgIMKgIElmIHRoaXMg
dG9rZW4gYW5kIG90aGVycyBhcmUgbGVnaXRpbWF0ZSwgcGxlYXNlIHVzZSBtNF9wYXR0ZXJuX2Fs
bG93LjwvZGl2PjxkaXY+wqAgwqAgwqAgU2VlIHRoZSBBdXRvY29uZiBkb2N1bWVudGF0aW9uLjwv
ZGl2PjxkaXY+YXV0b3JlY29uZjogL3Vzci9iaW4vYXV0b2NvbmYgZmFpbGVkIHdpdGggZXhpdCBz
dGF0dXM6IDE8L2Rpdj48ZGl2PjxkaXY+W3Jvb3RAbG9jYWxob3N0IHRwbTItdG9vbHNdIyBycG0g
LXEgbGlidG9vbCBwa2djb25maWcgYXV0b2NvbmYgYXV0b21ha2UgbTTCoDwvZGl2PjxkaXY+bGli
dG9vbC0yLjQuMi0yMi5lbDdfMy54ODZfNjQ8L2Rpdj48ZGl2PnBrZ2NvbmZpZy0wLjI3LjEtNC5l
bDcueDg2XzY0PC9kaXY+PGRpdj5hdXRvY29uZi0yLjY5LTExLmVsNy5ub2FyY2g8L2Rpdj48ZGl2
PmF1dG9tYWtlLTEuMTMuNC0zLmVsNy5ub2FyY2g8L2Rpdj48ZGl2Pm00LTEuNC4xNi0xMC5lbDcu
eDg2XzY0PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PC9k
aXY+PC9kaXY+Cg==

--===============3948637669704865365==--

