Content-Type: multipart/mixed; boundary="===============8309187120097553767=="
MIME-Version: 1.0
From: Tadeusz Struk <tadeusz.struk at intel.com>
Subject: Re: [tpm2] tpm2-tss v2.2.0
Date: Tue, 05 Feb 2019 09:55:20 -0800
Message-ID: <4ced1f47-62ab-457b-0e6e-46f7e5de147a@intel.com>
In-Reply-To: 215e4114-07d2-7875-47fa-727b35b2634b@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8309187120097553767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On 2/4/19 11:36 PM, Javier Martinez Canillas wrote:
> Thanks a lot for the releases and the announcements. I've a maybe silly
> question but it wasn't clear to me why we have both a 2.1.1 and 2.2.0
> releases. From the CHANGELOG it seems that the only difference is that
> 2.2.0 has new features (QNX build and dev TCTI partial reads support)
> while 2.1.1 only contains the fixes.
> =

> Does it mean that it's safe to update the Fedora package from 2.1.0 to
> 2.2.0 or should I update to 2.1.1? My understanding is that the former.

Yes, the logic is that the first number changes if there are changes that
break backwards compatibility. The second number bumps if that are new
features, but the release does not break backward compatibility, and
the last number is just for bug fixes. So it is safe to update from 2.1.1
to 2.2.0. As you noted - it includes bug fixes and the two new features.
The 2.1.1 version is for users who, for whatever reason, do not want to
have the new features, but want to get all the bug fixes. Similar story
with 2.0.2.
I imagine that for 2.0.x and 2.1.x we will maintain them for one year
after the initial release, and only release new version if there will
be explicit ask for it from the users.

The numbering method is described in
https://github.com/tpm2-software/tpm2-tss/blob/master/RELEASE.md#version-nu=
mbers

> =

> I wonder if there's a lot of value in having too many 2.X releases or
> if we should just stick with one, as long as there are no backward
> incompatible changes. At least for me as a packager is confusing and
> have to dig to understand the differences between all these release
I'm not sure if there is a lot of value in having many 2.x versions,
but it is what we decided to follow as it gives users flexibility and
control over what features do they want to have. Some of the changes
depend on the version of the TPM driver so users who use old driver
may want to stick with the older version of the library and just
get the fixes. Hope that makes sense.

> =

> For example in tpm2-tools we did have to do both 3.0.X and 3.X releases
> because there was a non-backward compatible change between 3.0 and 3.1
> (migration from tpm2-tss 1.4.0 to 2.0.0).

Thanks,
-- =

Tadeusz

--===============8309187120097553767==--

