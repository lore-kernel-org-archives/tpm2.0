Content-Type: multipart/mixed; boundary="===============1392078069484728414=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-tools: 3.2.0-rc1
Date: Mon, 10 Jun 2019 16:33:47 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D9ECB7@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1392078069484728414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

New 3.2.0 RC1 of tools is available:

CHANGES since 3.1.4 (all):

RC1:
- fix configure bug for linking against libmu.

RC0:
- tpm2_changeauth: Support changing platform hierarchy auth.
- tpm2_flushcontext: Introduce new tool for flushing handles from the TPM.
- tpm2_checkquote: Introduce new tool for checking validity of quotes.
- tpm2_quote: Add ability to output PCR values for quotes.
- tpm2_makecredential: add support for executing tool off-TPM.
- tpm2_pcrreset: introduce new tool for resetting PCRs.
- tpm2_quote: Fix AK auth password not being used.

https://github.com/tpm2-software/tpm2-tools/releases/tag/3.2.0-rc1
----
Bill

--===============1392078069484728414==--

