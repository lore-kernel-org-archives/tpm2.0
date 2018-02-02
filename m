Content-Type: multipart/mixed; boundary="===============3997404970452665523=="
MIME-Version: 1.0
From: philip.b.tricca at intel.com
Subject: [tpm2] ESYS API pull request review to start 2018-02-05
Date: Thu, 01 Feb 2018 23:38:33 -0800
Message-ID: <a525b28f-aaf3-58c1-7b13-1c4d8d52d22e@twobit.us>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3997404970452665523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry for the spam but this topic has been discussed at the plumbers TPM
microconf and so I thought the wider audience might find this
interesting / relevant:

The OSS implementation of of the TCG TSS2 core libraries / APIs is
working its way toward a version 2.0 release and we're a few days away
from starting a pull request & review that will add the "Enhanced System
API". This new API adds additional features like automating the
application side of the hash and encryption operations for HMAC and
encrypted sessions.

If you're interested the spec is available here:
https://trustedcomputinggroup.org/wp-content/uploads/TSS_ESAPI_Version-0.9_=
Revision-04_reviewEND030918.pdf

Given the size of this generous code contribution (our thanks to
Fraunhofer SIT and Infineon), this PR will be under review for several
days. During this time lower priority PRs will be delayed and we may
build up a bit of a queue.

Regards,
Philip

--===============3997404970452665523==--

