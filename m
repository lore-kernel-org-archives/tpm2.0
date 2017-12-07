Content-Type: multipart/mixed; boundary="===============8476272713026579980=="
MIME-Version: 1.0
From: Patrick Ohly <patrick.ohly at intel.com>
Subject: Re: [tpm2] tpm2-tss 1.3.0-rc0 available
Date: Thu, 07 Dec 2017 18:45:13 +0100
Message-ID: <1512668713.5979.157.camel@intel.com>
In-Reply-To: 0dc5a8e2-eeb8-1975-a90c-227393562696@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8476272713026579980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-12-06 at 08:50 -0800, Philip Tricca wrote:
> There's now an RC3 tag for 1.3.0 & tarballs on github:
> https://github.com/intel/tpm2-tss/releases/tag/1.3.0-rc3
> =

> There has only been a single commit added since RC2 and it only
> affects
> the test code.

I prepared a fork of meta-measured which builds the release candidate
code and successfully tested it with the refkit TPM2-enabled whole-disk =

encryption:
https://github.com/pohly/meta-measured/tree/tpm2-tools-3.0

So from my perspective, the release is good to go. But admittedly my
testing is fairly limited ;-}

-- =

Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



--===============8476272713026579980==--

