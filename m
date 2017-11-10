Content-Type: multipart/mixed; boundary="===============5203158223206636949=="
MIME-Version: 1.0
From: Stefan Berger <stefanb at linux.vnet.ibm.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Fri, 10 Nov 2017 07:04:27 -0500
Message-ID: <72291633-2701-29a2-a4f0-d8808a29989e@linux.vnet.ibm.com>
In-Reply-To: 1510304872.22094.45.camel@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5203158223206636949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/10/2017 04:07 AM, Patrick Ohly wrote:
> On Thu, 2017-11-09 at 13:53 +0100, Patrick Ohly wrote:
>> Hello!
>>
>> I am trying to port the refkit support for whole-disk encryption from
>> TPM 1.2 to TPM 2.0. In refkit, an installer image sets up the
>> internal
>> disk with the root partition encrypted with LUKS. The initramfs then
>> unlocks that partition before mounting it and transferring control to
>> /bin/init. TPM NVRAM is used to store a per-machine LUKS password.
>>
>> The automated tests uses QEMU + swtpm. More precisely, I am using
>> QEMU
>> 2.10.0 with backported chardev patches plus a custom patch that makes
>> it possible to have QEMU start swtpm.  swtpm and libtpms are from the
>> current tpm2-preview branches
>> (5c70e401824e4f3f0900bddb50e7ea5fb7bbd84f
>> resp. e0331c6d71b273ef7f71ce6fa17306f6773f543e).
> I found that I was accidentally building with a different swtpm2 recipe
> in a local workspace, which used an older revision. I also noticed that
> the libtpms tpm2-preview branch doesn't actually have the latest
> revision: tpm2-preview.rev146 is more recent.
>
> To cut a long story short, with swtpm =3D
> 2dfd15d22b425c1ca92c9bc9f03c84634e6e344a and libtpms =3D
> 14cb73d6658a9baa41a5e2ff542168463b7becf0 it now works :-)

Should have read the most recent message first :-)
>
> Stefan, I know you said that you still want to continue rebasing your
> tpm2 branches because they aren't ready for use. Do you have an
> estimate when the code might become released officially?

QEMU will create version 2.11 in mid December. I would like to have an =

official version for 2.12, so that would probably be March 2018. I hope =

we can have some more people testing it or looking at the code until =

then... I want to be able to support TPM migration in QEMU once it opens =

up for new code in mid December. And migration needs testers.

The proportion between lines of code and eyes looking at it isn't quite =

right when it comes to TPM and especially swtpm and libtpms.


>
> I'm also still curious about taking ownership of the TPM.
>


--===============5203158223206636949==--

