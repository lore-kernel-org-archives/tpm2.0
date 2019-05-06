Content-Type: multipart/mixed; boundary="===============8787892080975398716=="
MIME-Version: 1.0
From: Fuchs, Andreas <andreas.fuchs at sit.fraunhofer.de>
Subject: Re: [tpm2] Verifying that session encryption key is the one you
 expected
Date: Mon, 06 May 2019 16:54:20 +0000
Message-ID: <9F48E1A823B03B4790B7E6E69430724D0162F2C4E9@exch2010c.sit.fraunhofer.de>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649D30A9D@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8787892080975398716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Raw handles are bad, I agree.

Easy option:
Serialize and deserialize the meta data of the persistent handle.
Rational:
The attack model for crafting a malicious ESYS_TR metadata on disk is equal=
 to that of crafting a malicious TPM2B_PUBLIC and TPM2B_PRIVATE (for loadin=
g) on disk, right ?

Other options:
- StartAuthSession with tpmKey parameter (e.g. use the EK; after checking t=
he EK certificate) and then ReadPublic. That's what FAPI is going to do.
- StartAuthSession with bindObject parameter (uses the auth value to seed t=
he session key) and then ReadPublic. You could use the ownerAuth or an NV-I=
ndex's auth for this.
- Unrelyable ReadPublic of the persistent key, but then StartAuthSession wi=
th bindObject to persistent key and readPublic itself.

I hope this is enough choices. I can probably come up with more... ;-)

Cheers,
Andreas

________________________________________
From: Roberts, William C [william.c.roberts(a)intel.com]
Sent: Monday, May 06, 2019 18:30
To: tpm2(a)lists.01.org; Fuchs, Andreas
Subject: Verifying that session encryption key is the one you expected

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

--===============8787892080975398716==--

