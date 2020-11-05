Content-Type: multipart/mixed; boundary="===============1283564976497213414=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] New Tutorial For Setting up TPM2 with QEMU
Date: Thu, 05 Nov 2020 16:28:13 +0000
Message-ID: <SN6PR11MB34376B906E9E63DE20EC58B2B8EE0@SN6PR11MB3437.namprd11.prod.outlook.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1283564976497213414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I would just like to announce a new tutorial on setting up TPM2.0 simulator=
 and exposing it as a TPM 2.0 device to a guest VM using QEMU.
https://tpm2-software.github.io/2020/10/19/TPM2-Device-Emulation-With-QEMU.=
html

The take away is you can get a TPM 2.0 Simulator you can run in a debugger,=
 along with using a kernel level /dev/tpm0 or /dev/tpmrm0 device node
and debug a guest VM.

There are existing tutorials, but I was missing a few things and it took me=
 a little while to get it working. Hopefully this helps others out
And saves some time.

Thanks,
Bill
--===============1283564976497213414==--

