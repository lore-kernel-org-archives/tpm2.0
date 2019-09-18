Content-Type: multipart/mixed; boundary="===============8688137459454416381=="
MIME-Version: 1.0
From: Luke Hinds <lhinds at redhat.com>
Subject: Re: [tpm2] Incomplete TPM event log on Linux?
Date: Wed, 18 Sep 2019 12:17:29 +0100
Message-ID: <CAKrSGQTKxgGJv_Cc6w7dL_sgGpj85-8sFrVvmzT5McbDZnCvBg@mail.gmail.com>
In-Reply-To: CANKkrzEDDXdGVFRA8QCpP_p-0XnHf10mTjJ+LW-tAtSH=sv2Mg@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8688137459454416381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 11:15 AM Matthew Dempsky <matthew(a)dempsky.org>
wrote:

> I'm trying to validate the PCR values computed by my TPM. They're mostly
> okay, but PCR 7 is giving me a weird value. I'm wondering if I'm missing
> something.
>
> I'm running Debian 10.1 on an X1 Carbon (gen 6). I don't believe I have
> any system software installed and configured to use the TPM. (E.g., I have
> full disk encryption enabled, but it's currently using a password rather
> than the TPM.)
>
> When I run tpm2_pcrread to read the PCRs, I get:
>
> $ sudo tpm2_pcrread | head -9
> sha1:
>   0 : 0x2365D6AB190CC51FD04911A36A6620578F5A15B7
>   1 : 0x90CDA14DCFA4B62CDE2898625606298C71A94F7C
>   2 : 0xB2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
>   3 : 0xB2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
>   4 : 0x9C27A66C20926B86EA3120FA36CC75D0EE870E0D
>   5 : 0xA842C2C96B7D8813837174751AEADB5314316ACB
>   6 : 0xB2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
>   7 : 0xDB9CFC01DCC5C88ACBE9C6E2DB0E6BC4EA231AC6
>
>
> And when I replay the event log from
> /sys/kernel/security/tpm0/binary_bios_measurements, I get:
>
> $ python sum.py < binary_bios_measurements
> 0 2365D6AB190CC51FD04911A36A6620578F5A15B7
> 1 90CDA14DCFA4B62CDE2898625606298C71A94F7C
> 2 B2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
> 3 B2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
> 4 9C27A66C20926B86EA3120FA36CC75D0EE870E0D
> 5 A842C2C96B7D8813837174751AEADB5314316ACB
> 6 B2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
> 7 37A1A97D5F0BE67FBD544A1604C843BCEE4EE3B2
>
>
> [I've attached the binary_bios_measurement file, and I've also included my
> sum.py script below.]
>
> Note that PCRs 0 through 6 match, but PCR 7 has a different value. I
> haven't manually written anything into PCR 7, and I get the same mismatch=
ed
> results even after rebooting.
>
> I noticed that Shim is generating malformed event log entries (see
> https://github.com/rhboot/shim/issues/184 for details), but even my
> attempts to correct for that don't seem to resolve the discrepancy (not
> that I'd expect them to anyway---I'm just running out of ideas).
>
> My best guess is that *something* (Shim? Grub? The Linux kernel? Some
> Debian userspace program?) is writing to PCR 7, but not recording a log
> entry (or logging somewhere other than binary_bios_measurements). However,
> I'm at a loss for what that might be, or how to track it down.
>
> Any recommendations would be greatly appreciated.
>
> Thanks,
> Matthew
>
>
> # sum.py
> import hashlib
> import struct
> import sys
>
> pcrs =3D ['\x00' * 20] * 8
>
> def extend(pcr, digest):
>     h =3D hashlib.sha1()
>     h.update(pcrs[pcr])
>     h.update(digest)
>     pcrs[pcr] =3D h.digest()
>
> events =3D sys.stdin.read()
> while events:
>     pcr, kind, digest, size =3D struct.unpack("<II20sI", events[:32])
>     events =3D events[32 + size:]
>     extend(pcr, digest)
>
> for i, pcr in enumerate(pcrs):
>     print i, pcr.encode('hex').upper()
> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
>

PCR 7 is various components of secure boo in the context of the shim:

