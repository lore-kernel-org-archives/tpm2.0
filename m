Content-Type: multipart/mixed; boundary="===============6864976868711250556=="
MIME-Version: 1.0
From: Patrick Ohly <patrick.ohly at intel.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Fri, 10 Nov 2017 10:07:52 +0100
Message-ID: <1510304872.22094.45.camel@intel.com>
In-Reply-To: 1510232036.22094.29.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============6864976868711250556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-11-09 at 13:53 +0100, Patrick Ohly wrote:
> Hello!
> =

> I am trying to port the refkit support for whole-disk encryption from
> TPM 1.2 to TPM 2.0. In refkit, an installer image sets up the
> internal
> disk with the root partition encrypted with LUKS. The initramfs then
> unlocks that partition before mounting it and transferring control to
> /bin/init. TPM NVRAM is used to store a per-machine LUKS password.
> =

> The automated tests uses QEMU + swtpm. More precisely, I am using
> QEMU
> 2.10.0 with backported chardev patches plus a custom patch that makes
> it possible to have QEMU start swtpm.=C2=A0 swtpm and libtpms are from the
> current tpm2-preview branches
> (5c70e401824e4f3f0900bddb50e7ea5fb7bbd84f
> resp. e0331c6d71b273ef7f71ce6fa17306f6773f543e).

I found that I was accidentally building with a different swtpm2 recipe
in a local workspace, which used an older revision. I also noticed that
the libtpms tpm2-preview branch doesn't actually have the latest
revision: tpm2-preview.rev146 is more recent.

To cut a long story short, with swtpm =3D
2dfd15d22b425c1ca92c9bc9f03c84634e6e344a and libtpms =3D
14cb73d6658a9baa41a5e2ff542168463b7becf0 it now works :-)

Stefan, I know you said that you still want to continue rebasing your
tpm2 branches because they aren't ready for use. Do you have an
estimate when the code might become released officially?

I'm also still curious about taking ownership of the TPM.

-- =

Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



--===============6864976868711250556==--

