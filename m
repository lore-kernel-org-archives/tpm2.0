Content-Type: multipart/mixed; boundary="===============7246921097688642756=="
MIME-Version: 1.0
From: Emmanuel Deloget <logout at free.fr>
Subject: Re: [tpm2] git clone vs tar file of tpm2-tss & bitbake
Date: Sat, 17 Feb 2018 10:11:50 +0100
Message-ID: <CAKh=nwGLbUwLPZQJoYR0H7HBG0yFHHosEn+U=y5WBxp15wsPLA@mail.gmail.com>
In-Reply-To: c4268245e2b94d95b8f3dd761524181b@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7246921097688642756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,


On Fri, Feb 16, 2018 at 8:25 PM, Scheie, Peter M <Petre.Scheie(a)gd-ms.com>
wrote:

> I=E2=80=99m trying to incorporate tpm2-tss into my bitbake (Wind River Li=
nux
> 8/yocto) build.  We=E2=80=99re on an air-gapped network, so I started by
> downloading the tpm2-tss-1.3.0.tar.gz file from the releases, moved that =
to
> the isolated network, and then used the tpm2-tss_1.2.0.bb and
> tpm2-tss.inc recipes, with the ARC_URI in the former being modified
> thusly:
>
>
>
>                 #SRC_URI =3D "git://github.com/01org/${BPN}
> .git;protocol=3Dgit;tag=3D${PV};name=3D${BPN};destsuffix=3D${BPN};branch=
=3D1.x
> <http://github.com/01org/$%7BBPN%7D.git;protocol=3Dgit;tag=3D$%7BPV%7D;na=
me=3D$%7BBPN%7D;destsuffix=3D$%7BBPN%7D;branch=3D1.x>
> "
>
>        SRC_URI =3D =E2=80=9Cfile://tpm2-tss=E2=80=9D
>
>
>
> And I commented out the whole do_config_prepend section in tpm2-tss.inc
> since it shouldn=E2=80=99t be necessary (right?  Besides, the tar file do=
esn=E2=80=99t have
> the bootstrap script).
>
>
>
> But when I ran configure, I got errors (or perhaps they=E2=80=99re warnin=
gs?)
> about tpm2-tss-1.3.0/ not being a git directory, which is true, it isn=E2=
=80=99t=E2=80=94it
> isn=E2=80=99t supposed to be, right?  So, next, I git cloned tpm2-tss via=
 an
> outside machine that did have internet access, tar=E2=80=99d up that dire=
ctory,
> moved it to the isolated network, and plopped it into my bitbake build
> environment.  Now when I run configure, I don=E2=80=99t get the git error=
s,
> although autoconf is still failing because of =E2=80=9Cpossibly undefined=
 macros=E2=80=9D
> which happens even with the git version and which I=E2=80=99ve mentioned
> elsewhere*.  But to try to solve the autoconf issues, I=E2=80=99m trying =
to make my
> setup as orthodox as possible.  I can take the release tar file and
> successfully build that outside my bitbake build environment, so I think I
> should be able to use it inside the bitbake build.  Suggestions?
>
>
>
>
>
> BTW, should the recipe file be tpm2-tss-1.3.0.bb rather than
> tpm2-tss-1.2.0.bb?
>
>
>
>
>
> *The real problem in building tpm2-tss inside bitbake is that it fails
> saying macros such as AC_SUBST =E2=80=9Cmay be undefined=E2=80=9D.  This =
suggests that
> autoconf-archive is missing, but it isn=E2=80=99t.  We=E2=80=99ve added a=
utconf-archive to
> our build, tagged it as native so it=E2=80=99s pulled into the build envi=
ronment,
> listed it as a dependency for tpm2-tss, and can see it being built when we
> try to  build tpm2-ss, but tpm2-tss still fails with the same
> AC_SUBST-may-be-undefined error.  So, it seems something else is wrong
> somewhere.  Thus my effort to try to align my build for tpm2-tss to be as
> =E2=80=9Cnormal=E2=80=9D as possible.
>


=E2=80=8BI did this job for integration in lede/openwrt, so I guess the wor=
k is
similar.

