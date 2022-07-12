Content-Type: multipart/mixed; boundary="===============4209920009201645757=="
MIME-Version: 1.0
From: Tim K <tpm2 at bitzap.e4ward.com>
Subject: [tpm2] Re: How to initialize a used TPM2 module and thoughts on clevis
Date: Tue, 12 Jul 2022 22:25:48 +0000
Message-ID: <20220712222548.2570.88870@ml01.vlan13.01.org>
In-Reply-To: 15f391d49af801d95d0ccbaf108c0e1d14eca850.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4209920009201645757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Very useful, thank you!

> and YES. This is required to keep someone from wiping all the keys in
> the owner hierarchy which would include your disk encryption keys.
> You also want to set the lockoutauth as well.

It appears clevis uses the owner hierarchy by default. If I set an owner pa=
ssword, what are the implications, does clevis need to know the owner passw=
ord when it creates its own key and then encrypts/decrypts its own key?

This is how I'm trying to use it to encrypt a single file on disk (not the =
entire disk/LUKS):
https://manpages.ubuntu.com/manpages/focal/man1/clevis-encrypt-tpm2.1.html
--===============4209920009201645757==--

