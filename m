Content-Type: multipart/mixed; boundary="===============3306708627334222686=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] TPM2TSS engine for OpenSSL
Date: Wed, 13 Jun 2018 10:16:44 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D010EB433EC@EXCH2010B.sit.fraunhofer.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3306708627334222686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I just wanted to announce that we pushed a new crypto engine for OpenSSL us=
ing the tpm2-tss software stack.
It is licensed under the BSD 3-clause license.
It currently includes RSA sign, RSA decrypt and ECDSA with TPM generated ke=
ys.
It uses ESAPI/ESYS (so it's a good usage example) and thus relies on the 2.=
0 series of tpm2-tss.
I'd like to see some testing and bug reports if you don't mind.

You can find the project here: https://github.com/tpm2-software/tpm2-tss-en=
gine

Big thanks to Infineon for sponsoring this work !

Best regards,
Andreas Fuchs
--===============3306708627334222686==--

