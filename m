Content-Type: multipart/mixed; boundary="===============0136140970855653482=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Fri, 17 Dec 2021 20:51:18 +0000
Message-ID: <SN6PR11MB3437FB8915DBAE7B824660E4B8789@SN6PR11MB3437.namprd11.prod.outlook.com>
In-Reply-To: CAEjGaqdLPaUicAeW-84_C2RRBvkPfXpufsQT_9zCHZf323303g@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0136140970855653482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I wonder if it's related to this bug, but manifesting itself differently:
  - https://github.com/tpm2-software/tpm2-tools/issues/1356

What version of the tpm2-tss libraries are you running? Do commands like tp=
m2_getrandom work?
________________________________
From: Han <keepsimple(a)gmail.com>
Sent: Friday, December 17, 2021 2:04 PM
To: Roberts, William C <william.c.roberts(a)intel.com>
Cc: tpm2(a)lists.01.org <tpm2(a)lists.01.org>
Subject: Re: [tpm2] tpm2_flushcontext stuck

It seems stuck in a call of `poll()` at fd 3, which is /dev/tpmrm0 based on=
 the log (see below).  The kernel version is 5.10.63.  Yes, I am using /dev=
/tpm0 and /dev/tpmrm0.

$ sudo strace tpm2_flushcontext 0x80000000

<snip>

openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D72845, ...}) =3D 0
mmap2(NULL, 72845, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xb6f74000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libtss2-tcti-device.so.0", O_RDO=
NLY|O_LARGEFILE|O_CLOEXEC) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\08\n\0\0004\0\0\0"...=
, 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D22028, ...}) =3D 0
mmap2(NULL, 86236, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0xb5f22000
mprotect(0xb5f27000, 61440, PROT_NONE)  =3D 0
mmap2(0xb5f36000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x4000) =3D 0xb5f36000
close(3)                                =3D 0
mprotect(0xb5f36000, 4096, PROT_READ)   =3D 0
munmap(0xb6f74000, 72845)               =3D 0
openat(AT_FDCWD, "/dev/tpmrm0", O_RDWR|O_NONBLOCK) =3D 3
write(3, "\200\1\0\0\0\f\0\0\1{\0\10", 12) =3D 12
poll([{fd=3D3, events=3DPOLLIN}], 1, 1000)  =3D 1 ([{fd=3D3, revents=3DPOLL=
IN}])
read(3, "\200\1\0\0\0\24\0\0\0\0", 10)  =3D 10
poll([{fd=3D3, events=3DPOLLIN}], 1, 1000)  =3D 1 ([{fd=3D3, revents=3DPOLL=
IN}])
read(3, "\0\10Z\314k~c`I\346", 10)      =3D 10
futex(0xb6e7d35c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7d360, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7d364, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7d380, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7ac9c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7d280, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7b224, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7ad20, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
brk(0xda2000)                           =3D 0xda2000
futex(0xb6e7d368, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7d384, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7d3f8, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7d36c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0xb6e7d370, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
write(3, "\200\1\0\0\0\16\0\0\1s\200\0\0\0", 14) =3D 14
poll([{fd=3D3, events=3DPOLLIN}], 1, -1



On Fri, Dec 17, 2021 at 10:29 AM Roberts, William C <william.c.roberts(a)in=
tel.com<mailto:william.c.roberts(a)intel.com>> wrote:
That's weird, could you strace it and see where it's hanging?

What kernel version is that? I'm assuming your using the /dev/tpm0 or /dev/=
tpmrm0 device directly since I see the sudo.
________________________________
From: Han <keepsimple(a)gmail.com<mailto:keepsimple(a)gmail.com>>
Sent: Wednesday, December 15, 2021 5:56 PM
To: tpm2(a)lists.01.org<mailto:tpm2(a)lists.01.org> <tpm2(a)lists.01.org<ma=
ilto:tpm2(a)lists.01.org>>
Subject: [tpm2] tpm2_flushcontext stuck

Hi,

I'm using tpm2-tools 5.0 in Debian 11 Bullseye based Raspberry Pi OS.  I'm =
trying to run tpm2_flushcontext but the command got stuck and it's not show=
ing anything. Is the data in TPM corrupted?  How can I check?

$ sudo tpm2_flushcontext 0x80000000
< no output at all and stuck here >

(note: the handle 0x80000000 was obtained from previous command output when=
 I was running previous version tpm2-tools 3.1.3 on Debian 10 Buster based =
OS:


$ sudo tpm2_createprimary -H o -g sha256 -G ecc -C context.out
ObjectAttribute: 0x00030072

CreatePrimary Succeed ! Handle: 0x80000000)

--===============0136140970855653482==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CjxoZWFkPgo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRl
eHQvaHRtbDsgY2hhcnNldD11cy1hc2NpaSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4KPC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxp
YnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4KSSB3b25kZXIgaWYgaXQncyByZWxhdGVkIHRvIHRoaXMgYnVnLCBi
dXQgbWFuaWZlc3RpbmcgaXRzZWxmIGRpZmZlcmVudGx5OjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+CiZuYnNwOyAtJm5ic3A7PGEgaHJlZj0iaHR0
cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9pc3N1ZXMvMTM1NiIgaWQ9
IkxQTm9MUE9XQUxpbmtQcmV2aWV3Ij5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90
cG0yLXRvb2xzL2lzc3Vlcy8xMzU2PC9hPjwvZGl2Pgo8ZGl2IGNsYXNzPSJfRW50aXR5IF9FVHlw
ZV9PV0FMaW5rUHJldmlldyBfRUlkX09XQUxpbmtQcmV2aWV3IF9FUmVhZG9ubHlfMSI+PC9kaXY+
CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4KPGJyPgo8L2Rp
dj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPgpXaGF0IHZl
cnNpb24gb2YgdGhlIHRwbTItdHNzIGxpYnJhcmllcyBhcmUgeW91IHJ1bm5pbmc/IERvIGNvbW1h
bmRzIGxpa2UgdHBtMl9nZXRyYW5kb20gd29yaz88L2Rpdj4KPGRpdiBpZD0iYXBwZW5kb25zZW5k
Ij48L2Rpdj4KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jazt3aWR0aDo5OCUiIHRhYmlu
ZGV4PSItMSI+CjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJD
YWxpYnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAw
Ij48Yj5Gcm9tOjwvYj4gSGFuICZsdDtrZWVwc2ltcGxlQGdtYWlsLmNvbSZndDs8YnI+CjxiPlNl
bnQ6PC9iPiBGcmlkYXksIERlY2VtYmVyIDE3LCAyMDIxIDI6MDQgUE08YnI+CjxiPlRvOjwvYj4g
Um9iZXJ0cywgV2lsbGlhbSBDICZsdDt3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20mZ3Q7PGJy
Pgo8Yj5DYzo8L2I+IHRwbTJAbGlzdHMuMDEub3JnICZsdDt0cG0yQGxpc3RzLjAxLm9yZyZndDs8
YnI+CjxiPlN1YmplY3Q6PC9iPiBSZTogW3RwbTJdIHRwbTJfZmx1c2hjb250ZXh0IHN0dWNrPC9m
b250Pgo8ZGl2PiZuYnNwOzwvZGl2Pgo8L2Rpdj4KPGRpdj4KPGRpdiBkaXI9Imx0ciI+SXQgc2Vl
bXMgc3R1Y2sgaW4gYSBjYWxsIG9mIGBwb2xsKClgIGF0IGZkIDMsIHdoaWNoIGlzIC9kZXYvdHBt
cm0wJm5ic3A7YmFzZWQgb24gdGhlIGxvZyAoc2VlIGJlbG93KS4mbmJzcDsgVGhlIGtlcm5lbCB2
ZXJzaW9uIGlzJm5ic3A7NS4xMC42My4mbmJzcDsgWWVzLCBJIGFtIHVzaW5nIC9kZXYvdHBtMCBh
bmQgL2Rldi90cG1ybTAuJm5ic3A7Jm5ic3A7CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4kIHN1ZG8g
c3RyYWNlIHRwbTJfZmx1c2hjb250ZXh0IDB4ODAwMDAwMDA8L2Rpdj4KPGRpdj48YnI+CjwvZGl2
Pgo8ZGl2PiZsdDtzbmlwJmd0OzwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+b3BlbmF0KEFU
X0ZEQ1dELCAmcXVvdDsvZXRjL2xkLnNvLmNhY2hlJnF1b3Q7LCBPX1JET05MWXxPX0xBUkdFRklM
RXxPX0NMT0VYRUMpID0gMzxicj4KZnN0YXQ2NCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0
X3NpemU9NzI4NDUsIC4uLn0pID0gMDxicj4KbW1hcDIoTlVMTCwgNzI4NDUsIFBST1RfUkVBRCwg
TUFQX1BSSVZBVEUsIDMsIDApID0gMHhiNmY3NDAwMDxicj4KY2xvc2UoMykgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7PSAwPGJyPgpvcGVuYXQo
QVRfRkRDV0QsICZxdW90Oy9saWIvYXJtLWxpbnV4LWdudWVhYmloZi9saWJ0c3MyLXRjdGktZGV2
aWNlLnNvLjAmcXVvdDssIE9fUkRPTkxZfE9fTEFSR0VGSUxFfE9fQ0xPRVhFQykgPSAzPGJyPgpy
ZWFkKDMsICZxdW90O1wxNzdFTEZcMVwxXDFcMFwwXDBcMFwwXDBcMFwwXDBcM1wwKFwwXDFcMFww
XDA4XG5cMFwwMDA0XDBcMFwwJnF1b3Q7Li4uLCA1MTIpID0gNTEyPGJyPgpmc3RhdDY0KDMsIHtz
dF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rfc2l6ZT0yMjAyOCwgLi4ufSkgPSAwPGJyPgptbWFwMihO
VUxMLCA4NjIzNiwgUFJPVF9SRUFEfFBST1RfRVhFQywgTUFQX1BSSVZBVEV8TUFQX0RFTllXUklU
RSwgMywgMCkgPSAweGI1ZjIyMDAwPGJyPgptcHJvdGVjdCgweGI1ZjI3MDAwLCA2MTQ0MCwgUFJP
VF9OT05FKSAmbmJzcDs9IDA8YnI+Cm1tYXAyKDB4YjVmMzYwMDAsIDgxOTIsIFBST1RfUkVBRHxQ
Uk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfRklYRUR8TUFQX0RFTllXUklURSwgMywgMHg0MDAw
KSA9IDB4YjVmMzYwMDA8YnI+CmNsb3NlKDMpICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOz0gMDxicj4KbXByb3RlY3QoMHhiNWYzNjAwMCwgNDA5
NiwgUFJPVF9SRUFEKSAmbmJzcDsgPSAwPGJyPgptdW5tYXAoMHhiNmY3NDAwMCwgNzI4NDUpICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyA9IDA8YnI+Cm9w
ZW5hdChBVF9GRENXRCwgJnF1b3Q7L2Rldi90cG1ybTAmcXVvdDssIE9fUkRXUnxPX05PTkJMT0NL
KSA9IDM8YnI+CndyaXRlKDMsICZxdW90O1wyMDBcMVwwXDBcMFxmXDBcMFwxe1wwXDEwJnF1b3Q7
LCAxMikgPSAxMjxicj4KcG9sbChbe2ZkPTMsIGV2ZW50cz1QT0xMSU59XSwgMSwgMTAwMCkgJm5i
c3A7PSAxIChbe2ZkPTMsIHJldmVudHM9UE9MTElOfV0pPGJyPgpyZWFkKDMsICZxdW90O1wyMDBc
MVwwXDBcMFwyNFwwXDBcMFwwJnF1b3Q7LCAxMCkgJm5ic3A7PSAxMDxicj4KcG9sbChbe2ZkPTMs
IGV2ZW50cz1QT0xMSU59XSwgMSwgMTAwMCkgJm5ic3A7PSAxIChbe2ZkPTMsIHJldmVudHM9UE9M
TElOfV0pPGJyPgpyZWFkKDMsICZxdW90O1wwXDEwWlwzMTRrfmNgSVwzNDYmcXVvdDssIDEwKSAm
bmJzcDsgJm5ic3A7ICZuYnNwOz0gMTA8YnI+CmZ1dGV4KDB4YjZlN2QzNWMsIEZVVEVYX1dBS0Vf
UFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgpmdXRleCgweGI2ZTdkMzYwLCBGVVRFWF9XQUtF
X1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KZnV0ZXgoMHhiNmU3ZDM2NCwgRlVURVhfV0FL
RV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CmZ1dGV4KDB4YjZlN2QzODAsIEZVVEVYX1dB
S0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgpmdXRleCgweGI2ZTdhYzljLCBGVVRFWF9X
QUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KZnV0ZXgoMHhiNmU3ZDI4MCwgRlVURVhf
V0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CmZ1dGV4KDB4YjZlN2IyMjQsIEZVVEVY
X1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgpmdXRleCgweGI2ZTdhZDIwLCBGVVRF
WF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KYnJrKDB4ZGEyMDAwKSAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgPSAweGRhMjAwMDxicj4KZnV0ZXgoMHhiNmU3ZDM2
OCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CmZ1dGV4KDB4YjZlN2Qz
ODQsIEZVVEVYX1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgpmdXRleCgweGI2ZTdk
M2Y4LCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KZnV0ZXgoMHhiNmU3
ZDM2YywgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CmZ1dGV4KDB4YjZl
N2QzNzAsIEZVVEVYX1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgp3cml0ZSgzLCAm
cXVvdDtcMjAwXDFcMFwwXDBcMTZcMFwwXDFzXDIwMFwwXDBcMCZxdW90OywgMTQpID0gMTQ8YnI+
CnBvbGwoW3tmZD0zLCBldmVudHM9UE9MTElOfV0sIDEsIC0xPGJyPgo8L2Rpdj4KPGRpdj48YnI+
CjwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjwvZGl2Pgo8YnI+CjxkaXYgY2xhc3M9InhfZ21haWxf
cXVvdGUiPgo8ZGl2IGRpcj0ibHRyIiBjbGFzcz0ieF9nbWFpbF9hdHRyIj5PbiBGcmksIERlYyAx
NywgMjAyMSBhdCAxMDoyOSBBTSBSb2JlcnRzLCBXaWxsaWFtIEMgJmx0OzxhIGhyZWY9Im1haWx0
bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj4KPC9kaXY+CjxibG9ja3F1b3RlIGNsYXNzPSJ4X2dtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4OyBib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTsgcGFkZGluZy1sZWZ0OjFleCI+CjxkaXYgZGlyPSJsdHIiPgo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlm
OyBmb250LXNpemU6MTJwdDsgY29sb3I6cmdiKDAsMCwwKSI+ClRoYXQncyB3ZWlyZCwgY291bGQg
eW91IHN0cmFjZSBpdCBhbmQgc2VlIHdoZXJlIGl0J3MgaGFuZ2luZz88L2Rpdj4KPGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjsgZm9udC1z
aXplOjEycHQ7IGNvbG9yOnJnYigwLDAsMCkiPgo8YnI+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJmb250
LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmOyBmb250LXNpemU6MTJw
dDsgY29sb3I6cmdiKDAsMCwwKSI+CldoYXQga2VybmVsIHZlcnNpb24gaXMgdGhhdD8gSSdtIGFz
c3VtaW5nIHlvdXIgdXNpbmcgdGhlIC9kZXYvdHBtMCBvciAvZGV2L3RwbXJtMCBkZXZpY2UgZGly
ZWN0bHkgc2luY2UgSSBzZWUgdGhlIHN1ZG8uPC9kaXY+CjxkaXYgaWQ9InhfZ21haWwtbV8tNjUw
NjUxMzQ5Mjc1MDQyMTU4MmFwcGVuZG9uc2VuZCI+PC9kaXY+CjxociBzdHlsZT0iZGlzcGxheTpp
bmxpbmUtYmxvY2s7IHdpZHRoOjk4JSI+CjxkaXYgaWQ9InhfZ21haWwtbV8tNjUwNjUxMzQ5Mjc1
MDQyMTU4MmRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5z
LXNlcmlmIiBjb2xvcj0iIzAwMDAwMCIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij48Yj5Gcm9tOjwv
Yj4gSGFuICZsdDs8YSBocmVmPSJtYWlsdG86a2VlcHNpbXBsZUBnbWFpbC5jb20iIHRhcmdldD0i
X2JsYW5rIj5rZWVwc2ltcGxlQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPgo8Yj5TZW50OjwvYj4gV2Vk
bmVzZGF5LCBEZWNlbWJlciAxNSwgMjAyMSA1OjU2IFBNPGJyPgo8Yj5Ubzo8L2I+IDxhIGhyZWY9
Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEu
b3JnPC9hPiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9i
bGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+Jmd0Ozxicj4KPGI+U3ViamVjdDo8L2I+IFt0cG0y
XSB0cG0yX2ZsdXNoY29udGV4dCBzdHVjazwvZm9udD4KPGRpdj4mbmJzcDs8L2Rpdj4KPC9kaXY+
CjxkaXY+CjxkaXYgZGlyPSJsdHIiPkhpLAo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSdtIHVzaW5n
IHRwbTItdG9vbHMgNS4wIGluIERlYmlhbiAxMSBCdWxsc2V5ZSBiYXNlZCBSYXNwYmVycnkgUGkg
T1MuJm5ic3A7IEknbSB0cnlpbmcgdG8gcnVuJm5ic3A7dHBtMl9mbHVzaGNvbnRleHQgYnV0IHRo
ZSBjb21tYW5kIGdvdCBzdHVjayBhbmQgaXQncyBub3Qgc2hvd2luZyBhbnl0aGluZy4gSXMgdGhl
IGRhdGEgaW4gVFBNIGNvcnJ1cHRlZD8mbmJzcDsgSG93IGNhbiBJIGNoZWNrPyZuYnNwOzwvZGl2
Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+JCBzdWRvIHRwbTJfZmx1c2hjb250ZXh0IDB4ODAwMDAw
MDA8YnI+CjwvZGl2Pgo8ZGl2PiZsdDsgbm8gb3V0cHV0IGF0IGFsbCBhbmQgc3R1Y2sgaGVyZSAm
Z3Q7PC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4obm90ZTogdGhlIGhhbmRsZSAweDgwMDAw
MDAwIHdhcyBvYnRhaW5lZCBmcm9tIHByZXZpb3VzIGNvbW1hbmQgb3V0cHV0IHdoZW4gSSB3YXMg
cnVubmluZyBwcmV2aW91cyB2ZXJzaW9uIHRwbTItdG9vbHMgMy4xLjMgb24gRGViaWFuIDEwIEJ1
c3RlciBiYXNlZCBPUzombmJzcDs8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pgo8cHJlIHN0
eWxlPSJib3gtc2l6aW5nOmJvcmRlci1ib3g7IGZvbnQtZmFtaWx5OnVpLW1vbm9zcGFjZSxTRk1v
bm8tUmVndWxhciwmcXVvdDtTRiBNb25vJnF1b3Q7LE1lbmxvLENvbnNvbGFzLCZxdW90O0xpYmVy
YXRpb24gTW9ubyZxdW90Oyxtb25vc3BhY2U7IGZvbnQtc2l6ZToxMS45cHg7IG1hcmdpbi10b3A6
MHB4OyBtYXJnaW4tYm90dG9tOjE2cHg7IHBhZGRpbmc6MTZweDsgb3ZlcmZsb3c6YXV0bzsgbGlu
ZS1oZWlnaHQ6MS40NTsgYm9yZGVyLXJhZGl1czo2cHg7IGNvbG9yOnJnYigzNiw0MSw0NykiPjxj
b2RlIHN0eWxlPSJib3gtc2l6aW5nOmJvcmRlci1ib3g7IGZvbnQtZmFtaWx5OnVpLW1vbm9zcGFj
ZSxTRk1vbm8tUmVndWxhciwmcXVvdDtTRiBNb25vJnF1b3Q7LE1lbmxvLENvbnNvbGFzLCZxdW90
O0xpYmVyYXRpb24gTW9ubyZxdW90Oyxtb25vc3BhY2U7IGZvbnQtc2l6ZToxMS45cHg7IHBhZGRp
bmc6MHB4OyBtYXJnaW46MHB4OyBiYWNrZ3JvdW5kOnRyYW5zcGFyZW50OyBib3JkZXItcmFkaXVz
OjZweDsgd29yZC1icmVhazpub3JtYWw7IGJvcmRlcjowcHg7IGRpc3BsYXk6aW5saW5lOyBvdmVy
Zmxvdzp2aXNpYmxlOyBsaW5lLWhlaWdodDppbmhlcml0Ij4kIHN1ZG8gdHBtMl9jcmVhdGVwcmlt
YXJ5IC1IIG8gLWcgc2hhMjU2IC1HIGVjYyAtQyBjb250ZXh0Lm91dApPYmplY3RBdHRyaWJ1dGU6
IDB4MDAwMzAwNzIKCkNyZWF0ZVByaW1hcnkgU3VjY2VlZCAhIEhhbmRsZTogMHg4MDAwMDAwMCkg
PC9jb2RlPjwvcHJlPgo8L2Rpdj4KPC9kaXY+CjwvZGl2Pgo8L2Rpdj4KPC9ibG9ja3F1b3RlPgo8
L2Rpdj4KPC9kaXY+CjwvYm9keT4KPC9odG1sPgo=

--===============0136140970855653482==--

