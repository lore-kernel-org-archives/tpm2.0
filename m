Content-Type: multipart/mixed; boundary="===============6092274789572327542=="
MIME-Version: 1.0
From: Chenxi Z <cxzhang1981 at hotmail.com>
Subject: [tpm2] TPM 2.0 hardware error DA lockout mode
Date: Sat, 06 Jun 2020 06:35:24 +0000
Message-ID: <20200606063524.2851.57600@ml01.vlan13.01.org>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6092274789572327542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have the exactly same issue as https://superuser.com/questions/1404738/tp=
m-2-0-hardware-error-da-lockout-mode

TPM2 tools version v1.1

Tried clearing ownership:

linux-host:~ # tpm2_takeownership -c -L lockpass
ERROR: Clearing Failed! TPM error code: 0x921


Tried clearing dictionary lockout:

linux-host:~ # tpm2_dictionarylockout -c -P lockpass
ERROR: 0x921 Error clearing dictionary lockout.


Neither works.

The error id decode says:

linux-host:~ # tpm2_rc_decode 0x921
error layer
  hex: 0x0
  identifier: TSS2_TPM_RC_LEVEL
  description: Error produced by the TPM
format 0 warning code
  hex: 0x21
  name: TPM2_RC_LOCKOUT
  description: authorizations for objects subject to DA protection are not =
allowed at this time because the TPM is in DA lockout mode

Can't figure out how to get out of this lockout state. Has someone came acr=
oss same error before? How to fix it? Thanks.
--===============6092274789572327542==--

