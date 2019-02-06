Content-Type: multipart/mixed; boundary="===============8309138372727827957=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2-tss v2.2.0
Date: Wed, 06 Feb 2019 01:21:09 +0100
Message-ID: <6ee9d456-9a2b-3b69-c90c-05037e64f998@redhat.com>
In-Reply-To: 4ced1f47-62ab-457b-0e6e-46f7e5de147a@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8309138372727827957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Tadeusz,

On 2/5/19 6:55 PM, Tadeusz Struk wrote:
> Hi Javier,
> =

> On 2/4/19 11:36 PM, Javier Martinez Canillas wrote:
>> Thanks a lot for the releases and the announcements. I've a maybe silly
>> question but it wasn't clear to me why we have both a 2.1.1 and 2.2.0
>> releases. From the CHANGELOG it seems that the only difference is that
>> 2.2.0 has new features (QNX build and dev TCTI partial reads support)
>> while 2.1.1 only contains the fixes.
>>
>> Does it mean that it's safe to update the Fedora package from 2.1.0 to
>> 2.2.0 or should I update to 2.1.1? My understanding is that the former.
> =

> Yes, the logic is that the first number changes if there are changes that
> break backwards compatibility. The second number bumps if that are new
> features, but the release does not break backward compatibility, and
> the last number is just for bug fixes. So it is safe to update from 2.1.1
> to 2.2.0. As you noted - it includes bug fixes and the two new features.
> The 2.1.1 version is for users who, for whatever reason, do not want to
> have the new features, but want to get all the bug fixes. Similar story
> with 2.0.2.
> I imagine that for 2.0.x and 2.1.x we will maintain them for one year
> after the initial release, and only release new version if there will
> be explicit ask for it from the users.
> =

> The numbering method is described in
> https://github.com/tpm2-software/tpm2-tss/blob/master/RELEASE.md#version-=
numbers
> =


Thanks a lot for the clarification. I've updated the package to 2.2.0.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============8309138372727827957==--

