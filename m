Content-Type: multipart/mixed; boundary="===============4360931946275745930=="
MIME-Version: 1.0
From: Philip Tricca <philip.b.tricca at intel.com>
Subject: Re: [tpm2] building tpm2-tools with bitbake fails even though
 tpm2-tss builds fine
Date: Tue, 20 Feb 2018 13:49:07 -0800
Message-ID: <20180220214907.GA6093@intel.com>
In-Reply-To: 2ba64c1cd60f46bda1192e4741b926ef@AZDC-MMB02.GD-MS.US
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4360931946275745930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2018 at 08:37:36PM +0000, Scheie, Peter M wrote:
> I'm trying to build tpm2-tools with bitbake, but it fails saying it canno=
t find sapi ("Package requirements (sapi >- 1.3.0 sapi < 2.0.0) were not me=
t") which is provided by tpm2-tss (right?).  Tpm2-tss builds just fine, and=
 when I try to build tpm2-tools, I can see tpm2-tss being built since it's =
listed as a dependency in the recipe.  But something breaks somewhere.

This is bitrot: I've been neglecting these recipes for a while now.
They're a personal project, not on my Intel time. Still, Trevor has
been proding me along with some very helpful patches. We've got a
'rocko' branch where we're refreshing versions and accounting for
minor changes in the upstream build.

I think the TSS2 libraries and the daemon should now be building the
latest release but I haven't done the tools yet. This could be part of
what you're running into.

> I should add that I'm not using the git clone of tpm2-tools, but rather t=
he tar file from releases.  For my recipe, I've modified tpm2-tools_2.1.0.b=
b so that it points to the tar file rather than the github repo, and rename=
d it tpm2-tools_3.0.3.bb.  Working through this, I'm confused by several th=
ings:
> =

> *         Why is the recipe version 2.1.0 on the OpenEmbedded.org website=
 when the latest tar file is 3.0.3?

See above. Also: https://github.com/flihp/meta-measured/pulls/

> =

> *          Why is the recipe made up of two files, tpm2-tools_2.1.0.bb an=
d tpm2-tools.inc instead  of just putting it all in the .bb file?

I don't remember. I think I was trying to support multiple versions of
one component at some point and the build required different
work-arounds in the bitbake metadata. As the build has gotten better the
version specific files (*.bb) have shrunk as the workarounds have come
out. Eventually they may go away completely ...

> *         Why does the SRC_URI in the .bb file point to gcc7.diff which r=
eferences, among others, a main.c file that isn't in the tar file?

No clue. The right thing to do is to update the recipe to the latest and
go from there.

Philip

> As I said, I've modified the recipe files to use the 3.0.3 tar file for t=
he SRC_URI, but I suspect something else is not quite right perhaps because=
 of how I'm mixing versions of tar files and recipes (even though I've remo=
ved all references to the 2.1.0 version) and causing the sapi error.  Ideas?


--===============4360931946275745930==--

