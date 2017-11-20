Content-Type: multipart/mixed; boundary="===============2906935284432237931=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] TPM2_MAX_NV_BUFFER_SIZE 2048 correct?
Date: Mon, 20 Nov 2017 20:44:28 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563F4BF721@ORSMSX115.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2906935284432237931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The nv large file tests are erroneously passing. Using a read size of 1024 =
corrects this yet, TPM2_MAX_NV_BUFFER_SIZE is set to 2048.
Tested against the 532 and 974 simulators.

Should TPM2_MAX_NV_BUFFER_SIZE be 1024?

--===============2906935284432237931==--

