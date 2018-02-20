Content-Type: multipart/mixed; boundary="===============4331988293723654450=="
MIME-Version: 1.0
From: Javier Martinez Canillas <javierm at redhat.com>
Subject: Re: [tpm2] building tpm2-tools with bitbake fails even though
 tpm2-tss builds fine
Date: Wed, 21 Feb 2018 00:33:38 +0100
Message-ID: <b61e87c7-1207-593a-7a0a-a825587ed2a2@redhat.com>
In-Reply-To: 20180220214907.GA6093@intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4331988293723654450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


[snip]

>>
>> *          Why is the recipe made up of two files, tpm2-tools_2.1.0.bb a=
nd tpm2-tools.inc instead  of just putting it all in the .bb file?
> =

> I don't remember. I think I was trying to support multiple versions of
> one component at some point and the build required different
> work-arounds in the bitbake metadata. As the build has gotten better the
> version specific files (*.bb) have shrunk as the workarounds have come
> out. Eventually they may go away completely ...
>

I'm not a BitBake & OpenEmbedded expert, but AFAIR what you do is pretty
common. That way you could for example develop / test against the latest
git snapshot but also provide a stable release so people can switch them
setting a PREFERRED_VERSION for the recipe in an image or machine config.

>> *         Why does the SRC_URI in the .bb file point to gcc7.diff which =
references, among others, a main.c file that isn't in the tar file?

SRC_URI in tpm2-tools.inc is set to the tpm2.0-tools.git repo, but then
the tpm2-tools_2.1.0.bb adds to the SRC_URI a patch. That's how you add
patches on the BitBake recipes.

That patch was to allow building with GCC7, since it got much more strict
on fall-throughs for switch case statements.

About the main.c not being in the tarball, it really depends on which
version of the recipe you are using. The tpm2-tools_2.1.0.bb has SRCREV
set to 27d34a61cb947780ab58508dfea70e696cff185c, which is the SHA-1 for
2.1.0 tag so it should be there when using that version of the recipe.

Best regards,
-- =

Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat

--===============4331988293723654450==--

