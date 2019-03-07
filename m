Content-Type: multipart/mixed; boundary="===============8085805377916699692=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] using existing key with tpm2-tss-engine
Date: Thu, 07 Mar 2019 18:26:26 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649CFB919@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8085805377916699692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Is there a way to use an existing key with the engine? Ie existing key to p=
em file?

I am not seeing a mechanism for this.

My use case:
I need to solve issue:
https://github.com/tpm2-software/tpm2-pkcs11/issues/16

So I can store the X509 certificate for a key in the attributes.

Looks like cert creation is tested a bit in:
test/sserver.sh


Bill

--===============8085805377916699692==--

