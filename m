Content-Type: multipart/mixed; boundary="===============7574249300847401868=="
MIME-Version: 1.0
From: Han <keepsimple at gmail.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Fri, 17 Dec 2021 15:58:23 -0800
Message-ID: <CAEjGaqdA2sj=cBcasO_0PqKHtE5mqAN4Bdyx9LUvqVj_QPCEGg@mail.gmail.com>
In-Reply-To: SN6PR11MB3437FB8915DBAE7B824660E4B8789@SN6PR11MB3437.namprd11.prod.outlook.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7574249300847401868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 12:51 PM Roberts, William C <
william.c.roberts(a)intel.com> wrote:

> I wonder if it's related to this bug, but manifesting itself differently:
>   - https://github.com/tpm2-software/tpm2-tools/issues/1356
>

Not sure. The bug is reported on "tpm2-tools" 3.1.3 with Linux kernel 5.0.
I'm using "tpm2-tools" 5.0 now with kernel 5.10.


> What version of the tpm2-tss libraries are you running? Do commands like
> tpm2_getrandom work?
>

There are multiple tss libs on my system (see below), but I think it
is 3.0.3.  Yes commands like `tpm2_getrandom` work, including
`tpm2_createprimary`.

$ apt search tpm2 | grep tss

WARNING: apt does not have a stable CLI interface. Use with caution in
scripts.

libtss2-dev/stable 3.0.3-2 armhf
libtss2-esys-3.0.2-0/stable,now 3.0.3-2 armhf [installed,automatic]
libtss2-fapi1/stable 3.0.3-2 armhf
libtss2-mu0/stable,now 3.0.3-2 armhf [installed,automatic]
libtss2-rc0/stable,now 3.0.3-2 armhf [installed,automatic]
libtss2-sys1/stable,now 3.0.3-2 armhf [installed,automatic]
libtss2-tcti-cmd0/stable,now 3.0.3-2 armhf [installed,automatic]
libtss2-tcti-device0/stable,now 3.0.3-2 armhf [installed,automatic]
libtss2-tcti-mssim0/stable,now 3.0.3-2 armhf [installed,automatic]
libtss2-tcti-swtpm0/stable,now 3.0.3-2 armhf [installed,automatic]
libtss2-tcti-tabrmd-dev/stable 2.3.3-1+b1 armhf
libtss2-tcti-tabrmd0/stable 2.3.3-1+b1 armhf
libtss2-tctildr0/stable,now 3.0.3-2 armhf [installed,automatic]



