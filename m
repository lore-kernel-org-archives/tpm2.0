Content-Type: multipart/mixed; boundary="===============7134465501813481410=="
MIME-Version: 1.0
From: Peter Magnusson <blaufish.public.email at gmail.com>
Subject: [tpm2] tpm2_getpubek EvictControl fails with 0x1c4 (TPM_RC_VALUE)
Date: Mon, 30 Jul 2018 15:28:13 +0200
Message-ID: <CANtcRX5FY+Ou+5143U6_m+tifxKGWkH=i0BFEd9P0SLuJ_YGxA@mail.gmail.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7134465501813481410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I've run into tpm2_getpubek (3.0.4;
https://github.com/tpm2-software/tpm2-tools/blob/3.0.4/tools/tpm2_getpubek.=
c)
failing unexpectedly with Tss2_Sys_EvictControl emitting TPM_RC_VALUE.
Target system is an Intel NUC with a discrete infineon TPM.

Does the error make sense to anyone?



sudo -u tss TSS2_LOG=3Dall+TRACE tpm2_getpubek -V --tcti
device:/dev/tpmrm0 -H 0x80000000 -g 0x0023  -f ek_ecc.pub

INFO on line: "217" in file: "tools/tpm2_getpubek.c": EK create
success. Got handle: 0x80ffffff

ERROR on line: "225" in file: "tools/tpm2_getpubek.c": EvictControl
failed. Could not make EK persistent.TPM Error:0x1c4

Makefile:8: recipe for target 'ek_ecc.bin' failed




tpm2_rc_decode 0x1c4

error layer

  hex: 0x0

  identifier: TSS2_TPM_ERROR_LEVEL

  description: Error produced by the TPM

format 1 error code

  hex: 0x04

  identifier: TPM_RC_VALUE

  description: value is out of range or is not correct for the context

parameter

  hex: 0x100

  identifier:  TPM_RC_1

  description:  (null)

--===============7134465501813481410==--

