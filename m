Content-Type: multipart/mixed; boundary="===============7131767362735821809=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] 48ed85: lib: mask TPM_RC to only get the
 bits set by the T...
Date: Tue, 28 Nov 2017 10:47:14 -0800
Message-ID: <5a1daf32a9da_316a3f91d5939c38850a5@hookshot-fe5-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7131767362735821809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/3.X
  Home:   https://github.com/intel/tpm2-tools
  Commit: 48ed8546941cfb2c5f347072fcb3e1015f31e1ef
      https://github.com/intel/tpm2-tools/commit/48ed8546941cfb2c5f347072fc=
b3e1015f31e1ef
  Author: Javier Martinez Canillas <javierm(a)redhat.com>
  Date:   2017-11-28 (Tue, 28 Nov 2017)

  Changed paths:
    M lib/tpm2_util.h
    M tools/tpm2_encryptdecrypt.c

  Log Message:
  -----------
  lib: mask TPM_RC to only get the bits set by the TPM

The TPM only uses the lower 12 bits from the 32 bits of TPM_RC, the other
layers uses some of the higher unused 20 bits to indicate from which layer
of the stack the error comes from.

So mask the low-order 12 bits of the TPM_RC variable instead comparing TPM
response codes directly. There's no need to mask when the check is against
TPM_RC_SUCCESS, since in this case the upper 20 bits are going to be zero.

Fixes: #646

Signed-off-by: Javier Martinez Canillas <javierm(a)redhat.com>



--===============7131767362735821809==--

