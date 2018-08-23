Content-Type: multipart/mixed; boundary="===============7804530183614154926=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2_loadexternal - enhancements
Date: Thu, 23 Aug 2018 17:08:51 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C2D2FA@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7804530183614154926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Previously, tpm2_loadexternal was quite limited. It could only load a publi=
c/private file in the TSS format (aka generated via readpublic or create).
Recently, on master, I have been working on a series that allows loading bo=
th the public and private portions of an object from PEM files.
This way, folks can seamlessly use openssl objects in the TPM. The man page=
s have been updated, to show full examples, as well as
tests for this.

Tpm2_loadexternal supports:
1. AES keys (raw key byte files)
2. RSA keys
3. ECC keys

We still need support for XOR and HMAC, but that should follow the AES key =
code closely. We dropped support for tpm2_loadexternal for TSS format priva=
te objects,
as no command response returns such a structure from the TPM.

Remember, that loadexternal loaded objects have restrictions on their use, =
since they are *NOT* tpm managed objects. This is the major
Difference between tpm2_loadexternal and tpm2_import. ECC support has not b=
een added to tpm2_import at this time.


--===============7804530183614154926==--

