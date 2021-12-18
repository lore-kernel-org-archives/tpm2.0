Content-Type: multipart/mixed; boundary="===============3663745044693946765=="
MIME-Version: 1.0
From: Juergen Repp <Juergen.Repp at sit.fraunhofer.de>
Subject: [tpm2] Re: tpm2_flushcontext stuck
Date: Sat, 18 Dec 2021 15:11:44 +0100
Message-ID: <17c21c50-b575-92f3-0aca-17479d8a7b86@sit.fraunhofer.de>
In-Reply-To: CAEjGaqdA2sj=cBcasO_0PqKHtE5mqAN4Bdyx9LUvqVj_QPCEGg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3663745044693946765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I forgot to mention: If /dev/tpm0 was used instead of /dev/tpmrm0 everythin=
g worked without problems.

Am 18.12.21 um 00:58 schrieb Han:
> =

> On Fri, Dec 17, 2021 at 12:51 PM Roberts, William C <william.c.roberts(a)=
intel.com <mailto:william.c.roberts(a)intel.com>> wrote:
> =

>     I wonder if it's related to this bug, but manifesting itself differen=
tly:
>     =C2=A0 -=C2=A0https://github.com/tpm2-software/tpm2-tools/issues/1356=
 <https://github.com/tpm2-software/tpm2-tools/issues/1356>
> =

> =

> Not sure. The bug is reported on "tpm2-tools" 3.1.3 with Linux kernel 5.0=
.=C2=A0 I'm using "tpm2-tools" 5.0 now with kernel 5.10.
> =C2=A0
> =

>     What version of the tpm2-tss libraries are you running? Do commands l=
ike tpm2_getrandom work?
> =

> =

> There are multiple tss libs on my system (see below), but I think it is=
=C2=A03.0.3.=C2=A0 Yes commands like `tpm2_getrandom` work, including `tpm2=
_createprimary`.=C2=A0
> =

> $ apt search tpm2 | grep tss
> =

> WARNING: apt does not have a stable CLI interface. Use with caution in sc=
ripts.
> =

> libtss2-dev/stable 3.0.3-2 armhf
> libtss2-esys-3.0.2-0/stable,now 3.0.3-2 armhf [installed,automatic]
> libtss2-fapi1/stable 3.0.3-2 armhf
> libtss2-mu0/stable,now 3.0.3-2 armhf [installed,automatic]
> libtss2-rc0/stable,now 3.0.3-2 armhf [installed,automatic]
> libtss2-sys1/stable,now 3.0.3-2 armhf [installed,automatic]
> libtss2-tcti-cmd0/stable,now 3.0.3-2 armhf [installed,automatic]
> libtss2-tcti-device0/stable,now 3.0.3-2 armhf [installed,automatic]
> libtss2-tcti-mssim0/stable,now 3.0.3-2 armhf [installed,automatic]
> libtss2-tcti-swtpm0/stable,now 3.0.3-2 armhf [installed,automatic]
> libtss2-tcti-tabrmd-dev/stable 2.3.3-1+b1 armhf
> libtss2-tcti-tabrmd0/stable 2.3.3-1+b1 armhf
> libtss2-tctildr0/stable,now 3.0.3-2 armhf [installed,automatic]
> =

> =C2=A0
> =

>     ---------------------------------------------------------------------=
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
---------------------
>     *From:* Han <keepsimple(a)gmail.com <mailto:keepsimple(a)gmail.com>>
>     *Sent:* Friday, December 17, 2021 2:04 PM
>     *To:* Roberts, William C <william.c.roberts(a)intel.com <mailto:willi=
am.c.roberts(a)intel.com>>
>     *Cc:* tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> <tpm2(a)lists.=
01.org <mailto:tpm2(a)lists.01.org>>
>     *Subject:* Re: [tpm2] tpm2_flushcontext stuck
>     =C2=A0
>     It seems stuck in a call of `poll()` at fd 3, which is /dev/tpmrm0=C2=
=A0based on the log (see below).=C2=A0 The kernel version is=C2=A05.10.63.=
=C2=A0 Yes, I am using /dev/tpm0 and /dev/tpmrm0.=C2=A0=C2=A0
> =

>     $ sudo strace tpm2_flushcontext 0x80000000
> =

