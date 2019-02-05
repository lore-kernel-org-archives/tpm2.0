Content-Type: multipart/mixed; boundary="===============2405607240076655265=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] tpm2-tss v2.2.0
Date: Tue, 05 Feb 2019 08:36:41 +0100
Message-ID: <215e4114-07d2-7875-47fa-727b35b2634b@redhat.com>
In-Reply-To: 9e582c6b-dc7c-0395-e0fc-56875ed73c2c@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============2405607240076655265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Tadeusz,

On 2/5/19 1:02 AM, Tadeusz Struk wrote:
> Hello,
> I'm happy to announce that the tpm2-tss v2.2.0 is out. It can be found he=
re:
> =

> https://github.com/tpm2-software/tpm2-tss/releases/tag/2.2.0
> =

> All changes and fixed issues are listed in the CHANGELOG.md file.
>

Thanks a lot for the releases and the announcements. I've a maybe silly
question but it wasn't clear to me why we have both a 2.1.1 and 2.2.0
releases. From the CHANGELOG it seems that the only difference is that
2.2.0 has new features (QNX build and dev TCTI partial reads support)
while 2.1.1 only contains the fixes.

Does it mean that it's safe to update the Fedora package from 2.1.0 to
2.2.0 or should I update to 2.1.1? My understanding is that the former.

I wonder if there's a lot of value in having too many 2.X releases or
if we should just stick with one, as long as there are no backward
incompatible changes. At least for me as a packager is confusing and
have to dig to understand the differences between all these releases.

For example in tpm2-tools we did have to do both 3.0.X and 3.X releases
because there was a non-backward compatible change between 3.0 and 3.1
(migration from tpm2-tss 1.4.0 to 2.0.0).
 =

> Thanks,
> =


Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============2405607240076655265==--

