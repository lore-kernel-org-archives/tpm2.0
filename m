Content-Type: multipart/mixed; boundary="===============3922637545404523064=="
MIME-Version: 1.0
From: Kenneth Goldman <kgoldman at us.ibm.com>
Subject: [tpm2] tpm2-abrmd bootstrap error
Date: Mon, 08 Mar 2021 15:27:30 -0500
Message-ID: <OF5329FB9F.2FB13C3C-ON00258692.007017CC-85258692.007061BC@notes.na.collabserv.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3922637545404523064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Does anyone have working instructions to build abrmd from source on Ubuntu
16 xenial?

I did this,
http://ftpmirror.gnu.org/autoconf-archive/autoconf-archive-2019.01.06.tar.xz
 fix, then got this:

libtoolize: putting auxiliary files in '.'.
libtoolize: linking file './ltmain.sh'
configure.ac:10: installing './compile'
configure.ac:13: installing './config.guess'
configure.ac:13: installing './config.sub'
configure.ac:15: installing './install-sh'
configure.ac:15: installing './missing'
aminclude_static.am:126: warning: .PHONY was already defined in condition
TRUE, which includes condition AUTOCONF_CODE_COVERAGE_2019_01_06 ...
Makefile.am:175:   'aminclude_static.am' included from here
Makefile.am:6: ... '.PHONY' previously defined here
Makefile.am:182: warning: AM_DISTCHECK_CONFIGURE_FLAGS multiply defined in
condition AUTOCONF_CODE_COVERAGE_2019_01_06 and CODE_COVERAGE_ENABLED ...
aminclude_static.am:100: ... 'AM_DISTCHECK_CONFIGURE_FLAGS' previously
defined here
Makefile.am:175:   'aminclude_static.am' included from here
Makefile.am: installing './depcomp'
parallel-tests: installing './test-driver'

--
Ken Goldman   kgoldman(a)us.ibm.com
914-945-2415 (862-2415)

--===============3922637545404523064==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+RG9lcyBhbnlvbmUgaGF2ZSB3b3JraW5nIGlu
c3RydWN0aW9ucyB0byBidWlsZCBhYnJtZCBmcm9tIHNvdXJjZSBvbiBVYnVudHUgMTYgeGVuaWFs
PzwvZm9udD48YnI+PGJyPjxmb250IHNpemU9IjIiPkkgZGlkIHRoaXMsIDwvZm9udD48YSBocmVm
PSJodHRwOi8vZnRwbWlycm9yLmdudS5vcmcvYXV0b2NvbmYtYXJjaGl2ZS9hdXRvY29uZi1hcmNo
aXZlLTIwMTkuMDEuMDYudGFyLnh6Ij48Zm9udCBzaXplPSIyIj5odHRwOi8vZnRwbWlycm9yLmdu
dS5vcmcvYXV0b2NvbmYtYXJjaGl2ZS9hdXRvY29uZi1hcmNoaXZlLTIwMTkuMDEuMDYudGFyLnh6
PC9mb250PjwvYT48Zm9udCBzaXplPSIyIj4gZml4LCB0aGVuIGdvdCB0aGlzOjwvZm9udD48YnI+
PGJyPjxmb250IHNpemU9IjIiPmxpYnRvb2xpemU6IHB1dHRpbmcgYXV4aWxpYXJ5IGZpbGVzIGlu
ICcuJy48L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPmxpYnRvb2xpemU6IGxpbmtpbmcgZmlsZSAn
Li9sdG1haW4uc2gnPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5jb25maWd1cmUuYWM6MTA6IGlu
c3RhbGxpbmcgJy4vY29tcGlsZSc8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPmNvbmZpZ3VyZS5h
YzoxMzogaW5zdGFsbGluZyAnLi9jb25maWcuZ3Vlc3MnPC9mb250Pjxicj48Zm9udCBzaXplPSIy
Ij5jb25maWd1cmUuYWM6MTM6IGluc3RhbGxpbmcgJy4vY29uZmlnLnN1Yic8L2ZvbnQ+PGJyPjxm
b250IHNpemU9IjIiPmNvbmZpZ3VyZS5hYzoxNTogaW5zdGFsbGluZyAnLi9pbnN0YWxsLXNoJzwv
Zm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+Y29uZmlndXJlLmFjOjE1OiBpbnN0YWxsaW5nICcuL21p
c3NpbmcnPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5hbWluY2x1ZGVfc3RhdGljLmFtOjEyNjog
d2FybmluZzogLlBIT05ZIHdhcyBhbHJlYWR5IGRlZmluZWQgaW4gY29uZGl0aW9uIFRSVUUsIHdo
aWNoIGluY2x1ZGVzIGNvbmRpdGlvbiBBVVRPQ09ORl9DT0RFX0NPVkVSQUdFXzIwMTlfMDFfMDYg
Li4uPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5NYWtlZmlsZS5hbToxNzU6ICAgJ2FtaW5jbHVk
ZV9zdGF0aWMuYW0nIGluY2x1ZGVkIGZyb20gaGVyZTwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiI+
TWFrZWZpbGUuYW06NjogLi4uICcuUEhPTlknIHByZXZpb3VzbHkgZGVmaW5lZCBoZXJlPC9mb250
Pjxicj48Zm9udCBzaXplPSIyIj5NYWtlZmlsZS5hbToxODI6IHdhcm5pbmc6IEFNX0RJU1RDSEVD
S19DT05GSUdVUkVfRkxBR1MgbXVsdGlwbHkgZGVmaW5lZCBpbiBjb25kaXRpb24gQVVUT0NPTkZf
Q09ERV9DT1ZFUkFHRV8yMDE5XzAxXzA2IGFuZCBDT0RFX0NPVkVSQUdFX0VOQUJMRUQgLi4uPC9m
b250Pjxicj48Zm9udCBzaXplPSIyIj5hbWluY2x1ZGVfc3RhdGljLmFtOjEwMDogLi4uICdBTV9E
SVNUQ0hFQ0tfQ09ORklHVVJFX0ZMQUdTJyBwcmV2aW91c2x5IGRlZmluZWQgaGVyZTwvZm9udD48
YnI+PGZvbnQgc2l6ZT0iMiI+TWFrZWZpbGUuYW06MTc1OiAgICdhbWluY2x1ZGVfc3RhdGljLmFt
JyBpbmNsdWRlZCBmcm9tIGhlcmU8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiPk1ha2VmaWxlLmFt
OiBpbnN0YWxsaW5nICcuL2RlcGNvbXAnPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj5wYXJhbGxl
bC10ZXN0czogaW5zdGFsbGluZyAnLi90ZXN0LWRyaXZlcic8YnI+PGJyPi0tPGJyPktlbiBHb2xk
bWFuICAga2dvbGRtYW5AdXMuaWJtLmNvbSAgIDxicj45MTQtOTQ1LTI0MTUgKDg2Mi0yNDE1KTxi
cj48L2ZvbnQ+PEJSPgo8L2JvZHk+PC9odG1sPgo=

--===============3922637545404523064==--

