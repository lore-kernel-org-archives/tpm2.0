Content-Type: multipart/mixed; boundary="===============1694859365320826088=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Verifying that session encryption key is the one you expected
Date: Mon, 06 May 2019 16:30:11 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649D30A9D@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1694859365320826088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm wondering if ESAPI does or provides a mechanism to ensure that the key =
I am using to start an encrypted session
with is the one I expected.

I could obviously check by reading the public structure and verifying again=
st a known good, but I was wondering what ESAPI does
for me in this area.

Loaded objects can come from 2 sources:
1. persistent handle
2. ContextLoad from TPM

ContextLoad would be fine, as you will get the object as expected from the =
context blob. The persistent handle
we would need to check. Should I perhaps serialize the ESYS_TR Handle from =
evictcontrol and only allow that as input vs raw
Persistent handles? It look like anyone can craft a malicious ESYS_TR seria=
lized to disk.

--===============1694859365320826088==--

