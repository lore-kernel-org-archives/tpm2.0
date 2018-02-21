Content-Type: multipart/mixed; boundary="===============1367309018871106297=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] building tpm2-tools with bitbake fails even though
 tpm2-tss builds fine
Date: Wed, 21 Feb 2018 14:27:58 +0000
Message-ID: <cdc22bc0e47748aa85279c47c3cef6b0@AZDC-MMB02.GD-MS.US>
In-Reply-To: b61e87c7-1207-593a-7a0a-a825587ed2a2@redhat.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1367309018871106297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the explanations.

I notice that if I just run ./configure in tpm2-tools-3.0.3, I get a simila=
r error to when I try to run bitbake, that it can't find SAPI.  With ./conf=
igure, I can solve this by setting PGK_CONFIG_PATH=3D/usr/local/lib/pkgconf=
ig, as that's where 'make install' for tpm2-tss puts the pkgconfig/ directo=
ry by default.  How do I do that with bitbake?  That is, how do I specify i=
n my recipe for tpm2-tools the location of pkgconfig as set by the tpm2-tss=
 build/recipe?

Peter

-----Original Message-----
From: Javier Martinez Canillas [mailto:javierm(a)redhat.com] =

Sent: Tuesday, February 20, 2018 5:34 PM
To: Philip Tricca; Scheie, Peter M
Cc: tpm2(a)lists.01.org
Subject: Re: [tpm2] building tpm2-tools with bitbake fails even though tpm2=
-tss builds fine


[snip]

>>
>> *          Why is the recipe made up of two files, tpm2-tools_2.1.0.bb a=
nd tpm2-tools.inc instead  of just putting it all in the .bb file?
> =

> I don't remember. I think I was trying to support multiple versions of =

> one component at some point and the build required different =

> work-arounds in the bitbake metadata. As the build has gotten better =

> the version specific files (*.bb) have shrunk as the workarounds have =

> come out. Eventually they may go away completely ...
>

I'm not a BitBake & OpenEmbedded expert, but AFAIR what you do is pretty co=
mmon. That way you could for example develop / test against the latest git =
snapshot but also provide a stable release so people can switch them settin=
g a PREFERRED_VERSION for the recipe in an image or machine config.

>> *         Why does the SRC_URI in the .bb file point to gcc7.diff which =
references, among others, a main.c file that isn't in the tar file?

SRC_URI in tpm2-tools.inc is set to the tpm2.0-tools.git repo, but then the=
 tpm2-tools_2.1.0.bb adds to the SRC_URI a patch. That's how you add patche=
s on the BitBake recipes.

That patch was to allow building with GCC7, since it got much more strict o=
n fall-throughs for switch case statements.

About the main.c not being in the tarball, it really depends on which versi=
on of the recipe you are using. The tpm2-tools_2.1.0.bb has SRCREV set to 2=
7d34a61cb947780ab58508dfea70e696cff185c, which is the SHA-1 for
2.1.0 tag so it should be there when using that version of the recipe.

Best regards,
--
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement Red Hat

--===============1367309018871106297==--

