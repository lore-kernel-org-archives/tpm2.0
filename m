Content-Type: multipart/mixed; boundary="===============1459690567707329063=="
MIME-Version: 1.0
From: Scheie, Peter M <Petre.Scheie at gd-ms.com>
Subject: Re: [tpm2] building tpm2-tools with bitbake fails even though
 tpm2-tss builds fine
Date: Thu, 22 Feb 2018 19:39:10 +0000
Message-ID: <087695a418874241b253dc47aa5a2330@AZDC-MMB02.GD-MS.US>
In-Reply-To: b08016d5-682a-f4dd-38e8-e7844fb7ef11@twobit.us
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============1459690567707329063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,
I switched to the rocko branch and now tpm2-tss and tpm2-abrmd build withou=
t errors, so thanks for that.  For tpm2-tools, the patch referenced in the =
recipe doesn't seem necessary any more (right?) so I've removed it from the=
 recipe for now.  Next I've got to get our OpenSSL package updated, as WRL8=
 provides 1.0.2d and tpm2-tools says it needs 1.0.2g (we're actually going =
to 1.0.2h because another package needs that, but that's all the responsibi=
lity of another fellow in my group).  Thanks for your help.

Peter

-----Original Message-----
From: Philip Tricca [mailto:flihp(a)twobit.us] =

Sent: Wednesday, February 21, 2018 11:05 PM
To: Scheie, Peter M
Cc: Javier Martinez Canillas; tpm2(a)lists.01.org
Subject: Re: [tpm2] building tpm2-tools with bitbake fails even though tpm2=
-tss builds fine

Hi Peter,

On 02/21/2018 12:38 PM, Scheie, Peter M wrote:
> I noticed that Version: in sapi.pc has no value assigned to it, so I thin=
k that's why tpm2-tools is failing to build.  IOW, the root of the problem =
is that tpm2-tss is not setting the Version when it creates sapi.pc when I =
build with bitbake (it does set it when I run ./configure, make, make insta=
ll myself).  Tpm2-tss's configure contains a "PACKAGE_VERSION=3D'1.3.0' lin=
e so I'm not sure why sapi.pc isn't getting that value assigned.

I've been bringing these recipes up to date on a branch named 'rocko'.
This corresponds to the current OE / Yocto release. The branch is here:

https://github.com/flihp/meta-measured/commits/rocko

I've already addressed the issue you've run into here:

https://github.com/flihp/meta-measured/commit/a11f6da298cb0f2c4fcbd14855b8b=
508e91456b8

Philip

> -----Original Message-----
> From: Scheie, Peter M
> Sent: Wednesday, February 21, 2018 10:19 AM
> To: 'Javier Martinez Canillas'; 'Philip Tricca'
> Cc: 'tpm2(a)lists.01.org'
> Subject: RE: [tpm2] building tpm2-tools with bitbake fails even though =

> tpm2-tss builds fine
> =

> I should add that I'm having the same problem as reported in Issue 764 on=
 github (https://github.com/tpm2-software/tpm2-tools/issues/764).  In my ca=
se, I *am* using the release tarball.
> =

> -----Original Message-----
> From: Scheie, Peter M
> Sent: Wednesday, February 21, 2018 8:28 AM
> To: 'Javier Martinez Canillas'; Philip Tricca
> Cc: tpm2(a)lists.01.org
> Subject: RE: [tpm2] building tpm2-tools with bitbake fails even though =

> tpm2-tss builds fine
> =

> Thanks for the explanations.
> =

> I notice that if I just run ./configure in tpm2-tools-3.0.3, I get a simi=
lar error to when I try to run bitbake, that it can't find SAPI.  With ./co=
nfigure, I can solve this by setting PGK_CONFIG_PATH=3D/usr/local/lib/pkgco=
nfig, as that's where 'make install' for tpm2-tss puts the pkgconfig/ direc=
tory by default.  How do I do that with bitbake?  That is, how do I specify=
 in my recipe for tpm2-tools the location of pkgconfig as set by the tpm2-t=
ss build/recipe?
> =

> Peter
> =

> -----Original Message-----
> From: Javier Martinez Canillas [mailto:javierm(a)redhat.com]
> Sent: Tuesday, February 20, 2018 5:34 PM
> To: Philip Tricca; Scheie, Peter M
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] building tpm2-tools with bitbake fails even though =

> tpm2-tss builds fine
> =

> =

> [snip]
> =

>>>
>>> *          Why is the recipe made up of two files, tpm2-tools_2.1.0.bb =
and tpm2-tools.inc instead  of just putting it all in the .bb file?
>>
>> I don't remember. I think I was trying to support multiple versions =

>> of one component at some point and the build required different =

>> work-arounds in the bitbake metadata. As the build has gotten better =

>> the version specific files (*.bb) have shrunk as the workarounds have =

>> come out. Eventually they may go away completely ...
>>
> =

> I'm not a BitBake & OpenEmbedded expert, but AFAIR what you do is pretty =
common. That way you could for example develop / test against the latest gi=
t snapshot but also provide a stable release so people can switch them sett=
ing a PREFERRED_VERSION for the recipe in an image or machine config.
> =

>>> *         Why does the SRC_URI in the .bb file point to gcc7.diff which=
 references, among others, a main.c file that isn't in the tar file?
> =

> SRC_URI in tpm2-tools.inc is set to the tpm2.0-tools.git repo, but then t=
he tpm2-tools_2.1.0.bb adds to the SRC_URI a patch. That's how you add patc=
hes on the BitBake recipes.
> =

> That patch was to allow building with GCC7, since it got much more strict=
 on fall-throughs for switch case statements.
> =

> About the main.c not being in the tarball, it really depends on which =

> version of the recipe you are using. The tpm2-tools_2.1.0.bb has =

> SRCREV set to 27d34a61cb947780ab58508dfea70e696cff185c, which is the =

> SHA-1 for
> 2.1.0 tag so it should be there when using that version of the recipe.
> =

> Best regards,
> --
> Javier Martinez Canillas
> Software Engineer - Desktop Hardware Enablement Red Hat =

> _______________________________________________
> tpm2 mailing list
> tpm2(a)lists.01.org
> https://lists.01.org/mailman/listinfo/tpm2
> =



--===============1459690567707329063==--