>     <snip>
> =

>     openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
=3D 3
>     fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D72845, ...}) =3D 0
>     mmap2(NULL, 72845, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xb6f74000
>     close(3) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0
>     openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libtss2-tcti-device.so.0",=
 O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 3
>     read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\08\n\0\0004\0\0=
\0"..., 512) =3D 512
>     fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D22028, ...}) =3D 0
>     mmap2(NULL, 86236, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,=
 0) =3D 0xb5f22000
>     mprotect(0xb5f27000, 61440, PROT_NONE) =C2=A0=3D 0
>     mmap2(0xb5f36000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|M=
AP_DENYWRITE, 3, 0x4000) =3D 0xb5f36000
>     close(3) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0
>     mprotect(0xb5f36000, 4096, PROT_READ) =C2=A0 =3D 0
>     munmap(0xb6f74000, 72845) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 0
>     openat(AT_FDCWD, "/dev/tpmrm0", O_RDWR|O_NONBLOCK) =3D 3
>     write(3, "\200\1\0\0\0\f\0\0\1{\0\10", 12) =3D 12
>     poll([{fd=3D3, events=3DPOLLIN}], 1, 1000) =C2=A0=3D 1 ([{fd=3D3, rev=
ents=3DPOLLIN}])
>     read(3, "\200\1\0\0\0\24\0\0\0\0", 10) =C2=A0=3D 10
>     poll([{fd=3D3, events=3DPOLLIN}], 1, 1000) =C2=A0=3D 1 ([{fd=3D3, rev=
ents=3DPOLLIN}])
>     read(3, "\0\10Z\314k~c`I\346", 10) =C2=A0 =C2=A0 =C2=A0=3D 10
>     futex(0xb6e7d35c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7d360, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7d364, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7d380, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7ac9c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7d280, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7b224, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7ad20, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     brk(0xda2000) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0xda2000
>     futex(0xb6e7d368, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7d384, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7d3f8, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7d36c, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     futex(0xb6e7d370, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
>     write(3, "\200\1\0\0\0\16\0\0\1s\200\0\0\0", 14) =3D 14
>     poll([{fd=3D3, events=3DPOLLIN}], 1, -1
> =

> =

> =

>     On Fri, Dec 17, 2021 at 10:29 AM Roberts, William C <william.c.robert=
s(a)intel.com <mailto:william.c.roberts(a)intel.com>> wrote:
> =

>         That's weird, could you strace it and see where it's hanging?
> =

>         What kernel version is that? I'm assuming your using the /dev/tpm=
0 or /dev/tpmrm0 device directly since I see the sudo.
>         -----------------------------------------------------------------=
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
-------------------------
>         *From:* Han <keepsimple(a)gmail.com <mailto:keepsimple(a)gmail.co=
m>>
>         *Sent:* Wednesday, December 15, 2021 5:56 PM
>         *To:* tpm2(a)lists.01.org <mailto:tpm2(a)lists.01.org> <tpm2(a)li=
sts.01.org <mailto:tpm2(a)lists.01.org>>
>         *Subject:* [tpm2] tpm2_flushcontext stuck
>         =C2=A0
>         Hi,
> =

>         I'm using tpm2-tools 5.0 in Debian 11 Bullseye based Raspberry Pi=
 OS.=C2=A0 I'm trying to run=C2=A0tpm2_flushcontext but the command got stu=
ck and it's not showing anything. Is the data in TPM corrupted?=C2=A0 How c=
an I check?=C2=A0
> =

>         $ sudo tpm2_flushcontext 0x80000000
>         < no output at all and stuck here >
> =

>         (note: the handle 0x80000000 was obtained from previous command o=
utput when I was running previous version tpm2-tools 3.1.3 on Debian 10 Bus=
ter based OS:=C2=A0
> =

>         |$ sudo tpm2_createprimary -H o -g sha256 -G ecc -C context.out O=
bjectAttribute: 0x00030072 CreatePrimary Succeed ! Handle: 0x80000000) |
> =

> =

> _______________________________________________
> tpm2 mailing list -- tpm2(a)lists.01.org
> To unsubscribe send an email to tpm2-leave(a)lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> =



--===============3663745044693946765==--