> ------------------------------
> *From:* Han <keepsimple(a)gmail.com>
> *Sent:* Friday, December 17, 2021 2:04 PM
> *To:* Roberts, William C <william.c.roberts(a)intel.com>
> *Cc:* tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> *Subject:* Re: [tpm2] tpm2_flushcontext stuck
>
> It seems stuck in a call of `poll()` at fd 3, which is /dev/tpmrm0 based
> on the log (see below).  The kernel version is 5.10.63.  Yes, I am using
> /dev/tpm0 and /dev/tpmrm0.
>
> $ sudo strace tpm2_flushcontext 0x80000000
>
> <snip>
>
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 3
> fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D72845, ...}) =3D 0
> mmap2(NULL, 72845, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xb6f74000
> close(3)                                =3D 0
> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libtss2-tcti-device.so.0",
> O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 3
> read(3,
> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\08\n\0\0004\0\0\0"..., 512)=
 =3D
> 512
> fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D22028, ...}) =3D 0
> mmap2(NULL, 86236, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D
> 0xb5f22000
> mprotect(0xb5f27000, 61440, PROT_NONE)  =3D 0
> mmap2(0xb5f36000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) =3D 0xb5f36000
> close(3)                                =3D 0
> mprotect(0xb5f36000, 4096, PROT_READ)   =3D 0
> munmap(0xb6f74000, 72845)               =3D 0
> openat(AT_FDCWD, "/dev/tpmrm0", O_RDWR|O_NONBLOCK) =3D 3
> write(3, "\200\1\0\0\0\f\0\0\1{\0\10", 12) =3D 12
> poll([{fd=3D3, events=3DPOLLIN}], 1, 1000)  =3D 1 ([{fd=3D3, revents=3DPO=
LLIN}])
> read(3, "\200\1\0\0\0\24\0\0\0\0", 10)  =3D 10
> poll([{fd=3D3, events=3DPOLLIN}], 1, 1000)  =3D 1 ([{fd=3D3, revents=3DPO=
LLIN}])
> read(3, "\0\10Z\314k~c`I\346", 10)      =3D 10
> futex(0xb6e7d35c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7d360, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7d364, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7d380, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7ac9c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7d280, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7b224, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7ad20, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> brk(0xda2000)                           =3D 0xda2000
> futex(0xb6e7d368, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7d384, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7d3f8, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7d36c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> futex(0xb6e7d370, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> write(3, "\200\1\0\0\0\16\0\0\1s\200\0\0\0", 14) =3D 14
> poll([{fd=3D3, events=3DPOLLIN}], 1, -1
>
>
>
> On Fri, Dec 17, 2021 at 10:29 AM Roberts, William C <
> william.c.roberts(a)intel.com> wrote:
>
> That's weird, could you strace it and see where it's hanging?
>
> What kernel version is that? I'm assuming your using the /dev/tpm0 or
> /dev/tpmrm0 device directly since I see the sudo.
> ------------------------------
> *From:* Han <keepsimple(a)gmail.com>
> *Sent:* Wednesday, December 15, 2021 5:56 PM
> *To:* tpm2(a)lists.01.org <tpm2(a)lists.01.org>
> *Subject:* [tpm2] tpm2_flushcontext stuck
>
> Hi,
>
> I'm using tpm2-tools 5.0 in Debian 11 Bullseye based Raspberry Pi OS.  I'm
> trying to run tpm2_flushcontext but the command got stuck and it's not
> showing anything. Is the data in TPM corrupted?  How can I check?
>
> $ sudo tpm2_flushcontext 0x80000000
> < no output at all and stuck here >
>
> (note: the handle 0x80000000 was obtained from previous command output
> when I was running previous version tpm2-tools 3.1.3 on Debian 10 Buster
> based OS:
>
> $ sudo tpm2_createprimary -H o -g sha256 -G ecc -C context.out
> ObjectAttribute: 0x00030072
>
> CreatePrimary Succeed ! Handle: 0x80000000)
>
>

--===============7574249300847401868==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gRnJpLCBEZWMgMTcs
IDIwMjEgYXQgMTI6NTEgUE0gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86
d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208
L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPgoKCgoKPGRpdiBkaXI9Imx0ciI+CjxkaXYg
c3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9u
dC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+Ckkgd29uZGVyIGlmIGl0JiMzOTtzIHJlbGF0
ZWQgdG8gdGhpcyBidWcsIGJ1dCBtYW5pZmVzdGluZyBpdHNlbGYgZGlmZmVyZW50bHk6PC9kaXY+
CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2Vy
aWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+CsKgIC3CoDxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS90cG0yLXNvZnR3YXJlL3RwbTItdG9vbHMvaXNzdWVzLzEzNTYiIGlkPSJn
bWFpbC1tXy02MTY1ODM1ODIyNTg1NjgwNjg4TFBOb0xQT1dBTGlua1ByZXZpZXciIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vl
cy8xMzU2PC9hPjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pk5v
dCBzdXJlLiBUaGUgYnVnIGlzIHJlcG9ydGVkIG9uICZxdW90O3RwbTItdG9vbHMmcXVvdDsgMy4x
LjMgd2l0aCBMaW51eCBrZXJuZWwgNS4wLsKgIEkmIzM5O20gdXNpbmcgJnF1b3Q7dHBtMi10b29s
cyZxdW90OyA1LjAgbm93IHdpdGgga2VybmVsIDUuMTAuPC9kaXY+PGRpdj7CoDwvZGl2PjxibG9j
a3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhl
eDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4
Ij48ZGl2IGRpcj0ibHRyIj4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxI
ZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KV2hh
dCB2ZXJzaW9uIG9mIHRoZSB0cG0yLXRzcyBsaWJyYXJpZXMgYXJlIHlvdSBydW5uaW5nPyBEbyBj
b21tYW5kcyBsaWtlIHRwbTJfZ2V0cmFuZG9tIHdvcms/PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3Rl
PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlcmUgYXJlIG11bHRpcGxlIHRzcyBsaWJzIG9uIG15IHN5
c3RlbSAoc2VlIGJlbG93KSwgYnV0IEkgdGhpbmsgaXQgaXPCoDMuMC4zLsKgIFllcyBjb21tYW5k
cyBsaWtlIGB0cG0yX2dldHJhbmRvbWAgd29yaywgaW5jbHVkaW5nIGB0cG0yX2NyZWF0ZXByaW1h
cnlgLsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4kIGFwdCBzZWFyY2ggdHBtMiB8IGdyZXAg
dHNzPGJyPjxicj5XQVJOSU5HOiBhcHQgZG9lcyBub3QgaGF2ZSBhIHN0YWJsZSBDTEkgaW50ZXJm
YWNlLiBVc2Ugd2l0aCBjYXV0aW9uIGluIHNjcmlwdHMuPGJyPjxicj5saWJ0c3MyLWRldi9zdGFi
bGUgMy4wLjMtMiBhcm1oZjxicj5saWJ0c3MyLWVzeXMtMy4wLjItMC9zdGFibGUsbm93IDMuMC4z
LTIgYXJtaGYgW2luc3RhbGxlZCxhdXRvbWF0aWNdPGJyPmxpYnRzczItZmFwaTEvc3RhYmxlIDMu
MC4zLTIgYXJtaGY8YnI+bGlidHNzMi1tdTAvc3RhYmxlLG5vdyAzLjAuMy0yIGFybWhmIFtpbnN0
YWxsZWQsYXV0b21hdGljXTxicj5saWJ0c3MyLXJjMC9zdGFibGUsbm93IDMuMC4zLTIgYXJtaGYg
W2luc3RhbGxlZCxhdXRvbWF0aWNdPGJyPmxpYnRzczItc3lzMS9zdGFibGUsbm93IDMuMC4zLTIg
YXJtaGYgW2luc3RhbGxlZCxhdXRvbWF0aWNdPGJyPmxpYnRzczItdGN0aS1jbWQwL3N0YWJsZSxu
b3cgMy4wLjMtMiBhcm1oZiBbaW5zdGFsbGVkLGF1dG9tYXRpY108YnI+bGlidHNzMi10Y3RpLWRl
dmljZTAvc3RhYmxlLG5vdyAzLjAuMy0yIGFybWhmIFtpbnN0YWxsZWQsYXV0b21hdGljXTxicj5s
aWJ0c3MyLXRjdGktbXNzaW0wL3N0YWJsZSxub3cgMy4wLjMtMiBhcm1oZiBbaW5zdGFsbGVkLGF1
dG9tYXRpY108YnI+bGlidHNzMi10Y3RpLXN3dHBtMC9zdGFibGUsbm93IDMuMC4zLTIgYXJtaGYg
W2luc3RhbGxlZCxhdXRvbWF0aWNdPGJyPmxpYnRzczItdGN0aS10YWJybWQtZGV2L3N0YWJsZSAy
LjMuMy0xK2IxIGFybWhmPGJyPmxpYnRzczItdGN0aS10YWJybWQwL3N0YWJsZSAyLjMuMy0xK2Ix
IGFybWhmPGJyPmxpYnRzczItdGN0aWxkcjAvc3RhYmxlLG5vdyAzLjAuMy0yIGFybWhmIFtpbnN0
YWxsZWQsYXV0b21hdGljXTxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PsKgPC9kaXY+PGJs
b2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAu
OGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDox
ZXgiPjxkaXYgZGlyPSJsdHIiPgo8ZGl2IGlkPSJnbWFpbC1tXy02MTY1ODM1ODIyNTg1NjgwNjg4
YXBwZW5kb25zZW5kIj48L2Rpdj4KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jazt3aWR0
aDo5OCUiPgo8ZGl2IGlkPSJnbWFpbC1tXy02MTY1ODM1ODIyNTg1NjgwNjg4ZGl2UnBseUZ3ZE1z
ZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYiIHN0eWxlPSJmb250
LXNpemU6MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxiPkZyb206PC9iPiBIYW4gJmx0OzxhIGhyZWY9
Im1haWx0bzprZWVwc2ltcGxlQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmtlZXBzaW1wbGVA
Z21haWwuY29tPC9hPiZndDs8YnI+CjxiPlNlbnQ6PC9iPiBGcmlkYXksIERlY2VtYmVyIDE3LCAy
MDIxIDI6MDQgUE08YnI+CjxiPlRvOjwvYj4gUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVm
PSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDs8YnI+CjxiPkNjOjwvYj4gPGEgaHJlZj0i
bWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5v
cmc8L2E+ICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7PGJyPgo8Yj5TdWJqZWN0OjwvYj4gUmU6IFt0
cG0yXSB0cG0yX2ZsdXNoY29udGV4dCBzdHVjazwvZm9udD4KPGRpdj7CoDwvZGl2Pgo8L2Rpdj4K
PGRpdj4KPGRpdiBkaXI9Imx0ciI+SXQgc2VlbXMgc3R1Y2sgaW4gYSBjYWxsIG9mIGBwb2xsKClg
IGF0IGZkIDMsIHdoaWNoIGlzIC9kZXYvdHBtcm0wwqBiYXNlZCBvbiB0aGUgbG9nIChzZWUgYmVs
b3cpLsKgIFRoZSBrZXJuZWwgdmVyc2lvbiBpc8KgNS4xMC42My7CoCBZZXMsIEkgYW0gdXNpbmcg
L2Rldi90cG0wIGFuZCAvZGV2L3RwbXJtMC7CoMKgCjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4kIHN1
ZG8gc3RyYWNlIHRwbTJfZmx1c2hjb250ZXh0IDB4ODAwMDAwMDA8L2Rpdj4KPGRpdj48YnI+Cjwv
ZGl2Pgo8ZGl2PiZsdDtzbmlwJmd0OzwvZGl2Pgo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+b3BlbmF0
KEFUX0ZEQ1dELCAmcXVvdDsvZXRjL2xkLnNvLmNhY2hlJnF1b3Q7LCBPX1JET05MWXxPX0xBUkdF
RklMRXxPX0NMT0VYRUMpID0gMzxicj4KZnN0YXQ2NCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQs
IHN0X3NpemU9NzI4NDUsIC4uLn0pID0gMDxicj4KbW1hcDIoTlVMTCwgNzI4NDUsIFBST1RfUkVB
RCwgTUFQX1BSSVZBVEUsIDMsIDApID0gMHhiNmY3NDAwMDxicj4KY2xvc2UoMykgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA9IDA8YnI+Cm9wZW5hdChBVF9G
RENXRCwgJnF1b3Q7L2xpYi9hcm0tbGludXgtZ251ZWFiaWhmL2xpYnRzczItdGN0aS1kZXZpY2Uu
c28uMCZxdW90OywgT19SRE9OTFl8T19MQVJHRUZJTEV8T19DTE9FWEVDKSA9IDM8YnI+CnJlYWQo
MywgJnF1b3Q7XDE3N0VMRlwxXDFcMVwwXDBcMFwwXDBcMFwwXDBcMFwzXDAoXDBcMVwwXDBcMDhc
blwwXDAwMDRcMFwwXDAmcXVvdDsuLi4sIDUxMikgPSA1MTI8YnI+CmZzdGF0NjQoMywge3N0X21v
ZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTIyMDI4LCAuLi59KSA9IDA8YnI+Cm1tYXAyKE5VTEws
IDg2MjM2LCBQUk9UX1JFQUR8UFJPVF9FWEVDLCBNQVBfUFJJVkFURXxNQVBfREVOWVdSSVRFLCAz
LCAwKSA9IDB4YjVmMjIwMDA8YnI+Cm1wcm90ZWN0KDB4YjVmMjcwMDAsIDYxNDQwLCBQUk9UX05P
TkUpIMKgPSAwPGJyPgptbWFwMigweGI1ZjM2MDAwLCA4MTkyLCBQUk9UX1JFQUR8UFJPVF9XUklU
RSwgTUFQX1BSSVZBVEV8TUFQX0ZJWEVEfE1BUF9ERU5ZV1JJVEUsIDMsIDB4NDAwMCkgPSAweGI1
ZjM2MDAwPGJyPgpjbG9zZSgzKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoD0gMDxicj4KbXByb3RlY3QoMHhiNWYzNjAwMCwgNDA5NiwgUFJPVF9SRUFEKSDC
oCA9IDA8YnI+Cm11bm1hcCgweGI2Zjc0MDAwLCA3Mjg0NSkgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
PSAwPGJyPgpvcGVuYXQoQVRfRkRDV0QsICZxdW90Oy9kZXYvdHBtcm0wJnF1b3Q7LCBPX1JEV1J8
T19OT05CTE9DSykgPSAzPGJyPgp3cml0ZSgzLCAmcXVvdDtcMjAwXDFcMFwwXDBcZlwwXDBcMXtc
MFwxMCZxdW90OywgMTIpID0gMTI8YnI+CnBvbGwoW3tmZD0zLCBldmVudHM9UE9MTElOfV0sIDEs
IDEwMDApIMKgPSAxIChbe2ZkPTMsIHJldmVudHM9UE9MTElOfV0pPGJyPgpyZWFkKDMsICZxdW90
O1wyMDBcMVwwXDBcMFwyNFwwXDBcMFwwJnF1b3Q7LCAxMCkgwqA9IDEwPGJyPgpwb2xsKFt7ZmQ9
MywgZXZlbnRzPVBPTExJTn1dLCAxLCAxMDAwKSDCoD0gMSAoW3tmZD0zLCByZXZlbnRzPVBPTExJ
Tn1dKTxicj4KcmVhZCgzLCAmcXVvdDtcMFwxMFpcMzE0a35jYElcMzQ2JnF1b3Q7LCAxMCkgwqAg
wqAgwqA9IDEwPGJyPgpmdXRleCgweGI2ZTdkMzVjLCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0
ODM2NDcpID0gMDxicj4KZnV0ZXgoMHhiNmU3ZDM2MCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3
NDgzNjQ3KSA9IDA8YnI+CmZ1dGV4KDB4YjZlN2QzNjQsIEZVVEVYX1dBS0VfUFJJVkFURSwgMjE0
NzQ4MzY0NykgPSAwPGJyPgpmdXRleCgweGI2ZTdkMzgwLCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIx
NDc0ODM2NDcpID0gMDxicj4KZnV0ZXgoMHhiNmU3YWM5YywgRlVURVhfV0FLRV9QUklWQVRFLCAy
MTQ3NDgzNjQ3KSA9IDA8YnI+CmZ1dGV4KDB4YjZlN2QyODAsIEZVVEVYX1dBS0VfUFJJVkFURSwg
MjE0NzQ4MzY0NykgPSAwPGJyPgpmdXRleCgweGI2ZTdiMjI0LCBGVVRFWF9XQUtFX1BSSVZBVEUs
IDIxNDc0ODM2NDcpID0gMDxicj4KZnV0ZXgoMHhiNmU3YWQyMCwgRlVURVhfV0FLRV9QUklWQVRF
LCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CmJyaygweGRhMjAwMCkgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgPSAweGRhMjAwMDxicj4KZnV0ZXgoMHhiNmU3ZDM2OCwgRlVURVhf
V0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CmZ1dGV4KDB4YjZlN2QzODQsIEZVVEVY
X1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgpmdXRleCgweGI2ZTdkM2Y4LCBGVVRF
WF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KZnV0ZXgoMHhiNmU3ZDM2YywgRlVU
RVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CmZ1dGV4KDB4YjZlN2QzNzAsIEZV
VEVYX1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgp3cml0ZSgzLCAmcXVvdDtcMjAw
XDFcMFwwXDBcMTZcMFwwXDFzXDIwMFwwXDBcMCZxdW90OywgMTQpID0gMTQ8YnI+CnBvbGwoW3tm
ZD0zLCBldmVudHM9UE9MTElOfV0sIDEsIC0xPGJyPgo8L2Rpdj4KPGRpdj48YnI+CjwvZGl2Pgo8
ZGl2Pjxicj4KPC9kaXY+CjwvZGl2Pgo8YnI+CjxkaXY+CjxkaXYgZGlyPSJsdHIiPk9uIEZyaSwg
RGVjIDE3LCAyMDIxIGF0IDEwOjI5IEFNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0i
bWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4KPC9kaXY+CjxibG9ja3F1
b3RlIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlk
IHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+CjxkaXYgZGlyPSJsdHIiPgo8ZGl2
IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpLEFyaWFsLEhlbHZldGljYSxzYW5zLXNlcmlmO2Zv
bnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPgpUaGF0JiMzOTtzIHdlaXJkLCBjb3VsZCB5
b3Ugc3RyYWNlIGl0IGFuZCBzZWUgd2hlcmUgaXQmIzM5O3MgaGFuZ2luZz88L2Rpdj4KPGRpdiBz
dHlsZT0iZm9udC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250
LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4KPGJyPgo8L2Rpdj4KPGRpdiBzdHlsZT0iZm9u
dC1mYW1pbHk6Q2FsaWJyaSxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6MTJw
dDtjb2xvcjpyZ2IoMCwwLDApIj4KV2hhdCBrZXJuZWwgdmVyc2lvbiBpcyB0aGF0PyBJJiMzOTtt
IGFzc3VtaW5nIHlvdXIgdXNpbmcgdGhlIC9kZXYvdHBtMCBvciAvZGV2L3RwbXJtMCBkZXZpY2Ug
ZGlyZWN0bHkgc2luY2UgSSBzZWUgdGhlIHN1ZG8uPC9kaXY+CjxkaXYgaWQ9ImdtYWlsLW1fLTYx
NjU4MzU4MjI1ODU2ODA2ODh4X2dtYWlsLW1fLTY1MDY1MTM0OTI3NTA0MjE1ODJhcHBlbmRvbnNl
bmQiPjwvZGl2Pgo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSI+Cjxk
aXYgaWQ9ImdtYWlsLW1fLTYxNjU4MzU4MjI1ODU2ODA2ODh4X2dtYWlsLW1fLTY1MDY1MTM0OTI3
NTA0MjE1ODJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fu
cy1zZXJpZiIgY29sb3I9IiMwMDAwMDAiIHN0eWxlPSJmb250LXNpemU6MTFwdCI+PGI+RnJvbTo8
L2I+IEhhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmtlZXBzaW1wbGVAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayI+a2VlcHNpbXBsZUBnbWFpbC5jb208L2E+Jmd0Ozxicj4KPGI+U2VudDo8L2I+IFdl
ZG5lc2RheSwgRGVjZW1iZXIgMTUsIDIwMjEgNTo1NiBQTTxicj4KPGI+VG86PC9iPiA8YSBocmVm
PSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAx
Lm9yZzwvYT4gJmx0OzxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJf
YmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDs8YnI+CjxiPlN1YmplY3Q6PC9iPiBbdHBt
Ml0gdHBtMl9mbHVzaGNvbnRleHQgc3R1Y2s8L2ZvbnQ+CjxkaXY+wqA8L2Rpdj4KPC9kaXY+Cjxk
aXY+CjxkaXYgZGlyPSJsdHIiPkhpLAo8ZGl2Pjxicj4KPC9kaXY+CjxkaXY+SSYjMzk7bSB1c2lu
ZyB0cG0yLXRvb2xzIDUuMCBpbiBEZWJpYW4gMTEgQnVsbHNleWUgYmFzZWQgUmFzcGJlcnJ5IFBp
IE9TLsKgIEkmIzM5O20gdHJ5aW5nIHRvIHJ1bsKgdHBtMl9mbHVzaGNvbnRleHQgYnV0IHRoZSBj
b21tYW5kIGdvdCBzdHVjayBhbmQgaXQmIzM5O3Mgbm90IHNob3dpbmcgYW55dGhpbmcuIElzIHRo
ZSBkYXRhIGluIFRQTSBjb3JydXB0ZWQ/wqAgSG93IGNhbiBJIGNoZWNrP8KgPC9kaXY+CjxkaXY+
PGJyPgo8L2Rpdj4KPGRpdj4kIHN1ZG8gdHBtMl9mbHVzaGNvbnRleHQgMHg4MDAwMDAwMDxicj4K
PC9kaXY+CjxkaXY+Jmx0OyBubyBvdXRwdXQgYXQgYWxsIGFuZCBzdHVjayBoZXJlICZndDs8L2Rp
dj4KPGRpdj48YnI+CjwvZGl2Pgo8ZGl2Pihub3RlOiB0aGUgaGFuZGxlIDB4ODAwMDAwMDAgd2Fz
IG9idGFpbmVkIGZyb20gcHJldmlvdXMgY29tbWFuZCBvdXRwdXQgd2hlbiBJIHdhcyBydW5uaW5n
IHByZXZpb3VzIHZlcnNpb24gdHBtMi10b29scyAzLjEuMyBvbiBEZWJpYW4gMTAgQnVzdGVyIGJh
c2VkIE9TOsKgPC9kaXY+CjxkaXY+PGJyPgo8L2Rpdj4KPGRpdj4KPHByZSBzdHlsZT0iYm94LXNp
emluZzpib3JkZXItYm94O2ZvbnQtZmFtaWx5OnVpLW1vbm9zcGFjZSxTRk1vbm8tUmVndWxhciwm
cXVvdDtTRiBNb25vJnF1b3Q7LE1lbmxvLENvbnNvbGFzLCZxdW90O0xpYmVyYXRpb24gTW9ubyZx
dW90Oyxtb25vc3BhY2U7Zm9udC1zaXplOjExLjlweDttYXJnaW4tdG9wOjBweDttYXJnaW4tYm90
dG9tOjE2cHg7cGFkZGluZzoxNnB4O292ZXJmbG93OmF1dG87bGluZS1oZWlnaHQ6MS40NTtib3Jk
ZXItcmFkaXVzOjZweDtjb2xvcjpyZ2IoMzYsNDEsNDcpIj48Y29kZSBzdHlsZT0iYm94LXNpemlu
Zzpib3JkZXItYm94O2ZvbnQtZmFtaWx5OnVpLW1vbm9zcGFjZSxTRk1vbm8tUmVndWxhciwmcXVv
dDtTRiBNb25vJnF1b3Q7LE1lbmxvLENvbnNvbGFzLCZxdW90O0xpYmVyYXRpb24gTW9ubyZxdW90
Oyxtb25vc3BhY2U7Zm9udC1zaXplOjExLjlweDtwYWRkaW5nOjBweDttYXJnaW46MHB4O2JhY2tn
cm91bmQ6dHJhbnNwYXJlbnQ7Ym9yZGVyLXJhZGl1czo2cHg7d29yZC1icmVhazpub3JtYWw7Ym9y
ZGVyOjBweDtkaXNwbGF5OmlubGluZTtvdmVyZmxvdzp2aXNpYmxlO2xpbmUtaGVpZ2h0OmluaGVy
aXQiPiQgc3VkbyB0cG0yX2NyZWF0ZXByaW1hcnkgLUggbyAtZyBzaGEyNTYgLUcgZWNjIC1DIGNv
bnRleHQub3V0Ck9iamVjdEF0dHJpYnV0ZTogMHgwMDAzMDA3MgoKQ3JlYXRlUHJpbWFyeSBTdWNj
ZWVkICEgSGFuZGxlOiAweDgwMDAwMDAwKSA8L2NvZGU+PC9wcmU+CjwvZGl2Pgo8L2Rpdj4KPC9k
aXY+CjwvZGl2Pgo8L2Jsb2NrcXVvdGU+CjwvZGl2Pgo8L2Rpdj4KPC9kaXY+Cgo8L2Jsb2NrcXVv
dGU+PC9kaXY+PC9kaXY+Cg==

--===============7574249300847401868==--

