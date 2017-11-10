Content-Type: multipart/mixed; boundary="===============3569162483010901099=="
MIME-Version: 1.0
From: Patrick Ohly <patrick.ohly at intel.com>
Subject: Re: [tpm2] using TPM2 NVRAM for storing LUKS password
Date: Fri, 10 Nov 2017 13:53:33 +0100
Message-ID: <1510318413.22094.49.camel@intel.com>
In-Reply-To: 72291633-2701-29a2-a4f0-d8808a29989e@linux.vnet.ibm.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============3569162483010901099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-11-10 at 07:04 -0500, Stefan Berger wrote:
> On 11/10/2017 04:07 AM, Patrick Ohly wrote:
> > Stefan, I know you said that you still want to continue rebasing
> > your
> > tpm2 branches because they aren't ready for use. Do you have an
> > estimate when the code might become released officially?
> =

> QEMU will create version 2.11 in mid December. I would like to have
> an=C2=A0
> official version for 2.12, so that would probably be March 2018. I
> hope=C2=A0
> we can have some more people testing it or looking at the code until=C2=
=A0
> then... I want to be able to support TPM migration in QEMU once it
> opens=C2=A0
> up for new code in mid December. And migration needs testers.
> =

> The proportion between lines of code and eyes looking at it isn't
> quite=C2=A0
> right when it comes to TPM and especially swtpm and libtpms.

Perhaps it would help to advertise some versions of the tpm2-preview
code as "ready for testing", for example by tagging them?

I've mentioned it to you before, but let me repeat it here because
others might also have an opinion. Providing ready-to-use recipes for
the preview code is tricky because build recipes (at least in Yocto)
don't include source directly and instead fetch from the upstream git.
That has the effect that such recipes can become unbuildable anytime
you rebase and the old revisions get garbage-collected in the GitHub
repo.

I want to merge my TPM2 code into refkit, but I can't risk making the
master branch unbuildable. So what I'll do is tag and mirror the code
that is needed by the recipes under github.com/pohly.

-- =

Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



--===============3569162483010901099==--

