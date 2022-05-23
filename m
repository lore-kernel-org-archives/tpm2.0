Content-Type: multipart/mixed; boundary="===============8357515983961201465=="
MIME-Version: 1.0
From: Petr Gotthard <petr.gotthard at centrum.cz>
Subject: [tpm2] Re: Virtualbox ubuntu 22.04 guest with tpm_server
Date: Mon, 23 May 2022 18:10:49 +0200
Message-ID: <20220523181049.FB9B2CCE@centrum.cz>
In-Reply-To: 20220523154415.2134.74422@ml01.vlan13.01.org
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8357515983961201465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello.
=C2=A0
You made a very nice and detailed problem description. I wish all problem r=
eports were like yours :)
You are on a good track. You may keep using the ibmswtpm2.
=C2=A0
The errors you are getting mean that the tpm2-tools are trying to access th=
e hardware TPM, which isn't there. You successfully connected the abrmd to =
the TPM simulator (the --tcti argument of abrmd), now you should connect th=
e tpm2-tools to the abrmd by setting the TPM2TOOLS_TCTI variable or using t=
he --tcti argument of the tpm2_pcrread. The TCTI should point to the abrmd =
(see https://github.com/tpm2-software/tpm2-tools/blob/master/man/common/tct=
i.md for some details.) The following might do the job:
export TPM2TOOLS_TCTI=3D"tabrmd:bus_name=3Dcom.intel.tss2.Tabrmd"
=C2=A0
=C2=A0
Regards,
Petr
=C2=A0
______________________________________________________________
> Od: dawn.howe(a)alten.com
> Komu: tpm2(a)lists.01.org
> Datum: 23.05.2022 17:44
> P=C5=99edm=C4=9Bt: [tpm2] Virtualbox ubuntu 22.04 guest with tpm_server
>
I am developing a c++ application for a dell server running ubuntu 22.04. T=
he application needs to store private keys and use them to decrypt files.
 =

 Before working on target hardware, I'm trying to get a virtualbox environm=
ent set up to use a simulated TPM2. =C2=A0Before writing the C++ applicatio=
n I'd like to get some command line tools working. I have struggled for a w=
eek following instructions I've found (for example: https://tpm2-tools.read=
thedocs.io/en/latest/INSTALL/ <https://tpm2-tools.readthedocs.io/en/latest/=
INSTALL/>, https://francislampayan.medium.com/how-to-setup-tpm-simulator-in=
-ubuntu-20-04-25ec673b88dc <https://francislampayan.medium.com/how-to-setup=
-tpm-simulator-in-ubuntu-20-04-25ec673b88dc>, etc). I am trying to use IBM'=
s SWTPM2, but have not had any luck.
 =

 Virtualbox 6.1.30
 Windows 10 host
 Ubuntu 22.04 server guest
 =

 TPM SERVER SIMULATOR
 First, I'm installing tpm_server. Since ubuntu 22.04 uses openssl3.0, I ca=
nnot use v1661, but instead am getting the latest version from the "next" b=
ranch:
 $ git clone https://git.code.sf.net/p/ibmswtpm2/tpm2 <https://git.code.sf.=
net/p/ibmswtpm2/tpm2> ibmswtpm2-tpm2
 $ cd ibmswtpm2-tpm/src
 $ make
 =

 TPM2 - ABRMD
 $ git clone https://github.com/tpm2-software/tpm2-abrmd.git <https://githu=
b.com/tpm2-software/tpm2-abrmd.git>
 $ cd tpm2-abrmd
 $ ./bootstrap
 $ ./configure \
 --with-dbuspolicydir=3D/etc/dbus-1/system.d \
 --with-systemdsystemunitdir=3D/usr/lib/systemd/system \
 --libdir=3D/usr/lib64 --prefix=3D/usr =

 $ make -j5
 $ sudo make install
 =

 TPM2 - tss
 $ git clone https://github.com/tpm2-software/tpm2-tss.git <https://github.=
com/tpm2-software/tpm2-tss.git>
 $ cd tpm2-tss
 $ ./bootstrap
 $ ./configure
 $ make
 $ sudo make install
 $ sudo ldconfig
 =

 TPM2 - tools
 $ git clone https://github.com/tpm2-software/tpm2-tools.git <https://githu=
b.com/tpm2-software/tpm2-tools.git>
 $ cd tpm2-tools
 $ ./bootstrap
 $ ./configure --prefix=3D/usr
 $ make -j5
 $ sudo make install
 =

 I'm just starting things on the command line, before makin them services. =
