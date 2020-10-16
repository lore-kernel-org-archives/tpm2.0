Content-Type: multipart/mixed; boundary="===============0344621888319637718=="
MIME-Version: 1.0
From: matthew at giassa.net
Subject: [tpm2] Question: missing "tpm0" in securityfs/sysfs,
 trying to parse TPM2 event log.
Date: Fri, 16 Oct 2020 19:55:12 +0000
Message-ID: <20201016195512.2619.75439@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0344621888319637718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Good day,

I have a setup with Ubuntu 20.04 "focal" x86_64 running in a QEMU based VM.=
 I've upgraded the default kernel to 5.8.15, mainly to leverage the patch n=
oted below (bottom of message). My understanding (please correct me if I'm =
off) is that it would allow a userspace application (i.e. "tpm2_eventlog") =
to access the TPM2 event log once the OS has fully booted. The QEMU instanc=
e itself connects to a Unix domain socket that's owned by a TPM2 simulator =
running in a Docker container (i.e. https://www.qemu.org/docs/master/specs/=
tpm.html).

I can run various "tpm2_*" binaries in my QEMU VM, and view the low-level l=
ogs in the simulator, so this setup appears to be working. However, there a=
re no "/sys/kernel/security/tpm0" objects, or anything I can find in "sysfs=
" and/or "securityfs" to get a handle to the TPM2 event logs. My ultimate g=
oal is to be able to acquire these logs, and have a service of mine parse t=
hem, and validate each message against the TPM (i.e. verify it it's legitim=
ate TPM_GENERATED content).

To my questions:
1. How would I go about getting access to the TPM2 event logs on a running =
system (i.e. are certain kernel build-time parameters needed, or does QEMU =
require specific flags in order to run, or does the simulator need to be ex=
ecuted in a certain manner).
2. Is my appraisal of the features provided by the kernel patch (below) cor=
rect?
3. In general, is a UEFI-enabled BIOS required to get access to the TPM2 ev=
ent log (i.e. for BIOS' other than SeaBios, for example)?





commit 85467f63a05c43364ba0b90d0c05bb89191543fa
Author: Stefan Berger <stefanb(a)linux.ibm.com>
Date:   Mon Jul 6 19:58:07 2020 -0400

    tpm: Add support for event log pointer found in TPM2 ACPI table

    In case a TPM2 is attached, search for a TPM2 ACPI table when trying
    to get the event log from ACPI. If one is found, use it to get the
    start and length of the log area. This allows non-UEFI systems, such
    as SeaBIOS, to pass an event log when using a TPM2.

    Cc: Peter Huewe <peterhuewe(a)gmx.de>
    Cc: Jason Gunthorpe <jgg(a)ziepe.ca>
    Signed-off-by: Stefan Berger <stefanb(a)linux.ibm.com>
    Reviewed-by: Jerry Snitselaar <jsnitsel(a)redhat.com>
    Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen(a)linux.intel.com>
--===============0344621888319637718==--

