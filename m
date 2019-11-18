Content-Type: multipart/mixed; boundary="===============0245744861782013618=="
MIME-Version: 1.0
From: Steven Clark <davolfman at gmail.com>
Subject: [tpm2] Re: Any suggestions on how to lock a TPM without passwords?
Date: Mon, 18 Nov 2019 12:10:46 -0800
Message-ID: <CAOCvsSnb=fJf_Jqh1_uaWQC-F50K0Xn5R3AVCYRdJay5iSAMMw@mail.gmail.com>
In-Reply-To: A3DEEEBB19900C48B49572CB9C2891C987A19406@SHSMSX108.ccr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0245744861782013618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

One very specific question I'll probably be able to answer myself in
the next couple of weeks: can a write-locked NV index (whether
individually or by globallock attribute) be undefined without a full
clear call?

I'll get a little more specific on desired use.

We're looking at tampering protection against physically present
attackers.  We have hard requirements that unprivileged operations be
available form the UI without an authentication mechanism.  We are
also willing to sacrifice system access to preserve confidentiality in
the case of intrusion.  Presently we have secrets locked in the TPM
against authorization policies.  The artifacts we presently have
stored in the NV regions (rather than persistent handles) are just
helpful tools in satisfying the policy for these secrets and a nice
sideband area to store some system information.  Replacing these
secrets is effectively a form of cryptographic erasure so they're
pretty safe from tamper.  Now we have a requirement for rollback
prevention we'd like to fulfill.  We'd like to protect installations
from external media (after some basic system initialization) on a
system with a large and full-featured userspace.  If we base our
system for this roughly on Chrome's then we need to store version
numbers in NV areas which are locked-down against tampering by system
software.  The requirement to update this means we (I think) can't
just randomize the owner auths.  Or at least we can't without a secure
policy to update them under controlled conditions.  We also can't
allow the installer to set it's own version.  Attempts to bypass the
rollback prevention in the field would ideally soft-brick this system.
That's not to say we're without assets:

We have a complete chain of trust from the CRTM to our initramfs and
kernel.  The code in the initramfs can be depended on to run on every
boot, from USB or storage, with an approved kernel, and before any
other OS code runs.
We can take ownership, and Physical Presence clear works.  Using the
PPI to take ownership is a necessary manufacturing step as somebody in
the supply chain has locked all the hierarchies as a safety measure
and we can't get a hold of anyone who will own up.
We have a signing authority.  We can send things off and get
signatures returned by business process and have some confidence it
isn't being done on the side.
We already have secrets that would be wiped by a TPM_Clear.
With clearControl we can probably arrange for platform-authorized
clear by UEFI to be our only working method to clear the TPM.

There's a couple of paths forward:
Magic policies:  I think it may be possible to combine policyAuthorize
with policySigned and maybe policyNameHash to create a policy that an
item may only be updated with specific pre-approved and signed
commands.  I'm pretty sure I don't have the tools to create this
policy or the understanding of the standard to create those tools but
my limited understanding of the standard hints it could be possible.
A definite long shot but a nice idea.  Similarly there could be some
other trick that allows a random authorization to be set and some
controlled-use policy be used to manage the hierarchies in it's place
that I don't know about.  I'm self taught so I'm sure there's gaps on
standard practices.
Psuedo-platform initramfs:  My security guarantees on initramfs code
allow me to treat it as almost an extension of the firmware.  I can
perform operations there and then issue some commands to lock things
down.  An easy example would be additional PCR measurements to enable
new policy options, or extending some existing PCRs to disable
policies afterwards.  The tpm2_nvwritelock tool would probably feature
heavily in this but I haven't been able to experiment as I just
started trying to make the switch from tpm2-tools to some ESAPI code
via TSS.  This command wasn't implemented until tools 4.1 which only
entered RC recently.  If I can lock things down enough from the
initramfs I can get away with leaving the hierarchies open or mostly
open like they are already.  The problem is a complete clear is the
ONLY thing I can reliably have done with platform authority, which
kinda voids the whole purpose of a rollback protection (by rolling
things back) unless I can make a blank TPM an invalid state for
installation.

Also, complete system measurement is likely too costly due to the raw
size of the system and the additional boot time that would result in,
and that's assuming we can get enough of the filesystem read-only to
provide some significant security guarantee from that measurement.  We
aren't exactly running on openWRT.
--===============0245744861782013618==--

