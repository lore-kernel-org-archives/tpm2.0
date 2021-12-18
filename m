Content-Type: multipart/mixed; boundary="===============1614851665705654275=="
MIME-Version: 1.0
From: Han <keepsimple at gmail.com>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Sat, 18 Dec 2021 11:34:58 -0800
Message-ID: <CAEjGaqeTkD1U2Ppb_F08WwG8gEfNJgYtD9tkYfw9tBHztcxu7Q@mail.gmail.com>
In-Reply-To: 17c21c50-b575-92f3-0aca-17479d8a7b86@sit.fraunhofer.de
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1614851665705654275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18, 2021 at 6:11 AM Juergen Repp <Juergen.Repp(a)sit.fraunhofer=
.de>
wrote:

> I forgot to mention: If /dev/tpm0 was used instead of /dev/tpmrm0
> everything worked without problems.
>

I probably missed it,  how can I specify to make sure /dev/tpm0 is used,
and not /dev/tpmrm0 ?  Is it in some configurations?

thanks
Han


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

--===============1614851665705654275==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gU2F0LCBEZWMgMTgs
IDIwMjEgYXQgNjoxMSBBTSBKdWVyZ2VuIFJlcHAgJmx0OzxhIGhyZWY9Im1haWx0bzpKdWVyZ2Vu
LlJlcHBAc2l0LmZyYXVuaG9mZXIuZGUiPkp1ZXJnZW4uUmVwcEBzaXQuZnJhdW5ob2Zlci5kZTwv
YT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+SSBmb3Jnb3QgdG8gbWVudGlvbjogSWYgL2Rl
di90cG0wIHdhcyB1c2VkIGluc3RlYWQgb2YgL2Rldi90cG1ybTAgZXZlcnl0aGluZyB3b3JrZWQg
d2l0aG91dCBwcm9ibGVtcy48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBw
cm9iYWJseSBtaXNzZWQgaXQswqAgaG93IGNhbiBJIHNwZWNpZnkgdG8gbWFrZSBzdXJlIC9kZXYv
dHBtMCBpcyB1c2VkLCBhbmQgbm90IC9kZXYvdHBtcm0wwqA/wqAgSXMgaXQgaW4gc29tZSBjb25m
aWd1cmF0aW9ucz88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRoYW5rczwvZGl2PjxkaXY+SGFu
PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwy
MDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KPGJyPgpBbSAxOC4xMi4yMSB1bSAwMDo1OCBzY2hy
aWViIEhhbjo8YnI+CiZndDsgPGJyPgomZ3Q7IE9uIEZyaSwgRGVjIDE3LCAyMDIxIGF0IDEyOjUx
IFBNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndpbGxpYW0uYy5yb2Jl
cnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNv
bTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiZndDsm
Z3Q7IHdyb3RlOjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoEkgd29uZGVyIGlmIGl0JiMzOTtz
IHJlbGF0ZWQgdG8gdGhpcyBidWcsIGJ1dCBtYW5pZmVzdGluZyBpdHNlbGYgZGlmZmVyZW50bHk6
PGJyPgomZ3Q7wqAgwqAgwqDCoCAtwqA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdHBtMi1z
b2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vlcy8xMzU2IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vdHBtMi1zb2Z0d2FyZS90cG0yLXRvb2xzL2lzc3Vl
cy8xMzU2PC9hPiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUv
dHBtMi10b29scy9pc3N1ZXMvMTM1NiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cHM6Ly9naXRodWIuY29tL3RwbTItc29mdHdhcmUvdHBtMi10b29scy9pc3N1ZXMvMTM1Njwv
YT4mZ3Q7PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgTm90IHN1cmUuIFRoZSBidWcgaXMg
cmVwb3J0ZWQgb24gJnF1b3Q7dHBtMi10b29scyZxdW90OyAzLjEuMyB3aXRoIExpbnV4IGtlcm5l
bCA1LjAuwqAgSSYjMzk7bSB1c2luZyAmcXVvdDt0cG0yLXRvb2xzJnF1b3Q7IDUuMCBub3cgd2l0
aCBrZXJuZWwgNS4xMC48YnI+CiZndDsgwqA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqBXaGF0
IHZlcnNpb24gb2YgdGhlIHRwbTItdHNzIGxpYnJhcmllcyBhcmUgeW91IHJ1bm5pbmc/IERvIGNv
bW1hbmRzIGxpa2UgdHBtMl9nZXRyYW5kb20gd29yaz88YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4K
Jmd0OyBUaGVyZSBhcmUgbXVsdGlwbGUgdHNzIGxpYnMgb24gbXkgc3lzdGVtIChzZWUgYmVsb3cp
LCBidXQgSSB0aGluayBpdCBpc8KgMy4wLjMuwqAgWWVzIGNvbW1hbmRzIGxpa2UgYHRwbTJfZ2V0
cmFuZG9tYCB3b3JrLCBpbmNsdWRpbmcgYHRwbTJfY3JlYXRlcHJpbWFyeWAuwqA8YnI+CiZndDsg
PGJyPgomZ3Q7ICQgYXB0IHNlYXJjaCB0cG0yIHwgZ3JlcCB0c3M8YnI+CiZndDsgPGJyPgomZ3Q7
IFdBUk5JTkc6IGFwdCBkb2VzIG5vdCBoYXZlIGEgc3RhYmxlIENMSSBpbnRlcmZhY2UuIFVzZSB3
aXRoIGNhdXRpb24gaW4gc2NyaXB0cy48YnI+CiZndDsgPGJyPgomZ3Q7IGxpYnRzczItZGV2L3N0
YWJsZSAzLjAuMy0yIGFybWhmPGJyPgomZ3Q7IGxpYnRzczItZXN5cy0zLjAuMi0wL3N0YWJsZSxu
b3cgMy4wLjMtMiBhcm1oZiBbaW5zdGFsbGVkLGF1dG9tYXRpY108YnI+CiZndDsgbGlidHNzMi1m
YXBpMS9zdGFibGUgMy4wLjMtMiBhcm1oZjxicj4KJmd0OyBsaWJ0c3MyLW11MC9zdGFibGUsbm93
IDMuMC4zLTIgYXJtaGYgW2luc3RhbGxlZCxhdXRvbWF0aWNdPGJyPgomZ3Q7IGxpYnRzczItcmMw
L3N0YWJsZSxub3cgMy4wLjMtMiBhcm1oZiBbaW5zdGFsbGVkLGF1dG9tYXRpY108YnI+CiZndDsg
bGlidHNzMi1zeXMxL3N0YWJsZSxub3cgMy4wLjMtMiBhcm1oZiBbaW5zdGFsbGVkLGF1dG9tYXRp
Y108YnI+CiZndDsgbGlidHNzMi10Y3RpLWNtZDAvc3RhYmxlLG5vdyAzLjAuMy0yIGFybWhmIFtp
bnN0YWxsZWQsYXV0b21hdGljXTxicj4KJmd0OyBsaWJ0c3MyLXRjdGktZGV2aWNlMC9zdGFibGUs
bm93IDMuMC4zLTIgYXJtaGYgW2luc3RhbGxlZCxhdXRvbWF0aWNdPGJyPgomZ3Q7IGxpYnRzczIt
dGN0aS1tc3NpbTAvc3RhYmxlLG5vdyAzLjAuMy0yIGFybWhmIFtpbnN0YWxsZWQsYXV0b21hdGlj
XTxicj4KJmd0OyBsaWJ0c3MyLXRjdGktc3d0cG0wL3N0YWJsZSxub3cgMy4wLjMtMiBhcm1oZiBb
aW5zdGFsbGVkLGF1dG9tYXRpY108YnI+CiZndDsgbGlidHNzMi10Y3RpLXRhYnJtZC1kZXYvc3Rh
YmxlIDIuMy4zLTErYjEgYXJtaGY8YnI+CiZndDsgbGlidHNzMi10Y3RpLXRhYnJtZDAvc3RhYmxl
IDIuMy4zLTErYjEgYXJtaGY8YnI+CiZndDsgbGlidHNzMi10Y3RpbGRyMC9zdGFibGUsbm93IDMu
MC4zLTIgYXJtaGYgW2luc3RhbGxlZCxhdXRvbWF0aWNdPGJyPgomZ3Q7IDxicj4KJmd0OyDCoDxi
cj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4KJmd0O8Kg
IMKgIMKgKkZyb206KiBIYW4gJmx0OzxhIGhyZWY9Im1haWx0bzprZWVwc2ltcGxlQGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmtlZXBzaW1wbGVAZ21haWwuY29tPC9hPiAmbHQ7bWFpbHRvOjxh
IGhyZWY9Im1haWx0bzprZWVwc2ltcGxlQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmtlZXBz
aW1wbGVAZ21haWwuY29tPC9hPiZndDsmZ3Q7PGJyPgomZ3Q7wqAgwqAgwqAqU2VudDoqIEZyaWRh
eSwgRGVjZW1iZXIgMTcsIDIwMjEgMjowNCBQTTxicj4KJmd0O8KgIMKgIMKgKlRvOiogUm9iZXJ0
cywgV2lsbGlhbSBDICZsdDs8YSBocmVmPSJtYWlsdG86d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwu
Y29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVydHNAaW50ZWwuY29tPC9hPiAmbHQ7
bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp3aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj53aWxsaWFtLmMucm9iZXJ0c0BpbnRlbC5jb208L2E+Jmd0OyZndDs8YnI+CiZn
dDvCoCDCoCDCoCpDYzoqIDxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0
PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0
bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9h
PiZndDsgJmx0OzxhIGhyZWY9Im1haWx0bzp0cG0yQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxh
bmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzp0cG0y
QGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnRwbTJAbGlzdHMuMDEub3JnPC9hPiZndDsm
Z3Q7PGJyPgomZ3Q7wqAgwqAgwqAqU3ViamVjdDoqIFJlOiBbdHBtMl0gdHBtMl9mbHVzaGNvbnRl
eHQgc3R1Y2s8YnI+CiZndDvCoCDCoCDCoMKgPGJyPgomZ3Q7wqAgwqAgwqBJdCBzZWVtcyBzdHVj
ayBpbiBhIGNhbGwgb2YgYHBvbGwoKWAgYXQgZmQgMywgd2hpY2ggaXMgL2Rldi90cG1ybTDCoGJh
c2VkIG9uIHRoZSBsb2cgKHNlZSBiZWxvdykuwqAgVGhlIGtlcm5lbCB2ZXJzaW9uIGlzwqA1LjEw
LjYzLsKgIFllcywgSSBhbSB1c2luZyAvZGV2L3RwbTAgYW5kIC9kZXYvdHBtcm0wLsKgwqA8YnI+
CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAkIHN1ZG8gc3RyYWNlIHRwbTJfZmx1c2hjb250ZXh0IDB4
ODAwMDAwMDA8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAmbHQ7c25pcCZndDs8YnI+CiZndDsg
PGJyPgomZ3Q7wqAgwqAgwqBvcGVuYXQoQVRfRkRDV0QsICZxdW90Oy9ldGMvbGQuc28uY2FjaGUm
cXVvdDssIE9fUkRPTkxZfE9fTEFSR0VGSUxFfE9fQ0xPRVhFQykgPSAzPGJyPgomZ3Q7wqAgwqAg
wqBmc3RhdDY0KDMsIHtzdF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rfc2l6ZT03Mjg0NSwgLi4ufSkg
PSAwPGJyPgomZ3Q7wqAgwqAgwqBtbWFwMihOVUxMLCA3Mjg0NSwgUFJPVF9SRUFELCBNQVBfUFJJ
VkFURSwgMywgMCkgPSAweGI2Zjc0MDAwPGJyPgomZ3Q7wqAgwqAgwqBjbG9zZSgzKSDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoD0gMDxicj4KJmd0O8KgIMKg
IMKgb3BlbmF0KEFUX0ZEQ1dELCAmcXVvdDsvbGliL2FybS1saW51eC1nbnVlYWJpaGYvbGlidHNz
Mi10Y3RpLWRldmljZS5zby4wJnF1b3Q7LCBPX1JET05MWXxPX0xBUkdFRklMRXxPX0NMT0VYRUMp
ID0gMzxicj4KJmd0O8KgIMKgIMKgcmVhZCgzLCAmcXVvdDtcMTc3RUxGXDFcMVwxXDBcMFwwXDBc
MFwwXDBcMFwwXDNcMChcMFwxXDBcMFwwOFxuXDBcMDAwNFwwXDBcMCZxdW90Oy4uLiwgNTEyKSA9
IDUxMjxicj4KJmd0O8KgIMKgIMKgZnN0YXQ2NCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0
X3NpemU9MjIwMjgsIC4uLn0pID0gMDxicj4KJmd0O8KgIMKgIMKgbW1hcDIoTlVMTCwgODYyMzYs
IFBST1RfUkVBRHxQUk9UX0VYRUMsIE1BUF9QUklWQVRFfE1BUF9ERU5ZV1JJVEUsIDMsIDApID0g
MHhiNWYyMjAwMDxicj4KJmd0O8KgIMKgIMKgbXByb3RlY3QoMHhiNWYyNzAwMCwgNjE0NDAsIFBS
T1RfTk9ORSkgwqA9IDA8YnI+CiZndDvCoCDCoCDCoG1tYXAyKDB4YjVmMzYwMDAsIDgxOTIsIFBS
T1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfRklYRUR8TUFQX0RFTllXUklURSwg
MywgMHg0MDAwKSA9IDB4YjVmMzYwMDA8YnI+CiZndDvCoCDCoCDCoGNsb3NlKDMpIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPSAwPGJyPgomZ3Q7wqAgwqAg
wqBtcHJvdGVjdCgweGI1ZjM2MDAwLCA0MDk2LCBQUk9UX1JFQUQpIMKgID0gMDxicj4KJmd0O8Kg
IMKgIMKgbXVubWFwKDB4YjZmNzQwMDAsIDcyODQ1KSDCoCDCoCDCoCDCoCDCoCDCoCDCoCA9IDA8
YnI+CiZndDvCoCDCoCDCoG9wZW5hdChBVF9GRENXRCwgJnF1b3Q7L2Rldi90cG1ybTAmcXVvdDss
IE9fUkRXUnxPX05PTkJMT0NLKSA9IDM8YnI+CiZndDvCoCDCoCDCoHdyaXRlKDMsICZxdW90O1wy
MDBcMVwwXDBcMFxmXDBcMFwxe1wwXDEwJnF1b3Q7LCAxMikgPSAxMjxicj4KJmd0O8KgIMKgIMKg
cG9sbChbe2ZkPTMsIGV2ZW50cz1QT0xMSU59XSwgMSwgMTAwMCkgwqA9IDEgKFt7ZmQ9MywgcmV2
ZW50cz1QT0xMSU59XSk8YnI+CiZndDvCoCDCoCDCoHJlYWQoMywgJnF1b3Q7XDIwMFwxXDBcMFww
XDI0XDBcMFwwXDAmcXVvdDssIDEwKSDCoD0gMTA8YnI+CiZndDvCoCDCoCDCoHBvbGwoW3tmZD0z
LCBldmVudHM9UE9MTElOfV0sIDEsIDEwMDApIMKgPSAxIChbe2ZkPTMsIHJldmVudHM9UE9MTElO
fV0pPGJyPgomZ3Q7wqAgwqAgwqByZWFkKDMsICZxdW90O1wwXDEwWlwzMTRrfmNgSVwzNDYmcXVv
dDssIDEwKSDCoCDCoCDCoD0gMTA8YnI+CiZndDvCoCDCoCDCoGZ1dGV4KDB4YjZlN2QzNWMsIEZV
VEVYX1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJyPgomZ3Q7wqAgwqAgwqBmdXRleCgw
eGI2ZTdkMzYwLCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KJmd0O8Kg
IMKgIMKgZnV0ZXgoMHhiNmU3ZDM2NCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9
IDA8YnI+CiZndDvCoCDCoCDCoGZ1dGV4KDB4YjZlN2QzODAsIEZVVEVYX1dBS0VfUFJJVkFURSwg
MjE0NzQ4MzY0NykgPSAwPGJyPgomZ3Q7wqAgwqAgwqBmdXRleCgweGI2ZTdhYzljLCBGVVRFWF9X
QUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KJmd0O8KgIMKgIMKgZnV0ZXgoMHhiNmU3
ZDI4MCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CiZndDvCoCDCoCDC
oGZ1dGV4KDB4YjZlN2IyMjQsIEZVVEVYX1dBS0VfUFJJVkFURSwgMjE0NzQ4MzY0NykgPSAwPGJy
PgomZ3Q7wqAgwqAgwqBmdXRleCgweGI2ZTdhZDIwLCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0
ODM2NDcpID0gMDxicj4KJmd0O8KgIMKgIMKgYnJrKDB4ZGEyMDAwKSDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA9IDB4ZGEyMDAwPGJyPgomZ3Q7wqAgwqAgwqBmdXRleCgw
eGI2ZTdkMzY4LCBGVVRFWF9XQUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KJmd0O8Kg
IMKgIMKgZnV0ZXgoMHhiNmU3ZDM4NCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9
IDA8YnI+CiZndDvCoCDCoCDCoGZ1dGV4KDB4YjZlN2QzZjgsIEZVVEVYX1dBS0VfUFJJVkFURSwg
MjE0NzQ4MzY0NykgPSAwPGJyPgomZ3Q7wqAgwqAgwqBmdXRleCgweGI2ZTdkMzZjLCBGVVRFWF9X
QUtFX1BSSVZBVEUsIDIxNDc0ODM2NDcpID0gMDxicj4KJmd0O8KgIMKgIMKgZnV0ZXgoMHhiNmU3
ZDM3MCwgRlVURVhfV0FLRV9QUklWQVRFLCAyMTQ3NDgzNjQ3KSA9IDA8YnI+CiZndDvCoCDCoCDC
oHdyaXRlKDMsICZxdW90O1wyMDBcMVwwXDBcMFwxNlwwXDBcMXNcMjAwXDBcMFwwJnF1b3Q7LCAx
NCkgPSAxNDxicj4KJmd0O8KgIMKgIMKgcG9sbChbe2ZkPTMsIGV2ZW50cz1QT0xMSU59XSwgMSwg
LTE8YnI+CiZndDsgPGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoE9uIEZyaSwg
RGVjIDE3LCAyMDIxIGF0IDEwOjI5IEFNIFJvYmVydHMsIFdpbGxpYW0gQyAmbHQ7PGEgaHJlZj0i
bWFpbHRvOndpbGxpYW0uYy5yb2JlcnRzQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndpbGxp
YW0uYy5yb2JlcnRzQGludGVsLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86d2ls
bGlhbS5jLnJvYmVydHNAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+d2lsbGlhbS5jLnJvYmVy
dHNAaW50ZWwuY29tPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDC
oCDCoCDCoFRoYXQmIzM5O3Mgd2VpcmQsIGNvdWxkIHlvdSBzdHJhY2UgaXQgYW5kIHNlZSB3aGVy
ZSBpdCYjMzk7cyBoYW5naW5nPzxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoCDCoFdoYXQg
a2VybmVsIHZlcnNpb24gaXMgdGhhdD8gSSYjMzk7bSBhc3N1bWluZyB5b3VyIHVzaW5nIHRoZSAv
ZGV2L3RwbTAgb3IgL2Rldi90cG1ybTAgZGV2aWNlIGRpcmVjdGx5IHNpbmNlIEkgc2VlIHRoZSBz
dWRvLjxicj4KJmd0O8KgIMKgIMKgIMKgIMKgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
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
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPgomZ3Q7
wqAgwqAgwqAgwqAgwqAqRnJvbToqIEhhbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmtlZXBzaW1wbGVA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+a2VlcHNpbXBsZUBnbWFpbC5jb208L2E+ICZsdDtt
YWlsdG86PGEgaHJlZj0ibWFpbHRvOmtlZXBzaW1wbGVAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+a2VlcHNpbXBsZUBnbWFpbC5jb208L2E+Jmd0OyZndDs8YnI+CiZndDvCoCDCoCDCoCDCoCDC
oCpTZW50OiogV2VkbmVzZGF5LCBEZWNlbWJlciAxNSwgMjAyMSA1OjU2IFBNPGJyPgomZ3Q7wqAg
wqAgwqAgwqAgwqAqVG86KiA8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdl
dD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWls
dG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwv
YT4mZ3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86dHBtMkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2Js
YW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86dHBt
MkBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj50cG0yQGxpc3RzLjAxLm9yZzwvYT4mZ3Q7
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgIMKgKlN1YmplY3Q6KiBbdHBtMl0gdHBtMl9mbHVzaGNv
bnRleHQgc3R1Y2s8YnI+CiZndDvCoCDCoCDCoCDCoCDCoMKgPGJyPgomZ3Q7wqAgwqAgwqAgwqAg
wqBIaSw8YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqBJJiMzOTttIHVzaW5nIHRwbTIt
dG9vbHMgNS4wIGluIERlYmlhbiAxMSBCdWxsc2V5ZSBiYXNlZCBSYXNwYmVycnkgUGkgT1MuwqAg
SSYjMzk7bSB0cnlpbmcgdG8gcnVuwqB0cG0yX2ZsdXNoY29udGV4dCBidXQgdGhlIGNvbW1hbmQg
Z290IHN0dWNrIGFuZCBpdCYjMzk7cyBub3Qgc2hvd2luZyBhbnl0aGluZy4gSXMgdGhlIGRhdGEg
aW4gVFBNIGNvcnJ1cHRlZD/CoCBIb3cgY2FuIEkgY2hlY2s/wqA8YnI+CiZndDsgPGJyPgomZ3Q7
wqAgwqAgwqAgwqAgwqAkIHN1ZG8gdHBtMl9mbHVzaGNvbnRleHQgMHg4MDAwMDAwMDxicj4KJmd0
O8KgIMKgIMKgIMKgIMKgJmx0OyBubyBvdXRwdXQgYXQgYWxsIGFuZCBzdHVjayBoZXJlICZndDs8
YnI+CiZndDsgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgwqAobm90ZTogdGhlIGhhbmRsZSAweDgwMDAw
MDAwIHdhcyBvYnRhaW5lZCBmcm9tIHByZXZpb3VzIGNvbW1hbmQgb3V0cHV0IHdoZW4gSSB3YXMg
cnVubmluZyBwcmV2aW91cyB2ZXJzaW9uIHRwbTItdG9vbHMgMy4xLjMgb24gRGViaWFuIDEwIEJ1
c3RlciBiYXNlZCBPUzrCoDxicj4KJmd0OyA8YnI+CiZndDvCoCDCoCDCoCDCoCDCoHwkIHN1ZG8g
dHBtMl9jcmVhdGVwcmltYXJ5IC1IIG8gLWcgc2hhMjU2IC1HIGVjYyAtQyBjb250ZXh0Lm91dCBP
YmplY3RBdHRyaWJ1dGU6IDB4MDAwMzAwNzIgQ3JlYXRlUHJpbWFyeSBTdWNjZWVkICEgSGFuZGxl
OiAweDgwMDAwMDAwKSB8PGJyPgomZ3Q7IDxicj4KJmd0OyA8YnI+CiZndDsgX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+CiZndDsgdHBtMiBtYWlsaW5n
IGxpc3QgLS0gPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFu
ayI+dHBtMkBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gPGEgaHJlZj0ibWFpbHRvOnRwbTItbGVhdmVAbGlzdHMuMDEub3JnIiB0YXJnZXQ9
Il9ibGFuayI+dHBtMi1sZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgomZ3Q7ICUod2ViX3BhZ2Vf
dXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlzPGJyPgomZ3Q7IDxicj4K
PGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+Cg==

--===============1614851665705654275==--

