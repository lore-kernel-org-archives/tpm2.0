Content-Type: multipart/mixed; boundary="===============6215372718662008297=="
MIME-Version: 1.0
From: Petko Manolov <sti at nucleusys.com>
Subject: [tpm2] how can i use abrmd/tpmrm0 with tpm2-tools
Date: Wed, 12 Dec 2018 17:45:32 +0200
Message-ID: <20181212154532.GD1889@carbon>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6215372718662008297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

	Hey guys,

I'm on Debian testing (tpm2-abrmd version 2.0.3, tpm2-tools 3.1.3, kernel =

v4.19.8) and no matter how i play with environment variables i can't get th=
e =

tpm2_xxx to talk to the abrm daemon.  Since this kernel has builtin RM i as=
sume =

there might be a collision between the userspace and kernel implementations.

I ran into this issue as my script's 'tpm2_load' runs out of memory (error =

0x902).  Running "tpm2-abrmd -f --allow-root" doesn't complain but:

# tpm2_takeownership -c
ERROR:tcti:src/tss2-tcti/tcti-device.c:319:Tss2_Tcti_Device_Init() Failed t=
o open device file /dev/tpm0: Device or resource busy
ERROR: tcti init allocation routine failed for library: "device" options: "=
(null)"
ERROR: Could not load tcti, got: "device"

How do i tell tpm2_xxx to use the userspace daemon instead of /dev/tpm0?

I'd like to apologize if this has been answered before.  If that's the case =

please point me to the corresponding thread.


		Petko

--===============6215372718662008297==--

