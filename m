Content-Type: multipart/mixed; boundary="===============6553955849462642474=="
MIME-Version: 1.0
From: GitHub <noreply at github.com>
Subject: [tpm2] [intel/tpm2-tools] faec46: lib: mask TPM_RC to only get the
 bits set by the T...
Date: Tue, 28 Nov 2017 15:36:35 -0800
Message-ID: <5a1df3037e83d_9873fdc73a1dc38172874@hookshot-fe6-cp1-prd.iad.github.net.mail>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6553955849462642474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  Branch: refs/heads/master
  Home:   https://github.com/intel/tpm2-tools
  Commit: faec469f3f56d1365a31d363b45cd9992e0a38cd
      https://github.com/intel/tpm2-tools/commit/faec469f3f56d1365a31d363b4=
5cd9992e0a38cd
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



--===============6553955849462642474==--

