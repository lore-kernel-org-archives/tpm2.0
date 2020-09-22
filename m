Content-Type: multipart/mixed; boundary="===============6839674262397940875=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: [tpm2] [RC / SECURITY] tpm2-tss 2.4.3-rc2 & 3.0.1-rc2
Date: Tue, 22 Sep 2020 12:21:25 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0171BB3881@EXCH2010B.sit.fraunhofer.de>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6839674262397940875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

tpm2-tss 2.4.3-rc2 and 3.0.1-rc2 are now available:
https://github.com/tpm2-software/tpm2-tss/releases/tag/2.4.3-rc2
https://github.com/tpm2-software/tpm2-tss/releases/tag/3.0.1-rc2

Please not that these rcs include a fix for CVE-2020-24455.
That bug concerns the PolicyPCR elements in FAPI that sometimes
just ommited PCR tests if currentPCRs or currentPCRandBanks was used.
ALL of these objects (keys and NV indices an hierarchyPolicies) need to be
recreated.

This will be a very short RC and I will push the final release tomorrow.

Thanks,
Andreas
--===============6839674262397940875==--

