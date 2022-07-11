Content-Type: multipart/mixed; boundary="===============1704482528258626441=="
MIME-Version: 1.0
From: tpm2 at bitzap.e4ward.com
Subject: [tpm2] How to initialize a used TPM2 module and thoughts on clevis
Date: Mon, 11 Jul 2022 06:23:09 +0000
Message-ID: <20220711062309.2570.35561@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1704482528258626441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello -

New to TPM2 here. I'm adding a *used* TPM2 module to a mobo that has a head=
er. What are best practices to initialize the TPM2 module? Should I clear i=
t first, possibly via the BIOS? Should I set an owner password?

So far I found `echo 5 > /sys/class/tpm/tpm0/ppi/request` which is probably=
 a good idea to do as I don't know where the module comes from and whether =
anyone has messed with it before.

I'd appreciate any pointers in the right direction and the correct commands=
 to start with a clean TPM2. Running Ubuntu 20.04 and I installed tpm2-tool=
s.

Also, is `clevis encrypt tpm2` a good wrapper if I just want to a simple wa=
y to encrypt/decrypt a file on disk that holds other credentials?

Thank you!
--===============1704482528258626441==--

