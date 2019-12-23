Content-Type: multipart/mixed; boundary="===============6777414110036989864=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] [RC] tpm2-tools: 4.1.1-RC0
Date: Mon, 23 Dec 2019 17:07:09 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E61CB5@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6777414110036989864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to announce that tpm2-tools release 4.1.1-RC0 is now available:
https://github.com/tpm2-software/tpm2-tools/releases/tag/4.1.1-RC0

The changes are below:
* tpm2_certify: Fix output of attestation data including size field. Now ou=
tputs just bytes.
* tpm2_certifycreation: Fix tool to match manpage where the code had the -C=
 and -c options reversed.
* tpm2_gettime: Fix output of attestation data including size field. Now ou=
tputs just bytes.
* tpm2_nvcertify: Fix output of attestation data including size field. Now =
outputs just bytes.
* tpm2_nvreadpublic: add name hash output.
* tpm2_import: Support object policies when importing raw key material.
* Fix overflow in pcrs.h where sizeof() was used instead of ARRAY_LEN().
* build:
  - Fix compilation inssue: lib/tpm2_hash.c:17:19: note: 'left' was declare=
d here.
* man:
    - Fix manpage examples that have "sha" instead of "sha1"
    - tpm2_shutdown manpage was missing, add it to build.

I'd like to point out these 3 changes:
* tpm2_certify: Fix output of attestation data including size field. Now ou=
tputs just bytes.
* tpm2_gettime: Fix output of attestation data including size field. Now ou=
tputs just bytes.
* tpm2_nvcertify: Fix output of attestation data including size field. Now =
outputs just bytes.

We had a bug where we outputting the structure rather than just the signatu=
re bytes,
*so there is a format change on this*. We considered this a bug, and since =
the on-disk
format is likely not long lived (like a key blob would be), we didn't do a =
major or minor
version bump, just a patch level bump. Please let me know if this is a prob=
lem for you.

Bill
--===============6777414110036989864==--

