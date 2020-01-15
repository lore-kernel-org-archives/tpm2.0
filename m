Content-Type: multipart/mixed; boundary="===============9138317458188333742=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Re: Device Identity Attestation with tpm2-tools
Date: Wed, 15 Jan 2020 14:08:31 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649E66B7A@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20A6FE0AC912764FB8B5BC5A1A7CB92B4734A04C@fmsmsx101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============9138317458188333742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<snip>
> working even after the device disk and tpm is cleared.
> The tpm will always derive the same EK if one provides the same parameter=
s.

This is true 99+% of the time. However, the spec allows TPMs to to implemen=
t the CHANGEEPS
Command that will cause the endorsement hierarchy seed to change. When this=
 occurs, calls
to createprimary  with the same templates to produce different keys. While =
this is rare, I've never
seen one in the wild, you may wish to check the command interface for chang=
eeps so you know
what's possible with that TPM. Similar commands exist for other hierarchies=
 as well.

> =

<snip>
--===============9138317458188333742==--

