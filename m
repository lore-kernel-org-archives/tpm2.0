Content-Type: multipart/mixed; boundary="===============7408982140069809153=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] [ANNOUNCE] Brace yourself: API & ABI incompatible changes
 in coming!
Date: Sun, 18 Mar 2018 21:05:14 -0700
Message-ID: <20180319040514.GC8769@intel.com>
In-Reply-To: 20180226233942.GA2550@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============7408982140069809153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

On Mon, Feb 26, 2018 at 03:39:42PM -0800, Philip Tricca wrote:
> We're getting pretty close to an RC0 for the next major release of the
> TSS2 libraries. Before we can make RCo though there are a number of
> changes that still need to be made to the header files to bring them
> in line with the latest TPM2 and TSS2 specifications. We've just
> started rolling these out and during this time, due to the nature of
> the changes, we'll be breaking backward compatibility (API and ABI
> both).
> =

> If you're following along at home you've probably seen changes to the
> TCTI headers and implemnetation happening in rapid succession over the
> last few days (when our CI isn't down). Expect similar changes to
> happen in the rest of the public headers over the course of this week.
> These changes will likely cause some issues for downstream projects but
> feel free to get on the list and we'll help sort things out.

~3 weeks and ~100 commits later and we're just about ready to start the
2.0 RCs. Thanks to everyone using the libraries for their patience
during this process. Our implementation is now (baring bugs :D) in line
with the latest draft specs on the TCG website.

The only issue blocking the RCs from rolling at this point is some TCG
process stuff. We're still waiting for a new version of the TCTI
specification to be released for public review. Once this is done we'll
have one small change to make in the TCTI headers and then we'll kick
off the release process.

In the meantime those packaging and / or using the TSS2 libraries don't
need to wait for the RCs to start before providing any feedback you may
have in advance of the release. Similarly we'll be getting the tools and
tabrmd ready for releases that will make use of the 2.0 version of the
TSS2 libraries.

Regards,
Philip

--===============7408982140069809153==--

