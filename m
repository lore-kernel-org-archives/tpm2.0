Content-Type: multipart/mixed; boundary="===============5971223789379550245=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2.0-tools: RC 2.1.0-rc1 available for review
Date: Tue, 18 Jul 2017 17:08:37 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC563EAA611D@ORSMSX103.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5971223789379550245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

A pre-release is available for review at:
https://github.com/01org/tpm2.0-tools/releases/tag/2.1.0-rc1

It contains the following changes:
* Fix readx and writex on multiple EINTR returns

As well as those from RC0
v2.1.0-rc0 - 2017-07-05
* Add support for the tabrmd TCTI. This is the new default.
* Change default socket port from 2323 (the old resourcemgr) to 2321 (defau=
lt
  simulator port).
* Cherry-pick fix for CVE-2017-7524.
* Fix tpm2_listpcr command line option handling.
* Fix tpm2_getmanufec memory issues.

Please submit any bug-fixes to the 2.X branch.

If all is quiet for 1 week, ill cut the official 2.1.0 release next week: 7=
/25/2017

----
Bill



--===============5971223789379550245==--

