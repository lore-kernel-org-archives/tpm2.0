Content-Type: multipart/mixed; boundary="===============2966794190758390212=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] using existing key with tpm2-tss-engine
Date: Thu, 07 Mar 2019 18:31:27 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162E6CA3D@exch2010c.sit.fraunhofer.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649CFB919@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2966794190758390212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yes, X509 certificate creation works.

"Importing an existing key" however is in the backlog:
https://github.com/tpm2-software/tpm2-tss-engine/issues/39

Workaround for the moment could be to temporarily evictControl the key to p=
ersistent.

Otherwise sorry to keep you waiting for the moment.
________________________________________
From: Roberts, William C [william.c.roberts(a)intel.com]
Sent: Thursday, March 07, 2019 19:26
To: tpm2(a)lists.01.org
Cc: Fuchs, Andreas
Subject: using existing key with tpm2-tss-engine

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

--===============2966794190758390212==--

