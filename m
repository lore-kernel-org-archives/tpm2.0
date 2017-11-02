Content-Type: multipart/mixed; boundary="===============8783271118204675482=="
MIME-Version: 1.0
From: philip.b.tricca at intel.com
Subject: [tpm2] tpm2-tss 1.3.0-rc0 available
Date: Wed, 01 Nov 2017 20:29:00 -0700
Message-ID: <c11fa167-0f09-568b-f290-779807645caf@twobit.us>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8783271118204675482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've just pushed a tag for the first release candidate for version 1.3.0
of the TSS libraries. It's available here:
https://github.com/01org/tpm2-tss/releases/tag/1.3.0-rc0

The CHANGELOG is very short, just fixing two broken macros and adding
support for the EncryptDecrypt2 command. This release is necessary for
users with TPM2 devices that have deprecated support for the
EncryptDecrypt function. Support for this function in the tools is
forthcoming.

Any additional testing & feedback would be much appreciated.

Philip

--===============8783271118204675482==--

