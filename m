Content-Type: multipart/mixed; boundary="===============4788084557713695530=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RELEASE] tpm2-tools: version 4.1.1
Date: Tue, 21 Jan 2020 18:20:43 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E752AD@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4788084557713695530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
I would like to announce the newest stable tools release of version 4.1.1 w=
ith the following changes:

4.1.1 - 2020-01-21

* tpm2\_certify: Fix output of attestation data including size field. Now o=
utputs just bytes.
* tpm2\_certifycreation: Fix tool to match manpage where the code had the -=
C and -c options reversed.
* tpm2\_gettime: Fix output of attestation data including size field. Now o=
utputs just bytes.
* tpm2\_nvcertify: Fix output of attestation data including size field. Now=
 outputs just bytes.
* tpm2\_nvreadpublic: add name hash output.
* tpm2\_import: Support object policies when importing raw key material.
* Fix overflow in pcrs.h where sizeof() was used instead of ARRAY\_LEN().
* build:
  - Fix compilation issue: lib/tpm2\_hash.c:17:19: note: 'left' was declare=
d here.
* man:
    - Fix manpage examples that have "sha" instead of "sha1"
    - tpm2\_shutdown manpage was missing, add it to build.
    - Fix manpage example for tpm2\_createak's tpm2\_evictcontrol example.

https://github.com/tpm2-software/tpm2-tools/releases/tag/4.1.1


Thanks,
Bill
--===============4788084557713695530==--