The missing aclocal macros are from the =E2=80=8Bautoconf-archive package (
https://www.gnu.org/software/autoconf-archive/). You can download
individual macros here:
https://www.gnu.org/software/autoconf-archive/The-Macros.html. I don't
remember which one are used (you can find out by yourself by reading the
configure.ac files). Copy the missing m4 files in the m4 directory before
calling autoreconf and this should be ok.

The version issue is less important - all you're missing is the version
information which is not that important. If it's really needed, you can
patch the configure.ac file to either read the version from a file or
directly put the correct version number within the file.

Best regards,

-- Emmanuel Deloget

--===============7246921097688642756==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFt
aWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPkhlbGxvLMKgPC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
ZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPjxicj48L2Rp
dj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5P
biBGcmksIEZlYiAxNiwgMjAxOCBhdCA4OjI1IFBNLCBTY2hlaWUsIFBldGVyIE0gPHNwYW4gZGly
PSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86UGV0cmUuU2NoZWllQGdkLW1zLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPlBldHJlLlNjaGVpZUBnZC1tcy5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJy
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij4KCgoKCgo8ZGl2IGxhbmc9IkVOLVVTIj4KPGRpdiBjbGFzcz0iZ21haWwtbV8xNzcy
NDA2MTkxNDE0NDMxOTkxV29yZFNlY3Rpb24xIj4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SeKAmW0g
dHJ5aW5nIHRvIGluY29ycG9yYXRlIHRwbTItdHNzIGludG8gbXkgYml0YmFrZSAoV2luZCBSaXZl
ciBMaW51eCA4L3lvY3RvKSBidWlsZC7CoCBXZeKAmXJlIG9uIGFuIGFpci1nYXBwZWQgbmV0d29y
aywgc28gSSBzdGFydGVkIGJ5IGRvd25sb2FkaW5nIHRoZSB0cG0yLXRzcy0xLjMuMC50YXIuZ3og
ZmlsZSBmcm9tIHRoZSByZWxlYXNlcywgbW92ZWQgdGhhdCB0byB0aGUgaXNvbGF0ZWQgbmV0d29y
aywgYW5kCiB0aGVuIHVzZWQgdGhlIDxhIGhyZWY9Imh0dHA6Ly90cG0yLXRzc18xLjIuMC5iYiIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTItdHNzXzEuMi4wLmJiPC9hPiBhbmQgdHBtMi10c3MuaW5jIHJl
Y2lwZXMsIHdpdGggdGhlIEFSQ19VUkkgaW4gdGhlIGZvcm1lciBiZWluZyBtb2RpZmllZCB0aHVz
bHk6wqAKPHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjx1PjwvdT7CoDx1
PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAjPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo5cHQ7Zm9udC1mYW1pbHk6Q29uc29sYXM7Y29s
b3I6cmdiKDM2LDQxLDQ2KTtiYWNrZ3JvdW5kOndoaXRlIj5TUkNfVVJJID0gJnF1b3Q7Z2l0Oi8v
PGEgaHJlZj0iaHR0cDovL2dpdGh1Yi5jb20vMDFvcmcvJCU3QkJQTiU3RC5naXQ7cHJvdG9jb2w9
Z2l0O3RhZz0kJTdCUFYlN0Q7bmFtZT0kJTdCQlBOJTdEO2Rlc3RzdWZmaXg9JCU3QkJQTiU3RDti
cmFuY2g9MS54IiB0YXJnZXQ9Il9ibGFuayI+Z2l0aHViLmNvbS8wMW9yZy8ke0JQTn08d2JyPi5n
aXQ7cHJvdG9jb2w9Z2l0O3RhZz0ke1BWfTs8d2JyPm5hbWU9JHtCUE59O2Rlc3RzdWZmaXg9JHtC
UE59Ozx3YnI+YnJhbmNoPTEueDwvYT4mcXVvdDs8dT48L3U+PHU+PC91Pjwvc3Bhbj48L3A+Cjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6OXB0O2ZvbnQtZmFtaWx5
OkNvbnNvbGFzO2NvbG9yOnJnYigzNiw0MSw0Nik7YmFja2dyb3VuZDp3aGl0ZSI+wqDCoMKgwqDC
oMKgIFNSQ19VUkkgPSDigJw8YT5maWxlOi8vdHBtMi10c3M8L2E+4oCdPC9zcGFuPjx1PjwvdT48
dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+wqA8dT48L3U+PC9wPgo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5BbmQgSSBjb21tZW50ZWQgb3V0IHRoZSB3aG9sZSBkb19jb25maWdf
cHJlcGVuZCBzZWN0aW9uIGluIHRwbTItdHNzLmluYyBzaW5jZSBpdCBzaG91bGRu4oCZdCBiZSBu
ZWNlc3NhcnkgKHJpZ2h0P8KgIEJlc2lkZXMsIHRoZSB0YXIgZmlsZSBkb2VzbuKAmXQgaGF2ZSB0
aGUgYm9vdHN0cmFwIHNjcmlwdCkuPHU+PC91Pjx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjx1PjwvdT7CoDx1PjwvdT48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkJ1dCB3aGVuIEkg
cmFuIGNvbmZpZ3VyZSwgSSBnb3QgZXJyb3JzIChvciBwZXJoYXBzIHRoZXnigJlyZSB3YXJuaW5n
cz8pIGFib3V0IHRwbTItdHNzLTEuMy4wLyBub3QgYmVpbmcgYSBnaXQgZGlyZWN0b3J5LCB3aGlj
aCBpcyB0cnVlLCBpdCBpc27igJl04oCUaXQgaXNu4oCZdCBzdXBwb3NlZCB0byBiZSwgcmlnaHQ/
wqAgU28sIG5leHQsIEkgZ2l0IGNsb25lZCB0cG0yLXRzcyB2aWEgYW4gb3V0c2lkZSBtYWNoaW5l
IHRoYXQKIGRpZCBoYXZlIGludGVybmV0IGFjY2VzcywgdGFy4oCZZCB1cCB0aGF0IGRpcmVjdG9y
eSwgbW92ZWQgaXQgdG8gdGhlIGlzb2xhdGVkIG5ldHdvcmssIGFuZCBwbG9wcGVkIGl0IGludG8g
bXkgYml0YmFrZSBidWlsZCBlbnZpcm9ubWVudC7CoCBOb3cgd2hlbiBJIHJ1biBjb25maWd1cmUs
IEkgZG9u4oCZdCBnZXQgdGhlIGdpdCBlcnJvcnMsIGFsdGhvdWdoIGF1dG9jb25mIGlzIHN0aWxs
IGZhaWxpbmcgYmVjYXVzZSBvZiDigJxwb3NzaWJseSB1bmRlZmluZWQKIG1hY3Jvc+KAnSB3aGlj
aCBoYXBwZW5zIGV2ZW4gd2l0aCB0aGUgZ2l0IHZlcnNpb24gYW5kIHdoaWNoIEnigJl2ZSBtZW50
aW9uZWQgZWxzZXdoZXJlKi7CoCBCdXQgdG8gdHJ5IHRvIHNvbHZlIHRoZSBhdXRvY29uZiBpc3N1
ZXMsIEnigJltIHRyeWluZyB0byBtYWtlIG15IHNldHVwIGFzIG9ydGhvZG94IGFzIHBvc3NpYmxl
LsKgIEkgY2FuIHRha2UgdGhlIHJlbGVhc2UgdGFyIGZpbGUgYW5kIHN1Y2Nlc3NmdWxseSBidWls
ZCB0aGF0IG91dHNpZGUgbXkgYml0YmFrZQogYnVpbGQgZW52aXJvbm1lbnQsIHNvIEkgdGhpbmsg
SSBzaG91bGQgYmUgYWJsZSB0byB1c2UgaXQgaW5zaWRlIHRoZSBiaXRiYWtlIGJ1aWxkLsKgIFN1
Z2dlc3Rpb25zPzx1PjwvdT48dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+
wqA8dT48L3U+PC9wPgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48dT48L3U+wqA8dT48L3U+PC9wPgo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5CVFcsIHNob3VsZCB0aGUgcmVjaXBlIGZpbGUgYmUgPGEgaHJl
Zj0iaHR0cDovL3RwbTItdHNzLTEuMy4wLmJiIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi10c3MtMS4z
LjAuYmI8L2E+IHJhdGhlciB0aGFuIDxhIGhyZWY9Imh0dHA6Ly90cG0yLXRzcy0xLjIuMC5iYiIg
dGFyZ2V0PSJfYmxhbmsiPnRwbTItdHNzLTEuMi4wLmJiPC9hPj88dT48L3U+PHU+PC91PjwvcD4K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHU+PC91PsKgPHU+PC91PjwvcD4KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHU+PC91PsKgPHU+PC91PjwvcD4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+KlRoZSByZWFs
IHByb2JsZW0gaW4gYnVpbGRpbmcgdHBtMi10c3MgaW5zaWRlIGJpdGJha2UgaXMgdGhhdCBpdCBm
YWlscyBzYXlpbmcgbWFjcm9zIHN1Y2ggYXMgQUNfU1VCU1Qg4oCcbWF5IGJlIHVuZGVmaW5lZOKA
nS7CoCBUaGlzIHN1Z2dlc3RzIHRoYXQgYXV0b2NvbmYtYXJjaGl2ZSBpcyBtaXNzaW5nLCBidXQg
aXQgaXNu4oCZdC7CoCBXZeKAmXZlIGFkZGVkIGF1dGNvbmYtYXJjaGl2ZSB0byBvdXIgYnVpbGQs
IHRhZ2dlZCBpdAogYXMgbmF0aXZlIHNvIGl04oCZcyBwdWxsZWQgaW50byB0aGUgYnVpbGQgZW52
aXJvbm1lbnQsIGxpc3RlZCBpdCBhcyBhIGRlcGVuZGVuY3kgZm9yIHRwbTItdHNzLCBhbmQgY2Fu
IHNlZSBpdCBiZWluZyBidWlsdCB3aGVuIHdlIHRyeSB0b8KgIGJ1aWxkIHRwbTItc3MsIGJ1dCB0
cG0yLXRzcyBzdGlsbCBmYWlscyB3aXRoIHRoZSBzYW1lIEFDX1NVQlNULW1heS1iZS11bmRlZmlu
ZWQgZXJyb3IuwqAgU28sIGl0IHNlZW1zIHNvbWV0aGluZyBlbHNlIGlzIHdyb25nCiBzb21ld2hl
cmUuwqAgVGh1cyBteSBlZmZvcnQgdG8gdHJ5IHRvIGFsaWduIG15IGJ1aWxkIGZvciB0cG0yLXRz
cyB0byBiZSBhcyDigJxub3JtYWzigJ0gYXMgcG9zc2libGUuPC9wPjwvZGl2PjwvZGl2PjwvYmxv
Y2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXYgY2xhc3M9Imdt
YWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj7igItJ
IGRpZCB0aGlzIGpvYiBmb3IgaW50ZWdyYXRpb24gaW4gbGVkZS9vcGVud3J0LCBzbyBJIGd1ZXNz
IHRoZSB3b3JrIGlzIHNpbWlsYXIuwqA8L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBz
dHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+PGJyPjwvZGl2PjxkaXYgY2xh
c3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNl
Ij5UaGUgbWlzc2luZyBhY2xvY2FsIG1hY3JvcyBhcmUgZnJvbSB0aGUg4oCLYXV0b2NvbmYtYXJj
aGl2ZSBwYWNrYWdlICg8YSBocmVmPSJodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2F1dG9j
b25mLWFyY2hpdmUvIj5odHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2F1dG9jb25mLWFyY2hp
dmUvPC9hPikuIFlvdSBjYW4gZG93bmxvYWQgaW5kaXZpZHVhbCBtYWNyb3MgaGVyZTrCoDxhIGhy
ZWY9Imh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvYXV0b2NvbmYtYXJjaGl2ZS9UaGUtTWFj
cm9zLmh0bWwiPmh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvYXV0b2NvbmYtYXJjaGl2ZS9U
aGUtTWFjcm9zLmh0bWw8L2E+LiBJIGRvbiYjMzk7dCByZW1lbWJlciB3aGljaCBvbmUgYXJlIHVz
ZWQgKHlvdSBjYW4gZmluZCBvdXQgYnkgeW91cnNlbGYgYnkgcmVhZGluZyB0aGUgPGEgaHJlZj0i
aHR0cDovL2NvbmZpZ3VyZS5hYyI+Y29uZmlndXJlLmFjPC9hPiBmaWxlcykuIENvcHkgdGhlIG1p
c3NpbmcgbTQgZmlsZXMgaW4gdGhlIG00IGRpcmVjdG9yeSBiZWZvcmUgY2FsbGluZyBhdXRvcmVj
b25mIGFuZCB0aGlzIHNob3VsZCBiZSBvay7CoDwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1
bHQiIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj48YnI+PC9kaXY+PGRp
diBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxtb25v
c3BhY2UiPlRoZSB2ZXJzaW9uIGlzc3VlIGlzIGxlc3MgaW1wb3J0YW50IC0gYWxsIHlvdSYjMzk7
cmUgbWlzc2luZyBpcyB0aGUgdmVyc2lvbiBpbmZvcm1hdGlvbiB3aGljaCBpcyBub3QgdGhhdCBp
bXBvcnRhbnQuIElmIGl0JiMzOTtzIHJlYWxseSBuZWVkZWQsIHlvdSBjYW4gcGF0Y2ggdGhlIDxh
IGhyZWY9Imh0dHA6Ly9jb25maWd1cmUuYWMiPmNvbmZpZ3VyZS5hYzwvYT4gZmlsZSB0byBlaXRo
ZXIgcmVhZCB0aGUgdmVyc2lvbiBmcm9tIGEgZmlsZSBvciBkaXJlY3RseSBwdXQgdGhlIGNvcnJl
Y3QgdmVyc2lvbiBudW1iZXIgd2l0aGluIHRoZSBmaWxlLjwvZGl2PjxkaXYgY2xhc3M9ImdtYWls
X2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj48YnI+PC9k
aXY+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFj
ZSxtb25vc3BhY2UiPkJlc3QgcmVnYXJkcyzCoDwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWls
X2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj48YnI+PC9k
aXY+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFj
ZSxtb25vc3BhY2UiPi0tIEVtbWFudWVsIERlbG9nZXQ8L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4K

--===============7246921097688642756==--