https://github.com/rhboot/shim/blob/a4a1fbe728c9545fc5647129df0cf1593b953be=
c/README.tpm#L9-L20

I am not sure how to verify that though.

--===============8688137459454416381==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgU2Vw
IDE4LCAyMDE5IGF0IDExOjE1IEFNIE1hdHRoZXcgRGVtcHNreSAmbHQ7PGEgaHJlZj0ibWFpbHRv
Om1hdHRoZXdAZGVtcHNreS5vcmciPm1hdHRoZXdAZGVtcHNreS5vcmc8L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+SSYjMzk7bSB0cnlpbmcgdG8gdmFs
aWRhdGUgdGhlIFBDUiB2YWx1ZXMgY29tcHV0ZWQgYnkgbXkgVFBNLiBUaGV5JiMzOTtyZSBtb3N0
bHkgb2theSwgYnV0IFBDUiA3IGlzIGdpdmluZyBtZSBhIHdlaXJkIHZhbHVlLiBJJiMzOTttIHdv
bmRlcmluZyBpZiBJJiMzOTttIG1pc3Npbmcgc29tZXRoaW5nLjwvZGl2PjxkaXY+PGJyPjwvZGl2
PkkmIzM5O20gcnVubmluZyBEZWJpYW4gMTAuMSBvbiBhbiBYMSBDYXJib24gKGdlbiA2KS4gSSBk
b24mIzM5O3QgYmVsaWV2ZSBJIGhhdmUgYW55IHN5c3RlbSBzb2Z0d2FyZSBpbnN0YWxsZWQgYW5k
IGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBUUE0uIChFLmcuLCBJIGhhdmUgZnVsbCBkaXNrIGVuY3J5
cHRpb24gZW5hYmxlZCwgYnV0IGl0JiMzOTtzIGN1cnJlbnRseSB1c2luZyBhIHBhc3N3b3JkIHJh
dGhlciB0aGFuIHRoZSBUUE0uKTxkaXY+PGJyPjwvZGl2PjxkaXY+V2hlbiBJIHJ1biB0cG0yX3Bj
cnJlYWQgdG8gcmVhZCB0aGUgUENScywgSSBnZXQ6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2Nr
cXVvdGUgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCA0MHB4O2JvcmRlcjpub25lO3BhZGRpbmc6
MHB4Ij48ZGl2PiQgc3VkbyB0cG0yX3BjcnJlYWQgfCBoZWFkIC05PC9kaXY+PGRpdj5zaGExOjwv
ZGl2PjxkaXY+wqAgMCA6IDB4MjM2NUQ2QUIxOTBDQzUxRkQwNDkxMUEzNkE2NjIwNTc4RjVBMTVC
NzwvZGl2PjxkaXY+wqAgMSA6IDB4OTBDREExNERDRkE0QjYyQ0RFMjg5ODYyNTYwNjI5OEM3MUE5
NEY3QzwvZGl2PjxkaXY+wqAgMiA6IDB4QjJBODNCMEVCRjJGODM3NDI5OUE1QjJCREZDMzFFQTk1
NUFENzIzNjwvZGl2PjxkaXY+wqAgMyA6IDB4QjJBODNCMEVCRjJGODM3NDI5OUE1QjJCREZDMzFF
QTk1NUFENzIzNjwvZGl2PjxkaXY+wqAgNCA6IDB4OUMyN0E2NkMyMDkyNkI4NkVBMzEyMEZBMzZD
Qzc1RDBFRTg3MEUwRDwvZGl2PjxkaXY+wqAgNSA6IDB4QTg0MkMyQzk2QjdEODgxMzgzNzE3NDc1
MUFFQURCNTMxNDMxNkFDQjwvZGl2PjxkaXY+wqAgNiA6IDB4QjJBODNCMEVCRjJGODM3NDI5OUE1
QjJCREZDMzFFQTk1NUFENzIzNjwvZGl2PjxkaXY+wqAgNyA6IDB4REI5Q0ZDMDFEQ0M1Qzg4QUNC
RTlDNkUyREIwRTZCQzRFQTIzMUFDNjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48
ZGl2PkFuZCB3aGVuwqBJIHJlcGxheSB0aGUgZXZlbnQgbG9nIGZyb20gL3N5cy9rZXJuZWwvc2Vj
dXJpdHkvdHBtMC9iaW5hcnlfYmlvc19tZWFzdXJlbWVudHMsIEkgZ2V0OjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggNDBweDtib3JkZXI6
bm9uZTtwYWRkaW5nOjBweCI+PGRpdj4kIHB5dGhvbiBzdW0ucHkgJmx0OyBiaW5hcnlfYmlvc19t
ZWFzdXJlbWVudHMgPC9kaXY+PGRpdj4wIDIzNjVENkFCMTkwQ0M1MUZEMDQ5MTFBMzZBNjYyMDU3
OEY1QTE1Qjc8L2Rpdj48ZGl2PjEgOTBDREExNERDRkE0QjYyQ0RFMjg5ODYyNTYwNjI5OEM3MUE5
NEY3QzwvZGl2PjxkaXY+MiBCMkE4M0IwRUJGMkY4Mzc0Mjk5QTVCMkJERkMzMUVBOTU1QUQ3MjM2
PC9kaXY+PGRpdj4zIEIyQTgzQjBFQkYyRjgzNzQyOTlBNUIyQkRGQzMxRUE5NTVBRDcyMzY8L2Rp
dj48ZGl2PjQgOUMyN0E2NkMyMDkyNkI4NkVBMzEyMEZBMzZDQzc1RDBFRTg3MEUwRDwvZGl2Pjxk
aXY+NSBBODQyQzJDOTZCN0Q4ODEzODM3MTc0NzUxQUVBREI1MzE0MzE2QUNCPC9kaXY+PGRpdj42
IEIyQTgzQjBFQkYyRjgzNzQyOTlBNUIyQkRGQzMxRUE5NTVBRDcyMzY8L2Rpdj48ZGl2PjcgMzdB
MUE5N0Q1RjBCRTY3RkJENTQ0QTE2MDRDODQzQkNFRTRFRTNCMjwvZGl2PjwvYmxvY2txdW90ZT48
ZGl2Pjxicj48L2Rpdj48ZGl2PltJJiMzOTt2ZSBhdHRhY2hlZCB0aGUgYmluYXJ5X2Jpb3NfbWVh
c3VyZW1lbnQgZmlsZSwgYW5kIEkmIzM5O3ZlIGFsc28gaW5jbHVkZWQgbXkgc3VtLnB5IHNjcmlw
dCBiZWxvdy5dPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Ob3RlIHRoYXQgUENScyAwIHRocm91
Z2ggNiBtYXRjaCwgYnV0IFBDUiA3IGhhcyBhIGRpZmZlcmVudCB2YWx1ZS4gSSBoYXZlbiYjMzk7
dCBtYW51YWxseSB3cml0dGVuIGFueXRoaW5nIGludG8gUENSIDcsIGFuZCBJIGdldCB0aGUgc2Ft
ZSBtaXNtYXRjaGVkIHJlc3VsdHMgZXZlbiBhZnRlciByZWJvb3RpbmcuPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5JIG5vdGljZWQgdGhhdCBTaGltIGlzIGdlbmVyYXRpbmcgbWFsZm9ybWVkIGV2
ZW50IGxvZyBlbnRyaWVzIChzZWXCoDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9yaGJvb3Qv
c2hpbS9pc3N1ZXMvMTg0IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL3JoYm9v
dC9zaGltL2lzc3Vlcy8xODQ8L2E+wqBmb3IgZGV0YWlscyksIGJ1dCBldmVuIG15IGF0dGVtcHRz
IHRvIGNvcnJlY3QgZm9yIHRoYXQgZG9uJiMzOTt0IHNlZW0gdG8gcmVzb2x2ZSB0aGUgZGlzY3Jl
cGFuY3nCoChub3QgdGhhdCBJJiMzOTtkIGV4cGVjdCB0aGVtIHRvIGFueXdheS0tLUkmIzM5O20g
anVzdCBydW5uaW5nIG91dCBvZiBpZGVhcykuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5NeSBi
ZXN0IGd1ZXNzIGlzIHRoYXQgPGk+c29tZXRoaW5nPC9pPsKgKFNoaW0/IEdydWI/IFRoZSBMaW51
eCBrZXJuZWw/IFNvbWUgRGViaWFuIHVzZXJzcGFjZSBwcm9ncmFtPykgaXMgd3JpdGluZyB0byBQ
Q1IgNywgYnV0IG5vdCByZWNvcmRpbmcgYSBsb2cgZW50cnkgKG9yIGxvZ2dpbmcgc29tZXdoZXJl
IG90aGVyIHRoYW4gYmluYXJ5X2Jpb3NfbWVhc3VyZW1lbnRzKS4gSG93ZXZlciwgSSYjMzk7bSBh
dCBhIGxvc3MgZm9yIHdoYXQgdGhhdCBtaWdodCBiZSwgb3IgaG93IHRvIHRyYWNrIGl0IGRvd24u
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BbnkgcmVjb21tZW5kYXRpb25zIHdvdWxkIGJlIGdy
ZWF0bHkgYXBwcmVjaWF0ZWQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+
PGRpdj5NYXR0aGV3PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4jIHN1
bS5weTwvZGl2PjxkaXY+aW1wb3J0IGhhc2hsaWI8YnI+aW1wb3J0IHN0cnVjdDxicj5pbXBvcnQg
c3lzPGJyPjxicj5wY3JzID0gWyYjMzk7XHgwMCYjMzk7ICogMjBdICogODxicj48YnI+ZGVmIGV4
dGVuZChwY3IsIGRpZ2VzdCk6PGJyPsKgIMKgIGggPSBoYXNobGliLnNoYTEoKTxicj7CoCDCoCBo
LnVwZGF0ZShwY3JzW3Bjcl0pPGJyPsKgIMKgIGgudXBkYXRlKGRpZ2VzdCk8YnI+wqAgwqAgcGNy
c1twY3JdID0gaC5kaWdlc3QoKTxicj48YnI+ZXZlbnRzID0gc3lzLnN0ZGluLnJlYWQoKTxicj53
aGlsZSBldmVudHM6PGJyPsKgIMKgIHBjciwga2luZCwgZGlnZXN0LCBzaXplID0gc3RydWN0LnVu
cGFjaygmcXVvdDsmbHQ7SUkyMHNJJnF1b3Q7LCBldmVudHNbOjMyXSk8YnI+wqAgwqAgZXZlbnRz
ID0gZXZlbnRzWzMyICsgc2l6ZTpdPGJyPsKgIMKgIGV4dGVuZChwY3IsIGRpZ2VzdCk8YnI+PGJy
PmZvciBpLCBwY3IgaW4gZW51bWVyYXRlKHBjcnMpOjxicj7CoCDCoCBwcmludCBpLCBwY3IuZW5j
b2RlKCYjMzk7aGV4JiMzOTspLnVwcGVyKCk8YnI+PC9kaXY+PC9kaXY+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgp0cG0yIG1haWxpbmcgbGlzdDxi
cj4KPGEgaHJlZj0ibWFpbHRvOnRwbTJAbGlzdHMuMDEub3JnIiB0YXJnZXQ9Il9ibGFuayI+dHBt
MkBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3RwbTIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vdHBtMjwvYT48YnI+CjwvYmxvY2txdW90
ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGRpdj5QQ1IgNyBpcyB2YXJpb3VzIGNvbXBvbmVudHMg
b2Ygc2VjdXJlIGJvbyBpbiB0aGUgY29udGV4dCBvZiB0aGUgc2hpbTo8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9yaGJvb3Qvc2hpbS9ibG9iL2E0
YTFmYmU3MjhjOTU0NWZjNTY0NzEyOWRmMGNmMTU5M2I5NTNiZWMvUkVBRE1FLnRwbSNMOS1MMjAi
Pmh0dHBzOi8vZ2l0aHViLmNvbS9yaGJvb3Qvc2hpbS9ibG9iL2E0YTFmYmU3MjhjOTU0NWZjNTY0
NzEyOWRmMGNmMTU5M2I5NTNiZWMvUkVBRE1FLnRwbSNMOS1MMjA8L2E+PGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+SSBhbSBub3Qgc3VyZSBob3cgdG8gdmVyaWZ5IHRoYXQgdGhvdWdoLjwv
ZGl2PjwvZGl2Pgo=

--===============8688137459454416381==--

