Content-Type: multipart/mixed; boundary="===============8578155663860747429=="
MIME-Version: 1.0
From: Andersen, John <john.s.andersen at intel.com>
Subject: Re: [tpm2] Docker Images
Date: Wed, 28 Aug 2019 14:05:12 -0700
Message-ID: <20190828210511.GF14525@johnsa1-desk.jf.intel.com>
In-Reply-To: 476DC76E7D1DF2438D32BFADF679FC5649DEF841@ORSMSX101.amr.corp.intel.com
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============8578155663860747429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 08:19:29PM +0000, Roberts, William C wrote:
> Currently the https://github.com/tpm2-software/tpm2-software-container/pu=
lls =

> Docker build file has one branch and one Dockerfile. The Dockerhub is con=
figured
> To build the contents of branch master and tag as the latest.
> =

> If we want to utilize dockerhub to build multiple images and extend our b=
uild coverage,
> This seems limited. Dockerhub has the ability to follow any branch and as=
sociate a tag.
> I'm thinking that we create branches for each base image, like:
>   - branch: ubuntu-16.04
>   - ubuntu-18.04 =

>   - fedora-29
>   - fedora-30
>   - opensuse-tumbleweed
>   - opensuse-leap
>   - etc
> =

> Those branches can be mapped in the Docker build UI to build a similarly =
named file.
> The base image that our dockerfile extends is the image in the tag name. =
Ie branch
> ubuntu-18.04's Dockerfile starts with FROM ubuntu:18.04.
> =

> And then in a travis build file, just specify the matrix of images to tes=
t against.
> =

> Thoughts, ideas objections are welcome. I am **not** a Docker expert. =

> =

> Thanks,
> Bill
> =


Sounds like a great plan to me.

Thanks,
John

--===============8578155663860747429==--

