Content-Type: multipart/mixed; boundary="===============2476283192543610961=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-tools master branch
Date: Tue, 26 Jun 2018 17:53:19 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649BDBD45@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2476283192543610961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI: Large changes to the tpm2-tools master branch in how algorithms are ha=
ndled has landed.
For tpm2_create and tpm2_createprimary, the algorithm strings have changed =
drastically, and now
Support various AES/RSA/ECC/XOR/HMAC schemes.

Some of the details are discussed here:
https://github.com/tpm2-software/tpm2-tools/issues/1080

Before, we allowed algorithms like rsa, keyedhash, ecc and symcipher. But t=
hese were all hardcoded to algorithms/schemes/modes.
Thus if you wanted an AES 256 CBC key, it was impossible to create. This ha=
s been rectified, and things like aes256cbc can be specified.

I documented the strings available here:
https://github.com/tpm2-software/tpm2-tools/blob/master/man/common/object-a=
lg.md

Bill



--===============2476283192543610961==--

