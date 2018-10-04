Content-Type: multipart/mixed; boundary="===============1414862063636184709=="
MIME-Version: 1.0
From: Joshua Lock <joshua.g.lock at linux.intel.com>
Subject: [tpm2] tpm2-tools 3.1.3 release candidate 1
Date: Thu, 04 Oct 2018 11:23:55 +0100
Message-ID: <869524e8ed36b26bd60363b5df8850d07db42b4a.camel@linux.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1414862063636184709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've just tagged and signed rc1 for tpm-tools 3.1.3. Since rc0 I've
added a couple of fixes for issues reported against the 3.X series:

* Make test_tpm2_activecredential Python 3 compatible
* Fix tpm2_takeownership to only attempt to change the specified
hierarchies

https://github.com/tpm2-software/tpm2-tools/releases/tag/3.1.3-rc1

Please do test this release. If there aren't any reported issues I'll
do a final release in about a week.

Regards,
Joshua


--===============1414862063636184709==--

