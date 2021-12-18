Content-Type: multipart/mixed; boundary="===============6749434138773875495=="
MIME-Version: 1.0
From: Han <keepsimple at gmail.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Sat, 18 Dec 2021 11:33:23 -0800
Message-ID: <CAEjGaqeg3f+VdhAFdJEQfUN2pymqJ9om+iTkdf6HP1Kqb5oHmQ@mail.gmail.com>
In-Reply-To: 1e22ade5-5e50-dff3-6dca-f0f1271ea9ff@sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6749434138773875495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18, 2021 at 5:54 AM Juergen Repp <Juergen.Repp(a)sit.fraunhofer=
.de>
wrote:

> I did check your commands on Raspian (also /dev/tpmrm0 was used):
>
> tpm2_createprimary  -C o -g sha256 -G ecc -c primary.ctx
> tpm2_getcap handles-transient (No handle is displayed, primary.ctx can be
> used)
> tpm2_flushcontext 0x80000000
> ERROR:tcti:src/util/io.c:108:write_all() failed to write to fd 3: Invalid
> argument
> ERROR:tcti:src/tss2-tcti/tcti-device.c:126:tcti_device_transmit() wrong
> number of bytes written. Expected 14, wrote 0.
>
> So it seems to be a Problem with tcti_device_transmit. The write did
> return -1 if the handle does not exist.
> If the TPM handle used for tpm2_flushcontext exists this error did not
> occur.
>
> Do you also get no handle when executing getcap?:
> tpm2_getcap handles-transient


You're right.  No handles displayed when running "tpm2_getcap
handles-transient".  I can understand if tpm2_flushcontext returns
error messages when no handle. But I didn't understand why it got stuck in
my case.

thanks,
Han


