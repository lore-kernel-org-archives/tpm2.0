Content-Type: multipart/mixed; boundary="===============4164771066479076329=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] Some issues with tpm2-tss, tpm2-tools regarding packaging
Date: Thu, 22 Feb 2018 09:14:42 -0800
Message-ID: <20180222171442.GB6409@intel.com>
In-Reply-To: 880372d3-738f-c18c-8409-f2bffa8fff27@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4164771066479076329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Javier,

On Thu, Feb 22, 2018 at 03:09:33PM +0100, Javier Martinez Canillas wrote:
> On 02/22/2018 01:34 PM, Matthias Gerstner wrote:

snip

> > - I wanted to verify the GPG signature of the tpm2-tools distribution
> >   tarball tpm2-tools-3.0.3.tar.gz, but cannot seem to find the matching
> >   public key 0x6DE2E9078E1F50C1 on the public key servers.
> >
> =

> Indeed. The same problem happens with tpm2-tss, so I guess neither Bill n=
or Philip
> have pushed their public GPG keys to a key server:
> =

> $ gpg --verify tpm2-tss-1.3.0.tar.gz.asc tpm2-tss-1.3.0.tar.gz
> gpg: Signature made Fri 08 Dec 2017 02:12:30 AM CET using RSA key ID C2E1=
D3BA
> gpg: Can't check signature: public key not found

I don't know how you've got gpg configured but my signing key is up on
the MIT PGP key server. Try:

gpg --keyserver hkp://pgp.mit.edu --search-keys 0xc2e1d3ba =


When I first started using PGP the MIT key server was the only one that
could cope with subkeys (0xc2e1d3ba is a subkey of 0x43dec7c3). That may
have changed since but I've never had cause to push my key to other
servers. What's the default key server for your distro? Do we need to
put our keys there too?

> $ gpg --verify tpm2-tools-3.0.3.tar.gz.asc tpm2-tools-3.0.3.tar.gz       =
             =

> gpg: Signature made Mon 15 Jan 2018 11:08:10 PM CET using RSA key ID 8E1F=
50C1                                    =

> gpg: Can't check signature: public key not found

I couldn't find Bills key either. I vaguely remember having a discussion
about this a while back but don't remember the resolution.

Philip

--===============4164771066479076329==--

