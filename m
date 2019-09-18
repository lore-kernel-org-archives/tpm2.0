Content-Type: multipart/mixed; boundary="===============7868123796629411278=="
MIME-Version: 1.0
From: Oliver, Dario N <dario.n.oliver at intel.com>
Subject: Re: [tpm2] Incomplete TPM event log on Linux
Date: Wed, 18 Sep 2019 16:58:55 +0000
Message-ID: <20A6FE0AC912764FB8B5BC5A1A7CB92B3BBFDBE8@fmsmsx101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7868123796629411278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Matthew,

I had some problems before related to discrepancies between the TPM Event L=
og and the actual PCR values.
For my case, it was with Fedora and the PCR-9, "Missing TPM Event Log entry=
 for initramfs measurement" (https://bugzilla.redhat.com/show_bug.cgi?id=3D=
1730785)

What solved the issue was, apparently, a fedora kernel update. I was initia=
lly using a 5.0.16 kernel when I found the issue, and it was solved in the =
kernel 5.1.17

You have existing parsers as well that will tell which is the measured comp=
onent (and maybe if something is missing): iml2text, and https://github.com=
/ValdikSS/binary_bios_measurements_parser

Which version of the debian provided kernel are you using? =

Maybe for your case, a kernel update could help too.

------------------------------

Message: 2
Date: Wed, 18 Sep 2019 03:14:57 -0700
From: Matthew Dempsky <matthew(a)dempsky.org>
To: tpm2(a)lists.01.org
Subject: [tpm2] Incomplete TPM event log on Linux?
Message-ID:
	<CANKkrzEDDXdGVFRA8QCpP_p-0XnHf10mTjJ+LW-tAtSH=3Dsv2Mg(a)mail.gmail.com>
Content-Type: text/plain; charset=3D"utf-8"

I'm trying to validate the PCR values computed by my TPM. They're mostly ok=
ay, but PCR 7 is giving me a weird value. I'm wondering if I'm missing some=
thing.

I'm running Debian 10.1 on an X1 Carbon (gen 6). I don't believe I have any=
 system software installed and configured to use the TPM. (E.g., I have ful=
l disk encryption enabled, but it's currently using a password rather than =
the TPM.)

When I run tpm2_pcrread to read the PCRs, I get:

$ sudo tpm2_pcrread | head -9
sha1:
  0 : 0x2365D6AB190CC51FD04911A36A6620578F5A15B7
  1 : 0x90CDA14DCFA4B62CDE2898625606298C71A94F7C
  2 : 0xB2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
  3 : 0xB2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
  4 : 0x9C27A66C20926B86EA3120FA36CC75D0EE870E0D
  5 : 0xA842C2C96B7D8813837174751AEADB5314316ACB
  6 : 0xB2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
  7 : 0xDB9CFC01DCC5C88ACBE9C6E2DB0E6BC4EA231AC6


And when I replay the event log from
/sys/kernel/security/tpm0/binary_bios_measurements, I get:

$ python sum.py < binary_bios_measurements
0 2365D6AB190CC51FD04911A36A6620578F5A15B7
1 90CDA14DCFA4B62CDE2898625606298C71A94F7C
2 B2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
3 B2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
4 9C27A66C20926B86EA3120FA36CC75D0EE870E0D
5 A842C2C96B7D8813837174751AEADB5314316ACB
6 B2A83B0EBF2F8374299A5B2BDFC31EA955AD7236
7 37A1A97D5F0BE67FBD544A1604C843BCEE4EE3B2


[I've attached the binary_bios_measurement file, and I've also included my =
sum.py script below.]

Note that PCRs 0 through 6 match, but PCR 7 has a different value. I haven'=
t manually written anything into PCR 7, and I get the same mismatched resul=
ts even after rebooting.

I noticed that Shim is generating malformed event log entries (see
https://github.com/rhboot/shim/issues/184 for details), but even my attempt=
s to correct for that don't seem to resolve the discrepancy (not that I'd e=
xpect them to anyway---I'm just running out of ideas).

My best guess is that *something* (Shim? Grub? The Linux kernel? Some Debia=
n userspace program?) is writing to PCR 7, but not recording a log entry (o=
r logging somewhere other than binary_bios_measurements). However, I'm at a=
 loss for what that might be, or how to track it down.

Any recommendations would be greatly appreciated.

Thanks,
Matthew


# sum.py
import hashlib
import struct
import sys

pcrs =3D ['\x00' * 20] * 8

def extend(pcr, digest):
    h =3D hashlib.sha1()
    h.update(pcrs[pcr])
    h.update(digest)
    pcrs[pcr] =3D h.digest()

events =3D sys.stdin.read()
while events:
    pcr, kind, digest, size =3D struct.unpack("<II20sI", events[:32])
    events =3D events[32 + size:]
    extend(pcr, digest)

for i, pcr in enumerate(pcrs):
    print i, pcr.encode('hex').upper()

--===============7868123796629411278==--