>
>
>
> Am 18.12.21 um 00:58 schrieb Han:
> >
> > On Fri, Dec 17, 2021 at 12:51 PM Roberts, William C <
> william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>> wro=
te:
> >
> >     I wonder if it's related to this bug, but manifesting itself
> differently:
> >       - https://github.com/tpm2-software/tpm2-tools/issues/1356 <
> https://github.com/tpm2-software/tpm2-tools/issues/1356>
> >
> >
> > Not sure. The bug is reported on "tpm2-tools" 3.1.3 with Linux kernel
> 5.0.  I'm using "tpm2-tools" 5.0 now with kernel 5.10.
> >
> >
> >     What version of the tpm2-tss libraries are you running? Do commands
> like tpm2_getrandom work?
> >
> >
> > There are multiple tss libs on my system (see below), but I think it
> is 3.0.3.  Yes commands like `tpm2_getrandom` work, including
> `tpm2_createprimary`.
> >
> > $ apt search tpm2 | grep tss
> >
> > WARNING: apt does not have a stable CLI interface. Use with caution in
> scripts.
> >
> > libtss2-dev/stable 3.0.3-2 armhf
> > libtss2-esys-3.0.2-0/stable,now 3.0.3-2 armhf [installed,automatic]
> > libtss2-fapi1/stable 3.0.3-2 armhf
> > libtss2-mu0/stable,now 3.0.3-2 armhf [installed,automatic]
> > libtss2-rc0/stable,now 3.0.3-2 armhf [installed,automatic]
> > libtss2-sys1/stable,now 3.0.3-2 armhf [installed,automatic]
> > libtss2-tcti-cmd0/stable,now 3.0.3-2 armhf [installed,automatic]
> > libtss2-tcti-device0/stable,now 3.0.3-2 armhf [installed,automatic]
> > libtss2-tcti-mssim0/stable,now 3.0.3-2 armhf [installed,automatic]
> > libtss2-tcti-swtpm0/stable,now 3.0.3-2 armhf [installed,automatic]
> > libtss2-tcti-tabrmd-dev/stable 2.3.3-1+b1 armhf
> > libtss2-tcti-tabrmd0/stable 2.3.3-1+b1 armhf
> > libtss2-tctildr0/stable,now 3.0.3-2 armhf [installed,automatic]
> >
> >
> >
> >
>  ------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
------------------
> >     *From:* Han <keepsimple(a)gmail.com <mailto:keepsimple(a)gmail.com>>
> >     *Sent:* Friday, December 17, 2021 2:04 PM
> >     *To:* Roberts, William C <william.c.roberts(a)intel.com <mailto:
> william.c.roberts(a)intel.com>>
> >     *Cc:* tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> <
> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>>
> >     *Subject:* Re: [tpm2] tpm2_flushcontext stuck
> >
> >     It seems stuck in a call of `poll()` at fd 3, which is
> /dev/tpmrm0 based on the log (see below).  The kernel version is 5.10.63.
> Yes, I am using /dev/tpm0 and /dev/tpmrm0.
> >
> >     $ sudo strace tpm2_flushcontext 0x80000000
> >
> >     <snip>
> >
> >     openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC)
> =3D 3
> >     fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D72845, ...}) =3D 0
> >     mmap2(NULL, 72845, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xb6f74000
> >     close(3)                                =3D 0
> >     openat(AT_FDCWD,
> "/lib/arm-linux-gnueabihf/libtss2-tcti-device.so.0",
> O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 3
> >     read(3,
> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\08\n\0\0004\0\0\0"..., 512)=
 =3D
> 512
> >     fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D22028, ...}) =3D 0
> >     mmap2(NULL, 86236, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
> 3, 0) =3D 0xb5f22000
> >     mprotect(0xb5f27000, 61440, PROT_NONE)  =3D 0
> >     mmap2(0xb5f36000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) =3D 0xb5f36000
> >     close(3)                                =3D 0
> >     mprotect(0xb5f36000, 4096, PROT_READ)   =3D 0
> >     munmap(0xb6f74000, 72845)               =3D 0
> >     openat(AT_FDCWD, "/dev/tpmrm0", O_RDWR|O_NONBLOCK) =3D 3
> >     write(3, "\200\1\0\0\0\f\0\0\1{\0\10", 12) =3D 12
> >     poll([{fd=3D3, events=3DPOLLIN}], 1, 1000)  =3D 1 ([{fd=3D3,
> revents=3DPOLLIN}])
> >     read(3, "\200\1\0\0\0\24\0\0\0\0", 10)  =3D 10
> >     poll([{fd=3D3, events=3DPOLLIN}], 1, 1000)  =3D 1 ([{fd=3D3,
> revents=3DPOLLIN}])
> >     read(3, "\0\10Z\314k~c`I\346", 10)      =3D 10
> >     futex(0xb6e7d35c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7d360, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7d364, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7d380, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7ac9c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7d280, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7b224, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7ad20, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     brk(0xda2000)                           =3D 0xda2000
> >     futex(0xb6e7d368, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7d384, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7d3f8, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7d36c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     futex(0xb6e7d370, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> >     write(3, "\200\1\0\0\0\16\0\0\1s\200\0\0\0", 14) =3D 14
> >     poll([{fd=3D3, events=3DPOLLIN}], 1, -1
> >
> >
> >
> >     On Fri, Dec 17, 2021 at 10:29 AM Roberts, William C <
> william.c.roberts(a)intel.com <mailto:william.c.roberts(a)intel.com>> wro=
te:
> >
> >         That's weird, could you strace it and see where it's hanging?
> >
> >         What kernel version is that? I'm assuming your using the
> /dev/tpm0 or /dev/tpmrm0 device directly since I see the sudo.
> >
>  ------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
------------------
> >         *From:* Han <keepsimple(a)gmail.com <mailto:keepsimple(a)gmail.=
com>>
> >         *Sent:* Wednesday, December 15, 2021 5:56 PM
> >         *To:* tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> <
> tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org>>
> >         *Subject:* [tpm2] tpm2_flushcontext stuck
> >
> >         Hi,
> >
> >         I'm using tpm2-tools 5.0 in Debian 11 Bullseye based Raspberry
> Pi OS.  I'm trying to run tpm2_flushcontext but the command got stuck and
> it's not showing anything. Is the data in TPM corrupted?  How can I check?
> >
> >         $ sudo tpm2_flushcontext 0x80000000
> >         < no output at all and stuck here >
> >
> >         (note: the handle 0x80000000 was obtained from previous command
> output when I was running previous version tpm2-tools 3.1.3 on Debian 10
> Buster based OS:
> >
> >         |$ sudo tpm2_createprimary -H o -g sha256 -G ecc -C context.out
> ObjectAttribute: 0x00030072 CreatePrimary Succeed ! Handle: 0x80000000) |
> >
> >
> > _______________________________________________
> > tpm2 mailing list -- tpm2(a)lists.01.org
> > To unsubscribe send an email to tpm2-leave(a)lists.01.org
> > %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> >
>
>

--===============6749434138773875495==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gU2F0LCBEZWMgMTgs
IDIwMjEgYXQgNTo1NCBBTSBKdWVyZ2VuIFJlcHAgJmx0OzxhIGhyZWY9Im1haWx0bzpKdWVyZ2Vu
LlJlcHBAc2l0LmZyYXVuaG9mZXIuZGUiPkp1ZXJnZW4uUmVwcEBzaXQuZnJhdW5ob2Zlci5kZTwv
YT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SSBkaWQgY2hlY2sgeW91ciBjb21tYW5kcyBv
biBSYXNwaWFuIChhbHNvIC9kZXYvdHBtcm0wIHdhcyB1c2VkKTo8YnI+Cjxicj4KdHBtMl9jcmVh
dGVwcmltYXJ5wqAgLUMgbyAtZyBzaGEyNTYgLUcgZWNjIC1jIHByaW1hcnkuY3R4PGJyPgp0cG0y
X2dldGNhcCBoYW5kbGVzLXRyYW5zaWVudCAoTm8gaGFuZGxlIGlzIGRpc3BsYXllZCwgcHJpbWFy
eS5jdHggY2FuIGJlIHVzZWQpPGJyPgp0cG0yX2ZsdXNoY29udGV4dCAweDgwMDAwMDAwPGJyPgpF
UlJPUjp0Y3RpOnNyYy91dGlsL2lvLmM6MTA4OndyaXRlX2FsbCgpIGZhaWxlZCB0byB3cml0ZSB0
byBmZCAzOiBJbnZhbGlkIGFyZ3VtZW50IDxicj4KRVJST1I6dGN0aTpzcmMvdHNzMi10Y3RpL3Rj
dGktZGV2aWNlLmM6MTI2OnRjdGlfZGV2aWNlX3RyYW5zbWl0KCkgd3JvbmcgbnVtYmVyIG9mIGJ5
dGVzIHdyaXR0ZW4uIEV4cGVjdGVkIDE0LCB3cm90ZSAwLjxicj4KPGJyPgpTbyBpdCBzZWVtcyB0
byBiZSBhIFByb2JsZW0gd2l0aCB0Y3RpX2RldmljZV90cmFuc21pdC4gVGhlIHdyaXRlIGRpZCBy
ZXR1cm4gLTEgaWYgdGhlIGhhbmRsZSBkb2VzIG5vdCBleGlzdC48YnI+CklmIHRoZSBUUE0gaGFu
ZGxlIHVzZWQgZm9yIHRwbTJfZmx1c2hjb250ZXh0IGV4aXN0cyB0aGlzIGVycm9yIGRpZCBub3Qg
b2NjdXIuPGJyPgo8YnI+CkRvIHlvdSBhbHNvIGdldCBubyBoYW5kbGUgd2hlbiBleGVjdXRpbmcg
Z2V0Y2FwPzo8YnI+CnRwbTJfZ2V0Y2FwIGhhbmRsZXMtdHJhbnNpZW50PC9ibG9ja3F1b3RlPjxk
aXY+PGJyPjwvZGl2PjxkaXY+WW91JiMzOTtyZSByaWdodC7CoCBObyBoYW5kbGVzIGRpc3BsYXll
ZCB3aGVuIHJ1bm5pbmcgJnF1b3Q7dHBtMl9nZXRjYXAgaGFuZGxlcy10cmFuc2llbnQmcXVvdDsu
wqAgSSBjYW4gdW5kZXJzdGFuZCBpZiB0cG0yX2ZsdXNoY29udGV4dCByZXR1cm5zIGVycm9ywqBt
ZXNzYWdlcyB3aGVuIG5vIGhhbmRsZS4gQnV0IEkgZGlkbiYjMzk7dCB1bmRlcnN0YW5kIHdoeSBp
dCBnb3Qgc3R1Y2sgaW4gbXkgY2FzZS7CoDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+dGhhbmtz
LDxicj5IYW48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPiA8YnI+Cjxicj4KPGJyPgpBbSAxOC4x
Mi4yMSB1bSAwMDo1OCBzY2hyaWViIEhhbjo8YnI+CiZndDsgPGJyPgomZ3Q7IE9uIEZyaSwgRGVj
IDE3LCAyMDIxIGF0IDEyOjUxIFBNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFp
bHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0u
Yy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlh
bS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoEkg
d29uZGVyIGlmIGl0JiMzOTtzIHJlbGF0ZWQgdG8gdGhpcyBidWcsIGJ1dCBtYW5pZmVzdGluZyBp
dHNlbGYgZGlmZmVyZW50bHk6PGJyPgomZ3Q7wqAgwqAgwqDCoCAtwqA8YSBocmVmPSJodHRwczov
L2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy8xMzU2IiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2Fy
ZS90cG0yLXRvb2xzL2lzc3Vlcy8xMzU2PC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9pc3N1ZXMvMTM1NiIgcmVsPSJub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10
b29scy9pc3N1ZXMvMTM1NjwvYT4mZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgTm90
IHN1cmUuIFRoZSBidWcgaXMgcmVwb3J0ZWQgb24gJnF1b3Q7dHBtMi10b29scyZxdW90OyAzLjEu
MyB3aXRoIExpbnV4IGtlcm5lbCA1LjAuwqAgSSYjMzk7bSB1c2luZyAmcXVvdDt0cG0yLXRvb2xz
JnF1b3Q7IDUuMCBub3cgd2l0aCBrZXJuZWwgNS4xMC48YnI+CiZndDsgwqA8YnI+CiZndDsgPGJy
PgomZ3Q7wqAgwqAgwqBXaGF0IHZlcnNpb24gb2YgdGhlIHRwbTItdHNzIGxpYnJhcmllcyBhcmUg
eW91IHJ1bm5pbmc/IERvIGNvbW1hbmRzIGxpa2UgdHBtMl9nZXRyYW5kb20gd29yaz88YnI+CiZn
dDsgPGJyPgomZ3Q7IDxicj4KJmd0OyBUaGVyZSBhcmUgbXVsdGlwbGUgdHNzIGxpYnMgb24gbXkg
c3lzdGVtIChzZWUgYmVsb3cpLCBidXQgSSB0aGluayBpdCBpc8KgMy4wLjMuwqAgWWVzIGNvbW1h
bmRzIGxpa2UgYHRwbTJfZ2V0cmFuZG9tYCB3b3JrLCBpbmNsdWRpbmcgYHRwbTJfY3JlYXRlcHJp
bWFyeWAuwqA8YnI+CiZndDsgPGJyPgomZ3Q7ICQgYXB0IHNlYXJjaCB0cG0yIHwgZ3JlcCB0c3M8
YnI+CiZndDsgPGJyPgomZ3Q7IFdBUk5JTkc6IGFwdCBkb2VzIG5vdCBoYXZlIGEgc3RhYmxlIENM
SSBpbnRlcmZhY2UuIFVzZSB3aXRoIGNhdXRpb24gaW4gc2NyaXB0cy48YnI+CiZndDsgPGJyPgom
Z3Q7IGxpYnRzczItZGV2L3N0YWJsZSAzLjAuMy0yIGFybWhmPGJyPgomZ3Q7IGxpYnRzczItZXN5
cy0zLjAuMi0wL3N0YWJsZSxub3cgMy4wLjMtMiBhcm1oZiBbaW5zdGFsbGVkLGF1dG9tYXRpY108
YnI+CiZndDsgbGlidHNzMi1mYXBpMS9zdGFibGUgMy4wLjMtMiBhcm1oZjxicj4KJmd0OyBsaWJ0
c3MyLW11MC9zdGFibGUsbm93IDMuMC4zLTIgYXJtaGYgW2luc3RhbGxlZCxhdXRvbWF0aWNdPGJy
PgomZ3Q7IGxpYnRzczItcmMwL3N0YWJsZSxub3cgMy4wLjMtMiBhcm1oZiBbaW5zdGFsbGVkLGF1
dG9tYXRpY108YnI+CiZndDsgbGlidHNzMi1zeXMxL3N0YWJsZSxub3cgMy4wLjMtMiBhcm1oZiBb
aW5zdGFsbGVkLGF1dG9tYXRpY108YnI+CiZndDsgbGlidHNzMi10Y3RpLWNtZDAvc3RhYmxlLG5v
dyAzLjAuMy0yIGFybWhmIFtpbnN0YWxsZWQsYXV0b21hdGljXTxicj4KJmd0OyBsaWJ0c3MyLXRj
dGktZGV2aWNlMC9zdGFibGUsbm93IDMuMC4zLTIgYXJtaGYgW2luc3RhbGxlZCxhdXRvbWF0aWNd
PGJyPgomZ3Q7IGxpYnRzczItdGN0aS1tc3NpbTAvc3RhYmxlLG5vdyAzLjAuMy0yIGFybWhmIFtp
bnN0YWxsZWQsYXV0b21hdGljXTxicj4KJmd0OyBsaWJ0c3MyLXRjdGktc3d0cG0wL3N0YWJsZSxu
b3cgMy4wLjMtMiBhcm1oZiBbaW5zdGFsbGVkLGF1dG9tYXRpY108YnI+CiZndDsgbGlidHNzMi10
Y3RpLXRhYnJtZC1kZXYvc3RhYmxlIDIuMy4zLTErYjEgYXJtaGY8YnI+CiZndDsgbGlidHNzMi10
Y3RpLXRhYnJtZDAvc3RhYmxlIDIuMy4zLTErYjEgYXJtaGY8YnI+CiZndDsgbGlidHNzMi10Y3Rp
bGRyMC9zdGFibGUsbm93IDMuMC4zLTIgYXJtaGYgW2luc3RhbGxlZCxhdXRvbWF0aWNdPGJyPgom
Z3Q7IDxicj4KJmd0OyDCoDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLTxicj4KJmd0O8KgIMKgIMKgKkZyb206KiBIYW4gJmx0OzxhIGhyZWY9Im1haWx0bzpr
ZWVwc2ltcGxlQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmtlZXBzaW1wbGVAZ21haWwuY29t
PC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzprZWVwc2ltcGxlQGdtYWlsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPmtlZXBzaW1wbGVAZ21haWwuY29tPC9hPiZndDsmZ3Q7PGJyPgomZ3Q7wqAg
wqAgwqAqU2VudDoqIEZyaWRheSwgRGVjZW1iZXIgMTcsIDIwMjEgMjowNCBQTTxicj4KJmd0O8Kg
IMKgIMKgKlRvOiogUm9iZXJ0cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlh
bS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNA
aW50ZWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0
c0BpbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208
L2E+Jmd0OyZndDs8YnI+CiZndDvCoCDCoCDCoCpDYzoqIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxp
c3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRw
bTJAbGlzdHMuMDEub3JnPC9hPiZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAx
Lm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlz
dHMuMDEub3JnPC9hPiZndDsmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAqU3ViamVjdDoqIFJlOiBbdHBt
Ml0gdHBtMl9mbHVzaGNvbnRleHQgc3R1Y2s8YnI+CiZndDvCoCDCoCDCoMKgPGJyPgomZ3Q7wqAg
wqAgwqBJdCBzZWVtcyBzdHVjayBpbiBhIGNhbGwgb2YgYHBvbGwoKWAgYXQgZmQgMywgd2hpY2gg
aXMgL2Rldi90cG1ybTDCoGJhc2VkIG9uIHRoZSBsb2cgKHNlZSBiZWxvdykuwqAgVGhlIGtlcm5l
bCB2ZXJzaW9uIGlzwqA1LjEwLjYzLsKgIFllcywgSSBhbSB1c2luZyAvZGV2L3RwbTAgYW5kIC9k
ZXYvdHBtcm0wLsKgwqA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAkIHN1ZG8gc3RyYWNlIHRw
bTJfZmx1c2hjb250ZXh0IDB4ODAwMDAwMDA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAmbHQ7
c25pcCZndDs8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqBvcGVuYXQoQVRfRkRDV0QsICZxdW90
Oy9ldGMvbGQuc28uY2FjaGUmcXVvdDssIE9fUkRPTkxZfE9fTEFSR0VGSUxFfE9fQ0xPRVhFQykg
PSAzPGJyPgomZ3Q7wqAgwqAgwqBmc3RhdDY0KDMsIHtzdF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rf
c2l6ZT03Mjg0NSwgLi4ufSkgPSAwPGJyPgomZ3Q7wqAgwqAgwqBtbWFwMihOVUxMLCA3Mjg0NSwg
UFJPVF9SRUFELCBNQVBfUFJJVkFURSwgMywgMCkgPSAweGI2Zjc0MDAwPGJyPgomZ3Q7wqAgwqAg
wqBjbG9zZSgzKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oD0gMDxicj4KJmd0O8KgIMKgIMKgb3BlbmF0KEFUX0ZEQ1dELCAmcXVvdDsvbGliL2FybS1saW51
eC1nbnVlYWJpaGYvbGlidHNzMi10Y3RpLWRldmljZS5zby4wJnF1b3Q7LCBPX1JET05MWXxPX0xB
UkdFRklMRXxPX0NMT0VYRUMpID0gMzxicj4KJmd0O8KgIMKgIMKgcmVhZCgzLCAmcXVvdDtcMTc3
RUxGXDFcMVwxXDBcMFwwXDBcMFwwXDBcMFwwXDNcMChcMFwxXDBcMFwwOFxuXDBcMDAwNFwwXDBc
MCZxdW90Oy4uLiwgNTEyKSA9IDUxMjxicj4KJmd0O8KgIMKgIMKgZnN0YXQ2NCgzLCB7c3RfbW9k
ZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9MjIwMjgsIC4uLn0pID0gMDxicj4KJmd0O8KgIMKgIMKg
bW1hcDIoTlVMTCwgODYyMzYsIFBST1RfUkVBRHxQUk9UX0VYRUMsIE1BUF9QUklWQVRFfE1BUF9E
RU5ZV1JJVEUsIDMsIDApID0gMHhiNWYyMjAwMDxicj4KJmd0O8KgIMKgIMKgbXByb3RlY3QoMHhi
NWYyNzAwMCwgNjE0NDAsIFBST1RfTk9ORSkgwqA9IDA8YnI+CiZndDvCoCDCoCDCoG1tYXAyKDB4
YjVmMzYwMDAsIDgxOTIsIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfRklY
RUR8TUFQX0RFTllXUklURSwgMywgMHg0MDAwKSA9IDB4YjVmMzYwMDA8YnI+CiZndDvCoCDCoCDC
oGNsb3NlKDMpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
PSAwPGJyPgomZ3Q7wqAgwqAgwqBtcHJvdGVjdCgweGI1ZjM2MDAwLCA0MDk2LCBQUk9UX1JFQUQp
IMKgID0gMDxicj4KJmd0O8KgIMKgIMKgbXVubWFwKDB4YjZmNzQwMDAsIDcyODQ1KSDCoCDCoCDC
oCDCoCDCoCDCoCDCoCA9IDA8YnI+CiZndDvCoCDCoCDCoG9wZW5hdChBVF9GRENXRCwgJnF1b3Q7
L2Rldi90cG1ybTAmcXVvdDssIE9fUkRXUnxPX05PTkJMT0NLKSA9IDM8YnI+CiZndDvCoCDCoCDC
oHdyaXRlKDMsICZxdW90O1wyMDBcMVwwXDBcMFxmXDBcMFwxe1wwXDEwJnF1b3Q7LCAxMikgPSAx
Mjxicj4KJmd0O8KgIMKgIMKgcG9sbChbe2ZkPTMsIGV2ZW50cz1QT0xMSU59XSwgMSwgMTAwMCkg
wqA9IDEgKFt7ZmQ9MywgcmV2ZW50cz1QT0xMSU59XSk8YnI+CiZndDvCoCDCoCDCoHJlYWQoMywg
JnF1b3Q7XDIwMFwxXDBcMFwwXDI0XDBcMFwwXDAmcXVvdDssIDEwKSDCoD0gMTA8YnI+CiZndDvC
oCDCoCDCoHBvbGwoW3tmZD0zLCBldmVudHM9UE9MTElOfV0sIDEsIDEwMDApIMKgPSAxIChbe2Zk
PTMsIHJldmVudHM9UE9MTElOfV0pPGJyPgomZ3Q7wqAgwqAgwqByZWFkKDMsICZxdW90O1wwXDEw
WlwzMTRrfmNgSVwzNDYmcXVvdDssIDEwKSDCoCDCoCDCoD0gMTA8YnI+CiZndDvCoCDCoCDCoGZ1
dGV4KDB4YjZlN2QzNWMsIEZVVEVYX1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgom
Z3Q7wqAgwqAgwqBmdXRleCgweGI2ZTdkMzYwLCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2
NDcpID0gMDxicj4KJmd0O8KgIMKgIMKgZnV0ZXgoMHhiNmU3ZDM2NCwgRlVURVhfV0FLRV9QUklW
QVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CiZndDvCoCDCoCDCoGZ1dGV4KDB4YjZlN2QzODAsIEZV
VEVYX1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgomZ3Q7wqAgwqAgwqBmdXRleCgw
eGI2ZTdhYzljLCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KJmd0O8Kg
IMKgIMKgZnV0ZXgoMHhiNmU3ZDI4MCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9
IDA8YnI+CiZndDvCoCDCoCDCoGZ1dGV4KDB4YjZlN2IyMjQsIEZVVEVYX1dBS0VfUFJJVkFURSwg
MjE0NzQ4MzY0NykgPSAwPGJyPgomZ3Q7wqAgwqAgwqBmdXRleCgweGI2ZTdhZDIwLCBGVVRFWF9X
QUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KJmd0O8KgIMKgIMKgYnJrKDB4ZGEyMDAw
KSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA9IDB4ZGEyMDAwPGJyPgom
Z3Q7wqAgwqAgwqBmdXRleCgweGI2ZTdkMzY4LCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2
NDcpID0gMDxicj4KJmd0O8KgIMKgIMKgZnV0ZXgoMHhiNmU3ZDM4NCwgRlVURVhfV0FLRV9QUklW
QVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CiZndDvCoCDCoCDCoGZ1dGV4KDB4YjZlN2QzZjgsIEZV
VEVYX1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgomZ3Q7wqAgwqAgwqBmdXRleCgw
eGI2ZTdkMzZjLCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KJmd0O8Kg
IMKgIMKgZnV0ZXgoMHhiNmU3ZDM3MCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9
IDA8YnI+CiZndDvCoCDCoCDCoHdyaXRlKDMsICZxdW90O1wyMDBcMVwwXDBcMFwxNlwwXDBcMXNc
MjAwXDBcMFwwJnF1b3Q7LCAxNCkgPSAxNDxicj4KJmd0O8KgIMKgIMKgcG9sbChbe2ZkPTMsIGV2
ZW50cz1QT0xMSU59XSwgMSwgLTE8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZn
dDvCoCDCoCDCoE9uIEZyaSwgRGVjIDE3LCAyMDIxIGF0IDEwOjI5IEFNIFJvYmVydHMsIFdpbGxp
YW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4KJmd0
OyA8YnI+CiZndDvCoCDCoCDCoCDCoCDCoFRoYXQmIzM5O3Mgd2VpcmQsIGNvdWxkIHlvdSBzdHJh
Y2UgaXQgYW5kIHNlZSB3aGVyZSBpdCYjMzk7cyBoYW5naW5nPzxicj4KJmd0OyA8YnI+CiZndDvC
oCDCoCDCoCDCoCDCoFdoYXQga2VybmVsIHZlcnNpb24gaXMgdGhhdD8gSSYjMzk7bSBhc3N1bWlu
ZyB5b3VyIHVzaW5nIHRoZSAvZGV2L3RwbTAgb3IgL2Rldi90cG1ybTAgZGV2aWNlIGRpcmVjdGx5
IHNpbmNlIEkgc2VlIHRoZSBzdWRvLjxicj4KJmd0O8KgIMKgIMKgIMKgIMKgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAqRnJvbToqIEhhbiAmbHQ7PGEgaHJlZj0i
bWFpbHRvOmtlZXBzaW1wbGVAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+a2VlcHNpbXBsZUBn
bWFpbC5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOmtlZXBzaW1wbGVAZ21haWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+a2VlcHNpbXBsZUBnbWFpbC5jb208L2E+Jmd0OyZndDs8YnI+
CiZndDvCoCDCoCDCoCDCoCDCoCpTZW50OiogV2VkbmVzZGF5LCBEZWNlbWJlciAxNSwgMjAyMSA1
OjU2IFBNPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAqVG86KiA8YSBocmVmPSJtYWlsdG86dHBtMkBs
aXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21h
aWx0bzo8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50
cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4w
MS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8
YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxp
c3RzLjAxLm9yZzwvYT4mZ3Q7Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgIMKgKlN1YmplY3Q6KiBb
dHBtMl0gdHBtMl9mbHVzaGNvbnRleHQgc3R1Y2s8YnI+CiZndDvCoCDCoCDCoCDCoCDCoMKgPGJy
PgomZ3Q7wqAgwqAgwqAgwqAgwqBIaSw8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBJ
JiMzOTttIHVzaW5nIHRwbTItdG9vbHMgNS4wIGluIERlYmlhbiAxMSBCdWxsc2V5ZSBiYXNlZCBS
YXNwYmVycnkgUGkgT1MuwqAgSSYjMzk7bSB0cnlpbmcgdG8gcnVuwqB0cG0yX2ZsdXNoY29udGV4
dCBidXQgdGhlIGNvbW1hbmQgZ290IHN0dWNrIGFuZCBpdCYjMzk7cyBub3Qgc2hvd2luZyBhbnl0
aGluZy4gSXMgdGhlIGRhdGEgaW4gVFBNIGNvcnJ1cHRlZD/CoCBIb3cgY2FuIEkgY2hlY2s/wqA8
YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAkIHN1ZG8gdHBtMl9mbHVzaGNvbnRleHQg
MHg4MDAwMDAwMDxicj4KJmd0O8KgIMKgIMKgIMKgIMKgJmx0OyBubyBvdXRwdXQgYXQgYWxsIGFu
ZCBzdHVjayBoZXJlICZndDs8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAobm90ZTog
dGhlIGhhbmRsZSAweDgwMDAwMDAwIHdhcyBvYnRhaW5lZCBmcm9tIHByZXZpb3VzIGNvbW1hbmQg
b3V0cHV0IHdoZW4gSSB3YXMgcnVubmluZyBwcmV2aW91cyB2ZXJzaW9uIHRwbTItdG9vbHMgMy4x
LjMgb24gRGViaWFuIDEwIEJ1c3RlciBiYXNlZCBPUzrCoDxicj4KJmd0OyA8YnI+CiZndDvCoCDC
oCDCoCDCoCDCoHwkIHN1ZG8gdHBtMl9jcmVhdGVwcmltYXJ5IC1IIG8gLWcgc2hhMjU2IC1HIGVj
YyAtQyBjb250ZXh0Lm91dCBPYmplY3RBdHRyaWJ1dGU6IDB4MDAwMzAwNzIgQ3JlYXRlUHJpbWFy
eSBTdWNjZWVkICEgSGFuZGxlOiAweDgwMDAwMDAwKSB8PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+
CiZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+
CiZndDsgdHBtMiBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFRvIHVu
c3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlz
dHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJy
PgomZ3Q7ICUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFt
ZSlzPGJyPgomZ3Q7IDxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+Cg==

--===============6749434138773875495==--

