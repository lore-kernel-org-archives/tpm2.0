Content-Type: multipart/mixed; boundary="===============8075528903883301560=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: [tpm2] [ANNOUNCE] Brace yourself: API & ABI incompatible changes in
 coming!
Date: Mon, 26 Feb 2018 15:39:42 -0800
Message-ID: <20180226233942.GA2550@intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8075528903883301560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

We're getting pretty close to an RC0 for the next major release of the
TSS2 libraries. Before we can make RCo though there are a number of
changes that still need to be made to the header files to bring them
in line with the latest TPM2 and TSS2 specifications. We've just
started rolling these out and during this time, due to the nature of
the changes, we'll be breaking backward compatibility (API and ABI
both).

If you're following along at home you've probably seen changes to the
TCTI headers and implemnetation happening in rapid succession over the
last few days (when our CI isn't down). Expect similar changes to
happen in the rest of the public headers over the course of this week.
These changes will likely cause some issues for downstream projects but
feel free to get on the list and we'll help sort things out.

Regards,
Philip

--===============8075528903883301560==--

