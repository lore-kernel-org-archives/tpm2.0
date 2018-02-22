Content-Type: multipart/mixed; boundary="===============2283065526238144069=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] Some issues with tpm2-tss, tpm2-tools regarding packaging
Date: Thu, 22 Feb 2018 21:31:59 +0100
Message-ID: <93cf80b8-faa8-426f-0870-a83f4b736384@redhat.com>
In-Reply-To: 20180222171442.GB6409@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2283065526238144069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,

On 02/22/2018 06:14 PM, Philip Tricca wrote:
> Javier,
> =

> On Thu, Feb 22, 2018 at 03:09:33PM +0100, Javier Martinez Canillas wrote:
>> On 02/22/2018 01:34 PM, Matthias Gerstner wrote:
> =

> snip
> =

>>> - I wanted to verify the GPG signature of the tpm2-tools distribution
>>>   tarball tpm2-tools-3.0.3.tar.gz, but cannot seem to find the matching
>>>   public key 0x6DE2E9078E1F50C1 on the public key servers.
>>>
>>
>> Indeed. The same problem happens with tpm2-tss, so I guess neither Bill =
nor Philip
>> have pushed their public GPG keys to a key server:
>>
>> $ gpg --verify tpm2-tss-1.3.0.tar.gz.asc tpm2-tss-1.3.0.tar.gz
>> gpg: Signature made Fri 08 Dec 2017 02:12:30 AM CET using RSA key ID C2E=
1D3BA
>> gpg: Can't check signature: public key not found
> =

> I don't know how you've got gpg configured but my signing key is up on
> the MIT PGP key server. Try:
> =

> gpg --keyserver hkp://pgp.mit.edu --search-keys 0xc2e1d3ba =

>

Right, my bad. Sorry for the noise:

$ gpg --recv C2E1D3BA
gpg: requesting key C2E1D3BA from hkp server keys.gnupg.net
gpg: key 43DEC7C3: public key "Philip Tricca <flihp(a)twobit.us>" imported
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)

$ gpg --verify tpm2-tss-1.3.0.tar.gz.asc tpm2-tss-1.3.0.tar.gz
gpg: Signature made Fri 08 Dec 2017 02:12:30 AM CET using RSA key ID C2E1D3=
BA
gpg: Good signature from "Philip Tricca <flihp(a)twobit.us>"
gpg:                 aka "Philip Tricca <philip.b.tricca(a)intel.com>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owne=
r.
Primary key fingerprint: 4200 7E87 6F24 8E04 A3F2  FE25 AE45 48D0 43DE C7C3
     Subkey fingerprint: 3BDA DE45 DDE4 4AFD 4120  2980 32F7 7E75 C2E1 D3BA

> When I first started using PGP the MIT key server was the only one that
> could cope with subkeys (0xc2e1d3ba is a subkey of 0x43dec7c3). That may
> have changed since but I've never had cause to push my key to other
> servers. What's the default key server for your distro? Do we need to
> put our keys there too?
> =

>> $ gpg --verify tpm2-tools-3.0.3.tar.gz.asc tpm2-tools-3.0.3.tar.gz      =
              =

>> gpg: Signature made Mon 15 Jan 2018 11:08:10 PM CET using RSA key ID 8E1=
F50C1                                    =

>> gpg: Can't check signature: public key not found
> =

> I couldn't find Bills key either. I vaguely remember having a discussion
> about this a while back but don't remember the resolution.
> =


Ok, great. Let's see if Bill can push it his public key to a server then.

> Philip
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============2283065526238144069==--