In one window I start the TPM simulator:
 $ tpm2_server
 =

 In another window I start the ABRMD:
 sudo -u tss tpm2-abrmd --tcti=3D"libtss2-tcti-mssim.so.0:host=3D127.0.0.1,=
port=3D2321"
 =

 I see this in the window that started the TPM server:
 LIBRARY_COMPATIBILITY_CHECK is ON
 Starting ACT thread...
 TPM command server listening on port 2321
 Platform server listening on port 2322
 Command IPv4 client accepted
 Platform IPv4 client accepted
 =

 Then I try to run a command line tool:
 tpm2_pcrread
 ERROR:tcti:src/tss2-tcti/tcti-device.c:452:Tss2_Tcti_Device_Init() Failed =
to open specified TCTI device file /dev/tpmrm0: No such file or directory
 ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() Could not initi=
alize TCTI file: libtss2-tcti-device.so.0
 ERROR:tcti:src/tss2-tcti/tcti-device.c:452:Tss2_Tcti_Device_Init() Failed =
to open specified TCTI device file /dev/tpm0: No such file or directory
 ERROR:tcti:src/tss2-tcti/tctildr-dl.c:170:tcti_from_file() Could not initi=
alize TCTI file: libtss2-tcti-device.so.0
 =

 And I get no output. =C2=A0I feel like I'm not configuring the TSS correct=
ly. Can anyone give me insight on how to run this? =C2=A0Should I be using =
a different simulator? I haven't found any good instructions for how to run=
 https://github.com/stefanberger/swtpm <https://github.com/stefanberger/swt=
pm> in a virtualbox guest.
 _______________________________________________
 tpm2 mailing list -- tpm2(a)lists.01.org
 To unsubscribe send an email to tpm2-leave(a)lists.01.org
 %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s


