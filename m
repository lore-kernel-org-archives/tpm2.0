Content-Type: multipart/mixed; boundary="===============1916066335091525767=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] [RELEASE CANDIDATE] tpm2-tss 2.4.3-rc0 3.0.1-rc0
Date: Wed, 09 Sep 2020 07:21:17 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171BAD68B@exch2010c.sit.fraunhofer.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1916066335091525767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

I announce the rc0 for the stable branches of tpm2-tss 2.4.x and 3.0.x.

They can be found here:
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.4.3-rc0
https://github.com/tpm2-software/tpm2-tss/releases/tag/3.0.1-rc0

Changes include:
    Cleanup of leftover sessions in error cases in FAPI
    Better error messages in several FAPI errors
    Add checks to FAPI policy paths
    Add checks if FAPI is correctly provisioned
    Fix execution of FAPI policies in some cases
    Allow 0x prefixes for TPMU_HA in JSON encoding

Happy testing,
Andreas
--===============1916066335091525767==--

