Content-Type: multipart/mixed; boundary="===============3963944052481888316=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2.0-tools: Release 2.1.0 is available
Date: Mon, 24 Jul 2017 17:54:36 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAA7739@ORSMSX103.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3963944052481888316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Release 2.1.0 is available at: https://github.com/01org/tpm2.0-tools/releas=
es/tag/2.1.0

v2.1.0 - 2017-7-24
* Fix readx and writex on multiple EINTR returns.
* Add support for the tabrmd TCTI. This is the new default.
* Change default socket port from 2323 (the old resourcemgr) to 2321 (defau=
lt
  simulator port).
* Cherry-pick fix for CVE-2017-7524.
* Fix tpm2_listpcr command line option handling.
* Fix tpm2_getmanufec memory issues.

--===============3963944052481888316==--

