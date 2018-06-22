Content-Type: multipart/mixed; boundary="===============4182981918577800044=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] tpm2-abrmd 2.0 RCs
Date: Fri, 22 Jun 2018 08:43:20 -0700
Message-ID: <20180622154320.GI2727@intel.com>
In-Reply-To: 20180607004124.GE2727@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4182981918577800044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 05:41:24PM -0700, Philip Tricca wrote:
> I've just taged and signed RC0 for tabrmd version 2.0.0. This release is
> compatible with the future version 2.0.0 of the tpm2-tss libraries and
> will be released soon after. The release process currently on going for
> tpm2-tss has been a bit protracted and so for the sake of time we're
> overlapping the RCs.

The tpm2-tss 2.0 release is now done and the RC process for the tabrmd
has been pretty quiet. Only one change was made during RC0 and this was
a one-line change removing an unnecessary '#include' directive. This
msall change isn't sufficient for another RC and so the tabrmd 2.0.0
release has just been tagged and artifacts uploaded here:

https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.0.0

Regards,
Philip

--===============4182981918577800044==--