--===============8357515983961201465==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij5IZWxsby48L3A+Cgo8
cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4KCjxw
IHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+WW91IG1hZGUgYSB2ZXJ5
IG5pY2UgYW5kIGRldGFpbGVkIHByb2JsZW0gZGVzY3JpcHRpb24uIEkgd2lzaCBhbGwgcHJvYmxl
bSByZXBvcnRzIHdlcmUgbGlrZSB5b3VycyA6KTwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAw
IDA7IG1hcmdpbjowIDAgMCAwOyI+WW91IGFyZSBvbiBhIGdvb2QgdHJhY2suIFlvdSBtYXkga2Vl
cCB1c2luZyB0aGUgaWJtc3d0cG0yLjwvcD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1h
cmdpbjowIDAgMCAwOyI+Jm5ic3A7PC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFy
Z2luOjAgMCAwIDA7Ij5UaGUgZXJyb3JzIHlvdSBhcmUgZ2V0dGluZyBtZWFuIHRoYXQgdGhlIHRw
bTItdG9vbHMgYXJlIHRyeWluZyB0byBhY2Nlc3MgdGhlIGhhcmR3YXJlIFRQTSwgd2hpY2ggaXNu
J3QgdGhlcmUuIFlvdSBzdWNjZXNzZnVsbHkgY29ubmVjdGVkIHRoZSBhYnJtZCB0byB0aGUgVFBN
IHNpbXVsYXRvciAodGhlIC0tdGN0aSBhcmd1bWVudCBvZiBhYnJtZCksIG5vdyB5b3Ugc2hvdWxk
IGNvbm5lY3QgdGhlIHRwbTItdG9vbHMgdG8gdGhlIGFicm1kIGJ5IHNldHRpbmcgdGhlIFRQTTJU
T09MU19UQ1RJIHZhcmlhYmxlIG9yIHVzaW5nIHRoZSAtLXRjdGkgYXJndW1lbnQgb2YgdGhlIHRw
bTJfcGNycmVhZC4gVGhlIFRDVEkgc2hvdWxkIHBvaW50IHRvIHRoZSBhYnJtZCAoc2VlIGh0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvYmxvYi9tYXN0ZXIvbWFuL2Nv
bW1vbi90Y3RpLm1kIGZvciBzb21lIGRldGFpbHMuKSBUaGUgZm9sbG93aW5nIG1pZ2h0IGRvIHRo
ZSBqb2I6PC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij48
c3BhbiBjbGFzcz0icGwtZW50Ij5leHBvcnQgVFBNMlRPT0xTX1RDVEk9Ijwvc3Bhbj48c3BhbiBj
bGFzcz0icGwtcyI+dGFicm1kOmJ1c19uYW1lPWNvbS5pbnRlbC50c3MyLlRhYnJtZCI8L3NwYW4+
PC9wPgoKPHAgc3R5bGU9InBhZGRpbmc6MCAwIDAgMDsgbWFyZ2luOjAgMCAwIDA7Ij4mbmJzcDs8
L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwv
cD4KCjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+UmVnYXJkcyw8
L3A+Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPlBldHI8L3A+
Cgo8cCBzdHlsZT0icGFkZGluZzowIDAgMCAwOyBtYXJnaW46MCAwIDAgMDsiPiZuYnNwOzwvcD4K
CjxwIHN0eWxlPSJwYWRkaW5nOjAgMCAwIDA7IG1hcmdpbjowIDAgMCAwOyI+X19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnIgLz4K
Jmd0OyBPZDogZGF3bi5ob3dlQGFsdGVuLmNvbTxiciAvPgomZ3Q7IEtvbXU6IHRwbTJAbGlzdHMu
MDEub3JnPGJyIC8+CiZndDsgRGF0dW06IDIzLjA1LjIwMjIgMTc6NDQ8YnIgLz4KJmd0OyBQxZll
ZG3Em3Q6IFt0cG0yXSBWaXJ0dWFsYm94IHVidW50dSAyMi4wNCBndWVzdCB3aXRoIHRwbV9zZXJ2
ZXI8YnIgLz4KJmd0OzwvcD4KCkkgYW0gZGV2ZWxvcGluZyBhIGMrKyBhcHBsaWNhdGlvbiBmb3Ig
YSBkZWxsIHNlcnZlciBydW5uaW5nIHVidW50dSAyMi4wNC4gVGhlIGFwcGxpY2F0aW9uIG5lZWRz
IHRvIHN0b3JlIHByaXZhdGUga2V5cyBhbmQgdXNlIHRoZW0gdG8gZGVjcnlwdCBmaWxlcy48YnIg
Lz4KIDxiciAvPgogQmVmb3JlIHdvcmtpbmcgb24gdGFyZ2V0IGhhcmR3YXJlLCBJJ20gdHJ5aW5n
IHRvIGdldCBhIHZpcnR1YWxib3ggZW52aXJvbm1lbnQgc2V0IHVwIHRvIHVzZSBhIHNpbXVsYXRl
ZCBUUE0yLiAmbmJzcDtCZWZvcmUgd3JpdGluZyB0aGUgQysrIGFwcGxpY2F0aW9uIEknZCBsaWtl
IHRvIGdldCBzb21lIGNvbW1hbmQgbGluZSB0b29scyB3b3JraW5nLiBJIGhhdmUgc3RydWdnbGVk
IGZvciBhIHdlZWsgZm9sbG93aW5nIGluc3RydWN0aW9ucyBJJ3ZlIGZvdW5kIChmb3IgZXhhbXBs
ZTogPGEgaHJlZj0iaHR0cHM6Ly90cG0yLXRvb2xzLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9J
TlNUQUxMLyI+aHR0cHM6Ly90cG0yLXRvb2xzLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9JTlNU
QUxMLzwvYT4sIDxhIGhyZWY9Imh0dHBzOi8vZnJhbmNpc2xhbXBheWFuLm1lZGl1bS5jb20vaG93
LXRvLXNldHVwLXRwbS1zaW11bGF0b3ItaW4tdWJ1bnR1LTIwLTA0LTI1ZWM2NzNiODhkYyI+aHR0
cHM6Ly9mcmFuY2lzbGFtcGF5YW4ubWVkaXVtLmNvbS9ob3ctdG8tc2V0dXAtdHBtLXNpbXVsYXRv
ci1pbi11YnVudHUtMjAtMDQtMjVlYzY3M2I4OGRjPC9hPiwgZXRjKS4gSSBhbSB0cnlpbmcgdG8g
dXNlIElCTSdzIFNXVFBNMiwgYnV0IGhhdmUgbm90IGhhZCBhbnkgbHVjay48YnIgLz4KIDxiciAv
PgogVmlydHVhbGJveCA2LjEuMzA8YnIgLz4KIFdpbmRvd3MgMTAgaG9zdDxiciAvPgogVWJ1bnR1
IDIyLjA0IHNlcnZlciBndWVzdDxiciAvPgogPGJyIC8+CiBUUE0gU0VSVkVSIFNJTVVMQVRPUjxi
ciAvPgogRmlyc3QsIEknbSBpbnN0YWxsaW5nIHRwbV9zZXJ2ZXIuIFNpbmNlIHVidW50dSAyMi4w
NCB1c2VzIG9wZW5zc2wzLjAsIEkgY2Fubm90IHVzZSB2MTY2MSwgYnV0IGluc3RlYWQgYW0gZ2V0
dGluZyB0aGUgbGF0ZXN0IHZlcnNpb24gZnJvbSB0aGUgIm5leHQiIGJyYW5jaDo8YnIgLz4KICQg
Z2l0IGNsb25lIDxhIGhyZWY9Imh0dHBzOi8vZ2l0LmNvZGUuc2YubmV0L3AvaWJtc3d0cG0yL3Rw
bTIiPmh0dHBzOi8vZ2l0LmNvZGUuc2YubmV0L3AvaWJtc3d0cG0yL3RwbTI8L2E+IGlibXN3dHBt
Mi10cG0yPGJyIC8+CiAkIGNkIGlibXN3dHBtMi10cG0vc3JjPGJyIC8+CiAkIG1ha2U8YnIgLz4K
IDxiciAvPgogVFBNMiAtIEFCUk1EPGJyIC8+CiAkIGdpdCBjbG9uZSA8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLWFicm1kLmdpdCI+aHR0cHM6Ly9naXRodWIu
Y29tL3RwbTItc29mdHdhcmUvdHBtMi1hYnJtZC5naXQ8L2E+PGJyIC8+CiAkIGNkIHRwbTItYWJy
bWQ8YnIgLz4KICQgLi9ib290c3RyYXA8YnIgLz4KICQgLi9jb25maWd1cmUgXDxiciAvPgogLS13
aXRoLWRidXNwb2xpY3lkaXI9L2V0Yy9kYnVzLTEvc3lzdGVtLmQgXDxiciAvPgogLS13aXRoLXN5
c3RlbWRzeXN0ZW11bml0ZGlyPS91c3IvbGliL3N5c3RlbWQvc3lzdGVtIFw8YnIgLz4KIC0tbGli
ZGlyPS91c3IvbGliNjQgLS1wcmVmaXg9L3VzciA8YnIgLz4KICQgbWFrZSAtajU8YnIgLz4KICQg
c3VkbyBtYWtlIGluc3RhbGw8YnIgLz4KIDxiciAvPgogVFBNMiAtIHRzczxiciAvPgogJCBnaXQg
Y2xvbmUgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10c3Mu
Z2l0Ij5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRzcy5naXQ8L2E+PGJy
IC8+CiAkIGNkIHRwbTItdHNzPGJyIC8+CiAkIC4vYm9vdHN0cmFwPGJyIC8+CiAkIC4vY29uZmln
dXJlPGJyIC8+CiAkIG1ha2U8YnIgLz4KICQgc3VkbyBtYWtlIGluc3RhbGw8YnIgLz4KICQgc3Vk
byBsZGNvbmZpZzxiciAvPgogPGJyIC8+CiBUUE0yIC0gdG9vbHM8YnIgLz4KICQgZ2l0IGNsb25l
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMuZ2l0
Ij5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzLmdpdDwvYT48YnIg
Lz4KICQgY2QgdHBtMi10b29sczxiciAvPgogJCAuL2Jvb3RzdHJhcDxiciAvPgogJCAuL2NvbmZp
Z3VyZSAtLXByZWZpeD0vdXNyPGJyIC8+CiAkIG1ha2UgLWo1PGJyIC8+CiAkIHN1ZG8gbWFrZSBp
bnN0YWxsPGJyIC8+CiA8YnIgLz4KIEknbSBqdXN0IHN0YXJ0aW5nIHRoaW5ncyBvbiB0aGUgY29t
bWFuZCBsaW5lLCBiZWZvcmUgbWFraW4gdGhlbSBzZXJ2aWNlcy4gSW4gb25lIHdpbmRvdyBJIHN0
YXJ0IHRoZSBUUE0gc2ltdWxhdG9yOjxiciAvPgogJCB0cG0yX3NlcnZlcjxiciAvPgogPGJyIC8+
CiBJbiBhbm90aGVyIHdpbmRvdyBJIHN0YXJ0IHRoZSBBQlJNRDo8YnIgLz4KIHN1ZG8gLXUgdHNz
IHRwbTItYWJybWQgLS10Y3RpPSJsaWJ0c3MyLXRjdGktbXNzaW0uc28uMDpob3N0PTEyNy4wLjAu
MSxwb3J0PTIzMjEiPGJyIC8+CiA8YnIgLz4KIEkgc2VlIHRoaXMgaW4gdGhlIHdpbmRvdyB0aGF0
IHN0YXJ0ZWQgdGhlIFRQTSBzZXJ2ZXI6PGJyIC8+CiBMSUJSQVJZX0NPTVBBVElCSUxJVFlfQ0hF
Q0sgaXMgT048YnIgLz4KIFN0YXJ0aW5nIEFDVCB0aHJlYWQuLi48YnIgLz4KIFRQTSBjb21tYW5k
IHNlcnZlciBsaXN0ZW5pbmcgb24gcG9ydCAyMzIxPGJyIC8+CiBQbGF0Zm9ybSBzZXJ2ZXIgbGlz
dGVuaW5nIG9uIHBvcnQgMjMyMjxiciAvPgogQ29tbWFuZCBJUHY0IGNsaWVudCBhY2NlcHRlZDxi
ciAvPgogUGxhdGZvcm0gSVB2NCBjbGllbnQgYWNjZXB0ZWQ8YnIgLz4KIDxiciAvPgogVGhlbiBJ
IHRyeSB0byBydW4gYSBjb21tYW5kIGxpbmUgdG9vbDo8YnIgLz4KIHRwbTJfcGNycmVhZDxiciAv
PgogRVJST1I6dGN0aTpzcmMvdHNzMi10Y3RpL3RjdGktZGV2aWNlLmM6NDUyOlRzczJfVGN0aV9E
ZXZpY2VfSW5pdCgpIEZhaWxlZCB0byBvcGVuIHNwZWNpZmllZCBUQ1RJIGRldmljZSBmaWxlIC9k
ZXYvdHBtcm0wOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5PGJyIC8+CiBFUlJPUjp0Y3RpOnNy
Yy90c3MyLXRjdGkvdGN0aWxkci1kbC5jOjE3MDp0Y3RpX2Zyb21fZmlsZSgpIENvdWxkIG5vdCBp
bml0aWFsaXplIFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLWRldmljZS5zby4wPGJyIC8+CiBFUlJP
Ujp0Y3RpOnNyYy90c3MyLXRjdGkvdGN0aS1kZXZpY2UuYzo0NTI6VHNzMl9UY3RpX0RldmljZV9J
bml0KCkgRmFpbGVkIHRvIG9wZW4gc3BlY2lmaWVkIFRDVEkgZGV2aWNlIGZpbGUgL2Rldi90cG0w
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5PGJyIC8+CiBFUlJPUjp0Y3RpOnNyYy90c3MyLXRj
dGkvdGN0aWxkci1kbC5jOjE3MDp0Y3RpX2Zyb21fZmlsZSgpIENvdWxkIG5vdCBpbml0aWFsaXpl
IFRDVEkgZmlsZTogbGlidHNzMi10Y3RpLWRldmljZS5zby4wPGJyIC8+CiA8YnIgLz4KIEFuZCBJ
IGdldCBubyBvdXRwdXQuICZuYnNwO0kgZmVlbCBsaWtlIEknbSBub3QgY29uZmlndXJpbmcgdGhl
IFRTUyBjb3JyZWN0bHkuIENhbiBhbnlvbmUgZ2l2ZSBtZSBpbnNpZ2h0IG9uIGhvdyB0byBydW4g
dGhpcz8gJm5ic3A7U2hvdWxkIEkgYmUgdXNpbmcgYSBkaWZmZXJlbnQgc2ltdWxhdG9yPyBJIGhh
dmVuJ3QgZm91bmQgYW55IGdvb2QgaW5zdHJ1Y3Rpb25zIGZvciBob3cgdG8gcnVuIDxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS9zdGVmYW5iZXJnZXIvc3d0cG0iPmh0dHBzOi8vZ2l0aHViLmNv
bS9zdGVmYW5iZXJnZXIvc3d0cG08L2E+IGluIGEgdmlydHVhbGJveCBndWVzdC48YnIgLz4KIF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyIC8+CiB0cG0y
IG1haWxpbmcgbGlzdCAtLSB0cG0yQGxpc3RzLjAxLm9yZzxiciAvPgogVG8gdW5zdWJzY3JpYmUg
c2VuZCBhbiBlbWFpbCB0byB0cG0yLWxlYXZlQGxpc3RzLjAxLm9yZzxiciAvPgogJSh3ZWJfcGFn
ZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM8YnIgLz4KCg==

--===============8357515983961201465==--

