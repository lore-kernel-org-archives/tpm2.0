Content-Type: multipart/mixed; boundary="===============0546104131003934401=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Docker Images
Date: Thu, 29 Aug 2019 16:40:53 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEFAE3@ORSMSX101.amr.corp.intel.com>
In-Reply-To: CANKkrzG0y9xdOaVFDoW-smReSiM+wWrt8QJnw+n7nQe8etUb=Q@mail.gmail.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============0546104131003934401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Matthew Dempsky [mailto:matthew(a)dempsky.org]
> Sent: Wednesday, August 28, 2019 6:36 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Docker Images
> =

> On Wed, Aug 28, 2019 at 1:19 PM Roberts, William C <william.c.roberts(a)i=
ntel.com
> <mailto:william.c.roberts(a)intel.com> > wrote:
> =

> =

> 	If we want to utilize dockerhub to build multiple images and extend our
> build coverage,
> =

> =

> 	This seems limited. Dockerhub has the ability to follow any branch and
> associate a tag.
> 	I'm thinking that we create branches for each base image, like:
> 	  - branch: ubuntu-16.04
> 	  - ubuntu-18.04
> 	  - fedora-29
> 	  - fedora-30
> 	  - opensuse-tumbleweed
> 	  - opensuse-leap
> 	  - etc
> =

> =

> =

> If I understand you correctly, you're suggesting to create a separate Git=
 branch
> for each supported OS, and each Git branch has a single Dockerfile?
> =

> That seems like it might lead to a lot of extra busy work. E.g., if you w=
ant to add a
> new dependency, you'll have to do N commits touching N files across N bra=
nches.
> =

> I'd think you could configure Docker Hub to build multiple Dockerfiles (e=
.g.,
> stored within separate subdirectories, or "build contexts" in Docker ling=
o?
> <https://docs.docker.com/docker-hub/builds/#set-the-build-context-and-
> dockerfile-location> ) within a single branch. Then if you need to make s=
weeping
> updates, that's only 1 commit touching N files across 1 branch.

Yep that is the downside. But Dockerhub knows how to map branch/tag name to=
 a docker image name.
And do to constraints I cannot control, I need to use dockerhub to build th=
e images...
The other thing is that each distro is likely going to differences to the d=
ocker file anyways. Setup on
Ubuntu will likely not be the same as fedora. Right now the updates are inf=
requent enough where
It shouldn't really be that much of a burden, hopefully.

I really see us limiting us to like 6 images.

> =

> =

> 	Thoughts, ideas objections are welcome. I am **not** a Docker expert.
> =

> =

> =

> Caveat: I'm certainly not either.

--===============0546104131003934401==--

