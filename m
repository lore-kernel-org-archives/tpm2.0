Content-Type: multipart/mixed; boundary="===============5798998721370734292=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: Re: [tpm2] Docker Images
Date: Wed, 28 Aug 2019 22:26:35 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEF8F3@ORSMSX101.amr.corp.intel.com>
In-Reply-To: 20190828210511.GF14525@johnsa1-desk.jf.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============5798998721370734292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Andersen, John S
> Sent: Wednesday, August 28, 2019 4:05 PM
> To: Roberts, William C <william.c.roberts(a)intel.com>
> Cc: tpm2(a)lists.01.org
> Subject: Re: [tpm2] Docker Images
> =

> On Wed, Aug 28, 2019 at 08:19:29PM +0000, Roberts, William C wrote:
> > Currently the
> > https://github.com/tpm2-software/tpm2-software-container/pulls
> > Docker build file has one branch and one Dockerfile. The Dockerhub is
> > configured To build the contents of branch master and tag as the latest.
> >
> > If we want to utilize dockerhub to build multiple images and extend
> > our build coverage, This seems limited. Dockerhub has the ability to fo=
llow any
> branch and associate a tag.
> > I'm thinking that we create branches for each base image, like:
> >   - branch: ubuntu-16.04
> >   - ubuntu-18.04
> >   - fedora-29
> >   - fedora-30
> >   - opensuse-tumbleweed
> >   - opensuse-leap
> >   - etc
> >
> > Those branches can be mapped in the Docker build UI to build a similarl=
y named
> file.
> > The base image that our dockerfile extends is the image in the tag
> > name. Ie branch ubuntu-18.04's Dockerfile starts with FROM ubuntu:18.04.
> >
> > And then in a travis build file, just specify the matrix of images to t=
est against.
> >
> > Thoughts, ideas objections are welcome. I am **not** a Docker expert.
> >
> > Thanks,
> > Bill
> >
> =

> Sounds like a great plan to me.

Another nice part is that I can "extend" the base image and have another la=
yer
In a branch called ubuntu-18.04-tools that would be built with a docker fil=
e that
satisfies the TSS and ABRMD dependencies (tied to a stable release of them).

Probably will be a tad bit faster than cloning and building on each travis =
run. At least
Simplify our CI scripts.

--===============5798998721370734292==--

