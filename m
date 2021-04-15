Content-Type: multipart/mixed; boundary="===============7505281782153900997=="
MIME-Version: 1.0
From: nicolasoliver03 at gmail.com
Subject: [tpm2] Re: tpm2_eventlog ERROR: SpecID eventType must be EV_NO_ACTION
Date: Thu, 15 Apr 2021 18:25:54 +0000
Message-ID: <20210415182554.2848.69001@ml01.vlan13.01.org>
In-Reply-To: OF0100B943.2E0657A1-ON002586B2.005F299D-852586B2.005FC2E2@notes.na.collabserv.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7505281782153900997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello again,

I have been debugging this issue with the manufacturer for a couple of days=
, and found something very interesting.
Initially, I thought it was a System Firmware (BIOS) problem, that it was m=
isbehaving and reporting an invalid log.
But it seems to be a Kernel related problem.

If the system is booted with a customized Linux Kernel 4.19, the TPM Event =
Log present in sysfs is invalid: tools fails to parse it, and there are no =
SHA256 measurements.
If the system is booted with a vanilla Linux Kernel 5.8.15 (Fedora Workstat=
ion 33 Live), the TPM Event Log is valid, tools can parse it, there are bot=
h SHA1 and SHA256 measurements, and the reconstruction matches perfectly wi=
th the state of the TPM PCRs

This is more evident by comparing the binary_bios_measurements files taken =
from both executions. I can see the good one starting with "Spec ID Ev..", =
and the bad one directly with "Secure Boot" related info

The git history of the kernel source related to TPM Event Log is available =
here https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log=
/drivers/char/tpm/eventlog. =

I will look there to see if something shed some light to this issue.

Any hints are appreciated,

Thank you for your help so far!
--===============7505281782153900997==--

