Content-Type: multipart/mixed; boundary="===============4696938480077356317=="
MIME-Version: 1.0
From: Philip Tricca <flihp at twobit.us>
Subject: Re: [tpm2] Issue Solved/Trusted Boot
Date: Wed, 06 Sep 2017 09:16:04 -0700
Message-ID: <1504714564.11928.12.camel@twobit.us>
In-Reply-To: a15fb54a-9d7c-657f-13f4-2c03435d8e5b@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4696938480077356317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-09-04 at 12:04 +0200, Javier Martinez Canillas wrote:
> Following a discussion on 01org/tpm2-tools #444 [https://github.com
> > /01org/
> > tpm2-tools/issues/444] I wanted to post an update on what the issue
> > was.
> > =

> =

> I'm glad that your issue got solved.
>  > =

> > If I could ask one further thing (I believe this is the correct
> > place to
> > post this?), I=E2=80=99m looking at setting up a trusted boot system on=
 my
> > current
> > setup (Ubuntu 16.04, kernel 4.4) to be used with the now working
> > tpm2. I
> > have previously done this with tpm1.2 but the process seems rather
> > different this time, if anyone can point me to any good
> > resources/tutorials
> > that would be a massive help.
> > =

> =

> There isn't a single way to do this, so it depends on what kind of
> system you
> want to use and what is your threat model.
> =

> For example, do you want to boot your system in EFI or BIOS mode? do
> you want
> to use Secure Boot or no?

Minor clarification: TPM2 has no support for legacy BIOS boot. UEFI
only.

> For me the best way to do this is to use UEFI + Secure Boot and to
> seal your
> secrets against PCR7 as described in this blog post [0] from Matthew
> Garret.
> =

> But for that you need latest shim that measures certificates into
> PCR7 [1] and
> TPM2 measurement support in grub2 [2] that haven't landed yet.
> =

> If you want to boot your system in BIOS mode, then you have other
> options like
> the TrustedGrub2 project [3].

There is a set of patches to Grub2 that integrates TPM2 measurements
for loadable modules, kernel, initramfs & command line that was sent to
the grub2 devel list a while back. I've not seen the RSC TrustedGrub2
work before (thanks for the link by the way) but IMHO forking Grub2 for
TPM2 work in the same way the original TrustedGrub did isn't the right
way to do this. Better to get more people talking about this on the
grub devel mailing list to try to get the patches upstreamed.

Regards,
Philip

> [0]: https://mjg59.dreamwidth.org/48897.html
> [1]: https://github.com/rhboot/shim/commit/8af7c4cacaf753f38f2564b26b
> 962a7a2942d664
> [2]: http://lists.gnu.org/archive/html/grub-devel/2017-07/msg00003.ht
> ml
> [3]: https://github.com/Rohde-Schwarz-Cybersecurity/TrustedGRUB2

--===============4696938480077356317==--

