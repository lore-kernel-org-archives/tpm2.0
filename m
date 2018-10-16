Content-Type: multipart/mixed; boundary="===============5945358204819599797=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] tpm2-tss-engine key compatibility with tpm2-pkcs11
Date: Tue, 16 Oct 2018 21:22:06 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649C5F04D@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5945358204819599797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use case:
Create a certificate or CSR with tpm2-tss-engine for adding a certificate t=
o the PKCS11 engine.

Environment:
The key already exists generated outside of the tpm2-tss-engine code, the c=
hild key is loaded and requires an auth value.

Discussion:
It looks as though the discussion around the PEM format on the wiki page ha=
s some of the support, but there is no tool I see to take
In the information and perhaps spit out a PEM file for usage. Is their exam=
ples on  how to do that or do we have to create a tool for this?


--===============5945358204819599797==--

