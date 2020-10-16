Content-Type: multipart/mixed; boundary="===============0012923448336645355=="
MIME-Version: 1.0
From: matthew at giassa.net
Subject: [tpm2] Question: standardized development environment for TPM2
 testing, regressions, etc.
Date: Fri, 16 Oct 2020 20:00:57 +0000
Message-ID: <20201016200057.2619.50064@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0012923448336645355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Good day,

Are there any "standardized" setups for TPM2 development, automated regress=
ion testing, etc.? I ask because I've replicated an existing setup where a =
QEMU-based VM exposes a virtualized TPM2 device that's actually just offloa=
ding to an SWTPM simulator (i.e. https://www.qemu.org/docs/master/specs/tpm=
.html). I created a top-level Docker-in-Docker (aka "DIND") setup where a t=
op-level container instantiates the QEMU VM (plus some customizations, cust=
om kernel, etc.) in one sub-container, and the simulator in another sub-con=
tainer, then "wires" the two together. All 3x containers expose an SSH serv=
er instance, so it's pretty easy to access them all directly, run automated=
 regression tests against them, etc.; without requiring a real physical TPM=
2 device. It's mainly intended for use as an easy-to-recreate tool for trai=
ning and automated regression tests.

I'm wondering if other people have created such setups, and if there's any =
merit in releasing the Dockerfile + build scripts for this setup (once I've=
 resolved an issue with sysfs in another post: https://lists.01.org/hyperki=
tty/list/tpm2(a)lists.01.org/thread/FMBZO6V6QO55BER4YGIGUAYFWEB7ATAM/). Als=
o, I'm trying to determine where it would be be stored (i.e. which repo) if=
 there's perceived value to it.

Cheers!
--===============0012923448336645355==--

