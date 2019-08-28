Content-Type: multipart/mixed; boundary="===============4810135401662178572=="
MIME-Version: 1.0
From: Roberts, William C <william.c.roberts at intel.com>
Subject: [tpm2] Docker Images
Date: Wed, 28 Aug 2019 20:19:29 +0000
Message-ID: <476DC76E7D1DF2438D32BFADF679FC5649DEF841@ORSMSX101.amr.corp.intel.com>
List-ID: <tpm2@lists.01.org>
To: tpm2@lists.01.org

--===============4810135401662178572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently the https://github.com/tpm2-software/tpm2-software-container/pull=
s =

Docker build file has one branch and one Dockerfile. The Dockerhub is confi=
gured
To build the contents of branch master and tag as the latest.

If we want to utilize dockerhub to build multiple images and extend our bui=
ld coverage,
This seems limited. Dockerhub has the ability to follow any branch and asso=
ciate a tag.
I'm thinking that we create branches for each base image, like:
  - branch: ubuntu-16.04
  - ubuntu-18.04 =

  - fedora-29
  - fedora-30
  - opensuse-tumbleweed
  - opensuse-leap
  - etc

Those branches can be mapped in the Docker build UI to build a similarly na=
med file.
The base image that our dockerfile extends is the image in the tag name. Ie=
 branch
ubuntu-18.04's Dockerfile starts with FROM ubuntu:18.04.

And then in a travis build file, just specify the matrix of images to test =
against.

Thoughts, ideas objections are welcome. I am **not** a Docker expert. =


Thanks,
Bill




--===============4810135401662178572==--

